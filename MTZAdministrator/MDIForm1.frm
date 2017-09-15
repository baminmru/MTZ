VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.MDIForm frmMain 
   BackColor       =   &H8000000C&
   Caption         =   "Администратор."
   ClientHeight    =   6495
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   7815
   Icon            =   "MDIForm1.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.Timer Timer2 
      Interval        =   1000
      Left            =   360
      Top             =   1320
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
      Begin VB.Menu mnuCreateDics 
         Caption         =   "Создать справочники"
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
      Begin VB.Menu mnuRoleS 
         Caption         =   "Роли"
      End
      Begin VB.Menu mnuMetaModel 
         Caption         =   "Метамодель"
      End
      Begin VB.Menu mnuLog 
         Caption         =   "Активность пользователей"
      End
      Begin VB.Menu mnuSep 
         Caption         =   "-"
      End
      Begin VB.Menu mnuDocuments 
         Caption         =   "Новый документ"
      End
      Begin VB.Menu mnuSwitchLang 
         Caption         =   "Переключить язык"
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
      Begin VB.Menu mnuDocRename 
         Caption         =   "Переименовать"
      End
      Begin VB.Menu mnuDocDelete 
         Caption         =   "Удалить"
      End
   End
   Begin VB.Menu mnutoolS 
      Caption         =   "Инструменты"
      Begin VB.Menu mnuViewWizard 
         Caption         =   "Создание запроса"
      End
      Begin VB.Menu mnuSetupJ 
         Caption         =   "Настройка журнала"
      End
      Begin VB.Menu mnuSetupModes 
         Caption         =   "Настройка режимов"
      End
      Begin VB.Menu mnuSetupState 
         Caption         =   "Настройка состояний"
      End
      Begin VB.Menu mnuUniqTool 
         Caption         =   "Настройка уникальных сочетаний"
      End
      Begin VB.Menu mnuSecurity 
         Caption         =   "Настройка прав"
      End
      Begin VB.Menu mnuSort 
         Caption         =   "Упорядочивание полей и типов объектов"
      End
      Begin VB.Menu mnuAddMethod 
         Caption         =   "Добавление метода SetName"
      End
      Begin VB.Menu mnuUnlockAll 
         Caption         =   "Разблокировать объекты"
      End
      Begin VB.Menu mnuS33 
         Caption         =   "-"
      End
      Begin VB.Menu mnuPrepareARM 
         Caption         =   "Подготовка АРМ"
      End
      Begin VB.Menu mnuGenerator 
         Caption         =   "Генератор документов"
      End
      Begin VB.Menu mnuARMGenerator 
         Caption         =   "Генератор АРМ"
      End
      Begin VB.Menu mnuInstallGenerator 
         Caption         =   "Генератор инсталлции"
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
      Begin VB.Menu mnuSignCode 
         Caption         =   "Подписать код"
      End
      Begin VB.Menu fake33 
         Caption         =   "-"
      End
      Begin VB.Menu mnuCreateJournalByView 
         Caption         =   "Генерация журнала по вью"
      End
      Begin VB.Menu mnuViewJournal 
         Caption         =   "Мастер ""Вью->Журнал"""
      End
      Begin VB.Menu mfakeFR 
         Caption         =   "FastReport"
         Begin VB.Menu mnuFastReportMaster 
            Caption         =   "Мастер отчётов (phil)"
         End
         Begin VB.Menu mnuMakeFR 
            Caption         =   "Создать отчет FR (bami style)"
         End
         Begin VB.Menu mnuMakeFRPhil 
            Caption         =   "Создать отчёт по объекту (phil style)"
         End
         Begin VB.Menu mnuMakeFRPhilViews 
            Caption         =   "Создать отчёт по объекту + views (phil style)"
         End
         Begin VB.Menu mnuMakeFRAppPhil 
            Caption         =   "Создать отчёт по объектам всего приложения (phil style)"
         End
      End
   End
   Begin VB.Menu mnuDataExchange 
      Caption         =   "Обмен данными"
      Begin VB.Menu mnuSaveDocs 
         Caption         =   "Сохранить документы"
      End
      Begin VB.Menu mnuToolSaveDesc 
         Caption         =   "Сохранить описание типа"
      End
      Begin VB.Menu mnuSaveFieldTypes 
         Caption         =   "Сохранить типы полей"
      End
      Begin VB.Menu mnuSaveMethods 
         Caption         =   "Сохранить методы и процедуры"
      End
      Begin VB.Menu mnuToolLoadDesc 
         Caption         =   "Загрузить описание типа"
      End
      Begin VB.Menu mnuLoadFT 
         Caption         =   "Загрузить типы полей"
      End
      Begin VB.Menu mnuLoadMethods 
         Caption         =   "Загрузить  методы и процедуры"
      End
      Begin VB.Menu mnus4 
         Caption         =   "-"
      End
      Begin VB.Menu mnuMergeObject 
         Caption         =   "Замена ссылки на объект"
      End
      Begin VB.Menu mnuMergeRow 
         Caption         =   "Замена ссылки на раздел"
      End
      Begin VB.Menu mnuS5 
         Caption         =   "-"
      End
      Begin VB.Menu mnuDelTools 
         Caption         =   "Удаление документов"
      End
      Begin VB.Menu mnuDelApp 
         Caption         =   "Удаление типов документов"
      End
      Begin VB.Menu mnuCB_sep 
         Caption         =   "-"
      End
      Begin VB.Menu mnuLoadFromXML 
         Caption         =   "Загрузить документ из XML"
      End
      Begin VB.Menu fake1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuCleanBase 
         Caption         =   "Очистка базы данных"
      End
      Begin VB.Menu mnuMSSQL2MTZ 
         Caption         =   "Импорт из MSSQL"
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
   Begin VB.Menu mnuTest 
      Caption         =   "Test"
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
Dim WithEvents fRole As frmJournalShow
Attribute fRole.VB_VarHelpID = -1

