VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Begin VB.Form frmGenerator 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Генератор метакода"
   ClientHeight    =   8325
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   9630
   Icon            =   "frmGenerator.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8325
   ScaleWidth      =   9630
   Begin VB.CommandButton cmdGen 
      Caption         =   "Генерация"
      Height          =   315
      Left            =   6480
      TabIndex        =   3
      Top             =   120
      Width           =   1095
   End
   Begin VB.CommandButton cmdSettingQ 
      Caption         =   "Настройка очередей"
      Height          =   315
      Left            =   4560
      TabIndex        =   22
      Top             =   120
      Width           =   1935
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Только коды объектов"
      Height          =   255
      Left            =   7200
      TabIndex        =   21
      Top             =   960
      Width           =   2265
   End
   Begin VB.TextBox txtPath 
      Height          =   285
      Left            =   1440
      Locked          =   -1  'True
      TabIndex        =   6
      Top             =   600
      Width           =   7725
   End
   Begin VB.CommandButton cmdRootFolder 
      Caption         =   "..."
      Height          =   315
      Left            =   9240
      TabIndex        =   7
      Top             =   600
      Width           =   315
   End
   Begin VB.CommandButton cmdNormNames 
      Caption         =   "Испр. имена"
      Height          =   315
      Left            =   1800
      TabIndex        =   1
      ToolTipText     =   "исправить имена разделов и полей. "
      Top             =   120
      Width           =   1695
   End
   Begin VB.CommandButton cmdGenSetup 
      Caption         =   "Настройка генератора"
      Height          =   315
      Left            =   0
      TabIndex        =   12
      Top             =   5520
      Width           =   4125
   End
   Begin VB.CommandButton cmdDoc 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Документация"
      Height          =   315
      Left            =   7920
      TabIndex        =   4
      Top             =   120
      Width           =   1575
   End
   Begin VB.CommandButton cmdCheckModel 
      Caption         =   "Проверить модель"
      Height          =   315
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1695
   End
   Begin MSComDlg.CommonDialog cdlg 
      Left            =   3000
      Top             =   6960
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin RichTextLib.RichTextBox txtLog 
      Height          =   1455
      Left            =   0
      TabIndex        =   19
      Top             =   6840
      Width           =   9585
      _ExtentX        =   16907
      _ExtentY        =   2566
      _Version        =   393217
      BackColor       =   -2147483648
      Enabled         =   -1  'True
      ReadOnly        =   -1  'True
      ScrollBars      =   2
      TextRTF         =   $"frmGenerator.frx":0442
   End
   Begin MSComctlLib.ProgressBar pb 
      Height          =   255
      Left            =   0
      TabIndex        =   15
      Top             =   6120
      Visible         =   0   'False
      Width           =   9525
      _ExtentX        =   16801
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.CommandButton cmdClearAll 
      Caption         =   "Отменить"
      Height          =   315
      Left            =   7080
      TabIndex        =   14
      Top             =   5520
      Width           =   2415
   End
   Begin VB.CommandButton cmdSelAll 
      Caption         =   "Выбрать все"
      Height          =   315
      Left            =   4440
      TabIndex        =   13
      Top             =   5520
      Width           =   2415
   End
   Begin VB.ListBox lstTypes 
      Height          =   4125
      IntegralHeight  =   0   'False
      Left            =   4200
      Sorted          =   -1  'True
      Style           =   1  'Checkbox
      TabIndex        =   11
      Top             =   1320
      Width           =   5385
   End
   Begin MSComctlLib.TreeView tvTarget 
      Height          =   4125
      Left            =   0
      TabIndex        =   9
      Top             =   1320
      Width           =   4095
      _ExtentX        =   7223
      _ExtentY        =   7276
      _Version        =   393217
      Indentation     =   176
      LabelEdit       =   1
      LineStyle       =   1
      Sorted          =   -1  'True
      Style           =   7
      Checkboxes      =   -1  'True
      Appearance      =   1
   End
   Begin VB.CommandButton cmdClearLog 
      Caption         =   "Очистить журнал"
      Height          =   315
      Left            =   7440
      TabIndex        =   18
      Top             =   6480
      Width           =   2175
   End
   Begin VB.CommandButton cmdFindErr 
      Caption         =   "Следующая ошибка"
      Height          =   315
      Left            =   5160
      TabIndex        =   17
      Top             =   6480
      Width           =   2175
   End
   Begin VB.CommandButton cmdClearQ 
      Caption         =   "Очистить очереди"
      Height          =   315
      Left            =   2040
      TabIndex        =   2
      Top             =   960
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.Label Label5 
      Caption         =   "Корневая папка"
      Height          =   255
      Left            =   0
      TabIndex        =   5
      Top             =   600
      Width           =   1335
   End
   Begin VB.Label Label4 
      Caption         =   "Типы документов"
      Height          =   255
      Left            =   4200
      TabIndex        =   10
      Top             =   1080
      Width           =   1515
   End
   Begin VB.Label Label2 
      Caption         =   "Генераторы"
      Height          =   255
      Left            =   0
      TabIndex        =   8
      Top             =   1080
      Width           =   1335
   End
   Begin VB.Label Label1 
      Caption         =   "Процесс генерации"
      Height          =   255
      Left            =   0
      TabIndex        =   20
      Top             =   5880
      Visible         =   0   'False
      Width           =   1695
   End
   Begin VB.Label Label3 
      Caption         =   "Журнал"
      Height          =   255
      Left            =   0
      TabIndex        =   16
      Top             =   6600
      Width           =   1575
   End
End
Attribute VB_Name = "frmGenerator"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public WithEvents gen As MTZGenerator.Response
Attribute gen.VB_VarHelpID = -1
Public tid As String
Dim Host As MSScriptControl.ScriptControl
Dim WithEvents wh As WordHelper
Attribute wh.VB_VarHelpID = -1
Dim pbStart As Long
Dim DocShort As Boolean
Dim IncludeProcsToDoc  As Boolean
Dim IncludeStateToDoc  As Boolean
Dim IncludeModeToDoc  As Boolean


Private Declare Function CharToOem Lib "user32" Alias "CharToOemA" (ByVal lpszSrc As String, ByVal lpszDst As String) As Long
Const frmCaption As String = "Генератор метакода "
 
  
Private Sub Log(s As String)
  If txtLog <> "" Then txtLog.Text = txtLog.Text & vbCrLf
  txtLog.Text = txtLog.Text & s
End Sub
  
Private Sub Check1_Click()
  Call loadTypes(Check1.Value)
End Sub

Private Sub cmdCheckModel_Click()
  txtLog = ""
  LoadWords
  Dim j As Long
  pb.min = 0
  pb.max = lstTypes.SelCount
  pb.Value = 0
  pb.Visible = True
  For j = 0 To lstTypes.ListCount - 1
    If lstTypes.Selected(j) Then
      On Error GoTo next_one
      Log "Тип документа: " & model.objectType.item(lstTypes.ItemData(j)).the_comment
      VerifyType model.objectType.item(lstTypes.ItemData(j))
      pb.Value = pb.Value + 1
    End If
    GoTo cont
next_one:
  Resume cont
cont:
  Next
  pb.Visible = False
  MsgBox "Проверка завершена!" & vbCrLf & "Сморти результаты в журнале.", vbInformation + vbOKOnly, "Проверка модели"
End Sub

Private Sub cmdClearAll_Click()
Dim i As Long
For i = 0 To lstTypes.ListCount - 1
    lstTypes.Selected(i) = False
Next
End Sub

Private Sub cmdClearLog_Click()
txtLog = ""
End Sub


Private Sub cmdClearQ_Click()
Dim i As Long
Dim t As GENERATOR_TARGET

For i = 1 To tvTarget.Nodes.Count
    If tvTarget.Nodes.item(i).Tag = "TARGET" And tvTarget.Nodes.item(i).Checked Then
      Set t = model.FindRowObject("GENERATOR_TARGET", tvTarget.Nodes.item(i).Key)
      If t.QueueName <> "" Then
        On Error Resume Next
        DeleteSetting t.QueueName
      End If
    End If
  Next

End Sub

Private Sub cmdDoc_Click()
  Dim fn As String
  cdlg.Filter = "Документ|*.doc"
  cdlg.DefaultExt = "doc"
  cdlg.FileName = GetSetting(App.Title, "Recent", "LastWord", "")
  cdlg.ShowOpen
  fn = cdlg.FileName
  Set wh = New WordHelper
  wh.MakeDocument (fn)

End Sub

Private Sub cmdFindErr_Click()
Dim fres As Long

fres = txtLog.Find("ERROR-->", txtLog.SelStart)
If fres >= 0 Then
  txtLog.SelStart = fres + 5
Else
  MsgBox "Ошибок не обнаружено", vbOKOnly
  txtLog.SelStart = 0
End If
End Sub

Private Function W2OEM(ByVal s As String) As String
  Dim es As String
  es = Space(Len(s))
  Call CharToOem(s, es)
  W2OEM = es
End Function

