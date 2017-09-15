VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
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
      Begin VB.Menu mnuwpACT 
         Caption         =   "Акт расхождений"
         Begin VB.Menu mnuAllwpACT 
            Caption         =   "Акт расхождений - все состояния"
         End
         Begin VB.Menu mnuwpACT_1 
            Caption         =   "Акт расхождений :Проведен"
         End
         Begin VB.Menu mnuwpACT_2 
            Caption         =   "Акт расхождений :Согласован"
         End
         Begin VB.Menu mnuwpACT_3 
            Caption         =   "Акт расхождений :Создан"
         End
      End
      Begin VB.Menu mnuwpDog 
         Caption         =   "Договор"
      End
      Begin VB.Menu mnuwpOut 
         Caption         =   "Заказ на отгрузку"
         Begin VB.Menu mnuAllwpOut 
            Caption         =   "Заказ на отгрузку - все состояния"
         End
         Begin VB.Menu mnuwpOut_1 
            Caption         =   "Заказ на отгрузку :Проведен"
         End
         Begin VB.Menu mnuwpOut_2 
            Caption         =   "Заказ на отгрузку :Создан"
         End
         Begin VB.Menu mnuwpOut_3 
            Caption         =   "Заказ на отгрузку :Товар заблокирован"
         End
         Begin VB.Menu mnuwpOut_4 
            Caption         =   "Заказ на отгрузку :Согласован"
         End
         Begin VB.Menu mnuwpOut_5 
            Caption         =   "Заказ на отгрузку :Отгружен"
         End
         Begin VB.Menu mnuwpOut_6 
            Caption         =   "Заказ на отгрузку :Отменен"
         End
      End
      Begin VB.Menu mnuwpIN 
         Caption         =   "Заказ на приемку"
         Begin VB.Menu mnuAllwpIN 
            Caption         =   "Заказ на приемку - все состояния"
         End
         Begin VB.Menu mnuwpIN_1 
            Caption         =   "Заказ на приемку :Идет приемка"
         End
         Begin VB.Menu mnuwpIN_2 
            Caption         =   "Заказ на приемку :Отменен"
         End
         Begin VB.Menu mnuwpIN_3 
            Caption         =   "Заказ на приемку :Принят"
         End
         Begin VB.Menu mnuwpIN_4 
            Caption         =   "Заказ на приемку :Проведен"
         End
         Begin VB.Menu mnuwpIN_5 
            Caption         =   "Заказ на приемку :Создан"
         End
         Begin VB.Menu mnuwpIN_6 
            Caption         =   "Заказ на приемку :Согласован"
         End
      End
      Begin VB.Menu mnuwpCLI 
         Caption         =   "Контрагет"
      End
      Begin VB.Menu mnuwpOpt 
         Caption         =   "Оптимизация"
         Begin VB.Menu mnuAllwpOpt 
            Caption         =   "Оптимизация - все состояния"
         End
         Begin VB.Menu mnuwpOpt_1 
            Caption         =   "Оптимизация :Производятся перемещения"
         End
         Begin VB.Menu mnuwpOpt_2 
            Caption         =   "Оптимизация :Отменен"
         End
         Begin VB.Menu mnuwpOpt_3 
            Caption         =   "Оптимизация :Создан"
         End
         Begin VB.Menu mnuwpOpt_4 
            Caption         =   "Оптимизация :Расчет оптимизации произведен"
         End
         Begin VB.Menu mnuwpOpt_5 
            Caption         =   "Оптимизация :Проведен"
         End
      End
      Begin VB.Menu mnuwpPal 
         Caption         =   "Паллета"
         Begin VB.Menu mnuAllwpPal 
            Caption         =   "Паллета - все состояния"
         End
         Begin VB.Menu mnuwpPal_1 
            Caption         =   "Паллета :Списана"
         End
         Begin VB.Menu mnuwpPal_2 
            Caption         =   "Паллета :С грузом"
         End
         Begin VB.Menu mnuwpPal_3 
            Caption         =   "Паллета :Пустая"
         End
      End
      Begin VB.Menu mnuwpShift 
         Caption         =   "Перемещение"
         Begin VB.Menu mnuAllwpShift 
            Caption         =   "Перемещение - все состояния"
         End
         Begin VB.Menu mnuwpShift_1 
            Caption         =   "Перемещение :Отменен"
         End
         Begin VB.Menu mnuwpShift_2 
            Caption         =   "Перемещение :Перемещен"
         End
         Begin VB.Menu mnuwpShift_3 
            Caption         =   "Перемещение :Проведен"
         End
         Begin VB.Menu mnuwpShift_4 
            Caption         =   "Перемещение :Создан"
         End
      End
      Begin VB.Menu mnuwpCount 
         Caption         =   "Счетчики"
      End
   End
   Begin VB.Menu mnuDictionary 
      Caption         =   "Справочники"
      Begin VB.Menu mnuwpG 
         Caption         =   "Справочник товаров "
      End
      Begin VB.Menu mnuwpDic 
         Caption         =   "Справочники"
      End
      Begin VB.Menu mnuwpCell 
         Caption         =   "Ячейка"
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

Dim WithEvents jfmnuAllwpACT As frmJournalShow
Attribute jfmnuAllwpACT.VB_VarHelpID = -1

Dim WithEvents jfmnuwpACT_1 As frmJournalShow
Attribute jfmnuwpACT_1.VB_VarHelpID = -1

Dim WithEvents jfmnuwpACT_2 As frmJournalShow
Attribute jfmnuwpACT_2.VB_VarHelpID = -1

Dim WithEvents jfmnuwpACT_3 As frmJournalShow
Attribute jfmnuwpACT_3.VB_VarHelpID = -1



Dim WithEvents jfmnuwpDog As frmJournalShow
Attribute jfmnuwpDog.VB_VarHelpID = -1

Dim WithEvents jfmnuAllwpOut As frmJournalShow
Attribute jfmnuAllwpOut.VB_VarHelpID = -1

Dim WithEvents jfmnuwpOut_1 As frmJournalShow
Attribute jfmnuwpOut_1.VB_VarHelpID = -1

Dim WithEvents jfmnuwpOut_2 As frmJournalShow
Attribute jfmnuwpOut_2.VB_VarHelpID = -1

Dim WithEvents jfmnuwpOut_3 As frmJournalShow
Attribute jfmnuwpOut_3.VB_VarHelpID = -1

Dim WithEvents jfmnuwpOut_4 As frmJournalShow
Attribute jfmnuwpOut_4.VB_VarHelpID = -1

Dim WithEvents jfmnuwpOut_5 As frmJournalShow
Attribute jfmnuwpOut_5.VB_VarHelpID = -1

Dim WithEvents jfmnuwpOut_6 As frmJournalShow
Attribute jfmnuwpOut_6.VB_VarHelpID = -1



Dim WithEvents jfmnuAllwpIN As frmJournalShow
Attribute jfmnuAllwpIN.VB_VarHelpID = -1

Dim WithEvents jfmnuwpIN_1 As frmJournalShow
Attribute jfmnuwpIN_1.VB_VarHelpID = -1

Dim WithEvents jfmnuwpIN_2 As frmJournalShow
Attribute jfmnuwpIN_2.VB_VarHelpID = -1

Dim WithEvents jfmnuwpIN_3 As frmJournalShow
Attribute jfmnuwpIN_3.VB_VarHelpID = -1

Dim WithEvents jfmnuwpIN_4 As frmJournalShow
Attribute jfmnuwpIN_4.VB_VarHelpID = -1

Dim WithEvents jfmnuwpIN_5 As frmJournalShow
Attribute jfmnuwpIN_5.VB_VarHelpID = -1

Dim WithEvents jfmnuwpIN_6 As frmJournalShow
Attribute jfmnuwpIN_6.VB_VarHelpID = -1



Dim WithEvents jfmnuwpCLI As frmJournalShow
Attribute jfmnuwpCLI.VB_VarHelpID = -1

Dim WithEvents jfmnuAllwpOpt As frmJournalShow
Attribute jfmnuAllwpOpt.VB_VarHelpID = -1

Dim WithEvents jfmnuwpOpt_1 As frmJournalShow
Attribute jfmnuwpOpt_1.VB_VarHelpID = -1

Dim WithEvents jfmnuwpOpt_2 As frmJournalShow
Attribute jfmnuwpOpt_2.VB_VarHelpID = -1

Dim WithEvents jfmnuwpOpt_3 As frmJournalShow
Attribute jfmnuwpOpt_3.VB_VarHelpID = -1

Dim WithEvents jfmnuwpOpt_4 As frmJournalShow
Attribute jfmnuwpOpt_4.VB_VarHelpID = -1

Dim WithEvents jfmnuwpOpt_5 As frmJournalShow
Attribute jfmnuwpOpt_5.VB_VarHelpID = -1



Dim WithEvents jfmnuAllwpPal As frmJournalShow
Attribute jfmnuAllwpPal.VB_VarHelpID = -1

Dim WithEvents jfmnuwpPal_1 As frmJournalShow
Attribute jfmnuwpPal_1.VB_VarHelpID = -1

Dim WithEvents jfmnuwpPal_2 As frmJournalShow
Attribute jfmnuwpPal_2.VB_VarHelpID = -1

Dim WithEvents jfmnuwpPal_3 As frmJournalShow
Attribute jfmnuwpPal_3.VB_VarHelpID = -1



Dim WithEvents jfmnuAllwpShift As frmJournalShow
Attribute jfmnuAllwpShift.VB_VarHelpID = -1

Dim WithEvents jfmnuwpShift_1 As frmJournalShow
Attribute jfmnuwpShift_1.VB_VarHelpID = -1

Dim WithEvents jfmnuwpShift_2 As frmJournalShow
Attribute jfmnuwpShift_2.VB_VarHelpID = -1

Dim WithEvents jfmnuwpShift_3 As frmJournalShow
Attribute jfmnuwpShift_3.VB_VarHelpID = -1

Dim WithEvents jfmnuwpShift_4 As frmJournalShow
Attribute jfmnuwpShift_4.VB_VarHelpID = -1



Dim WithEvents jfmnuwpCount As frmJournalShow
Attribute jfmnuwpCount.VB_VarHelpID = -1

















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
                  objEntryPoint.save
              Else
                  Set objEntryPoint = objARM.FindRowObject("EntryPoints", objRS!Entrypointsid)
                  If Not objEntryPoint Is Nothing Then
                    objEntryPoint.Caption = ObjItem.Caption
                    objEntryPoint.Name = ObjItem.Name
                    objEntryPoint.AsToolbarItem = Boolean_Net
                    objEntryPoint.save
                  End If
              End If
              objRS.Close
            End If
        End If
    Next
End Function


Private Sub mnuAllwpACT_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuAllwpACT Is Nothing Then
      Set jfmnuAllwpACT = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{84C8AA50-443D-478A-9CAA-9D1AE752F599}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuAllwpACT.jv.journal = journal
      jfmnuAllwpACT.jv.OpenModal = False
      jfmnuAllwpACT.Caption = "Акт расхождений - все состояния"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmwpACT
    Set fltr = New frmwpACT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
    jfmnuAllwpACT.jv.Filter.Add "AUTOwpACT_DEF", f
    End If
      jfmnuAllwpACT.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuAllwpACT.Show
    jfmnuAllwpACT.WindowState = 0
    jfmnuAllwpACT.ZOrder 0
End Sub
Private Sub jfmnuAllwpACT_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpACT
    Dim f As String
    Set fltr = New frmwpACT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
    jfmnuAllwpACT.jv.Filter.Add "AUTOwpACT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuAllwpACT_OnClearFilter()
End Sub
Private Sub jfmnuAllwpACT_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpACT", "Акт расхождений" & Now, Site
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