Private Declare Sub ExitProcess Lib "kernel32" (ByVal uExitCode As Long)
Private Declare Function OemToChar Lib "user32" Alias "OemToCharA" (ByVal lpszSrc As String, ByVal lpszDst As String) As Long
Private Declare Function CharToOem Lib "user32" Alias "CharToOemA" (ByVal lpszSrc As String, ByVal lpszDst As String) As Long


'стpоки д.б. одинаковой длины, т.е. пpинимающую стpоку можно забить пpобелами:
'





Private Sub mdiform_load()
  'CreateIcon
  On Error Resume Next
  DeltaReminder = GetSetting("MTZ", "CONFIG", "REMINDER", "00:15:00")
  Me.Caption = Me.Caption & " (" & site & "\" & MyUser.brief & ")"
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

If (Not frmProgress Is Nothing) Then
  Unload frmProgress
  Set frmProgress = Nothing
End If

End Sub



Private Sub mnuAbout_Click()
  frmAbout.Show vbModal
End Sub

Private Sub mnuAddMethod_Click()
  Dim f As frmAddMethod
  Set f = New frmAddMethod
  f.Show vbModal
  Unload f
End Sub

Private Sub mnuARMGenerator_Click()
    
    
  Dim f As frmARMGEN
  Set f = New frmARMGEN
  f.Show vbModal
  Unload f
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


Private Sub mnuCleanBase_Click()
  frmCleanBaseTool.Show vbModal
End Sub

Private Sub mnuConvertNet_Click()
  ConvertNET
  MsgBox "Преобразование завершено"

End Sub

Private Sub mnuConvertSQL_Click()
ConvertSQL
MsgBox "Преобразование завершено"
End Sub

Private Sub mnuCreateDics_Click()
  Dim ot As objectType
  Dim i As Long
  Dim rs As ADODB.Recordset
  For i = 1 To model.objectType.Count
    Set ot = model.objectType.item(i)
    If ot.IsSingleInstance = Boolean_Da Then
      Set rs = Manager.ListInstances("", ot.Name)
      If rs.EOF Then
        Manager.NewInstance CreateGUID2, ot.Name, ot.the_comment
      End If
    End If
  Next
End Sub

Private Sub mnuCreateJournalByView_Click()
    Call JournalByView.ProcessJournal
End Sub

Private Sub mnuDelApp_Click()
  Set frmAppDel.model = model
  frmAppDel.Show vbModal
  If frmAppDel.OK Then
    Dim ma As mtzApp
    Set ma = frmAppDel.Result
    KillTypes ma
    'ma.Delete
    
  End If
End Sub

Private Sub mnuDelTools_Click()
  frmDeleteTool.Show
End Sub

Private Sub mnuDocRename_Click()
On Error Resume Next
  Dim item As Object
  Set item = GetActiveItem()
  If item Is Nothing Then Exit Sub
  Dim s As String
  s = InputBox("Введите новое название документа", "Переименовать документ", item.Name)
  If s <> "" Then
    item.Name = s
    item.Save
  End If
  

End Sub

Private Sub mnuExit_Click()
  Unload Me
End Sub