Private Sub cmdGen_Click()
  On Error Resume Next
  Dim t As GENERATOR_TARGET
  Dim i As Long, j As Long
  
  ' обработка пустого списка генераторов
  Dim b As Boolean
  b = True
  For i = 1 To tvTarget.Nodes.Count
    If tvTarget.Nodes.item(i).Tag = "TARGET" And tvTarget.Nodes.item(i).Checked Then b = False
  Next
  If b Then
    MsgBox "Не выбраны генераторы!!!", vbCritical + vbOKOnly, "Адмнистратор"
    Exit Sub
  End If
  
  ' обработка списка типов объектов
  b = True
  For j = 0 To lstTypes.ListCount - 1
    If lstTypes.Selected(j) Then b = False
  Next
  If b Then
    MsgBox "Не выбраны модели!!!", vbCritical + vbOKOnly, "Адмнистратор"
    Exit Sub
  End If
  
  ' обработка очищения очереди '
  ' 1 || 11 - no
  ' 2 || 12 - list
  ' 3 || 13 - VB
  ' GetSetting(App.EXEName, "config", "Query", 2)
  j = GetSetting(App.EXEName, "config", "Query", 2)
  If j > 10 Then j = j - 10
  Select Case j
    Case 2 ' очистить согласно списку генераторов
      For i = 1 To tvTarget.Nodes.Count
        If tvTarget.Nodes.item(i).Tag = "TARGET" And tvTarget.Nodes.item(i).Checked Then
          Set t = model.FindRowObject("GENERATOR_TARGET", tvTarget.Nodes.item(i).Key)
          If t.QueueName <> "" Then DeleteSetting t.QueueName
        End If
      Next
    Case 3 ' очистить только "MTZ_VBQUEUE"
      DeleteSetting "MTZ_VBQUEUE"
  End Select

  ' генерация XML
  txtLog.Text = ""
  
  On Error GoTo bye
  Dim o As Object
  Dim cnt As Long
  Dim xmlFile As String, prjPath As String, DONE As Boolean
