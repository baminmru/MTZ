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
      Begin VB.Menu mnuhw1 
         Caption         =   "world"
         Begin VB.Menu mnuAllhw1 
            Caption         =   "world - все состояния"
         End
         Begin VB.Menu mnuhw1_1 
            Caption         =   "world :xxx"
         End
         Begin VB.Menu mnuhw1_2 
            Caption         =   "world :yyyy"
         End
         Begin VB.Menu mnuhw1_3 
            Caption         =   "world :zzz"
         End
      End
   End
   Begin VB.Menu mnuDictionary 
      Caption         =   "Справочники"
      Begin VB.Menu mnudict 
         Caption         =   "dict"
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

Dim WithEvents jfmnuAllhw1 As frmJournalShow
Attribute jfmnuAllhw1.VB_VarHelpID = -1

Dim WithEvents jfmnuhw1_1 As frmJournalShow
Attribute jfmnuhw1_1.VB_VarHelpID = -1

Dim WithEvents jfmnuhw1_2 As frmJournalShow
Attribute jfmnuhw1_2.VB_VarHelpID = -1

Dim WithEvents jfmnuhw1_3 As frmJournalShow
Attribute jfmnuhw1_3.VB_VarHelpID = -1















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


Private Sub mnuAllhw1_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuAllhw1 Is Nothing Then
      Set jfmnuAllhw1 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{4608CAA8-0FD1-4E19-AFCD-20E508940237}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuAllhw1.jv.journal = journal
      jfmnuAllhw1.jv.OpenModal = False
      jfmnuAllhw1.Caption = "world - все состояния"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
    Dim fltr As frmhw1
    Set fltr = New frmhw1
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lbldat_LE.Value = vbChecked Then
        f = f & " and hw1_def_dat<=" & MakeMSSQLDate(fltr.dtpdat_LE.Value)
      End If
      If fltr.lbldat_GE.Value = vbChecked Then
        f = f & " and hw1_def_dat>=" & MakeMSSQLDate(fltr.dtpdat_GE.Value)
      End If
      If fltr.lblname.Value = vbChecked Then
        f = f & " and hw1_def_name like '%" & fltr.txtname.Text & "%'"
      End If
    jfmnuAllhw1.jv.Filter.Add "AUTOhw1_def", f
    End If
      jfmnuAllhw1.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuAllhw1.Show
    jfmnuAllhw1.WindowState = 0
    jfmnuAllhw1.ZOrder 0
End Sub
Private Sub jfmnuAllhw1_OnFilter(usedefault As Boolean)
    Dim fltr As frmhw1
    Dim f As String
    Set fltr = New frmhw1
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
      If fltr.lbldat_LE.Value = vbChecked Then
        f = f & " and hw1_def_dat<=" & MakeMSSQLDate(fltr.dtpdat_LE.Value)
      End If
      If fltr.lbldat_GE.Value = vbChecked Then
        f = f & " and hw1_def_dat>=" & MakeMSSQLDate(fltr.dtpdat_GE.Value)
      End If
      If fltr.lblname.Value = vbChecked Then
        f = f & " and hw1_def_name like '%" & fltr.txtname.Text & "%'"
      End If
    jfmnuAllhw1.jv.Filter.Add "AUTOhw1_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuAllhw1_OnClearFilter()
End Sub
Private Sub jfmnuAllhw1_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "hw1", "world" & Now, Site
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


Private Sub mnuhw1_1_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuhw1_1 Is Nothing Then
      Set jfmnuhw1_1 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{4608CAA8-0FD1-4E19-AFCD-20E508940237}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuhw1_1.jv.journal = journal
      jfmnuhw1_1.jv.OpenModal = False
      jfmnuhw1_1.Caption = "world :xxx"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{C3334582-F725-4A98-9EDC-9ED5309A1A2B}'"
    jfmnuhw1_1.jv.Filter.Add "AUTOhw1_def", f
    Dim fltr As frmhw1
    Set fltr = New frmhw1
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lbldat_LE.Value = vbChecked Then
        f = f & " and hw1_def_dat<=" & MakeMSSQLDate(fltr.dtpdat_LE.Value)
      End If
      If fltr.lbldat_GE.Value = vbChecked Then
        f = f & " and hw1_def_dat>=" & MakeMSSQLDate(fltr.dtpdat_GE.Value)
      End If
      If fltr.lblname.Value = vbChecked Then
        f = f & " and hw1_def_name like '%" & fltr.txtname.Text & "%'"
      End If
    jfmnuhw1_1.jv.Filter.Add "AUTOhw1_def", f
    End If
      jfmnuhw1_1.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuhw1_1.Show
    jfmnuhw1_1.WindowState = 0
    jfmnuhw1_1.ZOrder 0
