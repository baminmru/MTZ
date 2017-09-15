VERSION 5.00
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form Form1 
   Caption         =   "Монитор блокировок"
   ClientHeight    =   6375
   ClientLeft      =   5355
   ClientTop       =   615
   ClientWidth     =   10200
   Icon            =   "Config1.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6375
   ScaleWidth      =   10200
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame frameRight 
      Caption         =   "Параметры подключения"
      Height          =   1785
      Left            =   0
      TabIndex        =   13
      Top             =   0
      Width           =   8235
      Begin VB.CheckBox chkIntegrated 
         Caption         =   "Интегрированная NT безопасность"
         Height          =   255
         Left            =   4140
         TabIndex        =   4
         Top             =   120
         Width           =   3855
      End
      Begin VB.TextBox txtDatabase 
         Height          =   285
         Left            =   180
         TabIndex        =   3
         Top             =   1320
         Width           =   3855
      End
      Begin VB.TextBox txtPassword 
         Height          =   285
         IMEMode         =   3  'DISABLE
         Left            =   4140
         PasswordChar    =   "*"
         TabIndex        =   8
         Top             =   1305
         Width           =   3855
      End
      Begin VB.TextBox txtLogin 
         Height          =   285
         Left            =   4140
         TabIndex        =   6
         Top             =   720
         Width           =   3855
      End
      Begin VB.TextBox txtServer 
         Height          =   285
         Left            =   180
         TabIndex        =   1
         Top             =   720
         Width           =   3855
      End
      Begin VB.Label lblDatabase 
         Caption         =   "База данных сайта:"
         Height          =   255
         Left            =   180
         TabIndex        =   2
         Top             =   1080
         Width           =   3855
      End
      Begin VB.Label lblPassword 
         Caption         =   "SQL пароль:"
         Height          =   255
         Left            =   4140
         TabIndex        =   7
         Top             =   1080
         Width           =   3855
      End
      Begin VB.Label lblLogin 
         Caption         =   "SQL имя пользователя:"
         Height          =   255
         Left            =   4140
         TabIndex        =   5
         Top             =   450
         Width           =   3855
      End
      Begin VB.Label lblServer 
         Caption         =   "SQL сервер:"
         Height          =   255
         Left            =   180
         TabIndex        =   0
         Top             =   480
         Width           =   3855
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "продолжить"
      Enabled         =   0   'False
      Height          =   375
      Left            =   8280
      TabIndex        =   11
      Top             =   960
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "пауза"
      Enabled         =   0   'False
      Height          =   375
      Left            =   8280
      TabIndex        =   10
      Top             =   480
      Width           =   1455
   End
   Begin MSDataGridLib.DataGrid DataGrid1 
      Height          =   4455
      Left            =   0
      TabIndex        =   12
      Top             =   1920
      Width           =   10095
      _ExtentX        =   17806
      _ExtentY        =   7858
      _Version        =   393216
      AllowUpdate     =   0   'False
      HeadLines       =   1
      RowHeight       =   15
      BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCount     =   2
      BeginProperty Column00 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1049
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column01 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1049
            SubFormatType   =   0
         EndProperty
      EndProperty
      SplitCount      =   1
      BeginProperty Split0 
         BeginProperty Column00 
         EndProperty
         BeginProperty Column01 
         EndProperty
      EndProperty
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   8400
      Top             =   1440
   End
   Begin VB.CommandButton cmdGo 
      Caption         =   "старт"
      Height          =   375
      Left            =   8280
      TabIndex        =   9
      Top             =   0
      Width           =   1455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private iListIndex As Long
Private bDontClear As Boolean
Private DS As DataSource
Private Log As String
'Private xdom As MSXML2.DOMDocument
Private w As Writer
Private firsttime As Boolean


Dim n As String, cnt As Long, i, inClick As Boolean















Private Sub cmdGo_Click()

 Set DS = New DataSource

' With xdom.lastChild.childNodes.Item(cmbSite.ListIndex).Attributes
'    DS.Server = .getNamedItem("Server").nodeValue
'   DS.DataBaseName = .getNamedItem("DB").nodeValue
'    DS.UserName = .getNamedItem("USER").nodeValue
'     DS.Password = .getNamedItem("PASSWORD").nodeValue
'
'    If .getNamedItem("INTEGRATED").nodeValue Then
'      DS.Integrated = True
'    Else
'     DS.Integrated = False
'    End If
'  End With


  Set DS = New DataSource
  DS.Server = txtServer
  DS.DataBaseName = txtDatabase.Text
  DS.UserName = txtLogin
  DS.Password = txtPassword
  DS.Integrated = (chkIntegrated.Value = vbChecked)
  
  If Not DS.ServerLogIn Then
    MsgBox "Не удается подключиться к Microsoft SQL Server", vbCritical
    Set DS = Nothing
    Exit Sub
  End If
  If w Is Nothing Then
    Set w = New Writer
  End If
  firsttime = True
  cmdGo.Enabled = False
  frameRight.Enabled = False
  Command1.Enabled = True
  Timer1.Enabled = True
  
