VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Подготовка пакета обновления базы"
   ClientHeight    =   5100
   ClientLeft      =   5340
   ClientTop       =   600
   ClientWidth     =   8430
   Icon            =   "Config.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   5100
   ScaleWidth      =   8430
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command4 
      Caption         =   "Объединить пакеты"
      Height          =   375
      Left            =   5760
      TabIndex        =   13
      Top             =   4440
      Width           =   2535
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Добавить SQL файл в пакет"
      Height          =   375
      Left            =   5760
      TabIndex        =   12
      Top             =   3600
      Width           =   2535
   End
   Begin VB.TextBox txtXML 
      Height          =   285
      Left            =   120
      TabIndex        =   11
      Top             =   4440
      Width           =   3375
   End
   Begin VB.CommandButton Command2 
      Caption         =   "..."
      Height          =   315
      Left            =   3600
      TabIndex        =   10
      Top             =   4440
      Width           =   315
   End
   Begin VB.TextBox txtSQL 
      Height          =   285
      Left            =   120
      TabIndex        =   8
      Top             =   3600
      Width           =   3375
   End
   Begin VB.CommandButton Command1 
      Caption         =   "..."
      Height          =   315
      Left            =   3600
      TabIndex        =   7
      Top             =   3600
      Width           =   315
   End
   Begin VB.TextBox txtUpdate 
      Height          =   2085
      Left            =   90
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   5
      Top             =   1170
      Width           =   6270
   End
   Begin VB.CommandButton cmdGo 
      Caption         =   "Подготовить пакет"
      Height          =   375
      Left            =   6480
      TabIndex        =   3
      Top             =   1200
      Width           =   1815
   End
   Begin VB.CommandButton cmdDataPath 
      Caption         =   "..."
      Height          =   315
      Left            =   3555
      TabIndex        =   2
      Top             =   360
      Width           =   315
   End
   Begin VB.TextBox txtData 
      Height          =   285
      Left            =   75
      TabIndex        =   1
      Top             =   360
      Width           =   3375
   End
   Begin MSComDlg.CommonDialog Dlg 
      Left            =   6960
      Top             =   2760
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Label Label4 
      Caption         =   "Пакет для присоединения"
      Height          =   375
      Left            =   120
      TabIndex        =   9
      Top             =   4080
      Width           =   3735
   End
   Begin VB.Label Label3 
      Caption         =   "SQL файл обновления"
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   3360
      Width           =   2655
   End
   Begin VB.Label Label2 
      Caption         =   "Текст обновления"
      Height          =   255
      Left            =   90
      TabIndex        =   4
      Top             =   810
      Width           =   1815
   End
   Begin VB.Label Label1 
      Caption         =   "Файл с данными  (xml):"
      Height          =   255
      Left            =   75
      TabIndex        =   0
      Top             =   120
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
  Dlg.Flags = cdlOFNExplorer + cdlOFNCreatePrompt + cdlOFNPathMustExist + cdlOFNLongNames + cdlOFNHideReadOnly + cdlOFNNoDereferenceLinks
  Dlg.Filter = "XML файл (*.xml)|*.xml|"
  
  Dlg.FileName = ""
  
  Dlg.ShowOpen

  If Dlg.FileName > "" Then
    txtData.Text = Dlg.FileName
  End If


End Sub




Private Sub cmdGo_Click()

 
  Set GenResp = New MTZGenerator.Response
  Set GenPrj = GenResp.Project
  GenPrj.Load txtData.Text
  
  On Error Resume Next
  
  
  Dim i As Long, j As Long
  GenResp.Module = "--Update " & Date
  GenResp.Block = "-- Update Script"
  GenResp.OutNL txtUpdate.Text
  GenResp.Save txtData.Text
  
  
  Set GenResp = Nothing
  Set GenPrj = Nothing
  MsgBox "текстовый блок добавлен"
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

Private Sub Command1_Click()
Dim Path As String
  
  Dlg.DialogTitle = "Выберите файл с данными"
  Dlg.CancelError = False
  Dlg.Flags = cdlOFNExplorer + cdlOFNCreatePrompt + cdlOFNPathMustExist + cdlOFNLongNames + cdlOFNHideReadOnly + cdlOFNNoDereferenceLinks
  Dlg.Filter = "SQL файл (*.sql)|*.sql|Текстовый файл|*.txt"
  
  Dlg.FileName = ""
  
  Dlg.ShowOpen

  If Dlg.FileName > "" Then
    txtSQL.Text = Dlg.FileName
  End If
End Sub

Private Sub Command2_Click()
Dim Path As String
  
  Dlg.DialogTitle = "Выберите файл с данными"
  Dlg.CancelError = False
  Dlg.Flags = cdlOFNExplorer + cdlOFNCreatePrompt + cdlOFNPathMustExist + cdlOFNLongNames + cdlOFNHideReadOnly + cdlOFNNoDereferenceLinks
  Dlg.Filter = "XML файлы (*.xml)|*.xml|"
  
  Dlg.FileName = ""
  
  Dlg.ShowOpen

  If Dlg.FileName > "" Then
    txtXML.Text = Dlg.FileName
  End If
End Sub

Private Sub Command3_Click()
  Set GenResp = New MTZGenerator.Response
  Set GenPrj = GenResp.Project
  GenPrj.Load txtData.Text
  
  On Error Resume Next
  
  Dim ff As Long
  Dim sql As String
  ff = FreeFile
  Open txtSQL.Text For Input As #ff
  sql = input(LOF(ff), ff)
  Close #ff
  
  Dim i As Long, j As Long
  GenResp.Module = "-- " & txtSQL.Text
  GenResp.Block = "-- " & txtSQL.Text
  GenResp.OutNL sql
  GenResp.Save txtData.Text
  
  Set GenResp = Nothing
  Set GenPrj = Nothing
  MsgBox "SQL файл добавлен"
End Sub

Private Sub Command4_Click()
Dim GenResp2 As MTZGenerator.Response
Dim GenPrj2 As MTZGenerator.ProjectHolder
  
  
  
  Set GenResp = New MTZGenerator.Response
  Set GenPrj = GenResp.Project
  GenPrj.Load txtData.Text
  
  
    
  Set GenResp2 = New MTZGenerator.Response
  Set GenPrj2 = GenResp2.Project
  GenPrj2.Load txtXML.Text
    
  On Error Resume Next
  
 
  
  Dim i As Long, j As Long
  For i = 1 To GenPrj2.Modules.Count
  
  GenResp.Module = "-- " & txtXML.Text & GenPrj2.Modules.Item(i).ModuleName
  GenResp2.Module = GenPrj2.Modules.Item(i).ModuleName
  For j = 1 To GenPrj2.Modules.Item(i).Blocks.Count
      GenResp.Block = "-- " & txtXML.Text & GenPrj2.Modules.Item(i).Blocks.Item(j).BlockName
      GenResp2.Block = GenPrj2.Modules.Item(i).Blocks.Item(j).BlockName
      GenResp.Code = GenResp2.Code
  Next
  
  Next
  
  GenResp.Save txtData.Text
  
  Set GenResp = Nothing
  Set GenPrj = Nothing
  Set GenResp2 = Nothing
  Set GenPrj2 = Nothing
  MsgBox "Данные пакета добавлены"
End Sub