Private Sub mnuExpLic_Click()
  Dim ot As objectType
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
  
  If (frmProgress Is Nothing) Then
    Set frmProgress = New frmProgress
  End If
  
  Call frmProgress.Start(1, model.objectType.Count, "Получение лицензий", "Получение лицензий")
  
    
  Licenses.Add "GridEx20.GridEx"
  Call frmProgress.Tick(i, "----> компонент 'GUI.ctl" & ot.Name & "GUI.ctl_main")
    
  On Error GoTo Err
  
  model.objectType.Sort = "Name"
  For i = 1 To model.objectType.Count
    Set ot = model.objectType.item(i)
    Call frmProgress.Tick(i, "-Получение лицензии для '" & ot.Name & "'")
    For j = 1 To ot.OBJECTMODE.Count
      
      Err.Clear
      On Error Resume Next
      Licenses.Add ot.Name & "GUI.ctl" & ot.OBJECTMODE.item(j).Name & "_main"
      If (Err.Number = 0) Then
        Call frmProgress.Tick(i, "----> компонент '" & ot.Name & ".GUI.ctl" & ot.OBJECTMODE.item(j).Name & "_main""'")
      Else
        Call frmProgress.Tick(i, "----> компонент '" & ot.Name & ".GUI.ctl" & ot.OBJECTMODE.item(j).Name & "_main""' НЕ ДОБАВЛЕН - ")
        Call frmProgress.Tick(i, "----> " & Err.Number & " " & Err.Description)
      End If
      On Error GoTo Err
    Next
    Err.Clear
    On Error Resume Next
    Licenses.Add ot.Name & "GUI.ctl_main"
    On Error GoTo Err
    If (Err.Number = 0) Then
      Call frmProgress.Tick(i, "----> компонент 'GUI.ctl" & ot.Name & "GUI.ctl_main'")
    Else
      Call frmProgress.Tick(i, "----> компонент 'GUI.ctl" & ot.Name & "GUI.ctl_main' НЕ ДОБАВЛЕН - ")
      Call frmProgress.Tick(i, "----> " & Err.Number & " " & Err.Description)
    End If
    DoEvents
    If (frmProgress.STOP_PROCESS) Then
      Call frmProgress.Tick(-1, "Процесс прерван пользователем.")
      GoTo bye
    End If
  Next
  
  Dim intFile As Integer
  intFile = FreeFile
  
  Call frmProgress.Start(1, Licenses.Count, "Запись лицензий в файл", "Запись лицензий в файл")
  Call frmProgress.Tick(i, "Всего  - " & Licenses.Count)
  
  On Error GoTo Err
  
  Open fn For Output As #intFile
  
  Dim li As LicenseInfo
  i = 1
  For Each li In Licenses
    'Set li = Licenses.item(i)
    If li.LicenseKey <> "" Then
       Write #intFile, li.ProgId, li.LicenseKey
       Call frmProgress.Tick(i, "----> компонент '" & i & " " & li.ProgId & " лицензия: " & li.LicenseKey)
    Else
      Call frmProgress.Tick(i, "----> компонент '" & i & " " & li.ProgId & " LicenseKey  нет")
    End If
    i = i + 1
    
  Next
  Write #intFile, "", ""
  Close #intFile
  GoTo bye
errF:
  Write #intFile, "", ""
  Close #intFile
bye:
  Call frmProgress.Tick(-1, "Процесс завершён без ошибок.")
  Exit Sub
Err:
  Call frmProgress.Tick(-1, "Ошибка " & Err.Number & " -  " & Err.Description)
End Sub

Private Sub mnuFastReportMaster_Click()
Dim frmFR As New frmFastReportBuilder
    frmFR.Show
End Sub

Private Sub mnuFindAttr_Click()
  On Error GoTo Err
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
  Exit Sub
Err:
  MsgBox "Поиск по атрибутам недоступен", vbInformation + vbOKOnly, App.Title
End Sub

Private Sub mnuFullText_Click()
  On Error GoTo Err
  If frmFindFT Is Nothing Then
    Set frmFindFT = Manager.GetFullTextDialog(site)
    frmFindFT.Caption = "Поиск по тексту"
  End If
  frmFindFT.Show
  Exit Sub
Err:
  MsgBox "Полнотекстовый поиск недоступен", vbInformation + vbOKOnly, App.Title
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
  frmShowID.Label1 = "Идентификатор документа :" & vbCrLf & item.brief
  frmShowID.Text1 = item.ID
  frmShowID.Show vbModal
  Exit Sub
bye:

End Sub

