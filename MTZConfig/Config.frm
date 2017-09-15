VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Конфигуратор"
   ClientHeight    =   8850
   ClientLeft      =   5340
   ClientTop       =   600
   ClientWidth     =   8160
   Icon            =   "Config.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8850
   ScaleWidth      =   8160
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "О программе"
      Height          =   315
      Left            =   150
      TabIndex        =   53
      Top             =   8460
      Width           =   1230
   End
   Begin VB.Frame frameLeft 
      Caption         =   "Список сайтов"
      Height          =   5265
      Left            =   60
      TabIndex        =   4
      Top             =   690
      Width           =   3165
      Begin VB.CommandButton cmdDelSite 
         Caption         =   "&Удалить"
         Height          =   315
         Left            =   1800
         TabIndex        =   7
         ToolTipText     =   "Удалить выбранный сайт"
         Top             =   4860
         Width           =   1175
      End
      Begin VB.CommandButton cmdAddSite 
         Caption         =   "&Добавить"
         Height          =   315
         Left            =   570
         Picture         =   "Config.frx":0442
         TabIndex        =   6
         ToolTipText     =   "Добавить новый сайт"
         Top             =   4860
         Width           =   1175
      End
      Begin VB.ListBox lstSite 
         Height          =   4545
         Left            =   90
         TabIndex        =   5
         Top             =   240
         Width           =   2985
      End
   End
   Begin VB.Frame frameRight 
      Caption         =   "Настройки сайта"
      Height          =   3225
      Left            =   3300
      TabIndex        =   8
      Top             =   690
      Width           =   4785
      Begin VB.ComboBox cmbBaseType 
         Height          =   315
         ItemData        =   "Config.frx":07CC
         Left            =   2160
         List            =   "Config.frx":07D9
         Style           =   2  'Dropdown List
         TabIndex        =   14
         Top             =   900
         Width           =   2445
      End
      Begin VB.TextBox txtServer 
         Height          =   285
         Left            =   2160
         TabIndex        =   10
         Top             =   240
         Width           =   2415
      End
      Begin VB.TextBox txtPassword 
         Height          =   285
         IMEMode         =   3  'DISABLE
         Left            =   2190
         PasswordChar    =   "*"
         TabIndex        =   22
         Top             =   2505
         Width           =   2415
      End
      Begin VB.TextBox txtDatabase 
         Height          =   285
         Left            =   2160
         TabIndex        =   12
         Top             =   570
         Width           =   2415
      End
      Begin VB.TextBox txtProvider 
         Height          =   285
         Left            =   2190
         TabIndex        =   16
         ToolTipText     =   "sqloledb; MSDAORA.1"
         Top             =   1260
         Width           =   2415
      End
      Begin VB.TextBox txtTimeOut 
         Height          =   285
         Left            =   2190
         TabIndex        =   24
         Top             =   2835
         Width           =   2415
      End
      Begin VB.CheckBox chkIntegrated 
         Alignment       =   1  'Right Justify
         Caption         =   "Интегрированная NT безопасность"
         Height          =   255
         Left            =   120
         TabIndex        =   17
         Top             =   1560
         Width           =   4485
      End
      Begin VB.CheckBox chkIntegratedARM 
         Alignment       =   1  'Right Justify
         Caption         =   "Интегрированный вход в АРМ"
         Height          =   255
         Left            =   120
         TabIndex        =   18
         Top             =   1875
         Width           =   4485
      End
      Begin VB.TextBox txtLogin 
         Height          =   285
         Left            =   2190
         TabIndex        =   20
         Top             =   2160
         Width           =   2415
      End
      Begin VB.Label Label12 
         Caption         =   "Тип базы данных:"
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   900
         Width           =   2055
      End
      Begin VB.Label lblServer 
         Caption         =   "Сервер БД:"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   240
         Width           =   2055
      End
      Begin VB.Label lblPassword 
         Caption         =   "SQL пароль:"
         Height          =   255
         Left            =   120
         TabIndex        =   21
         Top             =   2520
         Width           =   2055
      End
      Begin VB.Label lblDatabase 
         Caption         =   "Имя базы:"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   559
         Width           =   2055
      End
      Begin VB.Label lblProvider 
         Caption         =   "OLEDB provider:"
         Height          =   255
         Left            =   120
         TabIndex        =   15
         Top             =   1245
         Width           =   2055
      End
      Begin VB.Label lblTimeOut 
         Caption         =   "Таймаут:"
         Height          =   255
         Left            =   120
         TabIndex        =   23
         Top             =   2835
         Width           =   2055
      End
      Begin VB.Label lblLogin 
         Caption         =   "Пользователь SQL:"
         Height          =   255
         Left            =   120
         TabIndex        =   19
         Top             =   2190
         Width           =   2055
      End
   End
   Begin VB.Frame FrameAddingDB 
      Height          =   1665
      Left            =   3300
      TabIndex        =   26
      Top             =   4290
      Width           =   4785
      Begin VB.TextBox txtKernelPrefix 
         Height          =   285
         Left            =   2220
         Locked          =   -1  'True
         TabIndex        =   34
         Top             =   1320
         Width           =   2415
      End
      Begin VB.TextBox txtProcPrefix 
         Height          =   285
         Left            =   2220
         Locked          =   -1  'True
         TabIndex        =   32
         Top             =   975
         Width           =   2415
      End
      Begin VB.TextBox txtfuncPrefix 
         Height          =   285
         Left            =   2220
         Locked          =   -1  'True
         TabIndex        =   30
         Top             =   615
         Width           =   2415
      End
      Begin VB.TextBox txtPrefix 
         Height          =   285
         Left            =   2220
         Locked          =   -1  'True
         TabIndex        =   28
         Top             =   270
         Width           =   2415
      End
      Begin VB.Label Label3 
         Caption         =   "Префикс процедур ядра:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   150
         TabIndex        =   33
         Top             =   1320
         Width           =   2055
      End
      Begin VB.Label Label2 
         Caption         =   "Префикс процедур типа:"
         Height          =   255
         Left            =   150
         TabIndex        =   31
         Top             =   975
         Width           =   2055
      End
      Begin VB.Label Label1 
         Caption         =   "Префикс функции:"
         Height          =   255
         Left            =   150
         TabIndex        =   29
         Top             =   615
         Width           =   2055
      End
      Begin VB.Label lblPrefix 
         Caption         =   "Префикс параметра:"
         Height          =   255
         Left            =   150
         TabIndex        =   27
         Top             =   270
         Width           =   2055
      End
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Разрешить дополнительные параметры доступа к БД"
      Height          =   255
      Left            =   3390
      TabIndex        =   25
      Top             =   3960
      Width           =   4725
   End
   Begin VB.CommandButton cmdConfigPath 
      Caption         =   "..."
      Height          =   315
      Left            =   7680
      TabIndex        =   2
      Top             =   120
      Width           =   315
   End
   Begin VB.TextBox txtConfig 
      Height          =   285
      Left            =   2160
      TabIndex        =   1
      Top             =   120
      Width           =   5535
   End
   Begin VB.Frame Frame2 
      Caption         =   "Настройки приложения"
      Height          =   2355
      Left            =   90
      TabIndex        =   35
      Top             =   6000
      Width           =   8025
      Begin VB.CheckBox chkNoFind 
         Caption         =   "Выбор без поиска "
         Height          =   375
         Left            =   6000
         TabIndex        =   54
         Top             =   1920
         Width           =   1935
      End
      Begin VB.TextBox txtLayout 
         Height          =   285
         Left            =   2100
         TabIndex        =   41
         Top             =   825
         Width           =   5535
      End
      Begin VB.TextBox txtImage 
         Height          =   285
         Left            =   2100
         TabIndex        =   37
         Top             =   270
         Width           =   5535
      End
      Begin VB.CommandButton cmdImagePath 
         Caption         =   "..."
         Height          =   315
         Left            =   7620
         TabIndex        =   38
         Top             =   270
         Width           =   315
      End
      Begin VB.CommandButton cmdLayuotPath 
         Caption         =   "..."
         Height          =   315
         Left            =   7620
         TabIndex        =   42
         Top             =   825
         Width           =   315
      End
      Begin VB.CheckBox chkCFGJRNL 
         Caption         =   "Настройка журналов разрешена"
         Height          =   375
         Left            =   2760
         TabIndex        =   49
         Top             =   1920
         Width           =   3015
      End
      Begin VB.CheckBox chkCFGFRM 
         Caption         =   "Настройка форм разрешена"
         Height          =   405
         Left            =   120
         TabIndex        =   48
         Top             =   1920
         Width           =   2535
      End
      Begin VB.TextBox txtTempPath 
         Height          =   285
         Left            =   2100
         TabIndex        =   45
         Top             =   1395
         Width           =   5535
      End
      Begin VB.CommandButton cmdTempPath 
         Caption         =   "..."
         Height          =   315
         Left            =   7620
         TabIndex        =   46
         Top             =   1395
         Width           =   315
      End
      Begin VB.Label Label9 
         Caption         =   "Каталог настроек форм:"
         Height          =   255
         Left            =   90
         TabIndex        =   40
         Top             =   825
         Width           =   2205
      End
      Begin VB.Label Label8 
         Caption         =   "Каталог изображений:"
         Height          =   255
         Left            =   90
         TabIndex        =   36
         Top             =   270
         Width           =   2205
      End
      Begin VB.Label Label7 
         Caption         =   "Каталог не найден!"
         ForeColor       =   &H000000FF&
         Height          =   255
         Left            =   2100
         TabIndex        =   47
         Top             =   1680
         Visible         =   0   'False
         Width           =   2205
      End
      Begin VB.Label Label6 
         Caption         =   "Каталог не найден!"
         ForeColor       =   &H000000FF&
         Height          =   255
         Left            =   2100
         TabIndex        =   43
         Top             =   1125
         Visible         =   0   'False
         Width           =   2205
      End
      Begin VB.Label Label5 
         Caption         =   "Каталог не найден!"
         ForeColor       =   &H000000FF&
         Height          =   255
         Left            =   2100
         TabIndex        =   39
         Top             =   570
         Visible         =   0   'False
         Width           =   2205
      End
      Begin VB.Label Label4 
         Caption         =   "Каталог временных файлов:"
         Height          =   525
         Left            =   90
         TabIndex        =   44
         Top             =   1395
         Width           =   1965
      End
   End
   Begin MSComDlg.CommonDialog Dlg 
      Left            =   120
      Top             =   8160
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdApply 
      Caption         =   "&Применить"
      Enabled         =   0   'False
      Height          =   315
      Left            =   6870
      TabIndex        =   52
      Top             =   8460
      Width           =   1175
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "&Выход"
      Height          =   315
      Left            =   5520
      TabIndex        =   51
      Top             =   8460
      Width           =   1175
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "&OK"
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   315
      Left            =   4290
      TabIndex        =   50
      Top             =   8460
      Width           =   1175
   End
   Begin VB.Label Label11 
      Caption         =   "Файл конфигурации не найден!"
      ForeColor       =   &H000000FF&
      Height          =   255
      Left            =   2160
      TabIndex        =   3
      Top             =   450
      Visible         =   0   'False
      Width           =   3525
   End
   Begin VB.Label Label10 
      Caption         =   "Файл конфигурации (xml):"
      Height          =   315
      Left            =   150
      TabIndex        =   0
      Top             =   120
      Width           =   1995
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
Private bChanged As Boolean
Private bData As Boolean
Private iListIndex As Long
Private bDontClear As Boolean