Private Sub mnuwpACT_1_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpACT_1 Is Nothing Then
      Set jfmnuwpACT_1 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{84C8AA50-443D-478A-9CAA-9D1AE752F599}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpACT_1.jv.journal = journal
      jfmnuwpACT_1.jv.OpenModal = False
      jfmnuwpACT_1.Caption = "Акт расхождений :Проведен"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{71A9B033-A2BC-4683-85F6-3ECE99C40A00}'"
    jfmnuwpACT_1.jv.Filter.Add "AUTOwpACT_DEF", f
    Dim fltr As frmwpACT
    Set fltr = New frmwpACT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
    jfmnuwpACT_1.jv.Filter.Add "AUTOwpACT_DEF", f
    End If
      jfmnuwpACT_1.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpACT_1.Show
    jfmnuwpACT_1.WindowState = 0
    jfmnuwpACT_1.ZOrder 0
End Sub
Private Sub jfmnuwpACT_1_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpACT
    Dim f As String
    Set fltr = New frmwpACT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{71A9B033-A2BC-4683-85F6-3ECE99C40A00}'"
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
    jfmnuwpACT_1.jv.Filter.Add "AUTOwpACT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpACT_1_OnClearFilter()
   jfmnuwpACT_1.jv.Filter.Add "AUTOwpACT_DEF", " INTSANCEStatusID='{71A9B033-A2BC-4683-85F6-3ECE99C40A00}'"
End Sub
Private Sub jfmnuwpACT_1_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpACT", "Акт расхождений" & Now, Site
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


Private Sub mnuwpACT_2_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpACT_2 Is Nothing Then
      Set jfmnuwpACT_2 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{84C8AA50-443D-478A-9CAA-9D1AE752F599}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpACT_2.jv.journal = journal
      jfmnuwpACT_2.jv.OpenModal = False
      jfmnuwpACT_2.Caption = "Акт расхождений :Согласован"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{39C6754B-4D97-408F-AB9B-725AF8DA7140}'"
    jfmnuwpACT_2.jv.Filter.Add "AUTOwpACT_DEF", f
    Dim fltr As frmwpACT
    Set fltr = New frmwpACT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
    jfmnuwpACT_2.jv.Filter.Add "AUTOwpACT_DEF", f
    End If
      jfmnuwpACT_2.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpACT_2.Show
    jfmnuwpACT_2.WindowState = 0
    jfmnuwpACT_2.ZOrder 0
End Sub
Private Sub jfmnuwpACT_2_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpACT
    Dim f As String
    Set fltr = New frmwpACT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{39C6754B-4D97-408F-AB9B-725AF8DA7140}'"
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
    jfmnuwpACT_2.jv.Filter.Add "AUTOwpACT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpACT_2_OnClearFilter()
   jfmnuwpACT_2.jv.Filter.Add "AUTOwpACT_DEF", " INTSANCEStatusID='{39C6754B-4D97-408F-AB9B-725AF8DA7140}'"
End Sub
Private Sub jfmnuwpACT_2_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpACT", "Акт расхождений" & Now, Site
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


Private Sub mnuwpACT_3_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpACT_3 Is Nothing Then
      Set jfmnuwpACT_3 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{84C8AA50-443D-478A-9CAA-9D1AE752F599}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpACT_3.jv.journal = journal
      jfmnuwpACT_3.jv.OpenModal = False
      jfmnuwpACT_3.Caption = "Акт расхождений :Создан"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{1CFC4610-2026-4D82-A595-784D93F8830D}'"
    jfmnuwpACT_3.jv.Filter.Add "AUTOwpACT_DEF", f
    Dim fltr As frmwpACT
    Set fltr = New frmwpACT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
    jfmnuwpACT_3.jv.Filter.Add "AUTOwpACT_DEF", f
    End If
      jfmnuwpACT_3.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpACT_3.Show
    jfmnuwpACT_3.WindowState = 0
    jfmnuwpACT_3.ZOrder 0
End Sub
Private Sub jfmnuwpACT_3_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpACT
    Dim f As String
    Set fltr = New frmwpACT
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{1CFC4610-2026-4D82-A595-784D93F8830D}'"
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpACT_DEF_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
    jfmnuwpACT_3.jv.Filter.Add "AUTOwpACT_DEF", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpACT_3_OnClearFilter()
   jfmnuwpACT_3.jv.Filter.Add "AUTOwpACT_DEF", " INTSANCEStatusID='{1CFC4610-2026-4D82-A595-784D93F8830D}'"
End Sub
Private Sub jfmnuwpACT_3_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpACT", "Акт расхождений" & Now, Site
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




Private Sub mnuwpDog_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpDog Is Nothing Then
      Set jfmnuwpDog = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{0E7C501C-4CC9-4F84-AC2C-85291E39FBB1}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpDog.jv.journal = journal
      jfmnuwpDog.jv.OpenModal = False
      jfmnuwpDog.Caption = "Договор"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmwpDog
    Set fltr = New frmwpDog
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblMyOrg.Value = vbChecked Then
        f = f & " and wpDog_def_MyOrg_ID='" & fltr.txtMyOrg.Tag & "'"
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpDog_def_TheClient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblDogDate_LE.Value = vbChecked Then
        f = f & " and wpDog_def_DogDate<=" & MakeMSSQLDate(fltr.dtpDogDate_LE.Value)
      End If
      If fltr.lblTheNumber.Value = vbChecked Then
        f = f & " and wpDog_def_TheNumber like '%" & fltr.txtTheNumber.Text & "%'"
      End If
      If fltr.lblDogDate_GE.Value = vbChecked Then
        f = f & " and wpDog_def_DogDate>=" & MakeMSSQLDate(fltr.dtpDogDate_GE.Value)
      End If
    jfmnuwpDog.jv.Filter.Add "AUTOwpDog_def", f
    End If
      jfmnuwpDog.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpDog.Show
    jfmnuwpDog.WindowState = 0
    jfmnuwpDog.ZOrder 0
End Sub
Private Sub jfmnuwpDog_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpDog
    Dim f As String
    Set fltr = New frmwpDog
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblMyOrg.Value = vbChecked Then
        f = f & " and wpDog_def_MyOrg_ID='" & fltr.txtMyOrg.Tag & "'"
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpDog_def_TheClient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblDogDate_LE.Value = vbChecked Then
        f = f & " and wpDog_def_DogDate<=" & MakeMSSQLDate(fltr.dtpDogDate_LE.Value)
      End If
      If fltr.lblTheNumber.Value = vbChecked Then
        f = f & " and wpDog_def_TheNumber like '%" & fltr.txtTheNumber.Text & "%'"
      End If
      If fltr.lblDogDate_GE.Value = vbChecked Then
        f = f & " and wpDog_def_DogDate>=" & MakeMSSQLDate(fltr.dtpDogDate_GE.Value)
      End If
    jfmnuwpDog.jv.Filter.Add "AUTOwpDog_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpDog_OnClearFilter()
End Sub
Private Sub jfmnuwpDog_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpDog", "Договор" & Now, Site
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


Private Sub mnuAllwpOut_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuAllwpOut Is Nothing Then
      Set jfmnuAllwpOut = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{135BDAE0-1BC5-4794-9D84-663DD53D2AB7}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuAllwpOut.jv.journal = journal
      jfmnuAllwpOut.jv.OpenModal = False
      jfmnuAllwpOut.Caption = "Заказ на отгрузку - все состояния"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmwpOut
    Set fltr = New frmwpOut
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpOut_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpOut_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpOut_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpOut_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpOut_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpOut_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpOut_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpOut_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpOut_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpOut_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuAllwpOut.jv.Filter.Add "AUTOwpOut_def", f
    End If
      jfmnuAllwpOut.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuAllwpOut.Show
    jfmnuAllwpOut.WindowState = 0
    jfmnuAllwpOut.ZOrder 0
End Sub
Private Sub jfmnuAllwpOut_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpOut
    Dim f As String
    Set fltr = New frmwpOut
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpOut_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpOut_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpOut_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpOut_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpOut_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpOut_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpOut_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpOut_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpOut_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpOut_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuAllwpOut.jv.Filter.Add "AUTOwpOut_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuAllwpOut_OnClearFilter()
End Sub
Private Sub jfmnuAllwpOut_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpOut", "Заказ на отгрузку" & Now, Site
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


Private Sub mnuwpOut_1_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpOut_1 Is Nothing Then
      Set jfmnuwpOut_1 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{135BDAE0-1BC5-4794-9D84-663DD53D2AB7}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpOut_1.jv.journal = journal
      jfmnuwpOut_1.jv.OpenModal = False
      jfmnuwpOut_1.Caption = "Заказ на отгрузку :Проведен"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{9AF79409-7A05-4CFE-A3D9-53701267A2C2}'"
    jfmnuwpOut_1.jv.Filter.Add "AUTOwpOut_def", f
    Dim fltr As frmwpOut
    Set fltr = New frmwpOut
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpOut_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpOut_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpOut_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpOut_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpOut_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpOut_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpOut_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpOut_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpOut_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpOut_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpOut_1.jv.Filter.Add "AUTOwpOut_def", f
    End If
      jfmnuwpOut_1.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpOut_1.Show
    jfmnuwpOut_1.WindowState = 0
    jfmnuwpOut_1.ZOrder 0
End Sub
Private Sub jfmnuwpOut_1_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpOut
    Dim f As String
    Set fltr = New frmwpOut
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{9AF79409-7A05-4CFE-A3D9-53701267A2C2}'"
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpOut_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpOut_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpOut_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpOut_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpOut_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpOut_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpOut_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpOut_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpOut_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpOut_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpOut_1.jv.Filter.Add "AUTOwpOut_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpOut_1_OnClearFilter()
   jfmnuwpOut_1.jv.Filter.Add "AUTOwpOut_def", " INTSANCEStatusID='{9AF79409-7A05-4CFE-A3D9-53701267A2C2}'"
End Sub
Private Sub jfmnuwpOut_1_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpOut", "Заказ на отгрузку" & Now, Site
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


Private Sub mnuwpOut_2_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpOut_2 Is Nothing Then
      Set jfmnuwpOut_2 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{135BDAE0-1BC5-4794-9D84-663DD53D2AB7}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpOut_2.jv.journal = journal
      jfmnuwpOut_2.jv.OpenModal = False
      jfmnuwpOut_2.Caption = "Заказ на отгрузку :Создан"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{EDC95A01-70D8-4C20-B5DA-61993ED44BE3}'"
    jfmnuwpOut_2.jv.Filter.Add "AUTOwpOut_def", f
    Dim fltr As frmwpOut
    Set fltr = New frmwpOut
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpOut_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpOut_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpOut_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpOut_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpOut_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpOut_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpOut_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpOut_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpOut_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpOut_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpOut_2.jv.Filter.Add "AUTOwpOut_def", f
    End If
      jfmnuwpOut_2.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpOut_2.Show
    jfmnuwpOut_2.WindowState = 0
    jfmnuwpOut_2.ZOrder 0
End Sub
Private Sub jfmnuwpOut_2_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpOut
    Dim f As String
    Set fltr = New frmwpOut
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{EDC95A01-70D8-4C20-B5DA-61993ED44BE3}'"
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpOut_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpOut_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpOut_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpOut_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpOut_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpOut_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpOut_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpOut_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpOut_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpOut_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpOut_2.jv.Filter.Add "AUTOwpOut_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpOut_2_OnClearFilter()
   jfmnuwpOut_2.jv.Filter.Add "AUTOwpOut_def", " INTSANCEStatusID='{EDC95A01-70D8-4C20-B5DA-61993ED44BE3}'"
End Sub
Private Sub jfmnuwpOut_2_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpOut", "Заказ на отгрузку" & Now, Site
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