Private Sub mnuInstallGenerator_Click()

On Error GoTo Error_Detected
Dim objInstall As MTZ_Install.Application
Set objInstall = GetDictionary("MTZ_Install")

'    Dim ii As Long
'    Dim jj As Long
'    For ii = 1 To objInstall.MTZ_Inst_Section.Count
'        For jj = 1 To objInstall.MTZ_Inst_Section.item(ii).MTZ_Inst_Sec_Files.Count
'            Dim objFile As MTZ_Inst_Sec_Files
'            Set objFile = objInstall.MTZ_Inst_Section.item(ii).MTZ_Inst_Sec_Files.item(jj)
'            If UCase(Left(objFile.TheSource, 6)) = UCase("c:\mtz") Then
'                objFile.TheSource = Replace(objFile.TheSource, "C:\MTZ", "%MTZDIR%", , , vbTextCompare)
'                objFile.Save
'            End If
'        Next
'    Next
'
'    Exit Sub

    If objInstall.MTZ_Inst_Section.Count <= 0 Or objInstall.MTZ_Inst_Build.Count <= 0 Then
        MsgBox "Нет данных"
        Exit Sub
    End If
    Dim objBuild As MTZ_Inst_Build
    Dim ID As String
    Dim brief As String
    If Manager.GetReferenceDialogEx2("MTZ_Inst_Build", ID, brief) Then
        ID = left(ID, 38)
        Set objBuild = objInstall.FindRowObject("MTZ_Inst_Build", ID)
        If objBuild Is Nothing Then
            MsgBox "Ошибка получения билда"
            Exit Sub
        End If
        
        'Get SaveFile
        cdlg.CancelError = True
        cdlg.Filter = "Документ NSI|*.NSI"
        cdlg.DefaultExt = "NSI"
        cdlg.FileName = objBuild.PRODUCT_NAME + ".NSI"
        cdlg.Flags = cdlOFNPathMustExist + cdlOFNHideReadOnly + cdlOFNOverwritePrompt 'cdlOFNFileMustExist
        cdlg.ShowSave
        
        
        
        PrepareInstall objBuild, cdlg.FileName '"c:\Inst.nsi"
        ShellExecute 0, "open", cdlg.FileName, "", "", 0
        MsgBox "Done!"
    End If
Error_Detected:
End Sub

Private Sub mnuLoadFromXML_Click()
On Error GoTo bye
  Dim fn As String
  cdlg.CancelError = True
  cdlg.Filter = "Документ XML |*.XML"
  cdlg.DefaultExt = "XML"
  'cdlg.FileName = App.path & "\" & item.ID & ".xml"
  cdlg.Flags = cdlOFNPathMustExist + cdlOFNHideReadOnly + cdlOFNFileMustExist
  cdlg.ShowOpen
  fn = cdlg.FileName
  Dim xdom As MSXML2.DOMDocument
  
  If fn <> "" Then
    Dim TypeName As String
    Dim ID As String
    Dim Name As String
    Dim drs As Object
    
    Set xdom = New MSXML2.DOMDocument
    xdom.Load fn
    ID = xdom.lastChild.firstChild.Attributes.getNamedItem("ID").nodeValue
    TypeName = xdom.lastChild.firstChild.Attributes.getNamedItem("TYPENAME").nodeValue
    Name = TypeName
    
    'try if new format
    Name = xdom.lastChild.firstChild.Attributes.getNamedItem("NAME").nodeValue
    
    Set drs = Manager.GetInstanceObject(ID)
    If drs Is Nothing Then
      Manager.NewInstance ID, TypeName, Name
    End If
    
    Set drs = Manager.GetInstanceObject(ID)
    If Not drs Is Nothing Then
      drs.LockResource True
      drs.AutoLoadPart = True
      drs.WorkOffline = True
      drs.XMLLoad xdom.lastChild, 0
      drs.WorkOffline = False
      drs.BatchUpdate
      drs.UnLockResource
    End If
    Set xdom = Nothing
    MsgBox "Документ загружен удачно!", vbOKOnly
  End If

bye:
End Sub

Private Sub mnuLoadFT_Click()
  Dim f As frmLoadFT
  Set f = New frmLoadFT
  f.Show
End Sub

Private Sub mnuLoadMethods_Click()
  Dim f As frmLoadMTD
  Set f = New frmLoadMTD
  f.Show
End Sub

Private Sub mnuLog_Click()
frmLog.Show
End Sub

Private Sub mnuMakeFile_Click()

frmPackGen.Show vbModal
  Exit Sub