End Sub
Private Sub jfmnuhw1_1_OnFilter(usedefault As Boolean)
    Dim fltr As frmhw1
    Dim f As String
    Set fltr = New frmhw1
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{C3334582-F725-4A98-9EDC-9ED5309A1A2B}'"
      If fltr.lbldat_LE.Value = vbChecked Then
        f = f & " and hw1_def_dat<=" & MakeMSSQLDate(fltr.dtpdat_LE.Value)
      End If
      If fltr.lbldat_GE.Value = vbChecked Then
        f = f & " and hw1_def_dat>=" & MakeMSSQLDate(fltr.dtpdat_GE.Value)
      End If
      If fltr.lblname.Value = vbChecked Then
        f = f & " and hw1_def_name like '%" & fltr.txtname.Text & "%'"
      End If
    jfmnuhw1_1.jv.Filter.Add "AUTOhw1_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuhw1_1_OnClearFilter()
   jfmnuhw1_1.jv.Filter.Add "AUTOhw1_def", " INTSANCEStatusID='{C3334582-F725-4A98-9EDC-9ED5309A1A2B}'"
End Sub
Private Sub jfmnuhw1_1_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "hw1", "world" & Now, Site
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


Private Sub mnuhw1_2_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuhw1_2 Is Nothing Then
      Set jfmnuhw1_2 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{4608CAA8-0FD1-4E19-AFCD-20E508940237}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuhw1_2.jv.journal = journal
      jfmnuhw1_2.jv.OpenModal = False
      jfmnuhw1_2.Caption = "world :yyyy"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{6E142449-96CE-4095-ABD4-8C3C493AF367}'"
    jfmnuhw1_2.jv.Filter.Add "AUTOhw1_def", f
    Dim fltr As frmhw1
    Set fltr = New frmhw1
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lbldat_LE.Value = vbChecked Then
        f = f & " and hw1_def_dat<=" & MakeMSSQLDate(fltr.dtpdat_LE.Value)
      End If
      If fltr.lbldat_GE.Value = vbChecked Then
        f = f & " and hw1_def_dat>=" & MakeMSSQLDate(fltr.dtpdat_GE.Value)
      End If
      If fltr.lblname.Value = vbChecked Then
        f = f & " and hw1_def_name like '%" & fltr.txtname.Text & "%'"
      End If
    jfmnuhw1_2.jv.Filter.Add "AUTOhw1_def", f
    End If
      jfmnuhw1_2.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuhw1_2.Show
    jfmnuhw1_2.WindowState = 0
    jfmnuhw1_2.ZOrder 0
End Sub
Private Sub jfmnuhw1_2_OnFilter(usedefault As Boolean)
    Dim fltr As frmhw1
    Dim f As String
    Set fltr = New frmhw1
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{6E142449-96CE-4095-ABD4-8C3C493AF367}'"
      If fltr.lbldat_LE.Value = vbChecked Then
        f = f & " and hw1_def_dat<=" & MakeMSSQLDate(fltr.dtpdat_LE.Value)
      End If
      If fltr.lbldat_GE.Value = vbChecked Then
        f = f & " and hw1_def_dat>=" & MakeMSSQLDate(fltr.dtpdat_GE.Value)
      End If
      If fltr.lblname.Value = vbChecked Then
        f = f & " and hw1_def_name like '%" & fltr.txtname.Text & "%'"
      End If
    jfmnuhw1_2.jv.Filter.Add "AUTOhw1_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuhw1_2_OnClearFilter()
   jfmnuhw1_2.jv.Filter.Add "AUTOhw1_def", " INTSANCEStatusID='{6E142449-96CE-4095-ABD4-8C3C493AF367}'"