Private Sub mnuwpOut_3_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpOut_3 Is Nothing Then
      Set jfmnuwpOut_3 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{135BDAE0-1BC5-4794-9D84-663DD53D2AB7}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpOut_3.jv.journal = journal
      jfmnuwpOut_3.jv.OpenModal = False
      jfmnuwpOut_3.Caption = "Заказ на отгрузку :Товар заблокирован"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{E05DFCB0-7609-4A37-B35A-73CF8863CD03}'"
    jfmnuwpOut_3.jv.Filter.Add "AUTOwpOut_def", f
    Dim fltr As frmwpOut
    Set fltr = New frmwpOut
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpOut_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpOut_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpOut_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpOut_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpOut_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpOut_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpOut_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpOut_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpOut_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpOut_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpOut_3.jv.Filter.Add "AUTOwpOut_def", f
    End If
      jfmnuwpOut_3.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpOut_3.Show
    jfmnuwpOut_3.WindowState = 0
    jfmnuwpOut_3.ZOrder 0
End Sub
Private Sub jfmnuwpOut_3_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpOut
    Dim f As String
    Set fltr = New frmwpOut
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{E05DFCB0-7609-4A37-B35A-73CF8863CD03}'"
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpOut_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpOut_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpOut_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpOut_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpOut_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpOut_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpOut_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpOut_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpOut_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpOut_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpOut_3.jv.Filter.Add "AUTOwpOut_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpOut_3_OnClearFilter()
   jfmnuwpOut_3.jv.Filter.Add "AUTOwpOut_def", " INTSANCEStatusID='{E05DFCB0-7609-4A37-B35A-73CF8863CD03}'"
End Sub
Private Sub jfmnuwpOut_3_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpOut", "Заказ на отгрузку" & Now, Site
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


Private Sub mnuwpOut_4_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpOut_4 Is Nothing Then
      Set jfmnuwpOut_4 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{135BDAE0-1BC5-4794-9D84-663DD53D2AB7}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpOut_4.jv.journal = journal
      jfmnuwpOut_4.jv.OpenModal = False
      jfmnuwpOut_4.Caption = "Заказ на отгрузку :Согласован"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{6F604281-1612-4658-AD21-BDE4DB63ED78}'"
    jfmnuwpOut_4.jv.Filter.Add "AUTOwpOut_def", f
    Dim fltr As frmwpOut
    Set fltr = New frmwpOut
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpOut_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpOut_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpOut_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpOut_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpOut_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpOut_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpOut_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpOut_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpOut_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpOut_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpOut_4.jv.Filter.Add "AUTOwpOut_def", f
    End If
      jfmnuwpOut_4.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpOut_4.Show
    jfmnuwpOut_4.WindowState = 0
    jfmnuwpOut_4.ZOrder 0
End Sub
Private Sub jfmnuwpOut_4_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpOut
    Dim f As String
    Set fltr = New frmwpOut
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{6F604281-1612-4658-AD21-BDE4DB63ED78}'"
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpOut_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpOut_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpOut_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpOut_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpOut_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpOut_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpOut_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpOut_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpOut_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpOut_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpOut_4.jv.Filter.Add "AUTOwpOut_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpOut_4_OnClearFilter()
   jfmnuwpOut_4.jv.Filter.Add "AUTOwpOut_def", " INTSANCEStatusID='{6F604281-1612-4658-AD21-BDE4DB63ED78}'"
End Sub
Private Sub jfmnuwpOut_4_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpOut", "Заказ на отгрузку" & Now, Site
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


Private Sub mnuwpOut_5_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpOut_5 Is Nothing Then
      Set jfmnuwpOut_5 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{135BDAE0-1BC5-4794-9D84-663DD53D2AB7}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpOut_5.jv.journal = journal
      jfmnuwpOut_5.jv.OpenModal = False
      jfmnuwpOut_5.Caption = "Заказ на отгрузку :Отгружен"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{9DBFD83F-B002-4CD1-9CAC-E7738C126AEC}'"
    jfmnuwpOut_5.jv.Filter.Add "AUTOwpOut_def", f
    Dim fltr As frmwpOut
    Set fltr = New frmwpOut
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpOut_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpOut_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpOut_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpOut_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpOut_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpOut_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpOut_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpOut_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpOut_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpOut_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpOut_5.jv.Filter.Add "AUTOwpOut_def", f
    End If
      jfmnuwpOut_5.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpOut_5.Show
    jfmnuwpOut_5.WindowState = 0
    jfmnuwpOut_5.ZOrder 0
End Sub
Private Sub jfmnuwpOut_5_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpOut
    Dim f As String
    Set fltr = New frmwpOut
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{9DBFD83F-B002-4CD1-9CAC-E7738C126AEC}'"
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpOut_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpOut_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpOut_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpOut_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpOut_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpOut_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpOut_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpOut_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpOut_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpOut_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpOut_5.jv.Filter.Add "AUTOwpOut_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpOut_5_OnClearFilter()
   jfmnuwpOut_5.jv.Filter.Add "AUTOwpOut_def", " INTSANCEStatusID='{9DBFD83F-B002-4CD1-9CAC-E7738C126AEC}'"
End Sub
Private Sub jfmnuwpOut_5_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpOut", "Заказ на отгрузку" & Now, Site
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


Private Sub mnuwpOut_6_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpOut_6 Is Nothing Then
      Set jfmnuwpOut_6 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{135BDAE0-1BC5-4794-9D84-663DD53D2AB7}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpOut_6.jv.journal = journal
      jfmnuwpOut_6.jv.OpenModal = False
      jfmnuwpOut_6.Caption = "Заказ на отгрузку :Отменен"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{ECB8C4A8-3A5F-43B1-99CE-FD9596E2B7C7}'"
    jfmnuwpOut_6.jv.Filter.Add "AUTOwpOut_def", f
    Dim fltr As frmwpOut
    Set fltr = New frmwpOut
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpOut_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpOut_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpOut_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpOut_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpOut_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpOut_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpOut_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpOut_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpOut_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpOut_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpOut_6.jv.Filter.Add "AUTOwpOut_def", f
    End If
      jfmnuwpOut_6.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpOut_6.Show
    jfmnuwpOut_6.WindowState = 0
    jfmnuwpOut_6.ZOrder 0
End Sub
Private Sub jfmnuwpOut_6_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpOut
    Dim f As String
    Set fltr = New frmwpOut
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{ECB8C4A8-3A5F-43B1-99CE-FD9596E2B7C7}'"
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpOut_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpOut_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpOut_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpOut_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpOut_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOut_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpOut_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpOut_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpOut_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpOut_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpOut_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOut_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpOut_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpOut_6.jv.Filter.Add "AUTOwpOut_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpOut_6_OnClearFilter()
   jfmnuwpOut_6.jv.Filter.Add "AUTOwpOut_def", " INTSANCEStatusID='{ECB8C4A8-3A5F-43B1-99CE-FD9596E2B7C7}'"
End Sub
Private Sub jfmnuwpOut_6_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpOut", "Заказ на отгрузку" & Now, Site
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




Private Sub mnuAllwpIN_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuAllwpIN Is Nothing Then
      Set jfmnuAllwpIN = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{B3C5210C-3BA3-4D19-A4A5-1511A579E62C}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuAllwpIN.jv.journal = journal
      jfmnuAllwpIN.jv.OpenModal = False
      jfmnuAllwpIN.Caption = "Заказ на приемку - все состояния"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmwpIN
    Set fltr = New frmwpIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpIn_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpIn_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpIn_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpIn_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpIn_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpIn_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpIn_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpIn_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpIn_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpIn_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuAllwpIN.jv.Filter.Add "AUTOwpIn_def", f
    End If
      jfmnuAllwpIN.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuAllwpIN.Show
    jfmnuAllwpIN.WindowState = 0
    jfmnuAllwpIN.ZOrder 0
End Sub
Private Sub jfmnuAllwpIN_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpIN
    Dim f As String
    Set fltr = New frmwpIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpIn_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpIn_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpIn_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpIn_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpIn_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpIn_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpIn_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpIn_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpIn_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpIn_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuAllwpIN.jv.Filter.Add "AUTOwpIn_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuAllwpIN_OnClearFilter()
End Sub
Private Sub jfmnuAllwpIN_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpIN", "Заказ на приемку" & Now, Site
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


Private Sub mnuwpIN_1_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpIN_1 Is Nothing Then
      Set jfmnuwpIN_1 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{B3C5210C-3BA3-4D19-A4A5-1511A579E62C}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpIN_1.jv.journal = journal
      jfmnuwpIN_1.jv.OpenModal = False
      jfmnuwpIN_1.Caption = "Заказ на приемку :Идет приемка"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{E4ED2AA6-4EFE-4146-9132-3E670DE9294F}'"
    jfmnuwpIN_1.jv.Filter.Add "AUTOwpIn_def", f
    Dim fltr As frmwpIN
    Set fltr = New frmwpIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpIn_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpIn_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpIn_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpIn_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpIn_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpIn_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpIn_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpIn_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpIn_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpIn_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpIN_1.jv.Filter.Add "AUTOwpIn_def", f
    End If
      jfmnuwpIN_1.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpIN_1.Show
    jfmnuwpIN_1.WindowState = 0
    jfmnuwpIN_1.ZOrder 0
End Sub
Private Sub jfmnuwpIN_1_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpIN
    Dim f As String
    Set fltr = New frmwpIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{E4ED2AA6-4EFE-4146-9132-3E670DE9294F}'"
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpIn_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpIn_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpIn_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpIn_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpIn_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpIn_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpIn_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpIn_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpIn_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpIn_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpIN_1.jv.Filter.Add "AUTOwpIn_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpIN_1_OnClearFilter()
   jfmnuwpIN_1.jv.Filter.Add "AUTOwpIn_def", " INTSANCEStatusID='{E4ED2AA6-4EFE-4146-9132-3E670DE9294F}'"
End Sub
Private Sub jfmnuwpIN_1_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpIN", "Заказ на приемку" & Now, Site
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


Private Sub mnuwpIN_2_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpIN_2 Is Nothing Then
      Set jfmnuwpIN_2 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{B3C5210C-3BA3-4D19-A4A5-1511A579E62C}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpIN_2.jv.journal = journal
      jfmnuwpIN_2.jv.OpenModal = False
      jfmnuwpIN_2.Caption = "Заказ на приемку :Отменен"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{CF9A2B5F-E6BB-4239-8ED1-8425787FDEC4}'"
    jfmnuwpIN_2.jv.Filter.Add "AUTOwpIn_def", f
    Dim fltr As frmwpIN
    Set fltr = New frmwpIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpIn_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpIn_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpIn_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpIn_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpIn_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpIn_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpIn_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpIn_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpIn_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpIn_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpIN_2.jv.Filter.Add "AUTOwpIn_def", f
    End If
      jfmnuwpIN_2.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpIN_2.Show
    jfmnuwpIN_2.WindowState = 0
    jfmnuwpIN_2.ZOrder 0
End Sub
Private Sub jfmnuwpIN_2_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpIN
    Dim f As String
    Set fltr = New frmwpIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{CF9A2B5F-E6BB-4239-8ED1-8425787FDEC4}'"
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpIn_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpIn_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpIn_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpIn_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpIn_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpIn_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpIn_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpIn_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpIn_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpIn_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpIN_2.jv.Filter.Add "AUTOwpIn_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpIN_2_OnClearFilter()
   jfmnuwpIN_2.jv.Filter.Add "AUTOwpIn_def", " INTSANCEStatusID='{CF9A2B5F-E6BB-4239-8ED1-8425787FDEC4}'"
End Sub
Private Sub jfmnuwpIN_2_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpIN", "Заказ на приемку" & Now, Site
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