'Dim ot As objectType
'Dim i As Long, j As Long
'
'  On Error GoTo bye
'  Dim fn As String
'  cdlg.CancelError = True
'  cdlg.Filter = "Файл пакета|*.cmd"
'  cdlg.DefaultExt = "cmd"
'  cdlg.FileName = ""
'  cdlg.ShowSave
'  fn = cdlg.FileName
'
'On Error Resume Next
'Dim out As String
'out = "echo on"
'
'Dim mask As String, OK As Boolean
'mask = InputBox("Задать маску", "Ограничить тип документов")
'
'
'For j = 1 To model.GENPACKAGE.item(1).GENERATOR_TARGET.Count
'  If model.GENPACKAGE.item(1).GENERATOR_TARGET.item(j).QueueName = "MTZ_VBQUEUE" Then
'  out = out & vbCrLf & "echo ----------------" & model.GENPACKAGE.item(1).GENERATOR_TARGET.item(j).Name
'  model.objectType.Sort = "Name"
'  For i = 1 To model.objectType.Count
'    OK = False
'    If mask <> "" Then
'      If Left(UCase(model.objectType.item(i).package.Name), Len(mask)) = UCase(mask) Then
'        OK = True
'      End If
'    Else
'      OK = True
'    End If
'
'    If OK Then
'      If model.GENPACKAGE.item(1).GENERATOR_TARGET.item(j).TargetType = TargetType_Prilogenie Then
'        out = out & vbCrLf & "call makevbp.cmd """ & App.path & "\" & W2OEM(model.objectType.item(i).package.Name) & "\" & model.GENPACKAGE.item(1).GENERATOR_TARGET.item(j).Name & "\" & model.objectType.item(i).Name & "\" & model.objectType.item(i).Name & "GUI.vbp"""
'      Else
'        out = out & vbCrLf & "call makevbp.cmd """ & App.path & "\" & W2OEM(model.objectType.item(i).package.Name) & "\" & model.GENPACKAGE.item(1).GENERATOR_TARGET.item(j).Name & "\" & model.objectType.item(i).Name & "\" & model.objectType.item(i).Name & ".vbp"""
'      End If
'    End If
'  Next
'  End If
'Next
'
'Dim intFile As Integer
'intFile = FreeFile
'
'Open fn For Output As #intFile
'Print #intFile, out
'Close #intFile
'bye:

End Sub


Private Function W2OEM(ByVal s As String) As String
 
  Dim es As String
  es = Space(Len(s))
  Call CharToOem(s, es)
  W2OEM = es
End Function

Private Sub mnuMakeFR_Click()
Dim f As frmMakeFR
Set f = New frmMakeFR
f.Show vbModal
Unload f
Set f = Nothing
End Sub

Private Sub mnuMakeFRAppPhil_Click()
On Error GoTo bye
    Dim fn As String
    Dim fp As String
    Dim objObject As objectType
    Dim IDv As String
    Dim Briefv As String
    If Not Manager.GetReferenceDialogEx3("MTZAPP", IDv, Briefv) Then
        Exit Sub
    End If
    IDv = left(IDv, 38)
    Dim mtzApp As mtzApp
    Dim oMetaModel As MTZMetaModel.Application
    Set mtzApp = MyUser.Application.FindRowObject("MTZAPP", IDv)
    Set oMetaModel = mtzApp.Application
    fp = GetPath("Путь для отчётов", Me.hwnd)
    If fp <> "" Then
        Dim i As Long
        For i = 1 To oMetaModel.objectType.Count
            If oMetaModel.objectType.item(i).package.ID = IDv Then
                Set objObject = oMetaModel.objectType.item(i)
                fn = fp + objObject.Name + ".fr3"
                MakeSingleFRForView fn, objObject, True
            End If
        Next
        MsgBox "Завершено!"
    End If

bye:
End Sub