Dim n As String, cnt As Long, i, inClick As Boolean

Private SelectedItem As Integer
Private bRefresh As Boolean

Private Const ATT_SERVER = "Server"
Private Const ATT_DB = "DB"
Private Const ATT_USER = "USER"
Private Const ATT_PASSWORD = "PASSWORD"
Private Const ATT_TIMEOUT = "TIMEOUT"
Private Const ATT_PROVIDER = "PROVIDER"
Private Const ATT_AT = "AT"
Private Const ATT_FUNC = "FUNC"
Private Const ATT_PROC = "PROC"
Private Const ATT_KERNEL = "KERNEL"
Private Const ATT_INTEGRATED = "INTEGRATED"
Private Const ATT_INTEGRATEDARM = "INTEGRATEDARM"
Private Const ATT_IMAGES = "IMAGES"
Private Const ATT_LAYOUTS = "LAYOUTS"
Private Const ATT_TEMP = "TEMP"

Private Const DEF_SERVERNAME = "<Server name>"
Private Const DEF_BASENAME = "<Database name>"



Private Sub Check1_Click()
  If (Check1.Value) Then
    lblPrefix.ForeColor = vbButtonText
    Label1.ForeColor = vbButtonText
    Label2.ForeColor = vbButtonText
    Label3.ForeColor = vbButtonText
    
    
    txtPrefix.Locked = False
    txtfuncPrefix.Locked = False
    txtProcPrefix.Locked = False
    txtKernelPrefix.Locked = False
    
    txtPrefix.BackColor = vbWindowBackground
    txtfuncPrefix.BackColor = vbWindowBackground
    txtProcPrefix.BackColor = vbWindowBackground
    txtKernelPrefix.BackColor = vbWindowBackground
    
    txtPrefix.ForeColor = vbWindowText
    txtfuncPrefix.ForeColor = vbWindowText
    txtProcPrefix.ForeColor = vbWindowText
    txtKernelPrefix.ForeColor = vbWindowText
    
    txtPrefix.TabStop = True
    txtfuncPrefix.TabStop = True
    txtProcPrefix.TabStop = True
    txtKernelPrefix.TabStop = True

  Else
    lblPrefix.ForeColor = &H80000011
    Label1.ForeColor = &H80000011
    Label2.ForeColor = &H80000011
    Label3.ForeColor = &H80000011
    
    txtPrefix.Locked = True
    txtfuncPrefix.Locked = True
    txtProcPrefix.Locked = True
    txtKernelPrefix.Locked = True
    
    txtPrefix.BackColor = vbButtonFace
    txtfuncPrefix.BackColor = vbButtonFace
    txtProcPrefix.BackColor = vbButtonFace
    txtKernelPrefix.BackColor = vbButtonFace
    
    txtPrefix.ForeColor = &H80000011
    txtfuncPrefix.ForeColor = &H80000011
    txtProcPrefix.ForeColor = &H80000011
    txtKernelPrefix.ForeColor = &H80000011
    
    txtPrefix.TabStop = False
    txtfuncPrefix.ForeColor = False
    txtProcPrefix.ForeColor = False
    txtKernelPrefix.ForeColor = False

  End If
