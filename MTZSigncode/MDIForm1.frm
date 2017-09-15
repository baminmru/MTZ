VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.MDIForm frmMain 
   BackColor       =   &H8000000C&
   Caption         =   "Администратор."
   ClientHeight    =   4980
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   6075
   Icon            =   "MDIForm1.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.Timer Timer2 
      Interval        =   60000
      Left            =   2400
      Top             =   0
   End
   Begin MSComDlg.CommonDialog cdlg 
      Left            =   600
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Menu mnuFILE 
      Caption         =   "Файл"
      Begin VB.Menu mnuDictionaries 
         Caption         =   "Справочники"
      End
      Begin VB.Menu mnuJournals 
         Caption         =   "Журналы"
      End
      Begin VB.Menu mnuBrowser 
         Caption         =   "Обозреватель объектов"
      End
      Begin VB.Menu mnuUsers 
         Caption         =   "Пользователи"
      End
      Begin VB.Menu mnuMetaModel 
         Caption         =   "Метамодель"
      End
      Begin VB.Menu mnuSep 
         Caption         =   "-"
      End
      Begin VB.Menu mnuDocuments 
         Caption         =   "Новый документ"
      End
      Begin VB.Menu mnuS2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "Выход"
      End
   End
   Begin VB.Menu mnuDocument 
      Caption         =   "Документ"
      Visible         =   0   'False
      Begin VB.Menu mnuDocLock 
         Caption         =   "Заблокировать"
      End
      Begin VB.Menu mnuDocUnlock 
         Caption         =   "Разблокировать"
      End
      Begin VB.Menu mnuDocSaveXML 
         Caption         =   "Сохранить в файл"
      End
      Begin VB.Menu mnuDocLoadXML 
         Caption         =   "Загрузить из файла"
      End
      Begin VB.Menu mnuDocSecure 
         Caption         =   "Установить права"
      End
      Begin VB.Menu mnuGetID 
         Caption         =   "Получить идентификатор"
      End
      Begin VB.Menu mnuDocDelete 
         Caption         =   "Удалить"
      End
   End
   Begin VB.Menu mnuTools 
      Caption         =   "Инструменты"
      Begin VB.Menu mnuViewWizard 
         Caption         =   "Создание запроса"
      End
      Begin VB.Menu mnuSetupJ 
         Caption         =   "Настройка журнала"
      End
      Begin VB.Menu mnuDelApp 
         Caption         =   "Удаление типов документов"
      End
      Begin VB.Menu mnuDelTools 
         Caption         =   "Удаление документов"
      End
      Begin VB.Menu mnuSecurity 
         Caption         =   "Настройка прав"
      End
      Begin VB.Menu mnuS33 
         Caption         =   "-"
      End
      Begin VB.Menu mnuGenerator 
         Caption         =   "Генератор кода"
      End
      Begin VB.Menu mnuExpLic 
         Caption         =   "Экспорт лицензий"
      End
      Begin VB.Menu mnuConvertSQL 
         Caption         =   "MSSQL кнвертор"
      End
      Begin VB.Menu mnuOraclecnv 
         Caption         =   "ORACLE конвертор"
      End
      Begin VB.Menu mnuASPConvert 
         Caption         =   "ASP конвертор"
      End
      Begin VB.Menu mnuConvertNet 
         Caption         =   ".Net конвертор"
      End
      Begin VB.Menu mnuMakeFile 
         Caption         =   "Файл пакетной кмпиляции"
      End
      Begin VB.Menu mnuSaveDocs 
         Caption         =   "Сохранить документы"
      End
      Begin VB.Menu mnuSetupState 
         Caption         =   "Настройка состояний"
      End
      Begin VB.Menu mnuSignCode 
         Caption         =   "Подписать код"
      End
   End
   Begin VB.Menu nmuFind 
      Caption         =   "Поиск"
      Begin VB.Menu mnuFullText 
         Caption         =   "Полнотекстовый поиск"
      End
      Begin VB.Menu mnuFindAttr 
         Caption         =   "Поиск по атрибутам"
      End
   End
   Begin VB.Menu mnuWin 
      Caption         =   "Окно"
      WindowList      =   -1  'True
      Begin VB.Menu mnuAbout 
         Caption         =   "О программе"
      End
      Begin VB.Menu mnuSep3 
         Caption         =   "-"
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
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim ObjectToReport As Object