Private Sub mnuMakeFRPhil_Click()
On Error GoTo bye
    Dim fn As String
    Dim objObject As objectType
    Dim IDv As String
    Dim Briefv As String
    If Not Manager.GetReferenceDialogEx3("OBJECTTYPE", IDv, Briefv) Then
        Exit Sub
    End If
    IDv = left(IDv, 38)
    Set objObject = MyUser.Application.FindRowObject("OBJECTTYPE", IDv)
    cdlg.CancelError = True
    cdlg.Filter = "Документ FastReport |*.fr3"
    cdlg.DefaultExt = "fr3"
    cdlg.FileName = objObject.Name
    'objObject.Name
    'cdlg.FileName = App.path & "\" & item.ID & ".xml"
    cdlg.Flags = cdlOFNPathMustExist '+ cdlOFNHideReadOnly + cdlOFNFileMustExist
    cdlg.ShowSave
    fn = cdlg.FileName
    If fn <> "" Then
        If MsgBox("Вставить кастом шапку?", vbYesNo) = vbYes Then
            cdlg.Filter = "Кстом шапка |*.txt"
            cdlg.DefaultExt = "txt"
            cdlg.Flags = cdlOFNPathMustExist + cdlOFNHideReadOnly + cdlOFNFileMustExist
            cdlg.ShowOpen
            Dim fn2 As String
            fn2 = cdlg.FileName
            MakeSingleFRForView fn, objObject, , , , , fn2
        Else
            MakeSingleFRForView fn, objObject
        End If
        MsgBox "Завершено!"
    End If

bye:
End Sub

Private Sub mnuMakeFRPhilViews_Click()
On Error GoTo bye
    Dim fn As String
    Dim objObject As objectType
    Dim IDv As String
    Dim Briefv As String
    If Not Manager.GetReferenceDialogEx3("OBJECTTYPE", IDv, Briefv) Then
        Exit Sub
    End If
    IDv = left(IDv, 38)
    Set objObject = MyUser.Application.FindRowObject("OBJECTTYPE", IDv)
    cdlg.CancelError = True
    cdlg.Filter = "Документ FastReport |*.fr3"
    cdlg.DefaultExt = "fr3"
    cdlg.FileName = objObject.Name
    'objObject.Name
    'cdlg.FileName = App.path & "\" & item.ID & ".xml"
    cdlg.Flags = cdlOFNPathMustExist '+ cdlOFNHideReadOnly + cdlOFNFileMustExist
    cdlg.ShowSave
    fn = cdlg.FileName
    If fn <> "" Then
        MakeSingleFRForView fn, objObject, , True
        MsgBox "Завершено!"
    End If

bye:
End Sub

Private Sub mnuMergeObject_Click()
  Dim f As frmMergeObjTool
  Set f = New frmMergeObjTool
  f.Show vbModal
  Unload f
  Set f = Nothing
End Sub

Private Sub mnuMergeRow_Click()
Dim f As frmMergeRowTool
  Set f = New frmMergeRowTool
  f.Show vbModal
  Unload f
  Set f = Nothing
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

Private Sub mnuMSSQL2MTZ_Click()
    Dim f As frmMSSQL2MTZ
    Set f = New frmMSSQL2MTZ
    f.Show vbModal
    Unload f
    Set f = Nothing
End Sub

Private Sub mnuOraclecnv_Click()
ConvertORA
MsgBox "Преобразование завершено"
End Sub

Private Sub mnuPrepareARM_Click()
frmSmartArm.Show vbModal
End Sub

Private Sub mnuRoles_Click()
'Dim rs As ADODB.Recordset
'Dim ID As String
'Set rs = Manager.ListInstances("", "ROLES")
'Set frmRoles.rs = rs
'Set frmRoles.Manager = Manager
'Set frmRoles.Session = Session
'frmRoles.Show

  Set journal = model.Manager.GetInstanceObject("{DB8F8C01-D05A-44B6-B80C-16A6B7AA65D6}")
  
   If Not journal Is Nothing Then
      Manager.LockInstanceObject journal.ID
      
      Set fRole = New frmJournalShow
      Set fRole.jv.journal = journal
      fRole.jv.AllowAdd = True
      fRole.jv.AllowDel = True
      fRole.jv.AllowFilter = False
      
      fRole.Caption = journal.Name
      fRole.Show
      fRole.jv.Refresh
    Else
      'Set frmRoles.Manager = Manager
      'Set frmRoles.Session = Session
      'frmRoles.Show
    End If

End Sub



Private Sub mnuSaveDocs_Click()
frmSaveTool.Show
End Sub

Private Sub mnuSaveFieldTypes_Click()
  Dim f As frmSaveFT
  Set f = New frmSaveFT
  f.Show vbModal
  Unload f
  Set f = Nothing
End Sub

Private Sub mnuSaveMethods_Click()
  Dim f As frmSaveMTD
  Set f = New frmSaveMTD
  f.Show vbModal
  Unload f
  Set f = Nothing
End Sub

Private Sub mnuSecurity_Click()
frmSecurity.Show
End Sub

Private Sub mnuSetupModes_Click()
Dim f As frmSetMode 'Tools
Set f = frmSetMode ' Tools
f.Show 'vbModal

End Sub

