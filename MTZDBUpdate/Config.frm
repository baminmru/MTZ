VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Обновление базы данных"
   ClientHeight    =   3405
   ClientLeft      =   5340
   ClientTop       =   600
   ClientWidth     =   8430
   Icon            =   "Config.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   3405
   ScaleWidth      =   8430
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox cmbSite 
      Height          =   315
      Left            =   120
      Style           =   2  'Dropdown List
      TabIndex        =   11
      Top             =   360
      Width           =   3870
   End
   Begin VB.Frame Frame1 
      Caption         =   "Процесс инсталляции"
      Enabled         =   0   'False
      Height          =   3255
      Left            =   4200
      TabIndex        =   6
      Top             =   0
      Width           =   4095
      Begin VB.ListBox lstBlocks 
         Height          =   2310
         Left            =   120
         Style           =   1  'Checkbox
         TabIndex        =   8
         Top             =   480
         Width           =   3855
      End
      Begin MSComctlLib.ProgressBar pb 
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   2880
         Visible         =   0   'False
         Width           =   3855
         _ExtentX        =   6800
         _ExtentY        =   450
         _Version        =   393216
         Appearance      =   1
      End
      Begin VB.Label Label3 
         Caption         =   "Модули"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   240
         Width           =   2775
      End
   End
   Begin VB.TextBox txtLog 
      Height          =   1140
      Left            =   90
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   5
      Top             =   2115
      Width           =   3855
   End
   Begin VB.CommandButton cmdGo 
      Caption         =   "Обновить базу данных"
      Height          =   375
      Left            =   90
      TabIndex        =   3
      Top             =   1290
      Width           =   3375
   End
   Begin VB.CommandButton cmdDataPath 
      Caption         =   "..."
      Height          =   315
      Left            =   3585
      TabIndex        =   2
      Top             =   945
      Width           =   315
   End
   Begin VB.TextBox txtData 
      Height          =   285
      Left            =   105
      TabIndex        =   1
      Top             =   945
      Width           =   3375
   End
   Begin MSComDlg.CommonDialog Dlg 
      Left            =   3495
      Top             =   2835
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Label Label4 
      Caption         =   "Сайт"
      Height          =   225
      Left            =   105
      TabIndex        =   10
      Top             =   90
      Width           =   2235
   End
   Begin VB.Label Label2 
      Caption         =   "Ошибки"
      Height          =   255
      Left            =   105
      TabIndex        =   4
      Top             =   1800
      Width           =   1815
   End
   Begin VB.Label Label1 
      Caption         =   "Файл с данными  (xml):"
      Height          =   255
      Left            =   105
      TabIndex        =   0
      Top             =   705
      Width           =   2205
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Path As String
Private xdom As MSXML2.DOMDocument
Private e As MSXML2.IXMLDOMElement
Private GenResp As MTZGenerator.Response
Private GenPrj As MTZGenerator.ProjectHolder
Private iListIndex As Long
Private bDontClear As Boolean
Private DS As DataSource
Private Log As String



Dim n As String, cnt As Long, i, inClick As Boolean






Private Function GetPath(Caption As String) As String
    Dim bi As browseinfo
    Dim lngPath As Long
    Dim lngBrowse As Long
    Dim Path As String
    Dim inull As Integer
    
    GetPath = Path
    
    Call SHGetSpecialFolderLocation(Me.hWnd, 17, lngPath)

    bi.hwndOwner = Me.hWnd
    bi.lpszTitle = Caption
    bi.pszDisplayName = String(MAX_PATH, 0)
    bi.pidlRoot = lngPath
    bi.lpfn = 0
    bi.ulFlags = 1
    bi.lParam = 0
    
    lngBrowse = SHBrowseForFolder(bi)
    
    Path = String(MAX_PATH, 0)
    
    Call SHGetPathFromIDList(lngBrowse, Path)
    
    inull = InStr(Path, vbNullChar)
    
    If inull Then
      Path = Left(Path, inull - 1)
    End If
    
    If Path <> vbNullString Then
      If Right(Path, 1) <> "\" Then
        Path = Path + "\"
      End If
    End If
    
    GetPath = Path