Dim frmFind As Form
Dim frmFindFT As Form

Dim inTimer1 As Boolean
Dim inTimer2 As Boolean
Dim DelayedCommand As String

Private Declare Sub ExitProcess Lib "kernel32" (ByVal uExitCode As Long)


Private Sub mdiform_load()
  'CreateIcon
  DeltaReminder = GetSetting("MTZ", "CONFIG", "REMINDER", "00:15:00")
  Me.Caption = Me.Caption & " (" & MyUser.Brief & ")"
End Sub

Private Sub mdiForm_Unload(Cancel As Integer)
On Error Resume Next


inTimer2 = True
Me.Timer2.Enabled = False

ReminderVisible = True
Timer2.Enabled = False


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
    Call f.Controls.item(0).object.Init(Nothing, Nothing, False, Nothing)
    Unload f
  End If
Next


Set MyUser = Nothing
Set usr = Nothing
Set model = Nothing
Erase Data



Session.Logout
Set Session = Nothing
Manager.CloseClass
Set Manager = Nothing

If Command$ <> "DEBUG" Then
 TerminateProcess GetCurrentProcess, 0
End If

End Sub



Private Sub mnuAbout_Click()
  frmAbout.Show vbModal
End Sub

Private Sub mnuArrangeIcon_Click()
Me.Arrange vbArrangeIcons
End Sub

Private Sub mnuASPConvert_Click()
  ConvertASP
  MsgBox "Преобразование завершено"
End Sub

Private Sub mnuBrowser_Click()
CallSys
End Sub

Private Sub mnuCascade_Click()
Me.Arrange vbCascade
End Sub


Private Sub mnuConvertNet_Click()
  ConvertNET
  MsgBox "Преобразование завершено"

End Sub

Private Sub mnuConvertSQL_Click()
ConvertSQL
MsgBox "Преобразование завершено"
End Sub

Private Sub mnuDelApp_Click()
  Set frmAppDel.model = model
  frmAppDel.Show vbModal
  If frmAppDel.ok Then
    Dim ma As MTZAPP
    Set ma = frmAppDel.Result
    KillTypes ma
    ma.Delete
    
  End If
End Sub

Private Sub mnuDelTools_Click()
  frmDeleteTool.Show
End Sub

Private Sub mnuExit_Click()
  Unload Me
End Sub



Private Sub mnuExpLic_Click()
Dim ot As OBJECTTYPE
Dim i As Long, j As Long

  On Error GoTo bye
  Dim fn As String
  cdlg.CancelError = True
  cdlg.Filter = "Файл лицензий|*.txt"
  cdlg.DefaultExt = "txt"
  cdlg.FileName = ""
  cdlg.ShowSave
  fn = cdlg.FileName

On Error Resume Next


Licenses.Add "GridEx20.GridEx"
model.OBJECTTYPE.Sort = "Name"
For i = 1 To model.OBJECTTYPE.Count
  Set ot = model.OBJECTTYPE.item(i)
  For j = 1 To ot.OBJECTMODE.Count
    Licenses.Add ot.Name & "GUI.ctl" & ot.OBJECTMODE.item(j).Name & "_main"
  Next
  Licenses.Add ot.Name & "GUI.ctl_main"
Next
Dim li As LicenseInfo
Dim intFile As Integer
intFile = FreeFile

Open fn For Output As #intFile
For Each li In Licenses
 If li.LicenseKey <> "" Then
  Write #intFile, li.ProgId, li.LicenseKey
 End If