End Sub

Private Sub chkCFGFRM_Click()
 changing
End Sub

Private Sub chkCFGJRNL_Click()
 changing
End Sub

Private Sub chkIntegrated_Click()
  If chkIntegrated.Value = vbChecked Then
    txtLogin.Enabled = False
    txtPassword.Enabled = False
    txtLogin.BackColor = vbButtonFace
    txtPassword.BackColor = vbButtonFace
  Else
    txtLogin.Enabled = True
    txtPassword.Enabled = True
    txtLogin.BackColor = vbWindowBackground
    txtPassword.BackColor = vbWindowBackground
  End If
  changing
End Sub

Private Sub chkIntegratedARM_Click()
  changing
End Sub

Private Sub chkNoFind_Click()
changing
End Sub

Private Sub cmbBaseType_Click()
  If (cmbBaseType.ListIndex = 0) Then
    ' SQL Server
    txtProvider.Text = "sqloledb"
    txtPrefix.Text = "@"
  ElseIf (cmbBaseType.ListIndex = 1) Then
    ' ORACLE Server
        txtProvider.Text = " MSDAORA.1"
  ElseIf (cmbBaseType.ListIndex = 2) Then
    ' MySQL Server
  End If
End Sub

Private Sub cmdAddSite_Click()
  Dim frmNewName As New frmNewName
  Dim NewName As String
  
  NewName = frmNewName.ShowModal
  Unload frmNewName
  Set frmNewName = Nothing
  
  If (NewName = "") Then Exit Sub

  lstSite.AddItem NewName
  Dim node As MSXML2.IXMLDOMNode
  Set node = xdom.createNode(MSXML2.NODE_ELEMENT, "SITE", "")
  If xdom.xml = "" Then
    xdom.loadXML "<root></root>"
  End If
  xdom.lastChild.appendChild node
  Set e = xdom.lastChild.lastChild
  e.setAttribute "Name", NewName
  With e
     .setAttribute ATT_SERVER, DEF_SERVERNAME
     .setAttribute ATT_DB, DEF_BASENAME
     .setAttribute ATT_USER, ""
     .setAttribute ATT_PASSWORD, ""
     .setAttribute ATT_TIMEOUT, "100"
     .setAttribute ATT_PROVIDER, "sqloledb"
     .setAttribute ATT_AT, "@"
     .setAttribute ATT_INTEGRATED, True
     .setAttribute ATT_INTEGRATEDARM, False
     .setAttribute ATT_IMAGES, App.Path & "\IMAGES\"
     .setAttribute ATT_LAYOUTS, App.Path & "\LAYOUTS\"
     .setAttribute ATT_TEMP, App.Path & "\TEMP\"
  End With
  
  cnt = xdom.lastChild.childNodes.length
  lstSite.ListIndex = lstSite.ListCount - 1
  bData = True
  
  changing
  
  txtServer.SelStart = 0
  txtServer.SelLength = Len(txtServer.Text)
  txtServer.SetFocus
  