End Function





Private Sub cmdDataPath_Click()
  Dim Path As String
  
  Dlg.DialogTitle = "Выберите файл с данными"
  Dlg.CancelError = False
  Dlg.Flags = cdlOFNExplorer + cdlOFNFileMustExist + cdlOFNLongNames + cdlOFNHideReadOnly + cdlOFNNoDereferenceLinks
  Dlg.Filter = "XML файлы (*.xml)|*.xml|"
  
  Dlg.FileName = ""
  
  Dlg.ShowOpen

  If Dlg.FileName > "" Then
    txtData.Text = Dlg.FileName
  End If


End Sub

Private Sub execBlock(b As BlockHolder, modulename As String)
Dim s As String, lines() As String, i As Long
lines = Split(b.BlockCode, vbCrLf, , vbTextCompare)
s = ""
pb.Min = LBound(lines)
pb.Max = UBound(lines)
pb.Value = LBound(lines)
pb.Visible = True
For i = LBound(lines) To UBound(lines)
  pb.Value = i
  If UCase(Trim(lines(i))) = "GO" Then
   On Error GoTo err1
   If Trim(s) <> "" Then
   DS.Execute s
   DoEvents
   End If
   s = ""
   GoTo cont
err1:
  txtLog.Text = txtLog.Text & vbCrLf & b.BlockName & ":" & modulename & vbCrLf & s & vbCrLf & "------------------------" & vbCrLf & Err.Description
  Log = Log & vbCrLf & b.BlockName & ":" & modulename & vbCrLf & s & vbCrLf & "------------------------" & vbCrLf & Err.Description
  
  Resume err2
err2:
   s = ""
  Else
    s = s & vbCrLf & lines(i)
  End If
cont:
Next
pb.Visible = False


End Sub



Private Sub cmdGo_Click()

 Set DS = New DataSource

 With xdom.lastChild.childNodes.Item(cmbSite.ListIndex).Attributes
    DS.Server = .getNamedItem("Server").nodeValue
   DS.DataBaseName = .getNamedItem("DB").nodeValue
    DS.UserName = .getNamedItem("USER").nodeValue
     DS.Password = .getNamedItem("PASSWORD").nodeValue
    
    If .getNamedItem("INTEGRATED").nodeValue Then
      DS.Integrated = True
    Else
     DS.Integrated = False
    End If
  End With
  
  txtLog.Text = ""
  Log = ""
  lstBlocks.Clear
  
  
  If Not DS.ServerLogIn Then
    MsgBox "Не удается подключиться к Microsoft SQL Server", vbCritical
    Set DS = Nothing
    Exit Sub
  End If
  
  Set GenResp = New MTZGenerator.Response
  Set GenPrj = GenResp.Project
  GenPrj.Load txtData.Text
  
  On Error Resume Next
  
  'DS.Execute ("create database " & txtDatabase.Text & " COLLATE Cyrillic_General_CI_AS")
  
  If Not DS.Execute("use " & DS.DataBaseName) Then
    MsgBox "Не удается открыть базу данных", vbCritical
    Set DS = Nothing
    Set GenResp = Nothing
    Set GenPrj = Nothing
    Exit Sub
  End If
  
  
  Dim i As Long, j As Long
  For i = 1 To GenPrj.Modules.Count
    For j = 1 To GenPrj.Modules.Item(i).Blocks.Count
      lstBlocks.AddItem GenPrj.Modules.Item(i).modulename & ":" & GenPrj.Modules.Item(i).Blocks.Item(j).BlockName
    Next
  Next
  Dim k As Long
  k = 0
  For i = 1 To GenPrj.Modules.Count
    For j = 1 To GenPrj.Modules.Item(i).Blocks.Count
      'If lstBlocks.Selected(k) = True Then
      execBlock GenPrj.Modules.Item(i).Blocks.Item(j), GenPrj.Modules.Item(i).modulename
      lstBlocks.Selected(k) = True
      k = k + 1
    Next
  Next
  If txtLog.Text = "" Then
    MsgBox "Обновление базы данных завершено", vbInformation
  Else
    MsgBox "Обновление базы данных завершено с ошибками", vbCritical
  End If
  Set DS = Nothing
  Set GenResp = Nothing
  Set GenPrj = Nothing
  Dim ff As Long
  ff = FreeFile
  Open App.Path & "\err.txt" For Output As #ff
  Write #ff, Log
  Close #ff
  
  
  
