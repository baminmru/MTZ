VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.MDIForm frmMain 
   BackColor       =   &H8000000C&
   Caption         =   "���. ����������� ����"
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
      Caption         =   "����"
      WindowList      =   -1  'True
      Begin VB.Menu mnuAbout 
         Caption         =   "� ���������"
      End
      Begin VB.Menu mnuCascade 
         Caption         =   "������"
      End
      Begin VB.Menu mnuTileVert 
         Caption         =   "��������� �����������"
      End
      Begin VB.Menu mnuTileHor 
         Caption         =   "��������� �������������"
      End
      Begin VB.Menu mnuArrangeIcon 
         Caption         =   "��������� ������"
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
    Debug.Print f.name
Next


Set MyRole = Nothing
Set MyUser = Nothing
Set usr = Nothing
Set Model = Nothing
Erase Data


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


Private Sub mnuCheckLimits_Click()
  Dim f As frmAttention
  Set f = New frmAttention
  f.Show vbModal
  Unload f
  Set f = Nothing
End Sub

Private Sub mnuClients_Click()
Dim journal As Object
    On Error Resume Next
    If fCli Is Nothing Then
      Set fCli = New frmJournalShow
      Set journal = Manager.GetInstanceObject("{DCA61EB0-54F4-4FFF-B1AD-C4B2AE7A6332}")
      
      Manager.LockInstanceObject journal.ID
      Set fCli.jv.journal = journal
      fCli.jv.OpenModal = False
      fCli.Caption = journal.name
      Me.MousePointer = vbHourglass
      DoEvents
      Dim f As String
      f = GetSetting(App.Title & "." & App.Major & "." & App.Minor, "FILTER", "CLIENT", "")
      If f <> "" Then
        fCli.jv.Filter.Add "viewVRCCommonInfo", f
      End If
      fCli.jv.Refresh
      Me.MousePointer = vbNormal
    End If
    fCli.Show
    fCli.WindowState = 0
    fCli.ZOrder 0
End Sub

Private Sub mnuDicPEK_Click()
Dim o As Object, g As Object
  Dim rs As ADODB.Recordset
  Set rs = Manager.ListInstances(Site, "PEKD")
  Set o = Manager.GetInstanceObject(rs!InstanceID)
  If IsDocDenied(o) Then
    MsgBox "�� �������� ������ � ���������� ������ ����"
    Exit Sub
  End If
  Set g = Manager.GetInstanceGUI(rs!InstanceID)
  g.Show GetDocumentMode(o), o, False
  Set rs = Nothing
End Sub

Private Sub mnuDirDict_Click()
  Dim o As Object, g As Object
  Dim rs As ADODB.Recordset
  Set rs = Manager.ListInstances(Site, "dir_")
  Set o = Manager.GetInstanceObject(rs!InstanceID)
  If IsDocDenied(o) Then
    MsgBox "�� �������� ������ � ���������� ������ ����"
    Exit Sub
  End If
  Set g = Manager.GetInstanceGUI(rs!InstanceID)
  g.Show GetDocumentMode(o), o, False
  Set rs = Nothing
End Sub

Private Sub mnuExit_Click()
Unload Me
End Sub



Private Sub mnuFullText_Click()
  If frmFindFT Is Nothing Then
    Set frmFindFT = Manager.GetFullTextDialog(Site)
    frmFindFT.Caption = "����� �� ������"
  End If
  frmFindFT.Show
End Sub


Private Sub mnuSetMyorg_Click()
Dim f As frmMyOrg
Set f = New frmMyOrg
f.Show vbModal
Set f = Nothing
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
    If t.Caption = o.name Then
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