Private Sub mnuwpIN_3_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpIN_3 Is Nothing Then
      Set jfmnuwpIN_3 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{B3C5210C-3BA3-4D19-A4A5-1511A579E62C}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpIN_3.jv.journal = journal
      jfmnuwpIN_3.jv.OpenModal = False
      jfmnuwpIN_3.Caption = "Заказ на приемку :Принят"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{EA7CCABE-D2BB-4914-A201-A01EFF5C535B}'"
    jfmnuwpIN_3.jv.Filter.Add "AUTOwpIn_def", f
    Dim fltr As frmwpIN
    Set fltr = New frmwpIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpIn_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpIn_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpIn_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpIn_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpIn_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpIn_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpIn_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpIn_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpIn_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpIn_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpIN_3.jv.Filter.Add "AUTOwpIn_def", f
    End If
      jfmnuwpIN_3.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpIN_3.Show
    jfmnuwpIN_3.WindowState = 0
    jfmnuwpIN_3.ZOrder 0
End Sub
Private Sub jfmnuwpIN_3_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpIN
    Dim f As String
    Set fltr = New frmwpIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{EA7CCABE-D2BB-4914-A201-A01EFF5C535B}'"
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpIn_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpIn_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpIn_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpIn_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpIn_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpIn_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpIn_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpIn_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpIn_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpIn_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpIN_3.jv.Filter.Add "AUTOwpIn_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpIN_3_OnClearFilter()
   jfmnuwpIN_3.jv.Filter.Add "AUTOwpIn_def", " INTSANCEStatusID='{EA7CCABE-D2BB-4914-A201-A01EFF5C535B}'"
End Sub
Private Sub jfmnuwpIN_3_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpIN", "Заказ на приемку" & Now, Site
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


Private Sub mnuwpIN_4_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpIN_4 Is Nothing Then
      Set jfmnuwpIN_4 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{B3C5210C-3BA3-4D19-A4A5-1511A579E62C}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpIN_4.jv.journal = journal
      jfmnuwpIN_4.jv.OpenModal = False
      jfmnuwpIN_4.Caption = "Заказ на приемку :Проведен"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{473E43A0-FF6E-4393-B340-A8F354F07287}'"
    jfmnuwpIN_4.jv.Filter.Add "AUTOwpIn_def", f
    Dim fltr As frmwpIN
    Set fltr = New frmwpIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpIn_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpIn_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpIn_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpIn_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpIn_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpIn_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpIn_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpIn_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpIn_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpIn_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpIN_4.jv.Filter.Add "AUTOwpIn_def", f
    End If
      jfmnuwpIN_4.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpIN_4.Show
    jfmnuwpIN_4.WindowState = 0
    jfmnuwpIN_4.ZOrder 0
End Sub
Private Sub jfmnuwpIN_4_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpIN
    Dim f As String
    Set fltr = New frmwpIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{473E43A0-FF6E-4393-B340-A8F354F07287}'"
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpIn_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpIn_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpIn_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpIn_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpIn_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpIn_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpIn_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpIn_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpIn_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpIn_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpIN_4.jv.Filter.Add "AUTOwpIn_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpIN_4_OnClearFilter()
   jfmnuwpIN_4.jv.Filter.Add "AUTOwpIn_def", " INTSANCEStatusID='{473E43A0-FF6E-4393-B340-A8F354F07287}'"
End Sub
Private Sub jfmnuwpIN_4_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpIN", "Заказ на приемку" & Now, Site
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


Private Sub mnuwpIN_5_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpIN_5 Is Nothing Then
      Set jfmnuwpIN_5 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{B3C5210C-3BA3-4D19-A4A5-1511A579E62C}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpIN_5.jv.journal = journal
      jfmnuwpIN_5.jv.OpenModal = False
      jfmnuwpIN_5.Caption = "Заказ на приемку :Создан"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{0B9A4284-FB8A-4201-8A40-EEABA5558165}'"
    jfmnuwpIN_5.jv.Filter.Add "AUTOwpIn_def", f
    Dim fltr As frmwpIN
    Set fltr = New frmwpIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpIn_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpIn_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpIn_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpIn_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpIn_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpIn_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpIn_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpIn_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpIn_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpIn_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpIN_5.jv.Filter.Add "AUTOwpIn_def", f
    End If
      jfmnuwpIN_5.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpIN_5.Show
    jfmnuwpIN_5.WindowState = 0
    jfmnuwpIN_5.ZOrder 0
End Sub
Private Sub jfmnuwpIN_5_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpIN
    Dim f As String
    Set fltr = New frmwpIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{0B9A4284-FB8A-4201-8A40-EEABA5558165}'"
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpIn_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpIn_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpIn_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpIn_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpIn_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpIn_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpIn_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpIn_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpIn_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpIn_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpIN_5.jv.Filter.Add "AUTOwpIn_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpIN_5_OnClearFilter()
   jfmnuwpIN_5.jv.Filter.Add "AUTOwpIn_def", " INTSANCEStatusID='{0B9A4284-FB8A-4201-8A40-EEABA5558165}'"
End Sub
Private Sub jfmnuwpIN_5_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpIN", "Заказ на приемку" & Now, Site
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


Private Sub mnuwpIN_6_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpIN_6 Is Nothing Then
      Set jfmnuwpIN_6 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{B3C5210C-3BA3-4D19-A4A5-1511A579E62C}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpIN_6.jv.journal = journal
      jfmnuwpIN_6.jv.OpenModal = False
      jfmnuwpIN_6.Caption = "Заказ на приемку :Согласован"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{88E76D49-A550-42F8-ADDD-FA9CF96FF55A}'"
    jfmnuwpIN_6.jv.Filter.Add "AUTOwpIn_def", f
    Dim fltr As frmwpIN
    Set fltr = New frmwpIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpIn_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpIn_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpIn_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpIn_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpIn_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpIn_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpIn_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpIn_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpIn_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpIn_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpIN_6.jv.Filter.Add "AUTOwpIn_def", f
    End If
      jfmnuwpIN_6.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpIN_6.Show
    jfmnuwpIN_6.WindowState = 0
    jfmnuwpIN_6.ZOrder 0
End Sub
Private Sub jfmnuwpIN_6_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpIN
    Dim f As String
    Set fltr = New frmwpIN
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{88E76D49-A550-42F8-ADDD-FA9CF96FF55A}'"
      If fltr.lblTTNDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate<=" & MakeMSSQLDate(fltr.dtpTTNDate_LE.Value)
      End If
      If fltr.lblPlombNum.Value = vbChecked Then
        f = f & " and wpIn_def_PlombNum like '%" & fltr.txtPlombNum.Text & "%'"
      End If
      If fltr.lblTTNDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TTNDate>=" & MakeMSSQLDate(fltr.dtpTTNDate_GE.Value)
      End If
      If fltr.lblTheContainer.Value = vbChecked Then
        f = f & " and wpIn_def_TheContainer like '%" & fltr.txtTheContainer.Text & "%'"
      End If
      If fltr.lblTTNNum.Value = vbChecked Then
        f = f & " and wpIn_def_TTNNum like '%" & fltr.txtTTNNum.Text & "%'"
      End If
      If fltr.lblCarOutTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime<=" & MakeMSSQLDate(fltr.dtpCarOutTime_LE.Value)
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpIn_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblCarOutTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarOutTime>=" & MakeMSSQLDate(fltr.dtpCarOutTime_GE.Value)
      End If
      If fltr.lblCarInTime_GE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime>=" & MakeMSSQLDate(fltr.dtpCarInTime_GE.Value)
      End If
      If fltr.lblCarInTime_LE.Value = vbChecked Then
        f = f & " and wpIn_def_CarInTime<=" & MakeMSSQLDate(fltr.dtpCarInTime_LE.Value)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpIn_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lblTheCLient.Value = vbChecked Then
        f = f & " and wpIn_def_TheCLient_ID='" & fltr.txtTheCLient.Tag & "'"
      End If
      If fltr.lblTheDogovor.Value = vbChecked Then
        f = f & " and wpIn_def_TheDogovor_ID='" & fltr.txtTheDogovor.Tag & "'"
      End If
      If fltr.lblCarNum.Value = vbChecked Then
        f = f & " and wpIn_def_CarNum like '%" & fltr.txtCarNum.Text & "%'"
      End If
      If fltr.lblCar2Num.Value = vbChecked Then
        f = f & " and wpIn_def_Car2Num like '%" & fltr.txtCar2Num.Text & "%'"
      End If
      If fltr.lblSupplier.Value = vbChecked Then
        f = f & " and wpIn_def_Supplier like '%" & fltr.txtSupplier.Text & "%'"
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpIn_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblTheComment.Value = vbChecked Then
        f = f & " and wpIn_def_TheComment like '%" & fltr.txtTheComment.Text & "%'"
      End If
    jfmnuwpIN_6.jv.Filter.Add "AUTOwpIn_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpIN_6_OnClearFilter()
   jfmnuwpIN_6.jv.Filter.Add "AUTOwpIn_def", " INTSANCEStatusID='{88E76D49-A550-42F8-ADDD-FA9CF96FF55A}'"
End Sub
Private Sub jfmnuwpIN_6_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpIN", "Заказ на приемку" & Now, Site
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




Private Sub mnuwpCLI_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpCLI Is Nothing Then
      Set jfmnuwpCLI = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{973069E8-C110-4EE8-B932-B05E19C95833}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpCLI.jv.journal = journal
      jfmnuwpCLI.jv.OpenModal = False
      jfmnuwpCLI.Caption = "Контрагет"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmwpCLI
    Set fltr = New frmwpCLI
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblemail.Value = vbChecked Then
        f = f & " and wpCli_def_email like '%" & fltr.txtemail.Text & "%'"
      End If
      If fltr.lblTheFax.Value = vbChecked Then
        f = f & " and wpCli_def_TheFax like '%" & fltr.txtTheFax.Text & "%'"
      End If
      If fltr.lblPhone.Value = vbChecked Then
        f = f & " and wpCli_def_Phone like '%" & fltr.txtPhone.Text & "%'"
      End If
      If fltr.lblFIOBuh.Value = vbChecked Then
        f = f & " and wpCli_def_FIOBuh like '%" & fltr.txtFIOBuh.Text & "%'"
      End If
      If fltr.lblFIODirector.Value = vbChecked Then
        f = f & " and wpCli_def_FIODirector like '%" & fltr.txtFIODirector.Text & "%'"
      End If
      If fltr.lblWEBSiteURL.Value = vbChecked Then
        f = f & " and wpCli_def_WEBSiteURL like '%" & fltr.txtWEBSiteURL.Text & "%'"
      End If
      If fltr.lblINN.Value = vbChecked Then
        f = f & " and wpCli_def_INN like '%" & fltr.txtINN.Text & "%'"
      End If
      If fltr.lblFullName.Value = vbChecked Then
        f = f & " and wpCli_def_FullName like '%" & fltr.txtFullName.Text & "%'"
      End If
      If fltr.lblShortName.Value = vbChecked Then
        f = f & " and wpCli_def_ShortName like '%" & fltr.txtShortName.Text & "%'"
      End If
      If fltr.lblpostAddr.Value = vbChecked Then
        f = f & " and wpCli_def_postAddr like '%" & fltr.txtpostAddr.Text & "%'"
      End If
      If fltr.lblUrAddr.Value = vbChecked Then
        f = f & " and wpCli_def_UrAddr like '%" & fltr.txtUrAddr.Text & "%'"
      End If
      If fltr.lblKPP.Value = vbChecked Then
        f = f & " and wpCli_def_KPP like '%" & fltr.txtKPP.Text & "%'"
      End If
    jfmnuwpCLI.jv.Filter.Add "AUTOwpCli_def", f
    End If
      jfmnuwpCLI.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpCLI.Show
    jfmnuwpCLI.WindowState = 0
    jfmnuwpCLI.ZOrder 0