End Sub
Private Sub jfmnuhw1_2_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "hw1", "world" & Now, Site
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


Private Sub mnuhw1_3_Click()
    Dim journal As Object
    On Error Resume Next
    If jfmnuhw1_3 Is Nothing Then
      Set jfmnuhw1_3 = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{4608CAA8-0FD1-4E19-AFCD-20E508940237}")
      Manager.LockInstanceObject journal.ID
      Set jfmnuhw1_3.jv.journal = journal
      jfmnuhw1_3.jv.OpenModal = False
      jfmnuhw1_3.Caption = "world :zzz"
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
    f = "1=1"
   f = " INTSANCEStatusID='{1A434074-52A8-4A7C-98B5-2BA317C0DA81}'"
    jfmnuhw1_3.jv.Filter.Add "AUTOhw1_def", f
    Dim fltr As frmhw1
    Set fltr = New frmhw1
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
      If fltr.lbldat_LE.Value = vbChecked Then
        f = f & " and hw1_def_dat<=" & MakeMSSQLDate(fltr.dtpdat_LE.Value)
      End If
      If fltr.lbldat_GE.Value = vbChecked Then
        f = f & " and hw1_def_dat>=" & MakeMSSQLDate(fltr.dtpdat_GE.Value)
      End If
      If fltr.lblname.Value = vbChecked Then
        f = f & " and hw1_def_name like '%" & fltr.txtname.Text & "%'"
      End If
    jfmnuhw1_3.jv.Filter.Add "AUTOhw1_def", f
    End If
      jfmnuhw1_3.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    jfmnuhw1_3.Show
    jfmnuhw1_3.WindowState = 0
    jfmnuhw1_3.ZOrder 0
End Sub
Private Sub jfmnuhw1_3_OnFilter(usedefault As Boolean)
    Dim fltr As frmhw1
    Dim f As String
    Set fltr = New frmhw1
    fltr.Show vbModal
    If fltr.OK Then
    ' build flter expression
    f = "1=1"
   f = " INTSANCEStatusID='{1A434074-52A8-4A7C-98B5-2BA317C0DA81}'"
      If fltr.lbldat_LE.Value = vbChecked Then
        f = f & " and hw1_def_dat<=" & MakeMSSQLDate(fltr.dtpdat_LE.Value)
      End If
      If fltr.lbldat_GE.Value = vbChecked Then
        f = f & " and hw1_def_dat>=" & MakeMSSQLDate(fltr.dtpdat_GE.Value)
      End If
      If fltr.lblname.Value = vbChecked Then
        f = f & " and hw1_def_name like '%" & fltr.txtname.Text & "%'"
      End If
    jfmnuhw1_3.jv.Filter.Add "AUTOhw1_def", f
    End If
    Unload fltr
    usedefault = False
End Sub
Private Sub jfmnuhw1_3_OnClearFilter()
   jfmnuhw1_3.jv.Filter.Add "AUTOhw1_def", " INTSANCEStatusID='{1A434074-52A8-4A7C-98B5-2BA317C0DA81}'"
End Sub
Private Sub jfmnuhw1_3_OnAdd(usedefaut As Boolean, Refesh As Boolean)
  Dim objGui  As Object
  Dim o As Object
  Dim ID As String
  ID = CreateGUID2
  Manager.NewInstance ID, "hw1", "world" & Now, Site
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






Private Sub mnudict_Click()
 Dim o As Object
 Dim rs  As ADODB.Recordset
 Dim ID As String
  Set rs = Manager.ListInstances("", "dict")
  If Not rs.EOF Then
    ID = rs!InstanceID
  Else
    ID = CreateGUID2
    Manager.NewInstance ID, "dict", "dict"
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



Unload jfmnuAllhw1
Set jfmnuAllhw1 = Nothing

Unload jfmnuhw1_1
Set jfmnuhw1_1 = Nothing

Unload jfmnuhw1_2
Set jfmnuhw1_2 = Nothing

Unload jfmnuhw1_3
Set jfmnuhw1_3 = Nothing



End Sub