End Sub

Private Sub Command1_Click()
Timer1.Enabled = False
Command1.Enabled = False
Command2.Enabled = True
Set w = Nothing
End Sub

Private Sub Command2_Click()
Timer1.Enabled = True
Command2.Enabled = False
Command1.Enabled = True
 If w Is Nothing Then
    Set w = New Writer
  End If
End Sub

Private Sub Form_Load()
 Dim i As Long
  Dim n As String
  
  
  
'  Set xdom = New MSXML2.DOMDocument
'  xdom.async = False
'  xdom.Load MTZGetSetting("MTZ", "CONFIG", "XMLPATH", App.Path & "\MTZ.XML")
'  On Error Resume Next
'
'  cmbSite.Clear
'  For i = 0 To xdom.lastChild.childNodes.length - 1
'    n = xdom.lastChild.childNodes.Item(i).Attributes.getNamedItem("Name").nodeValue
'    If n <> "" Then
'      cmbSite.AddItem n
'    End If
'  Next
'  If cmbSite.ListCount > 0 Then
'    cmbSite.ListIndex = 0
'  End If
    
End Sub




  





Private Sub cmdCancel_Click()
  Unload Me
  End
End Sub

Private Sub cmdOK_Click()
  Unload Me
  End
End Sub




Private Sub Form_Resize()
  On Error Resume Next
  DataGrid1.Left = 0
  DataGrid1.Width = Me.ScaleWidth
  DataGrid1.Height = Me.ScaleHeight - DataGrid1.Top
End Sub

Private Sub Form_Unload(Cancel As Integer)
Set w = Nothing
End Sub

Private Sub Timer1_Timer()
Dim rs As ADODB.RecordSet
Dim s As String
s = ""




s = s & vbCrLf & "select a.spid,a.type,a.mode, b.name tablename ,c.name dbname,d.name idxname, p.blocked, p.waittime,"
s = s & vbCrLf & "  p.program_name,p.last_batch,p.lastwaittype,  p.cmd, p.loginame,p.HostName,   p.open_tran, a.resource,p.login_time"
s = s & vbCrLf & "from ("
s = s & vbCrLf & "select  convert (smallint, req_spid) As spid,"
s = s & vbCrLf & "    rsc_dbid As dbid,"
s = s & vbCrLf & "    rsc_objid As ObjId,"
s = s & vbCrLf & "    rsc_indid As IndId,"
s = s & vbCrLf & "    substring (v.name, 1, 4) As Type,"
s = s & vbCrLf & "    substring (rsc_text, 1, 16) as Resource,"
s = s & vbCrLf & "    substring (u.name, 1, 8) As Mode,"
s = s & vbCrLf & "    substring(x.Name, 1, 5) As Status"
s = s & vbCrLf & ""
s = s & vbCrLf & "  from  master.dbo.syslockinfo with (nolock),"
s = s & vbCrLf & "    master.dbo.spt_values v with (nolock),"
s = s & vbCrLf & "    master.dbo.spt_values x with (nolock),"
s = s & vbCrLf & "    master.dbo.spt_values u with (nolock)"
s = s & vbCrLf & ""
s = s & vbCrLf & "  Where master.dbo.syslockinfo.rsc_type = v.Number"
s = s & vbCrLf & "      and v.type = 'LR'"
s = s & vbCrLf & "      and master.dbo.syslockinfo.req_status = x.number"
s = s & vbCrLf & "      and x.type = 'LS'"
s = s & vbCrLf & "      and master.dbo.syslockinfo.req_mode + 1 = u.number"
s = s & vbCrLf & "      and u.type = 'L'"
s = s & vbCrLf & ""
s = s & vbCrLf & " ) A join sysobjects B with (nolock) on A.objid = B.id"
s = s & vbCrLf & "join master.dbo.sysdatabases C with (nolock) on A.dbid = C.dbid and C.name = db_name()"
s = s & vbCrLf & "join  master.dbo.sysprocesses P with (nolock) on A.spid = p.spid"
s = s & vbCrLf & "left join sysindexes D with (nolock) on D.id = B.id and D.indid=A.indid"



Dim i As Integer
Dim ss As String
Dim ns As String


Set rs = DS.OpenRecordset(s)

If firsttime Then
  firsttime = False
  ss = ""
  For i = 1 To rs.Fields.Count
    ss = ss & """" & Trim(rs.Fields(i - 1).Name) & ""","
  Next
  ss = ss & """Время"""
  w.putBuf ss
End If


While Not rs.EOF
  ss = ""
  For i = 1 To rs.Fields.Count
    ss = ss & """" & Trim(rs.Fields(i - 1).Value) & ""","
  Next
  ss = ss & """" & Now & """"
  w.putBuf ss
  rs.MoveNext
Wend


Set DataGrid1.DataSource = rs
DataGrid1.Refresh
End Sub