End Sub
Private Sub jfmnuwpCLI_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpCLI
    Dim f As String
    Set fltr = New frmwpCLI
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblemail.Value = vbChecked Then
        f = f & " and wpCli_def_email like '%" & fltr.txtemail.Text & "%'"
      End If
      If fltr.lblTheFax.Value = vbChecked Then
        f = f & " and wpCli_def_TheFax like '%" & fltr.txtTheFax.Text & "%'"
      End If
      If fltr.lblPhone.Value = vbChecked Then
        f = f & " and wpCli_def_Phone like '%" & fltr.txtPhone.Text & "%'"
      End If
      If fltr.lblFIOBuh.Value = vbChecked Then
        f = f & " and wpCli_def_FIOBuh like '%" & fltr.txtFIOBuh.Text & "%'"
      End If
      If fltr.lblFIODirector.Value = vbChecked Then
        f = f & " and wpCli_def_FIODirector like '%" & fltr.txtFIODirector.Text & "%'"
      End If
      If fltr.lblWEBSiteURL.Value = vbChecked Then
        f = f & " and wpCli_def_WEBSiteURL like '%" & fltr.txtWEBSiteURL.Text & "%'"
      End If
      If fltr.lblINN.Value = vbChecked Then
        f = f & " and wpCli_def_INN like '%" & fltr.txtINN.Text & "%'"
      End If
      If fltr.lblFullName.Value = vbChecked Then
        f = f & " and wpCli_def_FullName like '%" & fltr.txtFullName.Text & "%'"
      End If
      If fltr.lblShortName.Value = vbChecked Then
        f = f & " and wpCli_def_ShortName like '%" & fltr.txtShortName.Text & "%'"
      End If
      If fltr.lblpostAddr.Value = vbChecked Then
        f = f & " and wpCli_def_postAddr like '%" & fltr.txtpostAddr.Text & "%'"
      End If
      If fltr.lblUrAddr.Value = vbChecked Then
        f = f & " and wpCli_def_UrAddr like '%" & fltr.txtUrAddr.Text & "%'"
      End If
      If fltr.lblKPP.Value = vbChecked Then
        f = f & " and wpCli_def_KPP like '%" & fltr.txtKPP.Text & "%'"
      End If
    jfmnuwpCLI.jv.Filter.Add "AUTOwpCli_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpCLI_OnClearFilter()
End Sub
Private Sub jfmnuwpCLI_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpCLI", "Контрагет" & Now, Site
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


Private Sub mnuAllwpOpt_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuAllwpOpt Is Nothing Then
      Set jfmnuAllwpOpt = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{8125ECB0-356D-44C0-9067-912209DCDC88}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuAllwpOpt.jv.journal = journal
      jfmnuAllwpOpt.jv.OpenModal = False
      jfmnuAllwpOpt.Caption = "Оптимизация - все состояния"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmwpOpt
    Set fltr = New frmwpOpt
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
    jfmnuAllwpOpt.jv.Filter.Add "AUTOwpOpt_def", f
    End If
      jfmnuAllwpOpt.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuAllwpOpt.Show
    jfmnuAllwpOpt.WindowState = 0
    jfmnuAllwpOpt.ZOrder 0
End Sub
Private Sub jfmnuAllwpOpt_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpOpt
    Dim f As String
    Set fltr = New frmwpOpt
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
    jfmnuAllwpOpt.jv.Filter.Add "AUTOwpOpt_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuAllwpOpt_OnClearFilter()
End Sub
Private Sub jfmnuAllwpOpt_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpOpt", "Оптимизация" & Now, Site
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


Private Sub mnuwpOpt_1_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpOpt_1 Is Nothing Then
      Set jfmnuwpOpt_1 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{8125ECB0-356D-44C0-9067-912209DCDC88}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpOpt_1.jv.journal = journal
      jfmnuwpOpt_1.jv.OpenModal = False
      jfmnuwpOpt_1.Caption = "Оптимизация :Производятся перемещения"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{0BC001B0-678C-4B7D-9CA2-1CF872AD98AD}'"
    jfmnuwpOpt_1.jv.Filter.Add "AUTOwpOpt_def", f
    Dim fltr As frmwpOpt
    Set fltr = New frmwpOpt
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
    jfmnuwpOpt_1.jv.Filter.Add "AUTOwpOpt_def", f
    End If
      jfmnuwpOpt_1.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpOpt_1.Show
    jfmnuwpOpt_1.WindowState = 0
    jfmnuwpOpt_1.ZOrder 0
End Sub
Private Sub jfmnuwpOpt_1_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpOpt
    Dim f As String
    Set fltr = New frmwpOpt
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{0BC001B0-678C-4B7D-9CA2-1CF872AD98AD}'"
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
    jfmnuwpOpt_1.jv.Filter.Add "AUTOwpOpt_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpOpt_1_OnClearFilter()
   jfmnuwpOpt_1.jv.Filter.Add "AUTOwpOpt_def", " INTSANCEStatusID='{0BC001B0-678C-4B7D-9CA2-1CF872AD98AD}'"
End Sub
Private Sub jfmnuwpOpt_1_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpOpt", "Оптимизация" & Now, Site
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


Private Sub mnuwpOpt_2_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpOpt_2 Is Nothing Then
      Set jfmnuwpOpt_2 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{8125ECB0-356D-44C0-9067-912209DCDC88}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpOpt_2.jv.journal = journal
      jfmnuwpOpt_2.jv.OpenModal = False
      jfmnuwpOpt_2.Caption = "Оптимизация :Отменен"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{A2358A44-752E-4BEE-B8CE-501461B7FF6F}'"
    jfmnuwpOpt_2.jv.Filter.Add "AUTOwpOpt_def", f
    Dim fltr As frmwpOpt
    Set fltr = New frmwpOpt
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
    jfmnuwpOpt_2.jv.Filter.Add "AUTOwpOpt_def", f
    End If
      jfmnuwpOpt_2.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpOpt_2.Show
    jfmnuwpOpt_2.WindowState = 0
    jfmnuwpOpt_2.ZOrder 0
End Sub
Private Sub jfmnuwpOpt_2_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpOpt
    Dim f As String
    Set fltr = New frmwpOpt
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{A2358A44-752E-4BEE-B8CE-501461B7FF6F}'"
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
    jfmnuwpOpt_2.jv.Filter.Add "AUTOwpOpt_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpOpt_2_OnClearFilter()
   jfmnuwpOpt_2.jv.Filter.Add "AUTOwpOpt_def", " INTSANCEStatusID='{A2358A44-752E-4BEE-B8CE-501461B7FF6F}'"
End Sub
Private Sub jfmnuwpOpt_2_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpOpt", "Оптимизация" & Now, Site
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


Private Sub mnuwpOpt_3_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpOpt_3 Is Nothing Then
      Set jfmnuwpOpt_3 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{8125ECB0-356D-44C0-9067-912209DCDC88}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpOpt_3.jv.journal = journal
      jfmnuwpOpt_3.jv.OpenModal = False
      jfmnuwpOpt_3.Caption = "Оптимизация :Создан"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{78377FCD-1A6A-4B60-B9FF-6E27D79966EA}'"
    jfmnuwpOpt_3.jv.Filter.Add "AUTOwpOpt_def", f
    Dim fltr As frmwpOpt
    Set fltr = New frmwpOpt
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
    jfmnuwpOpt_3.jv.Filter.Add "AUTOwpOpt_def", f
    End If
      jfmnuwpOpt_3.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpOpt_3.Show
    jfmnuwpOpt_3.WindowState = 0
    jfmnuwpOpt_3.ZOrder 0
End Sub
Private Sub jfmnuwpOpt_3_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpOpt
    Dim f As String
    Set fltr = New frmwpOpt
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{78377FCD-1A6A-4B60-B9FF-6E27D79966EA}'"
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
    jfmnuwpOpt_3.jv.Filter.Add "AUTOwpOpt_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpOpt_3_OnClearFilter()
   jfmnuwpOpt_3.jv.Filter.Add "AUTOwpOpt_def", " INTSANCEStatusID='{78377FCD-1A6A-4B60-B9FF-6E27D79966EA}'"
End Sub
Private Sub jfmnuwpOpt_3_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpOpt", "Оптимизация" & Now, Site
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


Private Sub mnuwpOpt_4_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpOpt_4 Is Nothing Then
      Set jfmnuwpOpt_4 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{8125ECB0-356D-44C0-9067-912209DCDC88}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpOpt_4.jv.journal = journal
      jfmnuwpOpt_4.jv.OpenModal = False
      jfmnuwpOpt_4.Caption = "Оптимизация :Расчет оптимизации произведен"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{2960F547-00D5-456E-9C40-855E62F64EAA}'"
    jfmnuwpOpt_4.jv.Filter.Add "AUTOwpOpt_def", f
    Dim fltr As frmwpOpt
    Set fltr = New frmwpOpt
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
    jfmnuwpOpt_4.jv.Filter.Add "AUTOwpOpt_def", f
    End If
      jfmnuwpOpt_4.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpOpt_4.Show
    jfmnuwpOpt_4.WindowState = 0
    jfmnuwpOpt_4.ZOrder 0
End Sub
Private Sub jfmnuwpOpt_4_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpOpt
    Dim f As String
    Set fltr = New frmwpOpt
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{2960F547-00D5-456E-9C40-855E62F64EAA}'"
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
    jfmnuwpOpt_4.jv.Filter.Add "AUTOwpOpt_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpOpt_4_OnClearFilter()
   jfmnuwpOpt_4.jv.Filter.Add "AUTOwpOpt_def", " INTSANCEStatusID='{2960F547-00D5-456E-9C40-855E62F64EAA}'"
End Sub
Private Sub jfmnuwpOpt_4_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpOpt", "Оптимизация" & Now, Site
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


Private Sub mnuwpOpt_5_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpOpt_5 Is Nothing Then
      Set jfmnuwpOpt_5 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{8125ECB0-356D-44C0-9067-912209DCDC88}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpOpt_5.jv.journal = journal
      jfmnuwpOpt_5.jv.OpenModal = False
      jfmnuwpOpt_5.Caption = "Оптимизация :Проведен"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{8A9EA233-4AB9-44D9-82B4-F3BDF9A0D753}'"
    jfmnuwpOpt_5.jv.Filter.Add "AUTOwpOpt_def", f
    Dim fltr As frmwpOpt
    Set fltr = New frmwpOpt
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
    jfmnuwpOpt_5.jv.Filter.Add "AUTOwpOpt_def", f
    End If
      jfmnuwpOpt_5.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpOpt_5.Show
    jfmnuwpOpt_5.WindowState = 0
    jfmnuwpOpt_5.ZOrder 0
End Sub
Private Sub jfmnuwpOpt_5_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpOpt
    Dim f As String
    Set fltr = New frmwpOpt
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{8A9EA233-4AB9-44D9-82B4-F3BDF9A0D753}'"
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpOpt_def_TheNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
    jfmnuwpOpt_5.jv.Filter.Add "AUTOwpOpt_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpOpt_5_OnClearFilter()
   jfmnuwpOpt_5.jv.Filter.Add "AUTOwpOpt_def", " INTSANCEStatusID='{8A9EA233-4AB9-44D9-82B4-F3BDF9A0D753}'"
End Sub
Private Sub jfmnuwpOpt_5_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpOpt", "Оптимизация" & Now, Site
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