Next
Write #intFile, "", ""
Close #intFile
bye:
End Sub

Private Sub mnuFindAttr_Click()
  If Not frmFind Is Nothing Then
    On Error Resume Next
    Unload frmFind
    Set frmFind = Nothing
  End If
  
  If frmFind Is Nothing Then
    Set frmFind = Manager.GetFinderDialog(site, "")
    frmFind.Caption = "Поиск по атрибутам"
  End If
  frmFind.Show

End Sub

Private Sub mnuFullText_Click()
  If frmFindFT Is Nothing Then
    Set frmFindFT = Manager.GetFullTextDialog(site)
    frmFindFT.Caption = "Поиск по тексту"
  End If
  frmFindFT.Show
End Sub



Private Sub mnuGenerator_Click()
  frmGenerator.Show
End Sub

Private Sub mnuGetID_Click()
On Error GoTo bye
  Dim item As Object
  Set item = GetActiveItem()
  If item Is Nothing Then Exit Sub
  Clipboard.Clear
  Clipboard.SetText item.ID, vbCFText
  frmShowID.Label1 = "Идентификатор документа :" & vbCrLf & item.Brief
  frmShowID.Text1 = item.ID
  frmShowID.Show vbModal
  Exit Sub
bye:

End Sub

Private Sub mnuMakeFile_Click()
Dim ot As OBJECTTYPE
Dim i As Long, j As Long

  On Error GoTo bye
  Dim fn As String
  cdlg.CancelError = True
  cdlg.Filter = "Файл пакета|*.cmd"
  cdlg.DefaultExt = "cmd"
  cdlg.FileName = ""
  cdlg.ShowSave
  fn = cdlg.FileName

On Error Resume Next
Dim out As String
out = "echo on"

Dim mask As String, ok As Boolean
mask = InputBox("Задать маску", "Ограничить тип документов")