End Sub


Private Sub cmdConfigPath_Click()
  Dim Path As String
  
  Dlg.DialogTitle = "Выберите файл конфигурации"
  Dlg.CancelError = False
  Dlg.Flags = cdlOFNExplorer + cdlOFNFileMustExist + cdlOFNLongNames + cdlOFNHideReadOnly + cdlOFNNoDereferenceLinks
  Dlg.Filter = "XML файлы (*.xml)|*.xml|"
  ' обнуляем имя текущего файла
  Dlg.FileName = ""
  
  Dlg.ShowOpen

  If Dlg.FileName > "" Then
    txtConfig.Text = Dlg.FileName
    bChanged = True
  End If

End Sub

Private Sub cmdDelSite_Click()
  Dim Index As Integer

  If lstSite.ListIndex = -1 Then Exit Sub
  
  Index = lstSite.ListIndex
 
  If MsgBox("Действительно удалить сайт '" & lstSite.Text & "' без возможности восстановления?", vbYesNo + vbQuestion, App.Title) = vbYes Then
    On Error GoTo ex
    xdom.lastChild.removeChild xdom.lastChild.childNodes.Item(lstSite.ListIndex)
    xdom.save Path
    Set xdom = Nothing
    bChanged = False
ex:
    Call LoadConfig
    Call ColorControls
    Call DisableInvisibleControls
  End If

