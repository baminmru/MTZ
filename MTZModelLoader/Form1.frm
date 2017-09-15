VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Загрузка начальных данных"
   ClientHeight    =   2445
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5925
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2445
   ScaleWidth      =   5925
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdPath 
      Caption         =   "..."
      Height          =   315
      Left            =   5520
      TabIndex        =   4
      Top             =   480
      Width           =   315
   End
   Begin VB.TextBox txtPath 
      Height          =   285
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   3
      Top             =   480
      Width           =   5370
   End
   Begin VB.CheckBox chkAppend 
      Caption         =   "Append mode"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   1560
      Width           =   4335
   End
   Begin VB.Timer Timer1 
      Interval        =   60000
      Left            =   5160
      Top             =   1440
   End
   Begin VB.CommandButton cmdLoad 
      Caption         =   "Загрузить данные из XML файлов"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   960
      Width           =   5775
   End
   Begin VB.Label Label8 
      Caption         =   "Путь для загрузки:"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   120
      Width           =   1785
   End
   Begin VB.Label Label1 
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   1920
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

Private Sub LoadObjects(start As Integer)
On Error Resume Next
Dim xdom As MSXML2.DOMDocument

Dim path As String

Dim drs As Object, ID As String, typename As String, name As String
Dim i As Long
i = start
path = Dir(txtPath & "\*.xml")
While path <> ""
    Set xdom = New MSXML2.DOMDocument
    xdom.Load txtPath & "\" & path
    ID = xdom.lastChild.firstChild.Attributes.getNamedItem("ID").nodeValue
    typename = xdom.lastChild.firstChild.Attributes.getNamedItem("TYPENAME").nodeValue
    name = typename
    
    'try if new format
    name = xdom.lastChild.firstChild.Attributes.getNamedItem("NAME").nodeValue
    i = i + 1
    Label1.Caption = CStr(i) & ": load " + typename
    DoEvents
    Set drs = m.GetInstanceObject(ID)
    If drs Is Nothing Then
      m.NewInstance ID, typename, name
    End If
    If UCase(drs.ID) <> "{88DEEBA4-69B1-454A-992A-FAE3CEBFBCA1}" Then
      Set drs = m.GetInstanceObject(ID)
      If Not drs Is Nothing Then
        drs.LockResource True
        drs.AutoLoadPart = True
        'drs.WorkOffline = True
        If chkAppend.Value = vbChecked Then
          drs.XMLLoad xdom.lastChild, 0
        Else
          drs.XMLLoad xdom.lastChild, 1
        End If
        'drs.XMLLoad xdom.lastChild, 0
        drs.WorkOffline = False
        drs.BatchUpdate
        drs.UnLockResource
      End If
      Set xdom = Nothing
    Else
      Label1.Caption = CStr(i) & ": skip " + typename
      DoEvents
    End If
    path = Dir
Wend
Label1.Caption = CStr(i) & " objects loaded"
End Sub

Private Function LoadMetaModel() As Integer
'MetaModel
Set rs = m.ListInstances(site, "MTZMetaModel")
Dim drs As Object, ID As String
 If Not rs.EOF Then
   ID = rs!InstanceID
 Else
  ID = "{88DEEBA4-69B1-454A-992A-FAE3CEBFBCA1}"
  m.NewInstance ID, "MTZMetaModel", "Спец:Метамодель"
 End If
 Set drs = m.GetInstanceObject(ID)

drs.LockResource True
drs.AutoLoadPart = False
'drs.WorkOffline = True
LoadMetaModel = 0
Label1.Caption = "Try to load MetaModel"
DoEvents
On Error Resume Next
  Dim xdom As MSXML2.DOMDocument
  Set xdom = New MSXML2.DOMDocument
  xdom.Load txtPath & "\{88DEEBA4-69B1-454A-992A-FAE3CEBFBCA1}.xml"
  If xdom.xml <> "" Then
    Label1.Caption = "Loading MetaModel"
    DoEvents
    If chkAppend.Value = vbChecked Then
      drs.XMLLoad xdom.lastChild, 0
    Else
      drs.XMLLoad xdom.lastChild, 1
    End If
    drs.WorkOffline = False
    Label1.Caption = "Saving MetaModel"
    DoEvents
    drs.BatchUpdate
    LoadMetaModel = 1
  End If
  Set xdom = Nothing


End Function

Private Sub cmdLoad_Click()
  If txtPath = "" Then
    txtPath = App.path
  End If
  LoadObjects LoadMetaModel
End Sub

Private Sub cmdPath_Click()
  Dim path As String
  path = GetPath("Каталог с данными для загрузки", Me.hWnd)
  
  If (path <> vbNullString) Then
    txtPath.Text = path
  End If
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