For j = 1 To model.GENPACKAGE.item(1).GENERATOR_TARGET.Count
  If model.GENPACKAGE.item(1).GENERATOR_TARGET.item(j).QueueName = "MTZ_VBQUEUE" Then
  out = out & vbCrLf & "echo ----------------" & model.GENPACKAGE.item(1).GENERATOR_TARGET.item(j).Name
  model.OBJECTTYPE.Sort = "Name"
  For i = 1 To model.OBJECTTYPE.Count
    ok = False
    If mask <> "" Then
      If Left(UCase(model.OBJECTTYPE.item(i).Package.Name), Len(mask)) = UCase(mask) Then
        ok = True
      End If
    Else
      ok = True
    End If
    
    If ok Then
      If model.GENPACKAGE.item(1).GENERATOR_TARGET.item(j).TargetType = TargetType_Prilogenie Then
        out = out & vbCrLf & "call makevbp.cmd """ & App.path & "\" & model.GENPACKAGE.item(1).GENERATOR_TARGET.item(j).Name & "\" & model.OBJECTTYPE.item(i).Name & "\" & model.OBJECTTYPE.item(i).Name & "GUI.vbp"""
      Else
        out = out & vbCrLf & "call makevbp.cmd """ & App.path & "\" & model.GENPACKAGE.item(1).GENERATOR_TARGET.item(j).Name & "\" & model.OBJECTTYPE.item(i).Name & "\" & model.OBJECTTYPE.item(i).Name & ".vbp"""
      End If
    End If
  Next
  End If
Next

Dim intFile As Integer
intFile = FreeFile

Open fn For Output As #intFile
Print #intFile, out
Close #intFile
bye:

End Sub

Private Sub mnuMetaModel_Click()
  Dim o As Object, g As Object
  Dim rs As ADODB.Recordset

  Set rs = Manager.ListInstances(site, "MTZMetaModel")
  Set o = Manager.GetInstanceObject(rs!InstanceID)
  
  
  Set g = Manager.GetInstanceGUI(rs!InstanceID)
  g.Show "", o, False
  Set rs = Nothing

End Sub

Private Sub mnuOraclecnv_Click()
ConvertORA
MsgBox "Преобразование завершено"
End Sub

Private Sub mnuSaveDocs_Click()
frmSaveTool.Show
End Sub

Private Sub mnuSecurity_Click()
frmSecurity.Show
End Sub

Private Sub mnuSetupState_Click()
  frmStateTool.Show
End Sub

Private Sub mnuSignCode_Click()
Dim ot As OBJECTTYPE
Dim i As Long, j As Long
Dim sc As CAPICOM.SignedCode
On Error GoTo bye
'Dim st As New Store
'Dim certs As Certificates
'Dim selectedCerts As Certificates
'Dim cert As Certificate
Dim Signer As Signer

'st.Open CAPICOM_CURRENT_USER_STORE, CAPICOM_MY_STORE, CAPICOM_STORE_OPEN_READ_ONLY
'Set certs = st.Certificates

Set Signer = New Signer
'Set Signer.Certificate = certs.item(1)
'Signer.Load

Set sc = New CAPICOM.SignedCode

On Error GoTo bye
Dim fn As String



Dim mask As String, ok As Boolean
mask = InputBox("Задать маску", "Ограничить тип документов")

On Error Resume Next
For j = 1 To model.GENPACKAGE.item(1).GENERATOR_TARGET.Count
  If model.GENPACKAGE.item(1).GENERATOR_TARGET.item(j).QueueName = "MTZ_VBQUEUE" Then
  model.OBJECTTYPE.Sort = "Name"
  For i = 1 To model.OBJECTTYPE.Count
    ok = False
    If mask <> "" Then
      If Left(UCase(model.OBJECTTYPE.item(i).Package.Name), Len(mask)) = UCase(mask) Then
        ok = True
      End If
    Else
      ok = True
    End If
    
    If ok Then
      If model.GENPACKAGE.item(1).GENERATOR_TARGET.item(j).TargetType = TargetType_Prilogenie Then
        Err.Clear
        sc.FileName = App.path & "\" & model.GENPACKAGE.item(1).GENERATOR_TARGET.item(j).Name & "\" & model.OBJECTTYPE.item(i).Name & "\" & model.OBJECTTYPE.item(i).Name & "GUI.ocx"
        sc.Description = model.OBJECTTYPE.item(i).the_comment
        sc.DescriptionURL = "http://3746485.921.ru"
        sc.Sign Signer
        'Signer.Certificate.Display
        If Err.Number > 0 Then
         MsgBox model.OBJECTTYPE.item(i).the_comment & vbCrLf & sc.FileName & vbCrLf & Err.Description, vbInformation, "Ошибка при подписывании кода"
        End If
      End If
    End If
  Next
  End If
Next
MsgBox "Код подписан"

bye:
  MsgBox Err.Description
  Set Signer = Nothing
  Set sc = Nothing
End Sub

Private Sub mnuTileHor_Click()
Me.Arrange vbTileHorizontal
End Sub

Private Sub mnuTileVert_Click()
Me.Arrange vbTileVertical
End Sub

Private Sub mnuUsers_Click()
  Dim o As Object, g As Object
  Dim rs As ADODB.Recordset

  Set rs = Manager.ListInstances(site, "MTZUsers")
  Set o = Manager.GetInstanceObject(rs!InstanceID)
  
  
  Set g = Manager.GetInstanceGUI(rs!InstanceID)
  g.Show "", o, False
  Set rs = Nothing
End Sub


Private Sub mnuViewWizard_Click()
'ViewBuilder
frmWizard.Show vbModal, Me
End Sub

Private Sub Timer2_Timer()
If inTimer2 Then Exit Sub
inTimer2 = True
On Error Resume Next
Call Session.Exec("SessionTouch", Nothing)
If Not GetActiveItem() Is Nothing Then
  mnuDocument.Visible = True
Else
  mnuDocument.Visible = False
End If

inTimer2 = False

End Sub



Private Function NoTabs(ByVal s As String) As String
  NoTabs = Replace(Replace(Replace(Replace(s, vbTab, " "), vbCrLf, " "), vbCr, " "), vbLf, " ")
End Function



Private Sub mnuDictionaries_Click()
  Set frmDicList.model = model
  frmDicList.Show vbModal
  If frmDicList.ok Then
    Dim ot As OBJECTTYPE
    Set ot = model.FindRowObject("OBJECTTYPE", frmDicList.Result)
    Dim o1 As Object, o2 As Object, ID As String
    Dim rs As ADODB.Recordset
    Set rs = Manager.ListInstances(site, ot.Name)
    If rs.EOF Then
      ID = CreateGUID2
      Manager.NewInstance ID, ot.Name, ot.the_comment, site
    Else
      ID = rs!InstanceID
    End If
    
    Set o1 = Manager.GetInstanceObject(ID, site)
    If o1 Is Nothing Then
      MsgBox "Отсутствует объектная библиотека для типа:" & ot.the_comment, vbCritical + vbOKOnly
      Exit Sub
    End If
    Set o2 = Manager.GetInstanceGUI(o1.ID)
    If o2 Is Nothing Then
      MsgBox "Отсутствует интерфейсный компонент для типа:" & ot.the_comment, vbCritical + vbOKOnly
      Exit Sub
    End If
    o2.Show "", o1, False
  End If
End Sub

Private Sub mnuDocuments_Click()
  Set frmDocList.model = model
  frmDocList.Show vbModal
  If frmDocList.ok Then
    Dim ot As OBJECTTYPE
    Set ot = model.FindRowObject("OBJECTTYPE", frmDocList.Result)
    Dim o1 As Object, o2 As Object, ID As String
    Dim rs As ADODB.Recordset
    ID = CreateGUID2
    Manager.NewInstance ID, ot.Name, ot.the_comment & " " & Now, site
    Set o1 = Manager.GetInstanceObject(ID, site)
    If o1 Is Nothing Then
      MsgBox "Отсутствует объектная библиотека для типа:" & ot.the_comment, vbCritical + vbOKOnly
      Exit Sub
    End If
    Set o2 = Manager.GetInstanceGUI(o1.ID)
    If o2 Is Nothing Then
      MsgBox "Отсутствует интерфейсный компонент для типа:" & ot.the_comment, vbCritical + vbOKOnly
      Exit Sub
    End If
    o2.Show "", o1, False
  End If
End Sub

Private Sub mnuJournals_Click()
  Set frmJouralList.model = model
  frmJouralList.Show vbModal
  If frmJouralList.ok Then
    Set journal = model.Manager.GetInstanceObject(frmJouralList.Result)
    Dim f As frmJournalShow
    Set f = New frmJournalShow
    Set f.jv.journal = journal
    f.jv.AllowAdd = False
    f.jv.AllowDel = False
    f.jv.AllowFilter = False
    
    f.Caption = journal.Name
    f.Show
    f.jv.Refresh
  End If
End Sub

Private Sub mnuSetupJ_Click()
  Set frmJouralList.model = model
  frmJouralList.Show vbModal
  If frmJouralList.ok Then
    Set journal = model.Manager.GetInstanceObject(frmJouralList.Result)
    Set frmJournalConfig.JournalDef1.model = model
    Set frmJournalConfig.JournalDef1.journal = journal
    frmJournalConfig.Show vbModal
    Unload frmJournalConfig
  End If
End Sub

Private Sub mnuDocDelete_Click()
On Error GoTo bye
  Dim item As Object
  Set item = GetActiveItem()
  If item Is Nothing Then Exit Sub
  If MsgBox("Удалить документ?", vbQuestion + vbYesNo) = vbYes Then
  
    item.UnLockResource
    item.WorkOffline = False
    item.Manager.DeleteInstance item.ID
    item.Manager.FreeInstanceObject item.ID
    Unload Me.ActiveForm
  End If
  Exit Sub
bye:
   MsgBox Err.Description, vbCritical, "Ошибка при удалении"
End Sub

Private Sub mnuDocLoadXML_Click()
 On Error Resume Next
 Dim item As Object
  Set item = GetActiveItem()
  If item Is Nothing Then Exit Sub
  If item.Application.MTZSession.CheckRight(item.SecureStyleID, "XMLLOAD") Then
  
  On Error GoTo bye
  Dim fn As String
  cdlg.CancelError = True
  cdlg.Filter = "Документ XML |*.XML"
  cdlg.DefaultExt = "XML"
  cdlg.FileName = App.path & "\" & item.ID & ".xml"
  cdlg.Flags = cdlOFNPathMustExist + cdlOFNHideReadOnly + cdlOFNFileMustExist
  cdlg.ShowOpen
  fn = cdlg.FileName
  
  Dim xdom As MSXML2.DOMDocument
  Set xdom = New MSXML2.DOMDocument
  xdom.Load fn
  item.XMLLoad xdom.lastChild, 1
  item.WorkOffline = False
  item.BatchUpdate
  Set xdom = Nothing
  
 End If
bye:
End Sub

Private Sub mnuDocLock_Click()
  On Error Resume Next
  Dim item As Object
  Set item = GetActiveItem()
  If item Is Nothing Then Exit Sub
  item.LockResource True
  Me.ActiveForm.TestLock
End Sub

Private Sub mnuDocSaveXML_Click()
 On Error Resume Next
 Dim item As Object
 Set item = GetActiveItem()
 If item Is Nothing Then Exit Sub
 
 If item.Application.MTZSession.CheckRight(item.SecureStyleID, "XMLSAVE") Then
 
  On Error GoTo bye
  Dim fn As String
  cdlg.CancelError = True
  cdlg.Filter = "Документ XML|*.XML"
  cdlg.DefaultExt = "XML"
  cdlg.FileName = App.path & "\" & item.ID & ".xml"
  cdlg.Flags = cdlOFNPathMustExist + cdlOFNHideReadOnly + cdlOFNOverwritePrompt 'cdlOFNFileMustExist
  cdlg.ShowSave
  fn = cdlg.FileName
   item.LockResource True
   item.LoadAll
   item.WorkOffline = True
   Dim xdom As MSXML2.DOMDocument
   Set xdom = New MSXML2.DOMDocument
   xdom.loadXML "<root></root>"
   item.XMLSave xdom.lastChild, xdom
   xdom.Save fn
   item.WorkOffline = False
 End If
bye:
End Sub

Private Sub mnuDocSecure_Click()
On Error Resume Next
  Dim item As Object
  Set item = GetActiveItem()
  If item Is Nothing Then Exit Sub
  item.Application.Manager.ShowSecurityDialog item
End Sub

Private Sub mnuDocUnlock_Click()
On Error Resume Next
  Dim item As Object
  Set item = GetActiveItem()
  If item Is Nothing Then Exit Sub
  If item.IsLocked Then
    item.UnLockResource
  Else
  MsgBox "Объект не заблокирован", vbInformation
  End If
  Me.ActiveForm.TestLock
End Sub

Private Function GetActiveItem() As Object
On Error Resume Next
If TypeName(Me.ActiveForm) = "frmObj" Then
  Set GetActiveItem = Me.ActiveForm.item
End If
End Function

Private Sub KillTypes(item As MTZMetaModel.MTZAPP)
  Dim ot As Object, i As Long
  On Error GoTo bye
tryagain:
  item.Application.OBJECTTYPE.Refresh
  For i = 1 To item.Application.OBJECTTYPE.Count
    Set ot = item.Application.OBJECTTYPE.item(i)
    If ot.Package.ID = item.ID Then
      item.Application.OBJECTTYPE.Delete ot.ID
      GoTo tryagain
    End If
  Next
bye:
End Sub