End Sub

Private Sub cmdImagePath_Click()
    On Error Resume Next
   
    Dim Path As String
    Path = GetPathEx(txtImage.Text, "Выбор каталога")
    If (Path <> vbNullString) Then
      txtImage.Text = Path
      bChanged = True
      Call EnableButtons
    End If
End Sub

Private Function GetPathEx(Path As String, Caption As String)
    Dim sBuffer As String
    Dim tBrowseInfo As BrowseInfo
    
    If txtImage.Text <> "" Then
        If Len(Path) > 3 Then
            gFolder = Left(Path, Len(Path) - 1)
        End If
    End If
    
    With tBrowseInfo
        .hWndOwner = Me.hwnd
        .lpszTitle = lstrcat(Caption, "")
        .ulFlags = BIF_RETURNONLYFSDIRS ' + BIF_DONTGOBELOWDOMAIN ' + BIF_USENEWUI
        .lpfnCallback = mAddressOf(AddressOf BrowseCallbackProc)
    End With
    Dim lpIDList  As Long
    lpIDList = SHBrowseForFolder(tBrowseInfo)
    If (lpIDList) Then
        sBuffer = Space(MAX_PATH)
        SHGetPathFromIDList lpIDList, sBuffer
        sBuffer = Left(sBuffer, InStr(sBuffer, vbNullChar) - 1)
        GetPathEx = sBuffer + "\"
    End If
End Function

Private Sub cmdLayuotPath_Click()
  Dim Path As String
  Path = GetPathEx(txtLayout.Text, "Выбор каталога")
  If (Path <> vbNullString) Then
    txtLayout.Text = Path
    bChanged = True
    Call EnableButtons
  End If
End Sub

Private Sub cmdTempPath_Click()
  Dim Path As String
  Path = GetPathEx(txtTempPath.Text, "Выбор каталога")
  If (Path <> vbNullString) Then
    txtTempPath.Text = Path
    bChanged = True
    Call EnableButtons
  End If
End Sub

Private Sub Command1_Click()
  frmAbout.Show vbModal
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
  Debug.Print KeyCode
End Sub