Private Sub mnuAllwpPal_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuAllwpPal Is Nothing Then
      Set jfmnuAllwpPal = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{214501F8-F2CB-4C89-971F-7F5D52EA939E}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuAllwpPal.jv.journal = journal
      jfmnuAllwpPal.jv.OpenModal = False
      jfmnuAllwpPal.Caption = "Паллета - все состояния"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmwpPal
    Set fltr = New frmwpPal
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblLockedForIn.Value = vbChecked Then
        f = f & " and wpPal_def_LockedForIn_ID='" & fltr.txtLockedForIn.Tag & "'"
      End If
      If fltr.lblpalType.Value = vbChecked Then
        f = f & " and wpPal_def_palType_ID='" & fltr.txtpalType.Tag & "'"
      End If
      If fltr.lblLockedForOut.Value = vbChecked Then
        f = f & " and wpPal_def_LockedForOut_ID='" & fltr.txtLockedForOut.Tag & "'"
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpPal_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblTheCell.Value = vbChecked Then
        f = f & " and wpPal_def_TheCell_ID='" & fltr.txtTheCell.Tag & "'"
      End If
      If fltr.lblTheWeight_GE.Value = vbChecked Then
        f = f & " and wpPal_def_TheWeight>=" & val(fltr.txtTheWeight_GE.Text)
      End If
      If fltr.lblTheNumber.Value = vbChecked Then
        f = f & " and wpPal_def_TheNumber like '%" & fltr.txtTheNumber.Text & "%'"
      End If
      If fltr.lblTheWeight_LE.Value = vbChecked Then
        f = f & " and wpPal_def_TheWeight<=" & val(fltr.txtTheWeight_LE.Text)
      End If
      If fltr.lblWeightingDate_LE.Value = vbChecked Then
        f = f & " and wpPal_def_WeightingDate<=" & MakeMSSQLDate(fltr.dtpWeightingDate_LE.Value)
      End If
      If fltr.lblWeightingDate_GE.Value = vbChecked Then
        f = f & " and wpPal_def_WeightingDate>=" & MakeMSSQLDate(fltr.dtpWeightingDate_GE.Value)
      End If
    jfmnuAllwpPal.jv.Filter.Add "AUTOwpPal_def", f
    End If
      jfmnuAllwpPal.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuAllwpPal.Show
    jfmnuAllwpPal.WindowState = 0
    jfmnuAllwpPal.ZOrder 0
End Sub
Private Sub jfmnuAllwpPal_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpPal
    Dim f As String
    Set fltr = New frmwpPal
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblLockedForIn.Value = vbChecked Then
        f = f & " and wpPal_def_LockedForIn_ID='" & fltr.txtLockedForIn.Tag & "'"
      End If
      If fltr.lblpalType.Value = vbChecked Then
        f = f & " and wpPal_def_palType_ID='" & fltr.txtpalType.Tag & "'"
      End If
      If fltr.lblLockedForOut.Value = vbChecked Then
        f = f & " and wpPal_def_LockedForOut_ID='" & fltr.txtLockedForOut.Tag & "'"
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpPal_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblTheCell.Value = vbChecked Then
        f = f & " and wpPal_def_TheCell_ID='" & fltr.txtTheCell.Tag & "'"
      End If
      If fltr.lblTheWeight_GE.Value = vbChecked Then
        f = f & " and wpPal_def_TheWeight>=" & val(fltr.txtTheWeight_GE.Text)
      End If
      If fltr.lblTheNumber.Value = vbChecked Then
        f = f & " and wpPal_def_TheNumber like '%" & fltr.txtTheNumber.Text & "%'"
      End If
      If fltr.lblTheWeight_LE.Value = vbChecked Then
        f = f & " and wpPal_def_TheWeight<=" & val(fltr.txtTheWeight_LE.Text)
      End If
      If fltr.lblWeightingDate_LE.Value = vbChecked Then
        f = f & " and wpPal_def_WeightingDate<=" & MakeMSSQLDate(fltr.dtpWeightingDate_LE.Value)
      End If
      If fltr.lblWeightingDate_GE.Value = vbChecked Then
        f = f & " and wpPal_def_WeightingDate>=" & MakeMSSQLDate(fltr.dtpWeightingDate_GE.Value)
      End If
    jfmnuAllwpPal.jv.Filter.Add "AUTOwpPal_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuAllwpPal_OnClearFilter()
End Sub
Private Sub jfmnuAllwpPal_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpPal", "Паллета" & Now, Site
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


Private Sub mnuwpPal_1_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpPal_1 Is Nothing Then
      Set jfmnuwpPal_1 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{214501F8-F2CB-4C89-971F-7F5D52EA939E}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpPal_1.jv.journal = journal
      jfmnuwpPal_1.jv.OpenModal = False
      jfmnuwpPal_1.Caption = "Паллета :Списана"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{FF7951B6-035E-4ADB-8B66-00C72740E543}'"
    jfmnuwpPal_1.jv.Filter.Add "AUTOwpPal_def", f
    Dim fltr As frmwpPal
    Set fltr = New frmwpPal
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblLockedForIn.Value = vbChecked Then
        f = f & " and wpPal_def_LockedForIn_ID='" & fltr.txtLockedForIn.Tag & "'"
      End If
      If fltr.lblpalType.Value = vbChecked Then
        f = f & " and wpPal_def_palType_ID='" & fltr.txtpalType.Tag & "'"
      End If
      If fltr.lblLockedForOut.Value = vbChecked Then
        f = f & " and wpPal_def_LockedForOut_ID='" & fltr.txtLockedForOut.Tag & "'"
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpPal_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblTheCell.Value = vbChecked Then
        f = f & " and wpPal_def_TheCell_ID='" & fltr.txtTheCell.Tag & "'"
      End If
      If fltr.lblTheWeight_GE.Value = vbChecked Then
        f = f & " and wpPal_def_TheWeight>=" & val(fltr.txtTheWeight_GE.Text)
      End If
      If fltr.lblTheNumber.Value = vbChecked Then
        f = f & " and wpPal_def_TheNumber like '%" & fltr.txtTheNumber.Text & "%'"
      End If
      If fltr.lblTheWeight_LE.Value = vbChecked Then
        f = f & " and wpPal_def_TheWeight<=" & val(fltr.txtTheWeight_LE.Text)
      End If
      If fltr.lblWeightingDate_LE.Value = vbChecked Then
        f = f & " and wpPal_def_WeightingDate<=" & MakeMSSQLDate(fltr.dtpWeightingDate_LE.Value)
      End If
      If fltr.lblWeightingDate_GE.Value = vbChecked Then
        f = f & " and wpPal_def_WeightingDate>=" & MakeMSSQLDate(fltr.dtpWeightingDate_GE.Value)
      End If
    jfmnuwpPal_1.jv.Filter.Add "AUTOwpPal_def", f
    End If
      jfmnuwpPal_1.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpPal_1.Show
    jfmnuwpPal_1.WindowState = 0
    jfmnuwpPal_1.ZOrder 0
End Sub
Private Sub jfmnuwpPal_1_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpPal
    Dim f As String
    Set fltr = New frmwpPal
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{FF7951B6-035E-4ADB-8B66-00C72740E543}'"
      If fltr.lblLockedForIn.Value = vbChecked Then
        f = f & " and wpPal_def_LockedForIn_ID='" & fltr.txtLockedForIn.Tag & "'"
      End If
      If fltr.lblpalType.Value = vbChecked Then
        f = f & " and wpPal_def_palType_ID='" & fltr.txtpalType.Tag & "'"
      End If
      If fltr.lblLockedForOut.Value = vbChecked Then
        f = f & " and wpPal_def_LockedForOut_ID='" & fltr.txtLockedForOut.Tag & "'"
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpPal_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblTheCell.Value = vbChecked Then
        f = f & " and wpPal_def_TheCell_ID='" & fltr.txtTheCell.Tag & "'"
      End If
      If fltr.lblTheWeight_GE.Value = vbChecked Then
        f = f & " and wpPal_def_TheWeight>=" & val(fltr.txtTheWeight_GE.Text)
      End If
      If fltr.lblTheNumber.Value = vbChecked Then
        f = f & " and wpPal_def_TheNumber like '%" & fltr.txtTheNumber.Text & "%'"
      End If
      If fltr.lblTheWeight_LE.Value = vbChecked Then
        f = f & " and wpPal_def_TheWeight<=" & val(fltr.txtTheWeight_LE.Text)
      End If
      If fltr.lblWeightingDate_LE.Value = vbChecked Then
        f = f & " and wpPal_def_WeightingDate<=" & MakeMSSQLDate(fltr.dtpWeightingDate_LE.Value)
      End If
      If fltr.lblWeightingDate_GE.Value = vbChecked Then
        f = f & " and wpPal_def_WeightingDate>=" & MakeMSSQLDate(fltr.dtpWeightingDate_GE.Value)
      End If
    jfmnuwpPal_1.jv.Filter.Add "AUTOwpPal_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpPal_1_OnClearFilter()
   jfmnuwpPal_1.jv.Filter.Add "AUTOwpPal_def", " INTSANCEStatusID='{FF7951B6-035E-4ADB-8B66-00C72740E543}'"
End Sub
Private Sub jfmnuwpPal_1_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpPal", "Паллета" & Now, Site
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


Private Sub mnuwpPal_2_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpPal_2 Is Nothing Then
      Set jfmnuwpPal_2 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{214501F8-F2CB-4C89-971F-7F5D52EA939E}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpPal_2.jv.journal = journal
      jfmnuwpPal_2.jv.OpenModal = False
      jfmnuwpPal_2.Caption = "Паллета :С грузом"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{5E67134F-3A06-4639-8993-ABC12AB96D00}'"
    jfmnuwpPal_2.jv.Filter.Add "AUTOwpPal_def", f
    Dim fltr As frmwpPal
    Set fltr = New frmwpPal
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblLockedForIn.Value = vbChecked Then
        f = f & " and wpPal_def_LockedForIn_ID='" & fltr.txtLockedForIn.Tag & "'"
      End If
      If fltr.lblpalType.Value = vbChecked Then
        f = f & " and wpPal_def_palType_ID='" & fltr.txtpalType.Tag & "'"
      End If
      If fltr.lblLockedForOut.Value = vbChecked Then
        f = f & " and wpPal_def_LockedForOut_ID='" & fltr.txtLockedForOut.Tag & "'"
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpPal_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblTheCell.Value = vbChecked Then
        f = f & " and wpPal_def_TheCell_ID='" & fltr.txtTheCell.Tag & "'"
      End If
      If fltr.lblTheWeight_GE.Value = vbChecked Then
        f = f & " and wpPal_def_TheWeight>=" & val(fltr.txtTheWeight_GE.Text)
      End If
      If fltr.lblTheNumber.Value = vbChecked Then
        f = f & " and wpPal_def_TheNumber like '%" & fltr.txtTheNumber.Text & "%'"
      End If
      If fltr.lblTheWeight_LE.Value = vbChecked Then
        f = f & " and wpPal_def_TheWeight<=" & val(fltr.txtTheWeight_LE.Text)
      End If
      If fltr.lblWeightingDate_LE.Value = vbChecked Then
        f = f & " and wpPal_def_WeightingDate<=" & MakeMSSQLDate(fltr.dtpWeightingDate_LE.Value)
      End If
      If fltr.lblWeightingDate_GE.Value = vbChecked Then
        f = f & " and wpPal_def_WeightingDate>=" & MakeMSSQLDate(fltr.dtpWeightingDate_GE.Value)
      End If
    jfmnuwpPal_2.jv.Filter.Add "AUTOwpPal_def", f
    End If
      jfmnuwpPal_2.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpPal_2.Show
    jfmnuwpPal_2.WindowState = 0
    jfmnuwpPal_2.ZOrder 0