'  Exit Sub
  cnt = 0
  For i = 1 To tvTarget.Nodes.Count
    If tvTarget.Nodes.item(i).Tag = "TARGET" And tvTarget.Nodes.item(i).Checked Then
      Set t = model.FindRowObject("GENERATOR_TARGET", tvTarget.Nodes.item(i).Key)
      If t.GeneratorStyle = GeneratorStyle_Odin_tip Then
        cnt = cnt + lstTypes.SelCount
      Else
        cnt = cnt + lstTypes.ListCount
      End If
    End If
  Next
  
  Dim sComp As String
  sComp = "del err.txt " & vbCrLf
  Dim n As Long, s As String, s1 As String, ss As String
  ss = "call makevbp.cmd """ & txtpath & "\"
  
  If cnt = 0 Then cnt = 1
  pb.min = 0
  pb.max = cnt
  pb.Value = 0
  pb.Visible = True
  Label1.Visible = True
  DoEvents
  
  For i = 1 To tvTarget.Nodes.Count
    If tvTarget.Nodes.item(i).Tag = "TARGET" And tvTarget.Nodes.item(i).Checked Then
      Set t = model.FindRowObject("GENERATOR_TARGET", tvTarget.Nodes.item(i).Key)
      tid = t.ID
      If t.GeneratorProgID <> "" Then
        If t.GeneratorStyle = GeneratorStyle_Odin_tip Then
          For j = 0 To lstTypes.ListCount - 1
            If lstTypes.Selected(j) Then
              On Error GoTo next_one
              Set gen = New MTZGenerator.Response
              Log "Create object " & t.GeneratorProgID
              Set o = CreateObject(t.GeneratorProgID)
              Log "call Run method"
              Log o.Run(model, gen, tid, model.objectType.item(lstTypes.ItemData(j)).ID)
              Set o = Nothing
              Log "Save file"
              txtLog.SelStart = 0
              On Error Resume Next
              
              MkDir txtpath
              MkDir txtpath & model.objectType.item(lstTypes.ItemData(j)).package.Name & "\"
              MkDir txtpath & model.objectType.item(lstTypes.ItemData(j)).package.Name & "\" & t.Name
              
              gen.Save txtpath & model.objectType.item(lstTypes.ItemData(j)).package.Name & "\" & t.Name & "\" & model.objectType.item(lstTypes.ItemData(j)).Name & ".xml"
              MkDir txtpath & model.objectType.item(lstTypes.ItemData(j)).package.Name & "\" & t.Name & "\" & model.objectType.item(lstTypes.ItemData(j)).Name
              
              If t.Name = "VB Model" Or t.Name = "VB Interface" Then
                n = lstTypes.ItemData(j)
                s = model.objectType.item(n).Name
                s1 = W2OEM(model.objectType.item(n).package.Name)
                sComp = sComp & ss & s1 & "\" & t.Name & "\" & s & "\" & s
                If t.Name = "VB Model" Then sComp = sComp & ".vbp"
                If t.Name = "VB Interface" Then sComp = sComp & "GUI.vbp"
                sComp = sComp & """" & vbCrLf
              End If
              
              pb.Value = pb.Value + 1
              DoEvents
              
              If t.QueueName <> "" Then
                  Log "Add project to queque"
                  cnt = GetSetting(t.QueueName, "ToDo", "Count", 0)
                  cnt = cnt + 1
                  Call SaveSetting(t.QueueName, "ToDo", "Count", cnt)
                  SaveSetting t.QueueName, "ToDo", "DONE" & cnt, False
                  Call SaveSetting(t.QueueName, "ToDo", "XML" & cnt, txtpath & model.objectType.item(lstTypes.ItemData(j)).package.Name & "\" & t.Name & "\" & model.objectType.item(lstTypes.ItemData(j)).Name & ".xml")
                  On Error GoTo bye
                  Call SaveSetting(t.QueueName, "ToDo", "PATH" & cnt, txtpath & model.objectType.item(lstTypes.ItemData(j)).package.Name & "\" & t.Name & "\" & model.objectType.item(lstTypes.ItemData(j)).Name)
                  
              End If
            End If
            GoTo continue
next_one:
            Resume continue
            Log Err.Description
continue:
          Set gen = Nothing
          Next
        End If
        
        If t.GeneratorStyle = GeneratorStyle_Vse_tipi_srazu Then
          On Error GoTo next_gen
          pbStart = pb.Value
          Set gen = New MTZGenerator.Response
          Log "Create object " & t.GeneratorProgID
          Set o = CreateObject(t.GeneratorProgID)
          Log "call Run method"
          Log o.Run(model, gen, tid)
          Set o = Nothing
          Log "Save file"
          txtLog.SelStart = 0
          
          On Error Resume Next
          MkDir txtpath & t.Name
          gen.Save txtpath & t.Name & "\all.xml"
             
          pb.Value = pb.Value + lstTypes.SelCount
          DoEvents
          
          If t.QueueName <> "" Then
              Log "Add project to queque"
              cnt = GetSetting(t.QueueName, "ToDo", "Count", 0)
              cnt = cnt + 1
              Call SaveSetting(t.QueueName, "ToDo", "Count", cnt)
              SaveSetting t.QueueName, "ToDo", "DONE" & cnt, False
              Call SaveSetting(t.QueueName, "ToDo", "XML" & cnt, txtpath & t.Name & "\all.xml")
              On Error GoTo bye
              Call SaveSetting(t.QueueName, "ToDo", "PATH" & cnt, txtpath & t.Name)
          End If
          GoTo cont2
next_gen:
          Resume cont2
cont2:
          Set gen = Nothing
        End If
        
      End If ' progid <>""
    End If ' target
  Next
  pb.Visible = False
  Label1.Visible = False
  
  ' сохранение файла пакетной компиляции
  If Len(sComp) > 20 And (GetSetting(App.EXEName, "config", "Query", 2) > 10) Then savePackGen (sComp)
  
  Set t = Nothing
  MsgBox "Создание метакода завершено!", vbExclamation
  Set gen = Nothing
  Exit Sub
  
bye:
  MsgBox Err.Description, vbCritical
  pb.Visible = False
  Label1.Visible = False
  Log Err.Description
  Set gen = Nothing

End Sub

Private Sub savePackGen(s As String)
  On Error GoTo bye
  Dim intFile As Integer
  intFile = FreeFile

  Dim fn As String
  cdlg.CancelError = True
  cdlg.Filter = "Файл пакета|*.cmd"
  cdlg.DefaultExt = "cmd"
  cdlg.FileName = ""
  cdlg.ShowSave
  fn = cdlg.FileName

  Open fn For Output As #intFile
  Print #intFile, s
  Close #intFile
bye:
End Sub

Private Sub cmdGenSetup_Click()
  tvTarget_DblClick
End Sub

Private Sub cmdNormNames_Click()
 txtLog = ""
  LoadWords
  Dim j As Long
  pb.min = 0
  pb.max = lstTypes.SelCount
  pb.Value = 0
  pb.Visible = True
  For j = 0 To lstTypes.ListCount - 1
    If lstTypes.Selected(j) Then
      On Error GoTo next_one
      Log "Тип документа: " & model.objectType.item(lstTypes.ItemData(j)).the_comment
      RenType model.objectType.item(lstTypes.ItemData(j))
      pb.Value = pb.Value + 1
    End If
    GoTo cont
next_one:
  Resume cont
cont:
  Next
  pb.Visible = False
End Sub

Private Sub cmdRootFolder_Click()
  Dim path As String
  path = GetPath("Корневой каталог для генерации мтакода", Me.hwnd)
  
  If (path <> vbNullString) Then
    txtpath.Text = path
    SaveSetting App.EXEName, "config", "rootpath", path
  End If
End Sub

Private Sub cmdSelAll_Click()
Dim i As Long
For i = 0 To lstTypes.ListCount - 1
    lstTypes.Selected(i) = True
Next
End Sub

Private Sub cmdSettingQ_Click()
  frmSettingGen.Q = GetSetting(App.EXEName, "config", "Query", 2)
  frmSettingGen.Show vbModal
  SaveSetting App.EXEName, "config", "Query", CStr(frmSettingGen.Q)
End Sub

Private Sub Form_Load()
  Dim t As GENERATOR_TARGET, i, j
  txtpath.Text = GetSetting(App.EXEName, "config", "rootpath", App.path)
  If Right(txtpath.Text, 1) <> "\" Then
    txtpath.Text = txtpath.Text & "\"
  End If
  Dim n As Node
  tvTarget.Nodes.Clear
  For i = 1 To model.GENPACKAGE.Count    '
    Set n = tvTarget.Nodes.Add(, , model.GENPACKAGE.item(i).ID, model.GENPACKAGE.item(i).Name)
    n.Tag = "PACKAGE"
    For j = 1 To model.GENPACKAGE.item(i).GENERATOR_TARGET.Count
      If model.GENPACKAGE.item(i).GENERATOR_TARGET.item(j).TargetType <> TargetType_ARM Then
        tvTarget.Nodes.Add(n.Key, tvwChild, model.GENPACKAGE.item(i).GENERATOR_TARGET.item(j).ID, model.GENPACKAGE.item(i).GENERATOR_TARGET.item(j).Name).Tag = "TARGET"
      End If
    Next
  Next
  
  Call loadTypes(False)
End Sub

Private Sub loadTypes(ObjOnly As Boolean)
  lstTypes.Clear
  If (ObjOnly) Then
    model.objectType.Sort = "Name"
  Else
    model.objectType.Sort = "Comment"
  End If
  Dim i As Long
  For i = 1 To model.objectType.Count
    With model.objectType.item(i)
      If (ObjOnly) Then
        lstTypes.AddItem .Name & " (" & .package.Name & "->" & .the_comment & ")"
      Else
        lstTypes.AddItem .package.Name & "->" & .the_comment
      End If
      lstTypes.ItemData(lstTypes.NewIndex) = i
    End With
  Next
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Set gen = Nothing
End Sub

Private Sub mnuExit_Click()
  Unload frmLogin
  Unload Me
End Sub

Private Sub VerifyType(ot As MTZMetaModel.objectType)
  Dim p As PART
  If ot.PART.Count = 0 Then
    Log "  ERROR-->не определен ни один раздел"
  End If
  
  If Not IsValidFieldName2(ot.Name) Then
    Log "  ERROR-->Имя типа " & ot.Name & " является ключевым словом, или имеет неверный формат"
  End If
  
   
  Dim i As Long, j As Long, dcnt As Integer
  dcnt = 0
  For i = 1 To ot.OBJECTMODE.Count
    If ot.OBJECTMODE.item(i).DefaultMode = Boolean_Da Then
      dcnt = dcnt + 1
    End If
    For j = 1 To ot.OBJECTMODE.item(i).FIELDRESTRICTION.Count
      If ot.OBJECTMODE.item(i).FIELDRESTRICTION.item(j).TheField Is Nothing Then
            Log "  ERROR-->Тип: " & ot.Name & " Режим:" & ot.OBJECTMODE.item(i).Name & "  в ограничении по полям не задано поле."
      End If
      If ot.OBJECTMODE.item(i).FIELDRESTRICTION.item(j).ThePart Is Nothing Then
            Log "  ERROR-->Тип: " & ot.Name & " Режим:" & ot.OBJECTMODE.item(i).Name & "  в ограничении по полям не задан раздел."
      End If
    Next
    
    For j = 1 To ot.OBJECTMODE.item(i).STRUCTRESTRICTION.Count
      If ot.OBJECTMODE.item(i).STRUCTRESTRICTION.item(j).struct Is Nothing Then
            Log "  ERROR-->Тип: " & ot.Name & " Режим:" & ot.OBJECTMODE.item(i).Name & "  в ограничении по разделам не задан раздел."
      End If
    Next
    
    For j = 1 To ot.OBJECTMODE.item(i).METHODRESTRICTION.Count
      If ot.OBJECTMODE.item(i).METHODRESTRICTION.item(j).Method Is Nothing Then
            Log "  ERROR-->Тип: " & ot.Name & " Режим:" & ot.OBJECTMODE.item(i).Name & "  в ограничении по методам не задан метод."
      End If
    Next
  Next
  
  If dcnt > 1 Then
          Log "  ERROR-->Тип: " & ot.Name & "  более одного режима помечены как режимы по умолчанию."
  End If
  
  dcnt = 0
  For i = 1 To ot.OBJSTATUS.Count
    If ot.OBJSTATUS.item(i).isStartup = Boolean_Da Then
      dcnt = dcnt + 1
    End If
  Next
  
  If ot.OBJSTATUS.Count > 0 Then
    If dcnt > 1 Then
          Log "  ERROR-->Тип: " & ot.Name & "  более одного состояния помечены как начальные."
    End If
    If dcnt = 0 Then
          Log "  ERROR-->Тип: " & ot.Name & "  ни одно состояние не помечено как начальное."
    End If
  End If
 
  ' проверяем  разделы
  For i = 1 To ot.PART.Count
    VerifyPart ot.PART.item(i)
  Next
  
  ' проверяем режимы работы
  
End Sub

Private Sub RenType(ot As MTZMetaModel.objectType)
  Dim p As PART
  
  
  
  If ot.Name <> VF(ot.Name) Then
    ot.Name = VF(ot.Name)
    ot.Save
  End If
  Dim i As Long
  ' проверяем  разделы
  For i = 1 To ot.PART.Count
    RenPart ot.PART.item(i)
  Next
  
  ' проверяем режимы работы
  
End Sub

Private Sub VerifyPart(p As PART)
  Dim fld As MTZMetaModel.Field
  Log "  Раздел: " & p.Caption
  If p.Field.Count = 0 And p.PartType <> PartType_Rassirenie Then
    Log "    ERROR-->не определено ни одного поля"
  End If
  
  If Not IsValidFieldName2(p.Name) Then
    Log "  ERROR-->Имя раздела " & p.Name & " является ключевым словом, или имеет неверный формат"
  End If
  
  Dim i As Long, j As Long
  Dim BriefCnt As Integer
  
  BriefCnt = 0
  
  ' проверяем поля
  For i = 1 To p.Field.Count
    VerifyField p.Field.item(i)
    If p.Field.item(i).IsBrief = Boolean_Da Then BriefCnt = BriefCnt + 1
  Next
  
  If BriefCnt = 0 And p.PartType <> PartType_Rassirenie Then
    Log "    ERROR-->не определены поля для краткого отображения"
  End If
  
  Dim uc As UNIQUECONSTRAINT
  Dim ft As MTZMetaModel.FIELDTYPE
  
  ' проверяем описания ограничений
  For i = 1 To p.UNIQUECONSTRAINT.Count
    Set uc = p.UNIQUECONSTRAINT.item(i)
    For j = 1 To uc.CONSTRAINTFIELD.Count
      Set fld = uc.CONSTRAINTFIELD.item(i).TheField
      If fld Is Nothing Then
        Log "    ERROR-->ошибка в определении уникального ограничения"
        Log "    поле  указывает на отсутствующий компонент"
      Else
        If fld.Parent.Parent.ID <> p.ID Then
          Log "    ERROR-->ошибка в определении уникального ограничения"
          Log "    поле " & fld.Caption & " не  пренадлежит данному разделу"
        End If
        Set ft = fld.FIELDTYPE
        
        If ft.Name = "Memo" Then
          Log "    ERROR-->ошибка в определении уникального ограничения"
          Log "    поле " & fld.Caption & " является BLOB полем"
        End If
        If ft.Name = "Image" Then
          Log "    ERROR-->ошибка в определении уникального ограничения"
          Log "    поле " & fld.Caption & " является BLOB полем"
        End If
        If ft.Name = "File" Then
          Log "    ERROR-->ошибка в определении уникального ограничения"
          Log "    поле " & fld.Caption & " является BLOB полем"
        End If
      End If
    Next
  Next
  
  ' проверяем view
 Dim v As PARTVIEW

  For i = 1 To p.PARTVIEW.Count
      Set v = p.PARTVIEW.item(i)
      VerifyView v, p
  Next
 
  
  ' проверяем зависимые разделы
  For i = 1 To p.PART.Count
    VerifyPart p.PART.item(i)
  Next
End Sub


Private Sub RenPart(p As PART)
  Dim fld As MTZMetaModel.Field
  
  If p.Name <> VF(p.Name) Then
    p.Name = VF(p.Name)
    p.Save
  End If
  
  Dim i As Long, j As Long
  Dim BriefCnt As Integer
  
  BriefCnt = 0
  
  ' проверяем поля
  For i = 1 To p.Field.Count
    RenField p.Field.item(i)
    
  Next
  
  
  ' проверяем view
 Dim v As PARTVIEW

  For i = 1 To p.PARTVIEW.Count
      Set v = p.PARTVIEW.item(i)
      RenView v, p
  Next
  
  ' проверяем зависимые разделы
  For i = 1 To p.PART.Count
      RenPart p.PART.item(i)
  Next
End Sub

Private Sub VerifyView(v As PARTVIEW, p As MTZMetaModel.PART)
  Dim vc As ViewColumn
  Dim i As Long
  Log "  View: " & v.Name & "(" & v.the_Alias & ")"
  If v.Name = "" Then
      Log "  ERROR-->Не определено имя "
  End If
  If v.the_Alias = "" Then
      Log "  ERROR-->Не определен псевдоним "
  End If
  
  For i = 1 To v.ViewColumn.Count
    Set vc = v.ViewColumn.item(i)
    If vc.FromPart Is Nothing Then
     Log "  ERROR-->Для колонки " & vc.Name & "(" & vc.the_Alias & ") не определен раздел - источник"
    End If
    If vc.Field Is Nothing Then
      Log "  ERROR-->Для колонки " & vc.Name & "(" & vc.the_Alias & ") не определено поле - источник"
    'ElseIf vc.Field.Parent.Parent.ID <> p.ID Then
    '  Log "  ERROR-->Для колонки " & vc.Name & "(" & vc.the_Alias & ") поле - источник"
    End If
    
  Next
  
End Sub


Private Sub RenView(v As PARTVIEW, p As MTZMetaModel.PART)
  Dim vc As ViewColumn
  Dim i As Long
  
  If v.the_Alias <> VF(v.the_Alias) Then
    v.the_Alias = VF(v.the_Alias)
    v.Save
  End If
  
  For i = 1 To v.ViewColumn.Count
    Set vc = v.ViewColumn.item(i)
    If vc.the_Alias <> VF(vc.the_Alias) Then
      vc.the_Alias = VF(vc.the_Alias)
      vc.Save
    End If
  Next
  
End Sub

Private Sub VerifyField(f As MTZMetaModel.Field)
  Dim ft As MTZMetaModel.FIELDTYPE
  Set ft = f.FIELDTYPE
  If f.Name = "" Then
    Log "  ERROR-->Для поля #" & f.sequence & "  не определено имя "
  End If
  If f.Caption = "" Then
    Log "  ERROR-->Для поля " & f.Name & "  не определен заголовок "
  End If
  
  If ft Is Nothing Then
    Log "  ERROR-->Для поля " & f.Name & " не определен тип"
  End If
  If f.IsBrief And UCase(f.FIELDTYPE.Name) = "FILE" Then
    Log "  ERROR-->Поля " & f.Name & " предназначено для хранения файлов. Не может быть отображением."
  End If
  
  
  If Not IsValidFieldName2(f.Name) Then
    Log "  ERROR-->Имя поля " & f.Name & " является ключевым словом, или имеет неверный формат"
  End If
  
  
  If ft.TypeStyle = TypeStyle_Ssilka Then
    If f.ReferenceType = ReferenceType_Skalyrnoe_pole_OPN_ne_ssilkaCLS Then
      Log "    Поле: " & f.Caption
      Log "      ERROR-->Ошибка в определении поля ссылочный тип не сочетается с трактовкой: скалярное поле"
    End If
    
    If f.ReferenceType = ReferenceType_Na_stroku_razdela Then
      If f.RefToPart Is Nothing Then
        Log "    Поле: " & f.Caption
        Log "      ERROR-->Не определен раздел  - источник данных для поля"
      End If
    End If
  End If
  
  If ft.AllowSize Then
    If f.DataSize = 0 Then
        Log "    Поле: " & f.Caption
        Log "      ERROR-->Тип данных требует задания размера"
    End If
  End If
  
  VerifyFieldType f, ft
End Sub

Private Sub RenField(f As MTZMetaModel.Field)
  If f.Name <> VF(f.Name) Then
    f.Name = VF(f.Name)
    f.Save
  End If
End Sub



Private Sub VerifyFieldType(f As MTZMetaModel.Field, ft As MTZMetaModel.FIELDTYPE)
  If ft.TypeStyle = TypeStyle_Viragenie Then
        Log "    Поле: " & f.Caption
        Log "      Тип данных: " & ft.Name
        Log "         ERROR-->ВЫРАЖЕНИЯ пока не поддерживаются"
  End If

  If ft.TypeStyle = TypeStyle_Interval Then
    If ft.Minimum >= ft.Maximum Then
        Log "    Поле: " & f.Caption
        Log "      Тип данных: " & ft.Name
        Log "        ERROR-->неверно определены границы интервала"
    End If
  End If

  If ft.TypeStyle = TypeStyle_Perecislenie Then
    If ft.ENUMITEM.Count = 0 Then
        Log "    Поле: " & f.Caption
        Log "      Тип данных: " & ft.Name
        Log "        ERROR-->не определены значения для перечисления"
    End If
  End If
  
  
   If ft.TypeStyle <> TypeStyle_Element_oformleniy Then
     If ft.FIELDTYPEMAP.Count < 3 Then
        Log "  Поле: " & f.Caption
        Log "    Тип данных: " & ft.Name
        Log "      ERROR-->не определено отображение типа данных для генераторов "
    End If
  End If


End Sub


Private Sub mnuWordDoc_Click()
End Sub





Private Sub gen_OnStatus(s As String, progress As Long)
  On Error Resume Next
  pb.Value = pbStart + progress
  Log s
End Sub

Private Sub tvTarget_DblClick()
' Setup
On Error GoTo bye
  Dim t As GENERATOR_TARGET
  Dim o As Object
  
    If tvTarget.SelectedItem.Tag = "TARGET" Then
      Set t = model.FindRowObject("GENERATOR_TARGET", tvTarget.SelectedItem.Key)
      tid = t.ID
      If t.GeneratorProgID <> "" Then
              Set gen = New MTZGenerator.Response
              Set o = CreateObject(t.GeneratorProgID)
              Log "call Setup method"
              Log o.Setup
              Set o = Nothing
      End If
    End If
  Exit Sub
  
bye:
  MsgBox Err.Description, vbCritical
  Log Err.Description



End Sub



' делаем документ
Private Sub wh_MakeContent()
On Error GoTo bye
  Dim j As Long
  Dim cnt As Long
  
  cnt = 0
  cnt = lstTypes.SelCount
  If cnt = 0 Then Exit Sub
  pb.min = 0
  pb.max = cnt + 1
  pb.Value = 0
  pb.Visible = True
  Label1.Visible = True
  DoEvents
  IncludeProcsToDoc = False
  
  If MsgBox("Включить описания типов документов?", vbYesNo, "Документация") = vbYes Then
    If MsgBox("Только краткое описание?", vbYesNo, "Документация") = vbYes Then
      DocShort = True
    Else
      DocShort = False
    End If
    
    If MsgBox("Включить описания процедур?", vbYesNo, "Документация") = vbYes Then
     IncludeProcsToDoc = True
    End If
    
    If MsgBox("Включить описания состояний?", vbYesNo, "Документация") = vbYes Then
     IncludeStateToDoc = True
    End If
    
    
    If MsgBox("Включить описания режимов?", vbYesNo, "Документация") = vbYes Then
     IncludeModeToDoc = True
    End If
    
    
    For j = 0 To lstTypes.ListCount - 1
      If lstTypes.Selected(j) Then
      
       ' describe object types
        ObjectTypeToWord model.objectType.item(lstTypes.ItemData(j))
        pb.Value = pb.Value + 1
      End If
    Next
  Else
    pb.Value = pb.Value + lstTypes.ListCount
  End If
  
  If MsgBox("Включить описания типов полей?", vbYesNo, "Документация") = vbYes Then
    ' describe fieldtypes
    FieldTypeToWord
  End If
  pb.Value = pb.Value + 1
  
  
  
  ' Вставляем описания процедур
  
   
   If IncludeProcsToDoc Then
   
    wh.OutStr "Стандартные процедуры документа"
    wh.Header
    
    wh.OutStr "Функция вычисления краткого наименования документа"
    wh.Bold
    wh.OutStr "function instance_BRIEF_F  (" & vbCrLf & _
    "@InstanceID uniqueidentifier          /* Идентификатор объекта */" & vbCrLf & _
    ",@Lang varchar(25)=NULL               /* язык */" & vbCrLf & _
    ")returns varchar(4000)" & vbCrLf
    wh.OutStr "Возвращаемый результат - краткое наименование документа" & vbCrLf & vbCrLf
    
    wh.OutStr "Процедура вычисления краткого наименования документа"
    wh.Bold
    wh.OutStr "proc instance_BRIEF  (" & vbCrLf & _
    "@CURSESSION uniqueidentifier          /* Идентификатор Текущей сессии */," & vbCrLf & _
    "@InstanceID uniqueidentifier          /* Идентификатор объекта */," & vbCrLf & _
    "@BRIEF varchar(4000) output           /* Краткое наименование документа */" & vbCrLf & _
    ")" & vbCrLf
    wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    
    wh.OutStr "Процедура удаления документа"
    wh.Bold
    wh.OutStr "proc Instance_DELETE (" & vbCrLf & _
    "@CURSESSION uniqueidentifier uniqueidentifier /*Идентификатор Текущей сессии*/," & vbCrLf & _
    "@InstanceID uniqueidentifier                  /* Идентификатор объекта */)" & vbCrLf
    wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    wh.OutStr "Процедура проверки состояния блокировки дочерних строк"
    wh.Bold
    wh.OutStr "proc Instance_HCL (" & vbCrLf & _
    "@CURSESSION uniqueidentifier uniqueidentifier /* Идентификатор Текущей сессии*/," & vbCrLf & _
    "@RowID uniqueidentifier                       /* идентификатор документа */," & vbCrLf & _
    "@IsLocked int out                             /* результат блокировки */" & vbCrLf & _
    ")" & vbCrLf & _
    " Возможные значения параметра @IsLocked: " & vbCrLf & _
    "  @isLocked = 4 /* Заблокирован другим пользователем в режиме CheckOut */" & vbCrLf & _
    "  @isLocked = 2 /* Заблокирован текущим пользователем в режиме CheckOut */" & vbCrLf & _
    "  @isLocked = 3 /* Заблокирован другим пользователем в рамках сессии */" & vbCrLf & _
    "  @isLocked = 1 /* Заблокирован текущим пользователем в рамках сессии */" & vbCrLf & _
    "  @isLocked = 0 /* Документ не заблокирован */" & vbCrLf
     wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
     
    wh.OutStr "Процедура проверки блокировки"
    wh.Bold
    wh.OutStr "proc INSTANCE_ISLOCKED (" & vbCrLf & _
    "@CURSESSION uniqueidentifier /*Идентификатор Текущей сессии*/," & vbCrLf & _
    "@RowID uniqueidentifier  /* идентификатор документа */," & vbCrLf & _
    "@IsLocked integer output /* результат блокировки */" & vbCrLf & _
    ")" & vbCrLf & _
   " Возможные значения параметра @IsLocked: " & vbCrLf & _
    "   @isLocked = 4 /* Заблокирован другим пользователем в режиме CheckOut */" & vbCrLf & _
    "   @isLocked = 2 /* Заблокирован текущим пользователем в режиме CheckOut */" & vbCrLf & _
    "   @isLocked = 3 /* Заблокирован другим пользователем в рамках сессии */" & vbCrLf & _
    "   @isLocked = 1 /* Заблокирован текущим пользователем в рамках сессии */" & vbCrLf & _
    "   @isLocked = 0 /* Документ не заблокирован*/" & vbCrLf
     wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    wh.OutStr "Блокировка"
    wh.Bold
    wh.OutStr "proc Instance_LOCK  (" & vbCrLf & _
    " @CURSESSION uniqueidentifier /*Идентификатор Текущей сессии*/," & vbCrLf & _
    " @RowID uniqueidentifier /* идентификатор документа */," & vbCrLf & _
    " @LockMode integer /* Режим блокироки */" & vbCrLf & _
    ")" & vbCrLf & vbCrLf & _
    " Возможные значения режима блокировки:" & vbCrLf & _
    "@LockMode =1  -  Блокировка в рамках текущей сессии" & vbCrLf & _
    "@LockMode =2  -  Блокировка в режиме CheckOut" & vbCrLf
     wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    wh.OutStr "Определение привязки документа к строке раздела"
    wh.Bold
    wh.OutStr "proc INSTANCE_OWNER (  @CURSESSION uniqueidentifier /*Идентификатор Текущей сессии*/ " & vbCrLf & _
    ",@InstanceID uniqueidentifier /* Идентификатор объекта */," & vbCrLf & _
    "@OwnerPartName varchar(255) /* Название раздела владельца*/," & vbCrLf & _
    "@OwnerRowID uniqueidentifier /* Идентификатор строки владельца*/)" & vbCrLf
     wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    wh.OutStr "Распространение прав на дочерние разделы и строки"
    wh.Bold
    wh.OutStr "proc Instance_propagate (" & vbCrLf & _
    "@CURSESSION uniqueidentifier uniqueidentifier /*Идентификатор Текущей сессии*/," & vbCrLf & _
    "@RowID uniqueidentifier /* идентификатор документа */" & vbCrLf & _
    ")" & vbCrLf
     wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    wh.OutStr "Сохранение\создание заголовка документа"
    wh.Bold
    wh.OutStr "proc Instance_Save (" & vbCrLf & _
    "@CURSESSION uniqueidentifier uniqueidentifier /*Идентификатор Текущей сессии*/," & vbCrLf & _
    "@InstanceID uniqueidentifier /* Идентификатор объекта */," & vbCrLf & _
    "@ObjType varchar(255) /* Тип объекта*/," & vbCrLf & _
    "@Name varchar(255) /* Краткое название объекта */" & vbCrLf & _
    ")" & vbCrLf
     wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    wh.OutStr "Инициализация прав по умолчанию"
    wh.Bold
    wh.OutStr "instance_SINIT  (" & vbCrLf & _
    "@CURSESSION uniqueidentifier uniqueidentifier /*Идентификатор Текущей сессии*/," & vbCrLf & _
    "@RowID uniqueidentifier /* идентификатор документа */," & vbCrLf & _
    "@SecurityStyleID uniqueidentifier=null /* Идентификатор дескриптора прав */" & vbCrLf & _
    ")" & vbCrLf
     wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    wh.OutStr "Задание состояния документа"
    wh.Bold
    wh.OutStr "Instance_Status(" & vbCrLf & _
    "  @CURSESSION uniqueidentifier /* Идентификатор Текущей сессии*/," & vbCrLf & _
    "  @InstanceID uniqueidentifier /* Идентификатор объекта */," & vbCrLf & _
    "  @statusid uniqueidentifier   /* Идентификатор нового состояния */)" & vbCrLf
     wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    wh.OutStr "Разблокировка"
    wh.Bold
    wh.OutStr "Instance_UNLOCK (" & vbCrLf & _
    " @CURSESSION uniqueidentifier /* Идентификатор Текущей сессии*/," & vbCrLf & _
    " @RowID uniqueidentifier      /* идентификатор документа */" & vbCrLf & _
    ")" & vbCrLf
     wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
     
     
      wh.OutStr "Стандартные процедуры ядра"
    wh.Header
    
    wh.OutStr "Разблокировка одного документа"
    wh.Bold
    wh.OutStr "proc AdminUnlock (@ID uniqueidentifier/* Идентификатор документа */ )" & vbCrLf
    wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    wh.OutStr "Снятие всех блокировок"
    wh.Bold
    wh.OutStr "proc AdminUnlockAll()" & vbCrLf
    wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    wh.OutStr "Открытие сессии"
    wh.Bold
    wh.OutStr "proc Login" & vbCrLf & _
    "(@the_SESSION uniqueidentifier = null  output /* Идентификатор новой сессии */" & vbCrLf & _
    ",@PWD varchar(80)                             /* Пароль */" & vbCrLf & _
    ",@USR VARCHAR (64)                            /* Имя пользователя */" & vbCrLf & _
    ")" & vbCrLf
     wh.OutStr "Возвращаемый результат - нет "
    
    wh.OutStr "Сохранение настроек"
    wh.Bold
    wh.OutStr "proc SysOptions_Save (" & vbCrLf & _
    "@SysOptionsid uniqueidentifier              /* ID строки настроек */," & vbCrLf & _
    "@Name varchar(255)                          /* Название настройки */," & vbCrLf & _
    "@Value varchar (255)                        /* Значение */," & vbCrLf & _
    "@OptionType varchar(255)                    /* Тип настройки */" & vbCrLf & _
    ")" & vbCrLf
    wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    '
    wh.OutStr "Закрытие сессии"
    wh.Bold
    wh.OutStr "proc Logout" & vbCrLf & _
    "(@CURSESSION uniqueidentifier          /* Идентификатор сессии */" & vbCrLf & _
    ")" & vbCrLf
    wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    
    wh.OutStr "Оповещение системы об активности сессии"
    wh.Bold
    wh.OutStr "proc SessionTouch" & vbCrLf & _
    "(@CURSESSION uniqueidentifier          /* Идентификатор сессии */" & vbCrLf & _
    ")" & vbCrLf
    wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    
    
  End If
  
  
  
  ' Вставляем оглавление
  Dim myRange As Object
  
  Set myRange = wh.wdoc.Range(0, 0)
  wh.wdoc.TablesOfContents.Add Range:=myRange, _
  UseFields:=False, UseHeadingStyles:=True, LowerHeadingLevel:=9, _
  UpperHeadingLevel:=1

  pb.Visible = False
  Label1.Visible = False
  
  
  Exit Sub
  
bye:
  MsgBox Err.Description, vbCritical
  pb.Visible = False
  Label1.Visible = False
  Log Err.Description

End Sub


Private Sub tvTarget_NodeCheck(ByVal Node As MSComctlLib.Node)
Dim n As Node, i
On Error GoTo bye
If Node.Tag = "TARGET" Then Exit Sub
Set n = Node.Child
For i = 1 To Node.children
    n.Checked = Node.Checked
    Set n = n.Next
Next
bye:
End Sub

Private Sub FieldTypeToWord()
  Dim ft As MTZMetaModel.FIELDTYPE
  Dim s As String
  Dim sp As Long, ep As Long

  wh.H = -1
  wh.NextHeader
  wh.OutStr "Описание типов полей"
  wh.Header
  
  model.FIELDTYPE.Sort = "Name"
  Dim i As Long, j As Long, k As Long
  For i = 1 To model.FIELDTYPE.Count
      Set ft = model.FIELDTYPE.item(i)
      wh.NextHeader
      wh.OutStr ft.Name
      wh.Header
      If ft.TypeStyle = TypeStyle_Interval Then
        wh.OutStr "Интервал в диапазоне от:" & ft.Minimum & " до:" & ft.Maximum & "."
      End If
      If ft.TypeStyle = TypeStyle_Perecislenie Then
        wh.OutStr "Перечисление:"
        Dim e As MTZMetaModel.ENUMITEM
        sp = wh.wdoc.Paragraphs.Count
        s = "Значение" & vbTab & " Название"
        wh.OutStr s
        ft.ENUMITEM.Sort = "NameValue"
        For j = 1 To ft.ENUMITEM.Count
          Set e = ft.ENUMITEM.item(j)
          s = e.NameValue & vbTab & e.Name
          wh.OutStr s
          wh.Italic
        Next
        ep = wh.wdoc.Paragraphs.Count
        wh.MakeTable sp, ep, ep - sp + 1, 2
      End If
      
      If ft.TypeStyle = TypeStyle_Skalyrniy_tip Then
        wh.OutStr "Скалярный тип."
        If ft.AllowSize Then
          wh.OutStr "Требует указания размера"
        End If
        If ft.AllowLikeSearch Then
          wh.OutStr "Допускает текстовый поиск"
        End If
      End If
      If ft.TypeStyle = TypeStyle_Ssilka Then
          wh.OutStr "Ссылка на ресурс или документ"
      End If
      
      If ft.TypeStyle = TypeStyle_Viragenie Then
          wh.OutStr "Вычисляемое выражение"
      End If
      Dim ftm As MTZMetaModel.FIELDTYPEMAP
      Dim trg As MTZMetaModel.GENERATOR_TARGET
      wh.OutStr "Отображение типа при генерации"
      wh.Bold
      sp = wh.wdoc.Paragraphs.Count
      s = "Тип генерации" & vbTab & "Генератор" & vbTab & "Отображается на"
      wh.OutStr s
      For j = 1 To ft.FIELDTYPEMAP.Count
        Set ftm = ft.FIELDTYPEMAP.item(j)
        Set trg = ftm.Target
        If trg.TargetType = TargetType_SUBD Then
          s = "База данных"
        End If
        If trg.TargetType = TargetType_MODEL_ Then
          s = "Объектная модель"
        End If
        If trg.TargetType = TargetType_Prilogenie Then
          s = "Приложение"
        End If
        
        s = s & vbTab & trg.Name
        If ftm.FixedSize <> 0 Then
          s = s & vbTab & ftm.StoageType & "(" & ftm.FixedSize & ")"
          
        Else
          s = s & vbTab & ftm.StoageType
          
        End If
        wh.OutStr s
        wh.Italic
      Next
      ep = wh.wdoc.Paragraphs.Count
      wh.MakeTable sp, ep, ep - sp + 1, 3
      wh.PrevHeader
  Next
  wh.PrevHeader
End Sub

Private Sub ObjectTypeToWord(ByVal ot As MTZMetaModel.objectType)
  wh.H = -1
  wh.NextHeader
  wh.OutStr "Описание документа: " & ot.the_comment & " ( " & ot.Name & " )"
  wh.Header
  If ot.TheComment <> "" Then
    wh.OutStr ot.TheComment
  End If
  Dim p As PART
  
  Dim pkg As MTZMetaModel.mtzApp
  Dim sm As MTZMetaModel.SHAREDMETHOD
  Dim i As Long, j As Long, k As Long
  Set pkg = ot.package
  wh.OutStr "Документ входит в состав приложения: " & pkg.Name
  
  If ot.IsSingleInstance Then
    wh.OutStr "Допускается существование только одного документа данного типа в информационной системе"
  End If
  
  If Not DocShort Then
    Dim iv As INSTANCEVALIDATOR
    Dim trg As MTZMetaModel.GENERATOR_TARGET
    If ot.INSTANCEVALIDATOR.Count > 0 Then
      wh.NextHeader
      wh.OutStr "Правильность заполнения"
      wh.Header
      For i = 1 To ot.INSTANCEVALIDATOR.Count
        Set iv = ot.INSTANCEVALIDATOR.item(i)
        If iv.Code <> "" Then
          Set trg = iv.Target
          wh.OutStr "Верификатор объекта для варианта генерации:" & trg.Name
          wh.OutStr wh.Plain(iv.Code)
          wh.Italic
        End If
      Next
      wh.PrevHeader
    End If
    
    If ot.TypeMenu.Count > 0 Then
      wh.NextHeader
      wh.OutStr "Операции над объектом"
      wh.Header
      
      Dim tm As MTZMetaModel.TypeMenu
      For i = 1 To ot.TypeMenu
        Set tm = ot.TypeMenu.item(i)
        wh.OutStr "Операция: " & tm.Caption & "(" & tm.Name & ")"
        Set sm = tm.the_Action
        wh.OutStr "Операция основана на методе: " & sm.the_comment & "(" & sm.Name & ")"
      Next
      wh.PrevHeader
    End If
    On Error GoTo nxt
    
    If IncludeModeToDoc Then
    
      If ot.OBJECTMODE.Count > 0 Then
        wh.NextHeader
        wh.OutStr "Режимы исполнения объекта"
        wh.Header
        wh.NextHeader
        Dim otm As OBJECTMODE
        Dim sr As STRUCTRESTRICTION
        For i = 1 To ot.OBJECTMODE.Count
          Set otm = ot.OBJECTMODE.item(i)
          If otm.DefaultMode = Boolean_Da Then
            wh.OutStr "Режим '" & otm.Name & "' - основной режим работы"
          Else
           wh.OutStr "Режим '" & otm.Name & "'"
          End If
          wh.Header
        
          
          If otm.TheComment <> "" Then
            wh.OutStr otm.TheComment
          End If
          If otm.STRUCTRESTRICTION.Count > 0 Then
            wh.NextHeader
            wh.OutStr "Ограничения на разделы"
            wh.Header
            wh.PrevHeader
            For j = 1 To otm.STRUCTRESTRICTION.Count
              Set sr = otm.STRUCTRESTRICTION.item(j)
              If Not sr.struct Is Nothing Then
                wh.OutStr "Раздел: '" & sr.struct.Caption & "'"
                wh.Bold
                If sr.AllowRead = Boolean_Net Then
                  wh.OutStr "Чтение запрещено"
                End If
                If sr.AllowDelete = Boolean_Net Then
                  wh.OutStr "Удаление из раздела запрещено"
                End If
                If sr.AllowEdit = Boolean_Net Then
                  wh.OutStr "Модификация строк запрещена"
                End If
                If sr.AllowAdd = Boolean_Net Then
                  wh.OutStr "Добавление строк запрещено"
                End If
              End If
            Next
          End If
        Next
        wh.PrevHeader
        wh.PrevHeader
      End If
    End If
      
    If IncludeStateToDoc Then
      If ot.OBJSTATUS.Count > 0 Then
        wh.NextHeader
        wh.OutStr "Состояния документа"
        wh.Header
        wh.NextHeader
        For i = 1 To ot.OBJSTATUS.Count
          wh.OutStr ot.OBJSTATUS.item(i).Name
          wh.Header
          If ot.OBJSTATUS.item(i).the_comment <> "" Then
            wh.OutStr ot.OBJSTATUS.item(i).the_comment
          End If
          If ot.OBJSTATUS.item(i).isStartup Then
            wh.OutStr "-Начальное состояние"
          End If
          If ot.OBJSTATUS.item(i).IsArchive Then
            wh.OutStr "-Конечное состояние"
          End If
          If ot.OBJSTATUS.item(i).NEXTSTATE.Count > 0 Then
            wh.OutStr "Разрешены ручные переходы в следующие состояния:"
            For j = 1 To ot.OBJSTATUS.item(i).NEXTSTATE.Count
              wh.OutStr ot.OBJSTATUS.item(i).NEXTSTATE.item(j).TheState.Name
              wh.Bullet
            Next
          End If
        Next
        wh.PrevHeader
      End If
    End If
  End If
    
nxt:
'    If Err.Number > 0 Then
'      Stop
'      Resume
'    End If
  
  
  ot.PART.Sort = "sequence"
  For i = 1 To ot.PART.Count
    PartToWord ot.PART.item(i), ot
  Next
  
  wh.PrevHeader
End Sub

'Private Sub PartToWord(ByVal p As MTZMetaModel.PART)
'  wh.NextHeader
'  wh.OutStr "Описание раздела: " & p.Caption & "(" & p.Name & ")"
'  wh.Header
'  wh.OutStr p.the_comment
'  Dim s As String, sp As Long, ep As Long
'  Dim f As MTZMetaModel.Field
'  Dim ft As MTZMetaModel.FIELDTYPE
'  Dim i As Long, j As Long, k As Long
'  If p.PartType = PartType_Stroka Then
'    wh.OutStr "Структура (коллекция с одной строкой)"
'  End If
'
'  If p.PartType = PartType_Kollekciy Then
'    wh.OutStr "Коллекция строк"
'  End If
'
'  If p.PartType = PartType_Derevo Then
'    wh.OutStr "Древовидная структура"
'  End If
''  If P.the_comment <> "" Then
''    wh.OutStr P.the_comment
''  End If
'  If Not DocShort Then
'    wh.OutStr "Структура раздела"
'    wh.Bold
'    p.Field.Sort = "sequence"
'    sp = wh.wdoc.Paragraphs.Count
'    s = "Название" & vbTab & "Псевдоним" & vbTab & "Тип" & vbTab & "Можно не задавать" & vbTab & "Кратко" & vbTab & "Размер / Ссылка" & vbTab & "Примечание"
'    wh.OutStr s
'    For i = 1 To p.Field.Count
'
'      ' skip big structs
'      If i > 20 Then Exit For
'
'
'      Set f = p.Field.item(i)
'
'
'      Set ft = f.FIELDTYPE
'
''      For j = 1 To ft.FIELDTYPEMAP.Count
''       If ft.FIELDTYPEMAP.item(j).Target.Name = "MS SQL 2000" Then
''          s = ft.FIELDTYPEMAP.item(j).StoageType
''          If ft.AllowSize = Boolean_Da Then
''            s = s & "(" & f.DataSize & ")"
''          Else
''            If ft.FIELDTYPEMAP.item(j).Target.FixedSize <> 0 Then
''             s = s & "(" & ft.FIELDTYPEMAP.item(j).Target.FixedSize & ")"
''            End If
''          End If
''        Exit for
''       End If
''      Next
'
'      s = f.Caption & vbTab & f.Name
'      s = s & vbTab & ft.the_comment & "(" & ft.Name & ")"
'      If f.AllowNull Then
'        s = s & vbTab & "Да"
'      Else
'        s = s & vbTab & "Нет"
'      End If
'
'      If f.IsBrief Then
'        s = s & vbTab & "Да"
'      Else
'        s = s & vbTab & "Нет"
'      End If
'
'      Dim rp As PART
'      Dim rt As objectType
'
'      If ft.AllowSize Then
'        s = s & vbTab & f.DataSize
'
'      ElseIf ft.TypeStyle = TypeStyle_Ssilka Then
'        If f.ReferenceType = ReferenceType_Na_ob_ekt_ Then
'          s = s & vbTab & "ссылка на объект "
'
'          Set rt = f.RefToType
'          If Not rt Is Nothing Then
'            s = s & "типа: " & Notabs(rt.the_comment)
'          End If
'        End If
'        If f.ReferenceType = ReferenceType_Na_stroku_razdela Then
'          s = s & vbTab & "ссылка на строку раздела"
'
'          Set rp = f.RefToPart
'          If Not rp Is Nothing Then
'             Set rt = TypeForStruct(rp)
'             s = s & ": " & Notabs(rp.Caption) & " (в документе: " & Notabs(rt.the_comment) & ")"
'          End If
'
'        End If
'      End If
'      s = s & vbTab & Notabs(f.TheComment)
'      wh.OutStr s
'      wh.Italic
'      DoEvents
'    Next
'    ep = wh.wdoc.Paragraphs.Count
'    wh.MakeTable sp, ep, ep - sp + 1, 7
'
'    If p.UNIQUECONSTRAINT.Count > 0 Then
'      wh.OutStr "Уникальные сочетания полей в разделе"
'      wh.Bold
'      Dim unc As MTZMetaModel.UNIQUECONSTRAINT
'      Dim uncf As MTZMetaModel.CONSTRAINTFIELD
'      For j = 1 To p.UNIQUECONSTRAINT.Count
'        Set unc = p.UNIQUECONSTRAINT.item(j)
'        If unc.PerParent Then
'          wh.OutStr "Ограничение №" & j & " - в рамках родительского раздела"
'        Else
'          wh.OutStr "Ограничение №" & j & " - глобальное"
'        End If
'        If unc.Name <> "" Then
'          wh.OutStr unc.Name
'        End If
'        If unc.TheComment <> "" Then
'          wh.OutStr unc.TheComment
'        End If
'
'
'        s = "Уникальное сочетание полей:"
'        For k = 1 To unc.CONSTRAINTFIELD.Count
'          Set uncf = unc.CONSTRAINTFIELD.item(k)
'          Set f = uncf.TheField
'          If k <> 1 Then
'            s = s & "+"
'          End If
'          s = s & f.Caption
'        Next
'        wh.OutStr s
'        wh.Italic
'
'      Next
'    End If
'  End If
'  p.PART.Sort = "sequence"
'  For i = 1 To p.PART.Count
'    PartToWord p.PART.item(i)
'  Next
'
'  wh.PrevHeader
'End Sub


Private Sub PartToWord(ByVal p As MTZMetaModel.PART, ByVal ot As MTZMetaModel.objectType)
  wh.NextHeader
  wh.OutStr "Описание раздела: " & p.Caption & "(" & p.Name & ")"
  wh.Header
  wh.OutStr p.the_comment
  
  
  Dim s As String, sp As Long, ep As Long
  Dim f As MTZMetaModel.Field
  Dim ft As MTZMetaModel.FIELDTYPE
  Dim i As Long, j As Long, k As Long
  
  If UCase(TypeName(p.Parent.Parent)) = "OBJECTTYPE" Then
    wh.OutStr "Раздел первого уровня документа " & ot.the_comment
  Else
    wh.OutStr "Дочерний раздел к разделу " & p.Parent.Parent.Caption
  End If
  
  If p.PartType = PartType_Stroka Then
    wh.OutStr "Структура (коллекция с одной строкой)"
  End If

  If p.PartType = PartType_Kollekciy Then
    wh.OutStr "Коллекция строк"
  End If
  
  If p.PartType = PartType_Derevo Then
    wh.OutStr "Древовидная структура"
  End If
'  If P.the_comment <> "" Then
'    wh.OutStr P.the_comment
'  End If
  

    
  If Not DocShort Then
    wh.OutStr "Структура раздела"
    wh.Bold
    p.Field.Sort = "sequence"
    sp = wh.wdoc.Paragraphs.Count
    s = "Название" & vbTab & "Псевдоним" & vbTab & "Тип" & vbTab & "Можно не задавать" & vbTab & "Размер / Ссылка" & vbTab & "Примечание"
    wh.OutStr s
    
    
    
    
    If UCase(TypeName(p.Parent.Parent)) = "OBJECTTYPE" Then
      wh.OutStr "Документ" & vbTab & "InstanceID" & vbTab & "UNIQUEIDENTIFIER" & vbTab & "Нет" & vbTab & "16" & vbTab & "ID Документа"
    Else
      wh.OutStr "ID родительской строки в " & p.Parent.Parent.Caption & vbTab & "ParentStructRowID" & vbTab & "UNIQUEIDENTIFIER" & vbTab & "Нет" & vbTab & "16" & vbTab & "ID Документа"
    End If
     
   
    wh.OutStr "Идентификатор строки" & vbTab & p.Name & "id" & vbTab & "UNIQUEIDENTIFIER" & vbTab & "Нет" & vbTab & "16" & vbTab & "Ключевое поле таблицы " & p.Name
    wh.OutStr "Дата модификации" & vbTab & "ChangeStamp" & vbTab & "datetime" & vbTab & "Нет" & vbTab & "8" & vbTab & "Время последней модификации"
    wh.OutStr "Дата модификации" & vbTab & "TimeStamp" & vbTab & "timestamp " & vbTab & "Нет" & vbTab & "8" & vbTab & ""
    wh.OutStr "Блокировка" & vbTab & "LockSessionID" & vbTab & "UNIQUEIDENTIFIER" & vbTab & "Нет" & vbTab & "16" & vbTab & "ID блокирующей сессии"
    wh.OutStr "CheckOut блокировка" & vbTab & "LockUserID" & vbTab & "UNIQUEIDENTIFIER" & vbTab & "Нет" & vbTab & "16" & vbTab & "ID блокирующего пользователя"
    wh.OutStr "Права на строку" & vbTab & "SecurityStyleID" & vbTab & "UNIQUEIDENTIFIER" & vbTab & "Нет" & vbTab & "16" & vbTab & "ID дескриптора прав ( не используется)"


    If p.PartType = PartType_Derevo Then
     wh.OutStr "Родительская строка в дереве" & vbTab & "ParentRowid" & vbTab & "UNIQUEIDENTIFIER" & vbTab & "Нет" & vbTab & "16" & vbTab & "ID родительской строки в дереве, либо NULL для первого уровня дерева"
    End If
    
    For i = 1 To p.Field.Count
      
      ' skip big structs
      If i > 30 Then Exit For
      
      
      Set f = p.Field.item(i)
      s = f.Caption & vbTab & f.Name
      Set ft = f.FIELDTYPE
      
      s = s & vbTab
      On Error Resume Next
      
      For j = 1 To ft.FIELDTYPEMAP.Count
         If ft.FIELDTYPEMAP.item(j).Target.Name = "MS SQL 2000" Then
            s = s & " " & ft.FIELDTYPEMAP.item(j).StoageType
            If ft.AllowSize = Boolean_Da Then
              s = s & "(" & f.DataSize & ")"
            Else
              If ft.FIELDTYPEMAP.item(j).Target.FixedSize <> 0 Then
               s = s & "(" & ft.FIELDTYPEMAP.item(j).Target.FixedSize & ")"
              End If
            End If
            Exit For
          End If
      Next
      
      
      's = s & " (" & ft.the_comment & ") "  ' & "(" & ft.Name & ")
      
      If f.AllowNull Then
        s = s & vbTab & "Да"
      Else
        s = s & vbTab & "Нет"
      End If
      
'      If f.IsBrief Then
'        s = s & vbTab & "Да"
'      Else
'        s = s & vbTab & "Нет"
'      End If
'
      Dim rp As PART
      Dim rt As objectType
      
      If ft.AllowSize Then
        s = s & vbTab & f.DataSize
        
      ElseIf ft.TypeStyle = TypeStyle_Ssilka Then
        If f.ReferenceType = ReferenceType_Na_ob_ekt_ Then
          s = s & vbTab & "ссылка на объект "
          
          Set rt = f.RefToType
          If Not rt Is Nothing Then
            s = s & "типа: " & Notabs(rt.the_comment)
          End If
        End If
        
        If f.ReferenceType = ReferenceType_Na_stroku_razdela Then
          s = s & vbTab & "ссылка на строку раздела"
      
          Set rp = f.RefToPart
          If Not rp Is Nothing Then
             Set rt = TypeForStruct(rp)
             s = s & ": " & Notabs(rp.Caption) & " (в документе: " & Notabs(rt.the_comment) & ")"
          End If
          
        End If
      Else
       s = s & vbTab
      End If
      
      s = s & vbTab & Notabs(ft.the_comment) & " " & Notabs(f.TheComment)
      wh.OutStr s
      wh.Italic
      DoEvents
    Next
    ep = wh.wdoc.Paragraphs.Count
    wh.MakeTable sp, ep, ep - sp + 1, 6
    
    If p.UNIQUECONSTRAINT.Count > 0 Then
      wh.OutStr "Уникальные сочетания полей в разделе"
      wh.Bold
      Dim unc As MTZMetaModel.UNIQUECONSTRAINT
      Dim uncf As MTZMetaModel.CONSTRAINTFIELD
      For j = 1 To p.UNIQUECONSTRAINT.Count
        Set unc = p.UNIQUECONSTRAINT.item(j)
        If unc.PerParent Then
          wh.OutStr "Ограничение №" & j & " - в рамках родительского раздела"
        Else
          wh.OutStr "Ограничение №" & j & " - глобальное"
        End If
        If unc.Name <> "" Then
          wh.OutStr unc.Name
        End If
        If unc.TheComment <> "" Then
          wh.OutStr unc.TheComment
        End If
        
        
        s = "Уникальное сочетание полей:"
        For k = 1 To unc.CONSTRAINTFIELD.Count
          Set uncf = unc.CONSTRAINTFIELD.item(k)
          Set f = uncf.TheField
          If k <> 1 Then
            s = s & "+"
          End If
          s = s & f.Caption
        Next
        wh.OutStr s
        wh.Italic
      
      Next
    End If
  End If
   p.PART.Sort = "sequence"

    If IncludeProcsToDoc Then
    wh.OutStr vbCrLf & "Стандартные процедуры раздела " & p.Caption & "(" & p.Name & ") документа " & ot.the_comment & "(" & ot.Name & ")"
    wh.Header
    
     wh.OutStr "Функция вычисления краткого наименования"
     wh.Bold
     wh.OutStr "function  " & p.Name & "_BRIEF_F  (" & vbCrLf & _
     "@" & p.Name & " id uniqueidentifier /* Идентификатор строки */" & vbCrLf & _
     ",@Lang varchar(25)=NULL             /* Язык */ " & vbCrLf & _
    ")returns varchar(4000) " & vbCrLf
    wh.OutStr "Возвращаемый результат - краткое наименование" & vbCrLf & vbCrLf
    
    wh.OutStr "Процедура вычисления краткого наименования"
    wh.Bold
    wh.OutStr "proc " & p.Name & "_BRIEF  (" & vbCrLf & _
     "@CURSESSION uniqueidentifier        /* Идентификатор Текущей сессии*/," & vbCrLf & _
     "@" & p.Name & " id uniqueidentifier /* Идентификатор строки */," & vbCrLf & _
     "@BRIEF varchar(4000) output         /* Краткое наименование */" & vbCrLf & _
    ")" & vbCrLf
     wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    wh.OutStr "Процедура удаления строки раздела"
    wh.Bold
    wh.OutStr "proc " & p.Name & "_DELETE (" & vbCrLf & _
    "@CURSESSION uniqueidentifier uniqueidentifier /* Идентификатор Текущей сессии*/," & vbCrLf & _
    "@" & p.Name & "ID uniqueidentifier            /* Идентификатор строки раздела */)" & vbCrLf & _
    "@InstanceID uniqueidentifier                  /* Идентификатор объекта */)" & vbCrLf
    wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    wh.OutStr "Процедура проверки состояния блокировки дочерних строк"
    wh.Bold
    wh.OutStr "proc " & p.Name & "_HCL (" & vbCrLf & _
    "@CURSESSION uniqueidentifier uniqueidentifier /* Идентификатор Текущей сессии*/," & vbCrLf & _
    "@RowID uniqueidentifier                       /* Идентификатор строки раздела */," & vbCrLf & _
    "@IsLocked int out                             /* Результат блокировки */" & vbCrLf & _
    ")" & vbCrLf & _
      " Возможные значения параметра @isLocked:" & vbCrLf & _
       "@isLocked = 4 /* Заблокирован другим пользователем в режиме CheckOut */" & vbCrLf & _
       "@isLocked = 2 /* Заблокирован текущим пользователем в режиме CheckOut */" & vbCrLf & _
       "@isLocked = 3 /* Заблокирован другим пользователем в рамках сессии */" & vbCrLf & _
       "@isLocked = 1 /* Заблокирован текущим пользователем в рамках сессии */" & vbCrLf & _
       "@isLocked = 0 /* Документ не заблокирован*/" & vbCrLf
    wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    wh.OutStr "Процедура проверки блокировки"
    wh.Bold
    wh.OutStr "proc " & p.Name & "_ISLOCKED (" & vbCrLf & _
     "@CURSESSION uniqueidentifier /* Идентификатор Текущей сессии*/," & vbCrLf & _
     "@RowID uniqueidentifier      /* Идентификатор строки раздела */ ," & vbCrLf & _
     "@IsLocked integer output     /* Результат блокировки */" & vbCrLf & _
    ")" & vbCrLf & _
      " Возможные значения параметра @isLocked:" & vbCrLf & _
      "@isLocked = 4 /* Заблокирован другим пользователем в режиме CheckOut */" & vbCrLf & _
      "@isLocked = 2 /* Заблокирован текущим пользователем в режиме CheckOut */" & vbCrLf & _
      "@isLocked = 3 /* Заблокирован другим пользователем в рамках сессии */" & vbCrLf & _
      "@isLocked = 1 /* Заблокирован текущим пользователем в рамках сессии */" & vbCrLf & _
      "@isLocked = 0 /* Документ не заблокирован*/" & vbCrLf
    wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    wh.OutStr "Блокировка строки"
    wh.Bold
    wh.OutStr "proc " & p.Name & "_LOCK  (" & vbCrLf & _
     "@CURSESSION uniqueidentifier /* Идентификатор Текущей сессии*/," & vbCrLf & _
     "@RowID uniqueidentifier      /* Идентификатор строки раздела */," & vbCrLf & _
     "@LockMode integer            /* Тип блокировки */" & vbCrLf & _
    ")" & vbCrLf & _
    " Возможные значения режима блокировки:" & vbCrLf & _
    "@LockMode = 1 - Блокировка в рамках текущей сессии" & vbCrLf & _
    "@LockMode = 2 - Блокировка в режиме CheckOut" & vbCrLf
    wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    wh.OutStr "Распространение прав на дочерние разделы и строки"
    wh.Bold
    wh.OutStr "proc " & p.Name & "_propagate (" & vbCrLf & _
    "@CURSESSION uniqueidentifier uniqueidentifier /* Идентификатор Текущей сессии */," & vbCrLf & _
    "@RowID uniqueidentifier                       /* Идентификатор строки раздела */" & vbCrLf & _
    ")" & vbCrLf
    wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    wh.OutStr "Сохранение\создание строки раздела"
    wh.Bold
    wh.OutStr "proc " & p.Name & "_Save (" & vbCrLf & _
    "@CURSESSION uniqueidentifier             /* Идентификатор Текущей сессии */" & vbCrLf & _
    ",@InstanceID uniqueidentifier            /* Идентификатор объекта */ =null," & vbCrLf

    If UCase(TypeName(p.Parent.Parent)) = "PART" Then
      wh.OutStr ",@ParentStructRowID uniqueidentifier =null /* Идентификатор родительской строки в вышестоящем разделе */" & vbCrLf
    End If
    If p.PartType = PartType_Derevo Then
      wh.OutStr ",@ParentRowID uniqueidentifier =null       /* Идентифыикатор родительской строки в дереве*/" & vbCrLf
    End If
    wh.OutStr ",@" & p.Name & "id uniqueidentifier          /* Идентификатор строки раздела */"
     
    
    For i = 1 To p.Field.Count
    Set f = p.Field.item(i)
    Set ft = f.FIELDTYPE
    
    On Error Resume Next
          For j = 1 To ft.FIELDTYPEMAP.Count
              If ft.FIELDTYPEMAP.item(j).Target.Name = "MS SQL 2000" Then
              s = ft.FIELDTYPEMAP.item(j).StoageType
              If ft.AllowSize = Boolean_Da Then
                s = s & "(" & f.DataSize & ")"
              Else
                If ft.FIELDTYPEMAP.item(j).Target.FixedSize <> 0 Then
                 s = s & "(" & ft.FIELDTYPEMAP.item(j).Target.FixedSize & ")"
                End If
              End If
              Exit For
           End If
    
    Next
    wh.OutStr ",@" & f.Name & " " & s & " " & "/* " & f.Caption & " */"
          Next
    wh.OutStr ")"
    wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    wh.OutStr "Инициализация прав по умолчанию"
    wh.Bold
    wh.OutStr p.Name & "_SINIT  (" & vbCrLf & _
    "@CURSESSION uniqueidentifier uniqueidentifier /* Идентификатор Текущей сессии */," & vbCrLf & _
    "@RowID uniqueidentifier                       /* Идентификатор строки раздела */," & vbCrLf & _
    "@SecurityStyleID uniqueidentifier=null        /* Идентификатор стиля защиты */" & vbCrLf & _
    ")" & vbCrLf
    wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
   
    wh.OutStr "Разблокировка"
    wh.Bold
    wh.OutStr p.Name & "_UNLOCK (" & vbCrLf & _
     "@CURSESSION uniqueidentifier      /* Идентификатор Текущей сессии*/," & vbCrLf & _
     "@RowID uniqueidentifier           /* Идентификатор строки раздела */" & vbCrLf & _
    ")" & vbCrLf
    wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
    
    wh.OutStr "Вычисление параметров строки родительского объекта"
    wh.Bold
    wh.OutStr "proc " & p.Name & "__PARENT  (" & vbCrLf & _
     "@CURSESSION uniqueidentifier      /* Идентификатор Текущей сессии */," & vbCrLf & _
     "@RowID uniqueidentifier           /* Идентификатор строки раздела */," & vbCrLf & _
     "@ParentID uniqueidentifier output /* Идентификатор родительской строки  */," & vbCrLf & _
     "@ParentTable varchar(255) output  /* название родительского раздела */" & vbCrLf & _
    ")" & vbCrLf
    wh.OutStr "Возвращаемый результат - нет" & vbCrLf & vbCrLf
  
 End If

  For i = 1 To p.PART.Count
    PartToWord p.PART.item(i), ot
  Next
    wh.PrevHeader


  
End Sub


Private Function Notabs(ByVal s As String) As String
Notabs = Replace(Replace(Replace(Replace(Replace(s, vbTab, " "), vbCrLf, " "), vbCr, " "), vbLf, " "), "  ", " ")
End Function