Private Sub mnuSetupState_Click()
  frmStateTool.Show
End Sub

Private Sub mnuSignCode_Click()
Dim ot As objectType
Dim i As Long, j As Long
Dim sc As CAPICOM.SignedCode
On Error GoTo bye
Dim Signer As CAPICOM.Signer
Set Signer = New CAPICOM.Signer
Set sc = New CAPICOM.SignedCode

On Error GoTo bye
Dim fn As String

On Error Resume Next

Dim mask As String, OK As Boolean
mask = InputBox("Задать маску", "Ограничить тип документов")

On Error Resume Next
For j = 1 To model.GENPACKAGE.item(1).GENERATOR_TARGET.Count
  If model.GENPACKAGE.item(1).GENERATOR_TARGET.item(j).QueueName = "MTZ_VBQUEUE" Then
  model.objectType.Sort = "Name"
  For i = 1 To model.objectType.Count
    OK = False
    If mask <> "" Then
      If left(UCase(model.objectType.item(i).package.Name), Len(mask)) = UCase(mask) Then
        OK = True
      End If
    Else
      OK = True
    End If
    
    If OK Then
      If model.GENPACKAGE.item(1).GENERATOR_TARGET.item(j).TargetType = TargetType_Prilogenie Then
        Err.Clear
        sc.FileName = App.path & "\" & model.GENPACKAGE.item(1).GENERATOR_TARGET.item(j).Name & "\" & model.objectType.item(i).Name & "\" & model.objectType.item(i).Name & "GUI.ocx"
        sc.Description = model.objectType.item(i).the_comment
        sc.DescriptionURL = "http://3746485.921.ru"
        sc.Sign Signer
        If Err.Number > 0 Then
         MsgBox model.objectType.item(i).the_comment & vbCrLf & sc.FileName & vbCrLf & Err.Description, vbInformation, "Ошибка при подписывании кода"
        End If
        sc.Verify False
        If Err.Number > 0 Then
         MsgBox model.objectType.item(i).the_comment & vbCrLf & sc.FileName & vbCrLf & Err.Description, vbInformation, "Ошибка при подписывании кода"
        End If
      End If
    End If
  Next
  End If
Next
MsgBox "Код подписан"

bye:
  Set Signer = Nothing
  Set sc = Nothing
End Sub

Private Sub mnuSort_Click()
  frmSortFieldOrObj.Show vbModal
End Sub

Private Sub mnuSwitchLang_Click()
Dim pv As Object
Dim IDv As String
Dim Briefv As String

  If Not Manager.GetReferenceDialogEx3("LocalizeInfo", IDv, Briefv) Then
    
        Exit Sub
    End If
    IDv = left(IDv, 38)
  
  
  Set pv = MyUser.Application.FindRowObject("LocalizeInfo", IDv)
  If pv Is Nothing Then Exit Sub
  Session.Language = pv.LangShort
  'Session.GetData ("update the_session set Lang='" + pv.LangShort + "' where the_sessionid='" + Session.sessionid + "'")
  MsgBox "Язык - " + Session.Language
  
End Sub

Private Sub mnuTest_Click()
Dim f As Form1
Set f = New Form1
f.Show vbModal
Set f = Nothing
End Sub

Private Sub mnuTileHor_Click()
Me.Arrange vbTileHorizontal
End Sub

Private Sub mnuTileVert_Click()
Me.Arrange vbTileVertical
End Sub

Private Sub mnuToolLoadDesc_Click()
  Dim f As frmLoadDesc
  Set f = New frmLoadDesc
  f.Show
End Sub

Private Sub mnuToolSaveDesc_Click()
  Dim f As frmSaveDesc
  Set f = New frmSaveDesc
  f.Show
End Sub

Private Sub mnuUniqTool_Click()
  frmUniqueTool.Show vbModal
End Sub

Private Sub mnuUnlockAll_Click()

If MsgBox("Будут отменены все блокировки документов." & vbCrLf & "Разблокировать документы ?", vbYesNo + vbQuestion, "ВНИМАНИЕ") = vbYes Then
    On Error GoTo bye
    Dim v As NamedValues
    Set v = New NamedValues
    Call Session.Exec("AdminUnlockAll", v)
  End If
  Exit Sub
bye:
  MsgBox Err.Description

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


Private Sub mnuViewJournal_Click()
    frmWizard.Show vbModal, Me
    Call JournalByView.ProcessJournal(CreatedView.ID)
End Sub

Private Sub mnuViewWizard_Click()
'ViewBuilder
frmWizard.Show vbModal, Me
End Sub