End Sub
Private Sub jfmnuwpPal_2_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpPal
    Dim f As String
    Set fltr = New frmwpPal
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{5E67134F-3A06-4639-8993-ABC12AB96D00}'"
      If fltr.lblLockedForIn.Value = vbChecked Then
        f = f & " and wpPal_def_LockedForIn_ID='" & fltr.txtLockedForIn.Tag & "'"
      End If
      If fltr.lblpalType.Value = vbChecked Then
        f = f & " and wpPal_def_palType_ID='" & fltr.txtpalType.Tag & "'"
      End If
      If fltr.lblLockedForOut.Value = vbChecked Then
        f = f & " and wpPal_def_LockedForOut_ID='" & fltr.txtLockedForOut.Tag & "'"
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpPal_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblTheCell.Value = vbChecked Then
        f = f & " and wpPal_def_TheCell_ID='" & fltr.txtTheCell.Tag & "'"
      End If
      If fltr.lblTheWeight_GE.Value = vbChecked Then
        f = f & " and wpPal_def_TheWeight>=" & val(fltr.txtTheWeight_GE.Text)
      End If
      If fltr.lblTheNumber.Value = vbChecked Then
        f = f & " and wpPal_def_TheNumber like '%" & fltr.txtTheNumber.Text & "%'"
      End If
      If fltr.lblTheWeight_LE.Value = vbChecked Then
        f = f & " and wpPal_def_TheWeight<=" & val(fltr.txtTheWeight_LE.Text)
      End If
      If fltr.lblWeightingDate_LE.Value = vbChecked Then
        f = f & " and wpPal_def_WeightingDate<=" & MakeMSSQLDate(fltr.dtpWeightingDate_LE.Value)
      End If
      If fltr.lblWeightingDate_GE.Value = vbChecked Then
        f = f & " and wpPal_def_WeightingDate>=" & MakeMSSQLDate(fltr.dtpWeightingDate_GE.Value)
      End If
    jfmnuwpPal_2.jv.Filter.Add "AUTOwpPal_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpPal_2_OnClearFilter()
   jfmnuwpPal_2.jv.Filter.Add "AUTOwpPal_def", " INTSANCEStatusID='{5E67134F-3A06-4639-8993-ABC12AB96D00}'"
End Sub
Private Sub jfmnuwpPal_2_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpPal", "Паллета" & Now, Site
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


Private Sub mnuwpPal_3_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpPal_3 Is Nothing Then
      Set jfmnuwpPal_3 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{214501F8-F2CB-4C89-971F-7F5D52EA939E}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpPal_3.jv.journal = journal
      jfmnuwpPal_3.jv.OpenModal = False
      jfmnuwpPal_3.Caption = "Паллета :Пустая"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{58B81E48-6D54-4F47-A237-EC4B72718D7D}'"
    jfmnuwpPal_3.jv.Filter.Add "AUTOwpPal_def", f
    Dim fltr As frmwpPal
    Set fltr = New frmwpPal
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblLockedForIn.Value = vbChecked Then
        f = f & " and wpPal_def_LockedForIn_ID='" & fltr.txtLockedForIn.Tag & "'"
      End If
      If fltr.lblpalType.Value = vbChecked Then
        f = f & " and wpPal_def_palType_ID='" & fltr.txtpalType.Tag & "'"
      End If
      If fltr.lblLockedForOut.Value = vbChecked Then
        f = f & " and wpPal_def_LockedForOut_ID='" & fltr.txtLockedForOut.Tag & "'"
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpPal_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblTheCell.Value = vbChecked Then
        f = f & " and wpPal_def_TheCell_ID='" & fltr.txtTheCell.Tag & "'"
      End If
      If fltr.lblTheWeight_GE.Value = vbChecked Then
        f = f & " and wpPal_def_TheWeight>=" & val(fltr.txtTheWeight_GE.Text)
      End If
      If fltr.lblTheNumber.Value = vbChecked Then
        f = f & " and wpPal_def_TheNumber like '%" & fltr.txtTheNumber.Text & "%'"
      End If
      If fltr.lblTheWeight_LE.Value = vbChecked Then
        f = f & " and wpPal_def_TheWeight<=" & val(fltr.txtTheWeight_LE.Text)
      End If
      If fltr.lblWeightingDate_LE.Value = vbChecked Then
        f = f & " and wpPal_def_WeightingDate<=" & MakeMSSQLDate(fltr.dtpWeightingDate_LE.Value)
      End If
      If fltr.lblWeightingDate_GE.Value = vbChecked Then
        f = f & " and wpPal_def_WeightingDate>=" & MakeMSSQLDate(fltr.dtpWeightingDate_GE.Value)
      End If
    jfmnuwpPal_3.jv.Filter.Add "AUTOwpPal_def", f
    End If
      jfmnuwpPal_3.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpPal_3.Show
    jfmnuwpPal_3.WindowState = 0
    jfmnuwpPal_3.ZOrder 0
End Sub
Private Sub jfmnuwpPal_3_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpPal
    Dim f As String
    Set fltr = New frmwpPal
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{58B81E48-6D54-4F47-A237-EC4B72718D7D}'"
      If fltr.lblLockedForIn.Value = vbChecked Then
        f = f & " and wpPal_def_LockedForIn_ID='" & fltr.txtLockedForIn.Tag & "'"
      End If
      If fltr.lblpalType.Value = vbChecked Then
        f = f & " and wpPal_def_palType_ID='" & fltr.txtpalType.Tag & "'"
      End If
      If fltr.lblLockedForOut.Value = vbChecked Then
        f = f & " and wpPal_def_LockedForOut_ID='" & fltr.txtLockedForOut.Tag & "'"
      End If
      If fltr.lblS_code.Value = vbChecked Then
        f = f & " and wpPal_def_S_code like '%" & fltr.txtS_code.Text & "%'"
      End If
      If fltr.lblTheCell.Value = vbChecked Then
        f = f & " and wpPal_def_TheCell_ID='" & fltr.txtTheCell.Tag & "'"
      End If
      If fltr.lblTheWeight_GE.Value = vbChecked Then
        f = f & " and wpPal_def_TheWeight>=" & val(fltr.txtTheWeight_GE.Text)
      End If
      If fltr.lblTheNumber.Value = vbChecked Then
        f = f & " and wpPal_def_TheNumber like '%" & fltr.txtTheNumber.Text & "%'"
      End If
      If fltr.lblTheWeight_LE.Value = vbChecked Then
        f = f & " and wpPal_def_TheWeight<=" & val(fltr.txtTheWeight_LE.Text)
      End If
      If fltr.lblWeightingDate_LE.Value = vbChecked Then
        f = f & " and wpPal_def_WeightingDate<=" & MakeMSSQLDate(fltr.dtpWeightingDate_LE.Value)
      End If
      If fltr.lblWeightingDate_GE.Value = vbChecked Then
        f = f & " and wpPal_def_WeightingDate>=" & MakeMSSQLDate(fltr.dtpWeightingDate_GE.Value)
      End If
    jfmnuwpPal_3.jv.Filter.Add "AUTOwpPal_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpPal_3_OnClearFilter()
   jfmnuwpPal_3.jv.Filter.Add "AUTOwpPal_def", " INTSANCEStatusID='{58B81E48-6D54-4F47-A237-EC4B72718D7D}'"
End Sub
Private Sub jfmnuwpPal_3_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpPal", "Паллета" & Now, Site
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




Private Sub mnuAllwpShift_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuAllwpShift Is Nothing Then
      Set jfmnuAllwpShift = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{25B0312B-1D80-4C2B-9E01-305DF54E2E4B}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuAllwpShift.jv.journal = journal
      jfmnuAllwpShift.jv.OpenModal = False
      jfmnuAllwpShift.Caption = "Перемещение - все состояния"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmwpShift
    Set fltr = New frmwpShift
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblpallet.Value = vbChecked Then
        f = f & " and wpShift_def_pallet_ID='" & fltr.txtpallet.Tag & "'"
      End If
      If fltr.lblTheCell.Value = vbChecked Then
        f = f & " and wpShift_def_TheCell_ID='" & fltr.txtTheCell.Tag & "'"
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
    jfmnuAllwpShift.jv.Filter.Add "AUTOwpShift_def", f
    End If
      jfmnuAllwpShift.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuAllwpShift.Show
    jfmnuAllwpShift.WindowState = 0
    jfmnuAllwpShift.ZOrder 0
End Sub
Private Sub jfmnuAllwpShift_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpShift
    Dim f As String
    Set fltr = New frmwpShift
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblpallet.Value = vbChecked Then
        f = f & " and wpShift_def_pallet_ID='" & fltr.txtpallet.Tag & "'"
      End If
      If fltr.lblTheCell.Value = vbChecked Then
        f = f & " and wpShift_def_TheCell_ID='" & fltr.txtTheCell.Tag & "'"
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
    jfmnuAllwpShift.jv.Filter.Add "AUTOwpShift_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuAllwpShift_OnClearFilter()
End Sub
Private Sub jfmnuAllwpShift_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpShift", "Перемещение" & Now, Site
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


Private Sub mnuwpShift_1_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpShift_1 Is Nothing Then
      Set jfmnuwpShift_1 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{25B0312B-1D80-4C2B-9E01-305DF54E2E4B}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpShift_1.jv.journal = journal
      jfmnuwpShift_1.jv.OpenModal = False
      jfmnuwpShift_1.Caption = "Перемещение :Отменен"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{C39DA1F6-9C9B-4B50-A32E-0A91438CA7F8}'"
    jfmnuwpShift_1.jv.Filter.Add "AUTOwpShift_def", f
    Dim fltr As frmwpShift
    Set fltr = New frmwpShift
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblpallet.Value = vbChecked Then
        f = f & " and wpShift_def_pallet_ID='" & fltr.txtpallet.Tag & "'"
      End If
      If fltr.lblTheCell.Value = vbChecked Then
        f = f & " and wpShift_def_TheCell_ID='" & fltr.txtTheCell.Tag & "'"
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
    jfmnuwpShift_1.jv.Filter.Add "AUTOwpShift_def", f
    End If
      jfmnuwpShift_1.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpShift_1.Show
    jfmnuwpShift_1.WindowState = 0
    jfmnuwpShift_1.ZOrder 0
End Sub
Private Sub jfmnuwpShift_1_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpShift
    Dim f As String
    Set fltr = New frmwpShift
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{C39DA1F6-9C9B-4B50-A32E-0A91438CA7F8}'"
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblpallet.Value = vbChecked Then
        f = f & " and wpShift_def_pallet_ID='" & fltr.txtpallet.Tag & "'"
      End If
      If fltr.lblTheCell.Value = vbChecked Then
        f = f & " and wpShift_def_TheCell_ID='" & fltr.txtTheCell.Tag & "'"
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
    jfmnuwpShift_1.jv.Filter.Add "AUTOwpShift_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpShift_1_OnClearFilter()
   jfmnuwpShift_1.jv.Filter.Add "AUTOwpShift_def", " INTSANCEStatusID='{C39DA1F6-9C9B-4B50-A32E-0A91438CA7F8}'"
End Sub
Private Sub jfmnuwpShift_1_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpShift", "Перемещение" & Now, Site
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


Private Sub mnuwpShift_2_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpShift_2 Is Nothing Then
      Set jfmnuwpShift_2 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{25B0312B-1D80-4C2B-9E01-305DF54E2E4B}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpShift_2.jv.journal = journal
      jfmnuwpShift_2.jv.OpenModal = False
      jfmnuwpShift_2.Caption = "Перемещение :Перемещен"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{877CE768-3554-4D38-8419-0FA19D5F7ACB}'"
    jfmnuwpShift_2.jv.Filter.Add "AUTOwpShift_def", f
    Dim fltr As frmwpShift
    Set fltr = New frmwpShift
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblpallet.Value = vbChecked Then
        f = f & " and wpShift_def_pallet_ID='" & fltr.txtpallet.Tag & "'"
      End If
      If fltr.lblTheCell.Value = vbChecked Then
        f = f & " and wpShift_def_TheCell_ID='" & fltr.txtTheCell.Tag & "'"
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
    jfmnuwpShift_2.jv.Filter.Add "AUTOwpShift_def", f
    End If
      jfmnuwpShift_2.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpShift_2.Show
    jfmnuwpShift_2.WindowState = 0
    jfmnuwpShift_2.ZOrder 0
