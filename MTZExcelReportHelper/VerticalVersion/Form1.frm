VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Excel Vertical Report generator"
   ClientHeight    =   3945
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9525
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3945
   ScaleWidth      =   9525
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtTest 
      Height          =   390
      Left            =   2520
      TabIndex        =   15
      Top             =   2445
      Width           =   4755
   End
   Begin VB.CommandButton test 
      Caption         =   "test"
      Height          =   300
      Left            =   1395
      TabIndex        =   14
      Top             =   2505
      Width           =   975
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   240
      Top             =   2400
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComctlLib.ProgressBar ProgressBar1 
      Height          =   255
      Left            =   1440
      TabIndex        =   10
      Top             =   3000
      Width           =   7935
      _ExtentX        =   13996
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.CommandButton Command4 
      Caption         =   "..."
      Height          =   375
      Left            =   9050
      TabIndex        =   6
      Top             =   1800
      Width           =   375
   End
   Begin VB.CommandButton Command3 
      Caption         =   "..."
      Height          =   375
      Left            =   9050
      TabIndex        =   5
      Top             =   1320
      Width           =   375
   End
   Begin VB.CommandButton Command2 
      Caption         =   "..."
      Height          =   375
      Left            =   9050
      TabIndex        =   4
      Top             =   840
      Width           =   375
   End
   Begin VB.TextBox Text3 
      Height          =   375
      Left            =   2160
      TabIndex        =   3
      Top             =   1800
      Width           =   6855
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   2160
      TabIndex        =   2
      Top             =   1320
      Width           =   6855
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   2160
      TabIndex        =   1
      Top             =   840
      Width           =   6855
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Generate"
      Default         =   -1  'True
      Height          =   375
      Left            =   7815
      TabIndex        =   0
      Top             =   2520
      Width           =   1575
   End
   Begin VB.Image Image1 
      BorderStyle     =   1  'Fixed Single
      Height          =   765
      Left            =   0
      Picture         =   "Form1.frx":0000
      Top             =   0
      Width           =   9540
   End
   Begin VB.Label Label6 
      Height          =   375
      Left            =   1440
      TabIndex        =   13
      Top             =   3360
      Width           =   7935
   End
   Begin VB.Label Label5 
      Caption         =   "Action"
      Height          =   255
      Left            =   120
      TabIndex        =   12
      Top             =   3360
      Width           =   1095
   End
   Begin VB.Label Label4 
      Caption         =   "Progress"
      Height          =   255
      Left            =   120
      TabIndex        =   11
      Top             =   3000
      Width           =   1215
   End
   Begin VB.Label Label3 
      Caption         =   "Output file:"
      Height          =   375
      Left            =   120
      TabIndex        =   9
      Top             =   1800
      Width           =   1935
   End
   Begin VB.Label Label2 
      Caption         =   "Report template:"
      Height          =   375
      Left            =   120
      TabIndex        =   8
      Top             =   1320
      Width           =   1815
   End
   Begin VB.Label Label1 
      Caption         =   "Data Base:"
      Height          =   375
      Left            =   120
      TabIndex        =   7
      Top             =   840
      Width           =   1935
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private WithEvents xls As XLSProcesser
Attribute xls.VB_VarHelpID = -1

Private Sub Command1_Click()
    Dim tryWithPWD As Boolean
    Dim mADOConnection As adodb.Connection
    Dim pwddlg As PasswordDLG
    
    Set pwddlg = New PasswordDLG
    
    If Text1.Text = "" Then
        MsgBox "Please specify data base"
        Command2_Click
        Exit Sub
    End If
    
    If Text2.Text = "" Then
        MsgBox "Please specify XLS Template"
        Command3_Click
        Exit Sub
    End If
    
    If Text3.Text = "" Then
        MsgBox "Please specify output file"
        Command4_Click
        Exit Sub
    End If
   
    Set xls = New XLSProcesser
    
    Set mADOConnection = New adodb.Connection
    mADOConnection.ConnectionString = Text1.Text
    
    mADOConnection.ConnectionTimeout = 10
    mADOConnection.CommandTimeout = 10
    On Error Resume Next
    Call mADOConnection.Open
    If Err.Number = -2147217843 Then
        tryWithPWD = True
    Else
        tryWithPWD = False
    End If
    Err.Clear
    While tryWithPWD
        Err.Clear
        pwddlg.Show vbModal, Me
        If pwddlg.isOk Then
            mADOConnection.Open , pwddlg.login, pwddlg.pwd
            If Err.Number = -2147217843 Then
                tryWithPWD = True
            Else
                tryWithPWD = False
            End If
            
        Else
            Exit Sub
        End If
    Wend
    Unload pwddlg
    On Error GoTo onerr
    xls.MakeDocument mADOConnection, Text2.Text, Text3.Text
    Label6.Caption = ""
    ProgressBar1.Value = 0
    MsgBox "Report created and saved.", , "Report created"
    Exit Sub
