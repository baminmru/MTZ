VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Копирование объектов"
   ClientHeight    =   1365
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6045
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1365
   ScaleWidth      =   6045
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   60000
      Left            =   240
      Top             =   240
   End
   Begin VB.CommandButton cmdLoad 
      Caption         =   "Создать копии объектов из XML файлов"
      Height          =   495
      Left            =   840
      TabIndex        =   0
      Top             =   240
      Width           =   4335
   End
   Begin VB.Label Label1 
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Left            =   240
      TabIndex        =   1
      Top             =   840
      Width           =   5655
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim m As MTZManager.Main
Dim s As MTZSession.Session
Dim o As Object 'System.Application
Dim u As Object 'UserSecurity.Application
Dim rs As ADODB.Recordset
Dim site As String

Private Sub LoadObjects()
On Error Resume Next
Dim xdom As MSXML2.DOMDocument

Dim path As String

Dim drs As Object, id As String, typename As String, name As String

path = Dir(App.path & "\*.xml")
While path <> ""
    Set xdom = New MSXML2.DOMDocument
    xdom.Load path
    id = CreateGUID2
    xdom.lastChild.firstChild.Attributes.getNamedItem("ID").nodeValue = id
    typename = xdom.lastChild.firstChild.Attributes.getNamedItem("TYPENAME").nodeValue
    name = typename
    
    'try if new format
    name = xdom.lastChild.firstChild.Attributes.getNamedItem("NAME").nodeValue
    
    Label1.Caption = "load " + typename
    DoEvents
    Set drs = m.GetInstanceObject(id)
    If drs Is Nothing Then
      m.NewInstance id, typename, name
    End If
    Set drs = m.GetInstanceObject(id)
    If Not drs Is Nothing Then
      drs.LockResource True
      drs.AutoLoadPart = True
      drs.WorkOffline = True
      drs.XMLLoad xdom.lastChild, 2
      drs.WorkOffline = False
      drs.BatchUpdate
      drs.UnLockResource
    End If
    Set xdom = Nothing
    path = Dir
Wend
Label1.Caption = "done"
End Sub


Private Sub cmdLoad_Click()
  LoadObjects
End Sub

Private Sub Form_Load()
  Dim f As frmLogin
  Set f = New frmLogin
again:
  f.Show vbModal
  If Not f.OK Then End
  Set m = New MTZManager.Main
  site = f.txtSite
  Set s = m.GetSession(site)
  If s Is Nothing Then
    MsgBox "Wrong site name", vbCritical
    GoTo again
  End If
  s.Login f.txtUserName, f.txtPassword
  
  If s.sessionid = "" Then
    MsgBox "Bad user name or password", vbCritical
    GoTo again
  End If
  Unload f
  Set f = Nothing
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Timer1.Enabled = False
  m.GetSession(site).Logout
  Set m = Nothing
End Sub

Private Sub Timer1_Timer()
  On Error Resume Next: m.GetSession(site).Exec "SessionTouch", Nothing
End Sub