Private Sub Timer2_Timer()
If inTimer2 Then Exit Sub
inTimer2 = True
On Error Resume Next
'Session.SessionTouch
If Not GetActiveItem() Is Nothing Then
  mnuDocument.Visible = True
Else
  mnuDocument.Visible = False
End If

inTimer2 = False

End Sub



Private Function Notabs(ByVal s As String) As String
  Notabs = Replace(Replace(Replace(Replace(s, vbTab, " "), vbCrLf, " "), vbCr, " "), vbLf, " ")
End Function



Private Sub mnuDictionaries_Click()
  Set frmDicList.model = model
  frmDicList.Show vbModal
  If frmDicList.OK Then
    Dim ot As objectType
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
  If frmDocList.OK Then
    Dim ot As objectType
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
  If frmJouralList.OK Then
    Set journal = model.Manager.GetInstanceObject(frmJouralList.Result)
    Dim f As frmJournalShow2
    Set f = New frmJournalShow2
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
  If frmJouralList.OK Then
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

Private Sub KillTypes(item As MTZMetaModel.mtzApp)
  Dim ot As Object, i As Long
  On Error GoTo bye
tryagain:
  item.Application.objectType.Refresh
  For i = 1 To item.Application.objectType.Count
    Set ot = item.Application.objectType.item(i)
    If ot.package.ID = item.ID Then
      item.Application.objectType.Delete ot.ID
      GoTo tryagain
    End If
  Next
  Exit Sub
bye:
MsgBox Err.Description
End Sub

Private Sub fRole_OnRun(ByVal RowIndex As Long, usedefaut As Boolean, Refesh As Boolean)
usedefaut = False
If MsgBox("Актуализировать описания меню?", vbYesNo) = vbYes Then
  Dim objRole As ROLES.Application
  Set objRole = Manager.GetInstanceObject(fRole.jv.RowInstanceID(fRole.jv.Row))
  Dim objRWP As ROLES_WP
    Dim i As Long
    For i = 1 To objRole.ROLES_WP.Count
        Set objRWP = objRole.ROLES_WP.item(i)
        Dim objWP As MTZwp.Application
        Set objWP = Manager.GetInstanceObject(objRWP.WP.ID)
        If Not objWP Is Nothing Then
            If Not objWP.WorkPlace.item(1) Is Nothing Then
                'If objWP.WorkPlace.item(1).EntryPoints.Count <> objRWP.ROLES_ACT.Count Then
                    ' Загружаем меню
                    LoadMenus objRWP, objWP
                'End If
            End If
  
        End If
    Next
    MsgBox "Описание меню для роли актуализировано по описанию АРМ"
  End If
End Sub


Private Sub LoadLevelEP(objWPEP As MTZwp.EntryPoints_COL, objREP As ROLES.ROLES_ACT_COL)
Dim i As Long
Dim objEP As ROLES.ROLES_ACT
Dim bChanged As Boolean
    bChanged = False
    
    For i = 1 To objWPEP.Count
        objREP.Filter = "EntryPoints='" + objWPEP.item(i).ID + "'"
        objREP.Refresh
    
        If Not objREP.Count > 0 Then
            Set objEP = objREP.Add(CreateGUID2)
            Set objEP.EntryPoints = objWPEP.item(i) '.ID
            objEP.Accesible = YesNo_Da
            objEP.Save
            bChanged = True
        Else
            Set objEP = objREP.item(1)
        End If
        
        If Not objEP Is Nothing Then
            If objWPEP.item(i).EntryPoints.Count > 0 Then
                LoadLevelEP objWPEP.item(i).EntryPoints, objEP.ROLES_ACT
            End If
        End If
    Next
    
    objREP.Filter = ""
    objREP.Refresh
    For i = objREP.Count To 1 Step -1
        If objREP.item(i).EntryPoints Is Nothing Then
            objREP.item(i).Delete
            bChanged = True
        ElseIf objWPEP.item(objREP.item(i).EntryPoints.ID) Is Nothing Then
            objREP.item(i).Delete
            bChanged = True
        End If
    Next
    If bChanged Then
        objREP.Application.Save
        objREP.Application.BatchUpdate
    End If
    
End Sub

Private Sub LoadMenus(objRWP As ROLES.ROLES_WP, objWP As MTZwp.Application)
Dim i As Long
Dim objEP As ROLES.ROLES_ACT
Dim objWP2 As MTZwp.Application
Dim bChanged As Boolean
    bChanged = False
    LoadLevelEP objWP.EntryPoints, objRWP.ROLES_ACT

End Sub