Private Sub Form_Load()
  inClick = True
  On Error Resume Next

  
  txtImage = GetSetting("MTZ", "CONFIG", "IMAGEPATH", App.Path & "\IMAGES\")
  txtLayout = GetSetting("MTZ", "CONFIG", "LAYOUTS", App.Path & "\LAYOUTS\")
  txtTempPath = GetSetting("MTZ", "CONFIG", "TEMPPATH", App.Path & "\TMP\")
  
  If CBool(GetSetting("MTZ", "CONFIG", "CFGFRM", False)) Then
    chkCFGFRM.Value = vbChecked
  Else
   chkCFGFRM.Value = vbUnchecked
  End If
  
  If CBool(GetSetting("MTZ", "CONFIG", "CFGJRNL", False)) Then
    chkCFGJRNL.Value = vbChecked
  Else
   chkCFGJRNL.Value = vbUnchecked
  End If
  
  If CBool(MTZGetSetting("MTZ", "CONFIG", "NOFIND", False)) Then
    chkNoFind.Value = vbChecked
  Else
    chkNoFind.Value = vbUnchecked
  End If
  
  
  Call LoadConfig

  Call ColorControls
  Call DisableInvisibleControls
  Call EnableButtons
    
  Dim FSO As FileSystemObject
  Set FSO = New FileSystemObject
  
  If (Not FSO.FileExists(txtConfig.Text)) Then
    Call txtConfig.SetFocus
    txtConfig.SelStart = 1
    txtConfig.SelLength = Len(txtConfig.Text)
    Label11.Visible = True
  Else
    Label11.Visible = False
  End If
  
  inClick = False
  Call Check1_Click
End Sub

Private Sub LoadVideoData()
  Call lstSite_Click
End Sub

Private Sub lstSite_Click()
  bData = False
  If lstSite.ListIndex = -1 Then Exit Sub
  
  If bDontClear Then
    bDontClear = False
    Exit Sub
  End If
  If (iListIndex <> lstSite.ListIndex) And bChanged And Not (inClick Or bRefresh) Then
    If MsgBox("Изменения будут потеряны. Продолжить?", vbYesNo + vbQuestion, App.Title) = vbNo Then
      bDontClear = True
      If (lstSite.ListCount > iListIndex) Then
        lstSite.ListIndex = iListIndex
      End If
      Exit Sub
    End If
  End If
  
  inClick = True
  On Error Resume Next
  With xdom.lastChild.childNodes.Item(lstSite.ListIndex).Attributes
    txtServer = .getNamedItem(ATT_SERVER).nodeValue
    txtDatabase = .getNamedItem(ATT_DB).nodeValue
    txtLogin = .getNamedItem(ATT_USER).nodeValue
    
'    Dim obj As Object
'    Dim strText As String, res As String
'    On Error Resume Next
'    Set obj = CreateObject("CryptLib.MD5")
'    If (Not obj Is Nothing) Then
'      strText = .getNamedItem(ATT_PASSWORD).nodeValue
'      res = obj.DeCrypt(strText)
'      Set obj = Nothing
'    Else
'      res = .getNamedItem(ATT_PASSWORD).nodeValue
'    End If
'    On Error GoTo 0

    txtPassword = .getNamedItem(ATT_PASSWORD).nodeValue
    
    
    txtTimeOut = .getNamedItem(ATT_TIMEOUT).nodeValue
    txtProvider = .getNamedItem(ATT_PROVIDER).nodeValue
    txtPrefix = .getNamedItem(ATT_AT).nodeValue
    txtfuncPrefix = .getNamedItem(ATT_FUNC).nodeValue
    txtProcPrefix = .getNamedItem(ATT_PROC).nodeValue
    txtKernelPrefix = .getNamedItem(ATT_KERNEL).nodeValue
    If .getNamedItem(ATT_INTEGRATED).nodeValue Then
      chkIntegrated.Value = vbChecked
    Else
     chkIntegrated.Value = vbUnchecked
    End If
    If .getNamedItem(ATT_INTEGRATEDARM).nodeValue Then
      chkIntegratedARM.Value = vbChecked
    Else
     chkIntegratedARM.Value = vbUnchecked
    End If
    Dim str As String
    str = .getNamedItem(ATT_IMAGES).nodeValue
    If (str <> vbNullString) Then txtImage.Text = str
    str = .getNamedItem(ATT_LAYOUTS).nodeValue
    If (str <> vbNullString) Then txtLayout.Text = str
    str = .getNamedItem(ATT_TEMP).nodeValue
    If (str <> vbNullString) Then txtTempPath.Text = str
  End With
  iListIndex = lstSite.ListIndex
  bData = True
  bChanged = False
  inClick = False
  Call ColorControls
End Sub

Private Sub SaveConfig()
  Dim root As Long
  
  If Not CheckFolder(txtImage.Text) Then
    Call txtImage.SetFocus
    txtImage.SelStart = 0
    txtImage.SelLength = Len(txtImage.Text)
    'Exit Sub
  Else
    If Right(txtImage.Text, 1) <> "\" Then
      txtImage.Text = txtImage.Text & "\"
    End If
  End If
  If Not CheckFolder(txtLayout.Text) Then
    Call txtLayout.SetFocus
    txtLayout.SelStart = 0
    txtLayout.SelLength = Len(txtLayout.Text)
    'Exit Sub
  Else
    If Right(txtLayout.Text, 1) <> "\" Then
      txtLayout.Text = txtLayout.Text & "\"
    End If
  End If
  If Not CheckFolder(txtTempPath.Text) Then
    Call txtTempPath.SetFocus
    txtTempPath.SelStart = 0
    txtTempPath.SelLength = Len(txtTempPath.Text)
    'Exit Sub
  Else
    If Right(txtTempPath.Text, 1) <> "\" Then
      txtTempPath.Text = txtTempPath.Text & "\"
    End If
  End If
  
 
  If inClick Then Exit Sub
  
  
  If chkCFGFRM.Value = vbChecked Then
    Call SaveSetting("MTZ", "CONFIG", "CFGFRM", True)
  Else
    Call SaveSetting("MTZ", "CONFIG", "CFGFRM", False)
  End If
  
  
  If chkCFGJRNL.Value = vbChecked Then
    Call SaveSetting("MTZ", "CONFIG", "CFGJRNL", True)
  Else
    Call SaveSetting("MTZ", "CONFIG", "CFGJRNL", False)
  End If
  
   If chkNoFind.Value = vbChecked Then
    Call MTZSaveSetting("MTZ", "CONFIG", "NOFIND", True)
  Else
    Call MTZSaveSetting("MTZ", "CONFIG", "NOFIND", False)
  End If
  
  Call SaveSetting("MTZ", "CONFIG", "IMAGEPATH", txtImage)
  Call SaveSetting("MTZ", "CONFIG", "LAYOUTS", txtLayout)
  Call SaveSetting("MTZ", "CONFIG", "TEMPPATH", txtTempPath)
  Call MTZSaveSetting("MTZ", "CONFIG", "XMLPATH", txtConfig)
  
  If lstSite.ListCount > 0 Then
    Set e = xdom.lastChild.childNodes.Item(lstSite.ListIndex)
    With e
       .setAttribute ATT_SERVER, txtServer
       .setAttribute ATT_DB, txtDatabase
       .setAttribute ATT_USER, txtLogin
       
'       Dim obj As Object
'       Dim strText As String, res As String
'       On Error Resume Next
'       Set obj = CreateObject("CryptLib.MD5")
'       If (Not obj Is Nothing) Then
'         strText = txtPassword.Text
'         res = obj.Crypt(strText)
'         Set obj = Nothing
'       Else
'         res = txtPassword.Text
'       End If
'       On Error GoTo 0
       
       .setAttribute ATT_PASSWORD, txtPassword.Text
       .setAttribute ATT_TIMEOUT, txtTimeOut
       .setAttribute ATT_PROVIDER, txtProvider
       .setAttribute ATT_AT, txtPrefix
       .setAttribute ATT_FUNC, txtfuncPrefix
       .setAttribute ATT_PROC, txtProcPrefix
       .setAttribute ATT_KERNEL, txtKernelPrefix
       .setAttribute ATT_INTEGRATED, (chkIntegrated.Value = vbChecked)
       .setAttribute ATT_INTEGRATEDARM, (chkIntegratedARM.Value = vbChecked)
       
       .setAttribute ATT_IMAGES, txtImage.Text
       .setAttribute ATT_LAYOUTS, txtLayout.Text
       .setAttribute ATT_TEMP, txtTempPath.Text
    
    End With
  End If
  On Error GoTo errSave
  If Path <> "" Then
      If Not xdom Is Nothing Then
        xdom.save Path
      End If
  End If
  If Path <> txtConfig Then
      Path = txtConfig
  End If
  
  On Error GoTo 0
  bChanged = False
  Call ColorControls
  Exit Sub
errSave:
  Call MsgBox("Ошибка сохранения файла (" & Path & ")" & vbCrLf & Err.Number & ":" & Err.Description, vbOKOnly + vbExclamation, App.Title)
  'Resume
End Sub

Private Sub LoadConfig()
  txtServer = ""
  txtDatabase = ""
  txtLogin = ""
  txtPassword = ""
  txtTimeOut = ""
  txtProvider = ""
  txtPrefix = ""
  txtfuncPrefix = ""
  txtProcPrefix = ""
  txtKernelPrefix = ""
  
  
  Dim Index As Integer
  On Error Resume Next
  bRefresh = True
  Index = lstSite.ListIndex
  txtConfig = MTZGetSetting("MTZ", "CONFIG", "XMLPATH", "")
  lstSite.Clear
  If txtConfig <> "" Then
    Path = txtConfig
    Set xdom = New MSXML2.DOMDocument
    xdom.async = False
    If xdom.Load(Path) Then
    cnt = xdom.lastChild.childNodes.length
    For i = 0 To cnt - 1
      n = xdom.lastChild.childNodes.Item(i).Attributes.getNamedItem("Name").nodeValue
      If n <> "" Then
        lstSite.AddItem n
      End If
    Next
    End If
  End If
  bRefresh = False
  If (Index >= lstSite.ListCount) Then
    Index = Index - 1
  End If
  If (Index >= 0) Then
    If (Index >= lstSite.ListCount) Then
      lstSite.ListIndex = Index
    Else
      If (lstSite.ListCount > 0) Then
        lstSite.ListIndex = 0
      End If
    End If
  Else
      If (lstSite.ListCount > 0) Then
        lstSite.ListIndex = 0
      End If
  End If
End Sub

Private Sub changing()
  If Not inClick And Not bRefresh Then
    bChanged = True
    cmdApply.Enabled = True
    cmdOK.Enabled = True
    Call ColorControls
  End If
End Sub

Private Sub SSTab1_Click(PreviousTab As Integer)
  Call DisableInvisibleControls
End Sub

Private Sub SSTab1_KeyDown(KeyCode As Integer, Shift As Integer)
  'If KeyCode = 112 Then
    ' Показать помощь
  '  Dim PathName As String
  '  PathName = "contents.chm"
  '  Call Shell(App.Path & "\" & PathName, vbNormalFocus)
  'End If
End Sub


Private Sub txtConfig_Change()
 If (bRefresh) Then Exit Sub
 Call MTZSaveSetting("MTZ", "CONFIG", "XMLPATH", txtConfig)
 Call changing
  
 Dim FSO As FileSystemObject
 Set FSO = New FileSystemObject
 If (Not FSO.FileExists(txtConfig.Text)) Then
  Label11.Visible = True
 Else
  Label11.Visible = False
 End If
 LoadConfig
 

End Sub
  
Private Function CheckFolder(Path As String) As Boolean
  Dim FSO As Object

  Set FSO = CreateObject("Scripting.FileSystemObject")
  
  If Not FSO.FolderExists(Path) Then
    Call MsgBox("Указанный каталог не существует:" & vbCrLf & Path, vbOKOnly + vbExclamation, App.Title)
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


Private Sub txtDatabase_Change()
Call changing
End Sub

Private Sub txtDatabase_GotFocus()
  If (txtDatabase.Text = DEF_BASENAME) Then
    txtDatabase.SelStart = 0
    txtDatabase.SelLength = Len(txtDatabase.Text)
  End If

End Sub

Private Sub txtfuncPrefix_Change()
 changing
End Sub

Private Sub txtImage_Change()
 Call changing
 Dim FSO As FileSystemObject
 Set FSO = New FileSystemObject
 If (Not FSO.FolderExists(txtImage.Text)) Then
  Label5.Visible = True
 Else
  Label5.Visible = False
 End If
End Sub

Private Sub txtKernelPrefix_Change()
 changing
End Sub

Private Sub txtLayout_Change()
 Call changing
 Dim FSO As FileSystemObject
 Set FSO = New FileSystemObject
 If (Not FSO.FolderExists(txtLayout.Text)) Then
  Label6.Visible = True
 Else
  Label6.Visible = False
 End If
  
End Sub

Private Sub txtLogin_Change()
  changing
End Sub

Private Sub txtPassword_Change()
  changing
End Sub

Private Sub txtPrefix_Change()
  changing
End Sub

Private Sub txtProcPrefix_Change()
 changing
End Sub

Private Sub txtProvider_Change()
  changing
End Sub

Private Sub txtServer_Change()
  changing
End Sub

Private Sub txtServer_GotFocus()
  If (txtServer.Text = DEF_SERVERNAME) Then
    txtServer.SelStart = 0
    txtServer.SelLength = Len(txtServer.Text)
  End If
End Sub

Private Sub txtTempPath_Change()
  Call changing
  Dim FSO As FileSystemObject
  Set FSO = New FileSystemObject
  If (Not FSO.FolderExists(txtTempPath.Text)) Then
   Label7.Visible = True
  Else
   Label7.Visible = False
  End If
End Sub

Private Sub txtTimeOut_Change()
  changing
End Sub

Private Sub txtxDatabase_Change()
  changing
End Sub

Private Sub ColorControls()
  
  If inClick Then Exit Sub
 
  Call EnableButtons
  inClick = False
End Sub

Private Sub ColorControl(objControl As Control, bEnabled As Boolean)
  Call EnableButtons
End Sub

Private Sub EnableButtons()
  cmdApply.Enabled = bChanged
  cmdOK.Enabled = bChanged
  cmdDelSite.Enabled = (lstSite.ListCount > 0) And (lstSite.ListIndex > -1)
End Sub

Private Sub cmdApply_Click()
  Call SaveConfig
  Call LoadVideoData
End Sub

Private Sub cmdCancel_Click()
  Unload Me
  End
End Sub

Private Sub cmdOK_Click()
  Call SaveConfig
  Unload Me
  Set xdom = Nothing
  'End
End Sub


Private Sub DisableInvisibleControls()
  On Error Resume Next
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