End Sub

Private Sub Form_Load()
 Dim i As Long
  Dim n As String
  
  
  
  Set xdom = New MSXML2.DOMDocument
  xdom.async = False
  xdom.Load MTZGetSetting("MTZ", "CONFIG", "XMLPATH", App.Path & "\MTZ.XML")
  On Error Resume Next
  
  cmbSite.Clear
  For i = 0 To xdom.lastChild.childNodes.length - 1
    n = xdom.lastChild.childNodes.Item(i).Attributes.getNamedItem("Name").nodeValue
    If n <> "" Then
      cmbSite.AddItem n
    End If
  Next
  If cmbSite.ListCount > 0 Then
    cmbSite.ListIndex = 0
  End If
    
End Sub




  
Private Function CheckFolder(Path As String) As Boolean
  Dim FSO As Object

  Set FSO = CreateObject("Scripting.FileSystemObject")
  
  If Not FSO.FolderExists(Path) Then
    Call MsgBox("Указанный каталог не существует", vbOKOnly + vbExclamation, App.Title)
    CheckFolder = False
  Else
    CheckFolder = True
  End If
  
  Set FSO = Nothing
End Function

Private Function CheckFile(Path As String) As Boolean
  Dim FSO As Object

  Set FSO = CreateObject("Scripting.FileSystemObject")
  
  If Not FSO.FileExists(Path) Then
    Call MsgBox("Указанный файл не существует", vbOKOnly + vbExclamation, App.Title)
    CheckFile = False
  Else
    CheckFile = True
  End If
  
  Set FSO = Nothing
End Function




Private Sub cmdCancel_Click()
  Unload Me
  End
End Sub

Private Sub cmdOK_Click()
  Unload Me
  End
End Sub


Private Sub DisableInvisibleControls()
  Dim i As Long
  Dim RealLeft As Long
  Dim RealTop As Long
  Dim ContainerControl As Object
  Dim CurrentControl As Object
  Dim TypeNameContainer As String

  For i = 1 To Me.Controls.Count
    On Error Resume Next
    ' Определим реальные координаты относительно высоту и лево
    Set CurrentControl = Me.Controls.Item(i)
    RealLeft = CurrentControl.Left
    RealTop = CurrentControl.Top
    Set ContainerControl = CurrentControl.Container
    TypeNameContainer = UCase(TypeName(ContainerControl))
    If (TypeNameContainer <> "NOTHING") Then
      While TypeNameContainer <> UCase(TypeName(Me)) And (RealLeft >= 0 And RealTop >= 0)
         RealLeft = RealLeft + ContainerControl.Left
         RealTop = RealTop + ContainerControl.Top
         Set ContainerControl = ContainerControl.Container
         TypeNameContainer = UCase(TypeName(ContainerControl))
         If (ContainerControl Is ContainerControl.Container) Then
           GoTo Wexit
         End If
      Wend
Wexit:
       If (RealLeft < 0) Or (RealTop < 0) Then
        CurrentControl.TabStop = False
      Else
        CurrentControl.TabStop = True
      End If
    End If
  Next
End Sub