'useForm:
onerr:
    MsgBox "Error: " & Err.Description, , "Error"
    Err.Clear
End Sub

Private Sub Command2_Click()
    Dim objNewUdl As MSDASC.DataLinks
    Dim cnnNewUdl As adodb.Connection
    
    Set objNewUdl = New MSDASC.DataLinks
    Set cnnNewUdl = New adodb.Connection
    cnnNewUdl.ConnectionString = Text1.Text
    cnnNewUdl.Provider = "SQLOLEDB"
    
    If objNewUdl.PromptEdit(cnnNewUdl) Then
        ' Get the Modified Results, if any
        Text1.Text = cnnNewUdl.ConnectionString
        'Set mADOConnection = cnnNewUdl
        SaveSetting "RBH XLS Report Tool", "Settings", "ConnectionString", cnnNewUdl.ConnectionString
    End If
End Sub

Private Sub Command3_Click()
    On Error Resume Next
    CommonDialog1.Filter = "Report template | *.XLS"
    CommonDialog1.CancelError = True
    CommonDialog1.ShowOpen
    If Err.Number = 0 Then
        Text2.Text = CommonDialog1.FileName
        SaveSetting "RBH XLS Report Tool", "Settings", "XLS Template", CommonDialog1.FileName
    End If
End Sub

Private Sub Command4_Click()
    On Error Resume Next
    CommonDialog1.Filter = "XLS Report | *.XLS"
    CommonDialog1.CancelError = True
    CommonDialog1.ShowSave
    If Err.Number = 0 Then
        Text3.Text = CommonDialog1.FileName
        SaveSetting "RBH XLS Report Tool", "Settings", "XLS Output", CommonDialog1.FileName
    End If
End Sub

Private Sub Form_Load()
    Text1.Text = GetSetting("RBH XLS Report Tool", "Settings", "ConnectionString", "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False")
    Text2.Text = GetSetting("RBH XLS Report Tool", "Settings", "XLS Template", "")
    Text3.Text = GetSetting("RBH XLS Report Tool", "Settings", "XLS Output", "")
    
End Sub

Private Sub test_Click()
Label6 = PrepareString(txtTest)
End Sub

Private Sub Text4_Change()

End Sub

Private Sub xls_LoadVar(ByVal Name As String, NewValue As Variant)
  NewValue = InputBox("Value for variable " & Name, "Set value", NewValue)
End Sub

Private Sub XLS_OnProgress(str As String)
    Label6.Caption = str
End Sub

Private Sub XLS_OnStep(val As Integer, max As Integer)
    ProgressBar1.Min = 0
    ProgressBar1.max = max
    ProgressBar1.Value = val
End Sub

Private Function PrepareString(ByVal s As String) As String
  Dim outs As String, exprs As String
  Dim spos As Long, epos As Long, curpos As Long
  outs = ""
  spos = 1
  curpos = 1
  On Error GoTo bye
  spos = InStr(1, s, "#")
  If spos > 0 Then
    outs = ""
    spos = 1
    epos = 1
    While epos > 0 And spos > 0 And spos <= Len(s)
      If spos = 1 Then spos = 0
      spos = InStr(spos + 1, s, "#")
      If spos > 0 Then
        epos = InStr(spos + 1, s, "#")
        If epos > 0 Then
          exprs = Mid(s, spos + 1, epos - spos - 1)
          outs = outs & Mid(s, curpos, spos - curpos) & exprs
          spos = epos + 1
          curpos = epos + 1
        End If
      End If
    Wend
    On Error Resume Next
    If epos > 0 Then
      outs = outs & Mid(s, epos + 1, Len(s) - epos)
    End If
  Else
    outs = s
  End If
  PrepareString = outs
  Exit Function
bye:
  PrepareString = s
  'Resume
End Function

