VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Проект ""Муромец""  Сервер управления процессами"
   ClientHeight    =   4845
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6990
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   4845
   ScaleWidth      =   6990
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Height          =   4215
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Top             =   480
      Width           =   6735
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   10000
      Left            =   6360
      Top             =   0
   End
   Begin VB.Label Label1 
      Caption         =   "Журнал"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private InTimer As Boolean

Private Sub Form_Load()
Dim f As frmLogin

  Set f = New frmLogin
again:
  f.Show vbModal
  If Not f.OK Then End
  Set Manager = New MTZManager.Main
  Set Session = Manager.GetSession(f.txtSite)
  If Session Is Nothing Then
    MsgBox "Wrong site name", vbCritical
    GoTo again
  End If
  Session.Login f.txtUserName, f.txtPassword
  
  If Session.sessionid = "" Then
    MsgBox "Bad user name or password", vbCritical
    GoTo again
  End If
  Unload f
  Set f = Nothing
  Dim rs As ADODB.Recordset
  
  Set rs = Manager.ListInstances(Session.Site, "WFDic")
  If rs.EOF Then
    MsgBox "отсутствует справочник системы управления проессами"
    Exit Sub
  End If
  Set Server = New WFServer.Server
  Server.Attach Manager, Session
  
  Timer1.Enabled = True
  Exit Sub
bye:
  MsgBox Err.Description
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Set Server = Nothing
  Session.Logout
  Set Session = Nothing
  If Not Manager Is Nothing Then Manager.CloseClass
  Set Manager = Nothing
End Sub


Private Sub Timer1_Timer()
  On Error Resume Next: Session.Exec "SessionTouch", Nothing
  If InTimer Then Exit Sub
  InTimer = True
  LOG = Server.OneStep()
  LOG = LOG & vbCrLf & Text1.Text
  If Len(LOG) > 65000 Then
     LOG = Left(LOG, 65000)
  End If
  Text1.Text = LOG
  
  InTimer = False
End Sub