End Sub
Private Sub jfmnuwpShift_2_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpShift
    Dim f As String
    Set fltr = New frmwpShift
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{877CE768-3554-4D38-8419-0FA19D5F7ACB}'"
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblpallet.Value = vbChecked Then
        f = f & " and wpShift_def_pallet_ID='" & fltr.txtpallet.Tag & "'"
      End If
      If fltr.lblTheCell.Value = vbChecked Then
        f = f & " and wpShift_def_TheCell_ID='" & fltr.txtTheCell.Tag & "'"
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
    jfmnuwpShift_2.jv.Filter.Add "AUTOwpShift_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpShift_2_OnClearFilter()
   jfmnuwpShift_2.jv.Filter.Add "AUTOwpShift_def", " INTSANCEStatusID='{877CE768-3554-4D38-8419-0FA19D5F7ACB}'"
End Sub
Private Sub jfmnuwpShift_2_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpShift", "Перемещение" & Now, Site
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


Private Sub mnuwpShift_3_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpShift_3 Is Nothing Then
      Set jfmnuwpShift_3 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{25B0312B-1D80-4C2B-9E01-305DF54E2E4B}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpShift_3.jv.journal = journal
      jfmnuwpShift_3.jv.OpenModal = False
      jfmnuwpShift_3.Caption = "Перемещение :Проведен"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{ADEA0736-B8F9-4414-8604-9BA3015EB112}'"
    jfmnuwpShift_3.jv.Filter.Add "AUTOwpShift_def", f
    Dim fltr As frmwpShift
    Set fltr = New frmwpShift
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblpallet.Value = vbChecked Then
        f = f & " and wpShift_def_pallet_ID='" & fltr.txtpallet.Tag & "'"
      End If
      If fltr.lblTheCell.Value = vbChecked Then
        f = f & " and wpShift_def_TheCell_ID='" & fltr.txtTheCell.Tag & "'"
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
    jfmnuwpShift_3.jv.Filter.Add "AUTOwpShift_def", f
    End If
      jfmnuwpShift_3.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpShift_3.Show
    jfmnuwpShift_3.WindowState = 0
    jfmnuwpShift_3.ZOrder 0
End Sub
Private Sub jfmnuwpShift_3_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpShift
    Dim f As String
    Set fltr = New frmwpShift
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{ADEA0736-B8F9-4414-8604-9BA3015EB112}'"
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblpallet.Value = vbChecked Then
        f = f & " and wpShift_def_pallet_ID='" & fltr.txtpallet.Tag & "'"
      End If
      If fltr.lblTheCell.Value = vbChecked Then
        f = f & " and wpShift_def_TheCell_ID='" & fltr.txtTheCell.Tag & "'"
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
    jfmnuwpShift_3.jv.Filter.Add "AUTOwpShift_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpShift_3_OnClearFilter()
   jfmnuwpShift_3.jv.Filter.Add "AUTOwpShift_def", " INTSANCEStatusID='{ADEA0736-B8F9-4414-8604-9BA3015EB112}'"
End Sub
Private Sub jfmnuwpShift_3_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpShift", "Перемещение" & Now, Site
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


Private Sub mnuwpShift_4_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpShift_4 Is Nothing Then
      Set jfmnuwpShift_4 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{25B0312B-1D80-4C2B-9E01-305DF54E2E4B}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpShift_4.jv.journal = journal
      jfmnuwpShift_4.jv.OpenModal = False
      jfmnuwpShift_4.Caption = "Перемещение :Создан"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{52DE307B-4B5F-4320-A8DC-87B57B4250E1}'"
    jfmnuwpShift_4.jv.Filter.Add "AUTOwpShift_def", f
    Dim fltr As frmwpShift
    Set fltr = New frmwpShift
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblpallet.Value = vbChecked Then
        f = f & " and wpShift_def_pallet_ID='" & fltr.txtpallet.Tag & "'"
      End If
      If fltr.lblTheCell.Value = vbChecked Then
        f = f & " and wpShift_def_TheCell_ID='" & fltr.txtTheCell.Tag & "'"
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
    jfmnuwpShift_4.jv.Filter.Add "AUTOwpShift_def", f
    End If
      jfmnuwpShift_4.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpShift_4.Show
    jfmnuwpShift_4.WindowState = 0
    jfmnuwpShift_4.ZOrder 0
End Sub
Private Sub jfmnuwpShift_4_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpShift
    Dim f As String
    Set fltr = New frmwpShift
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{52DE307B-4B5F-4320-A8DC-87B57B4250E1}'"
      If fltr.lbltheDate_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate<=" & MakeMSSQLDate(fltr.dtptheDate_LE.Value)
      End If
      If fltr.lblpallet.Value = vbChecked Then
        f = f & " and wpShift_def_pallet_ID='" & fltr.txtpallet.Tag & "'"
      End If
      If fltr.lblTheCell.Value = vbChecked Then
        f = f & " and wpShift_def_TheCell_ID='" & fltr.txtTheCell.Tag & "'"
      End If
      If fltr.lbltheNumber_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber>=" & val(fltr.txttheNumber_GE.Text)
      End If
      If fltr.lbltheNumber_LE.Value = vbChecked Then
        f = f & " and wpShift_def_theNumber<=" & val(fltr.txttheNumber_LE.Text)
      End If
      If fltr.lbltheDate_GE.Value = vbChecked Then
        f = f & " and wpShift_def_theDate>=" & MakeMSSQLDate(fltr.dtptheDate_GE.Value)
      End If
    jfmnuwpShift_4.jv.Filter.Add "AUTOwpShift_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpShift_4_OnClearFilter()
   jfmnuwpShift_4.jv.Filter.Add "AUTOwpShift_def", " INTSANCEStatusID='{52DE307B-4B5F-4320-A8DC-87B57B4250E1}'"
End Sub
Private Sub jfmnuwpShift_4_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpShift", "Перемещение" & Now, Site
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




Private Sub mnuwpCount_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuwpCount Is Nothing Then
      Set jfmnuwpCount = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{64531607-AF93-4237-BFDC-101CA494A327}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuwpCount.jv.journal = journal
      jfmnuwpCount.jv.OpenModal = False
      jfmnuwpCount.Caption = "Счетчики"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmwpCount
    Set fltr = New frmwpCount
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lblmaxPal_LE.Value = vbChecked Then
        f = f & " and wpCount_main_maxPal<=" & val(fltr.txtmaxPal_LE.Text)
      End If
      If fltr.lblmaxPal_GE.Value = vbChecked Then
        f = f & " and wpCount_main_maxPal>=" & val(fltr.txtmaxPal_GE.Text)
      End If
    jfmnuwpCount.jv.Filter.Add "AUTOwpCount_main", f
    End If
      jfmnuwpCount.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuwpCount.Show
    jfmnuwpCount.WindowState = 0
    jfmnuwpCount.ZOrder 0
End Sub
Private Sub jfmnuwpCount_OnFilter(usedefault As Boolean)
    Dim fltr As frmwpCount
    Dim f As String
    Set fltr = New frmwpCount
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lblmaxPal_LE.Value = vbChecked Then
        f = f & " and wpCount_main_maxPal<=" & val(fltr.txtmaxPal_LE.Text)
      End If
      If fltr.lblmaxPal_GE.Value = vbChecked Then
        f = f & " and wpCount_main_maxPal>=" & val(fltr.txtmaxPal_GE.Text)
      End If
    jfmnuwpCount.jv.Filter.Add "AUTOwpCount_main", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuwpCount_OnClearFilter()
End Sub
Private Sub jfmnuwpCount_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "wpCount", "Счетчики" & Now, Site
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




Private Sub mnuwpG_Click()
 Dim o As Object
 Dim rs  As ADODB.Recordset
 Dim ID As String
  Set rs = Manager.ListInstances("", "wpG")
  If Not rs.EOF Then
    ID = rs!InstanceID
  Else
    ID = CreateGUID2
    Manager.NewInstance ID, "wpG", "Справочник товаров "
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


Private Sub mnuwpDic_Click()
 Dim o As Object
 Dim rs  As ADODB.Recordset
 Dim ID As String
  Set rs = Manager.ListInstances("", "wpDic")
  If Not rs.EOF Then
    ID = rs!InstanceID
  Else
    ID = CreateGUID2
    Manager.NewInstance ID, "wpDic", "Справочники"
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


Private Sub mnuwpCell_Click()
 Dim o As Object
 Dim rs  As ADODB.Recordset
 Dim ID As String
  Set rs = Manager.ListInstances("", "wpCell")
  If Not rs.EOF Then
    ID = rs!InstanceID
  Else
    ID = CreateGUID2
    Manager.NewInstance ID, "wpCell", "Ячейка"
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



Unload jfmnuAllwpACT
Set jfmnuAllwpACT = Nothing

Unload jfmnuwpACT_1
Set jfmnuwpACT_1 = Nothing

Unload jfmnuwpACT_2
Set jfmnuwpACT_2 = Nothing

Unload jfmnuwpACT_3
Set jfmnuwpACT_3 = Nothing

Unload jfmnuwpDog
Set jfmnuwpDog = Nothing


Unload jfmnuAllwpOut
Set jfmnuAllwpOut = Nothing

Unload jfmnuwpOut_1
Set jfmnuwpOut_1 = Nothing

Unload jfmnuwpOut_2
Set jfmnuwpOut_2 = Nothing

Unload jfmnuwpOut_3
Set jfmnuwpOut_3 = Nothing

Unload jfmnuwpOut_4
Set jfmnuwpOut_4 = Nothing

Unload jfmnuwpOut_5
Set jfmnuwpOut_5 = Nothing

Unload jfmnuwpOut_6
Set jfmnuwpOut_6 = Nothing


Unload jfmnuAllwpIN
Set jfmnuAllwpIN = Nothing

Unload jfmnuwpIN_1
Set jfmnuwpIN_1 = Nothing

Unload jfmnuwpIN_2
Set jfmnuwpIN_2 = Nothing

Unload jfmnuwpIN_3
Set jfmnuwpIN_3 = Nothing

Unload jfmnuwpIN_4
Set jfmnuwpIN_4 = Nothing

Unload jfmnuwpIN_5
Set jfmnuwpIN_5 = Nothing

Unload jfmnuwpIN_6
Set jfmnuwpIN_6 = Nothing

Unload jfmnuwpCLI
Set jfmnuwpCLI = Nothing


Unload jfmnuAllwpOpt
Set jfmnuAllwpOpt = Nothing

Unload jfmnuwpOpt_1
Set jfmnuwpOpt_1 = Nothing

Unload jfmnuwpOpt_2
Set jfmnuwpOpt_2 = Nothing

Unload jfmnuwpOpt_3
Set jfmnuwpOpt_3 = Nothing

Unload jfmnuwpOpt_4
Set jfmnuwpOpt_4 = Nothing

Unload jfmnuwpOpt_5
Set jfmnuwpOpt_5 = Nothing


Unload jfmnuAllwpPal
Set jfmnuAllwpPal = Nothing

Unload jfmnuwpPal_1
Set jfmnuwpPal_1 = Nothing

Unload jfmnuwpPal_2
Set jfmnuwpPal_2 = Nothing

Unload jfmnuwpPal_3
Set jfmnuwpPal_3 = Nothing


Unload jfmnuAllwpShift
Set jfmnuAllwpShift = Nothing

Unload jfmnuwpShift_1
Set jfmnuwpShift_1 = Nothing

Unload jfmnuwpShift_2
Set jfmnuwpShift_2 = Nothing

Unload jfmnuwpShift_3
Set jfmnuwpShift_3 = Nothing

Unload jfmnuwpShift_4
Set jfmnuwpShift_4 = Nothing

Unload jfmnuwpCount
Set jfmnuwpCount = Nothing





End Sub



