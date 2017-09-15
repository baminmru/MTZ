VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmGenerator 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Генератор метакода"
   ClientHeight    =   6345
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   8445
   Icon            =   "frmGenerator.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6345
   ScaleWidth      =   8445
   Begin VB.CommandButton cmdGenSetup 
      Caption         =   "Настройка генератора"
      Height          =   270
      Left            =   105
      TabIndex        =   16
      Top             =   3600
      Width           =   2085
   End
   Begin VB.CommandButton cmdDoc 
      Caption         =   "Документация"
      Height          =   375
      Left            =   6480
      TabIndex        =   13
      Top             =   60
      Width           =   1815
   End
   Begin VB.CommandButton cmdGen 
      Caption         =   "Генерация"
      Height          =   375
      Left            =   4320
      TabIndex        =   12
      Top             =   60
      Width           =   1815
   End
   Begin VB.CommandButton cmdClearQ 
      Caption         =   "Очистить очереди"
      Height          =   375
      Left            =   2160
      TabIndex        =   11
      Top             =   60
      Width           =   1815
   End
   Begin VB.CommandButton cmdCheckModel 
      Caption         =   "Проверить модель"
      Height          =   375
      Left            =   120
      TabIndex        =   10
      Top             =   60
      Width           =   1815
   End
   Begin MSComDlg.CommonDialog cdlg 
      Left            =   2520
      Top             =   3480
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin RichTextLib.RichTextBox txtLog 
      Height          =   1455
      Left            =   120
      TabIndex        =   9
      Top             =   4680
      Width           =   8175
      _ExtentX        =   14420
      _ExtentY        =   2566
      _Version        =   393217
      BackColor       =   -2147483648
      ReadOnly        =   -1  'True
      ScrollBars      =   2
      TextRTF         =   $"frmGenerator.frx":0442
   End
   Begin MSComctlLib.ProgressBar pb 
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   3960
      Visible         =   0   'False
      Width           =   8175
      _ExtentX        =   14420
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.CommandButton cmdClearAll 
      Caption         =   "Отменить"
      Height          =   255
      Left            =   7080
      TabIndex        =   6
      Top             =   3600
      Width           =   1215
   End
   Begin VB.CommandButton cmdSelAll 
      Caption         =   "Выбрать все"
      Height          =   255
      Left            =   5760
      TabIndex        =   5
      Top             =   3600
      Width           =   1215
   End
   Begin VB.ListBox lstTypes 
      Height          =   2655
      IntegralHeight  =   0   'False
      Left            =   4200
      Sorted          =   -1  'True
      Style           =   1  'Checkbox
      TabIndex        =   4
      Top             =   840
      Width           =   4095
   End
   Begin MSComctlLib.TreeView tvTarget 
      Height          =   2655
      Left            =   120
      TabIndex        =   3
      Top             =   840
      Width           =   3975
      _ExtentX        =   7011
      _ExtentY        =   4683
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
      Height          =   255
      Left            =   6120
      TabIndex        =   2
      Top             =   4320
      Width           =   2175
   End
   Begin VB.CommandButton cmdFindErr 
      Caption         =   "Следующая ошибка"
      Height          =   255
      Left            =   3840
      TabIndex        =   1
      Top             =   4320
      Width           =   2175
   End
   Begin VB.Label Label4 
      Caption         =   "Типы документов"
      Height          =   255
      Left            =   4200
      TabIndex        =   15
      Top             =   600
      Width           =   4095
   End
   Begin VB.Label Label2 
      Caption         =   "Генераторы"
      Height          =   255
      Left            =   120
      TabIndex        =   14
      Top             =   600
      Width           =   3975
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Процесс генерации"
      Height          =   255
      Left            =   2985
      TabIndex        =   8
      Top             =   3675
      Visible         =   0   'False
      Width           =   2295
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Журнал"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   4320
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

Const frmCaption As String = "Генератор метакода "
 
  
Private Sub Log(s As String)
  If txtLog <> "" Then txtLog.Text = txtLog.Text & vbCrLf
  txtLog.Text = txtLog.Text & s
End Sub
  
Private Sub cmdCheckModel_Click()
  txtLog = ""
  LoadWords
  Dim j As Long
  pb.Min = 0
  pb.Max = lstTypes.SelCount
  pb.Value = 0
  pb.Visible = True
  For j = 0 To lstTypes.ListCount - 1
    If lstTypes.Selected(j) Then
      On Error GoTo next_one
      Log "Тип документа: " & model.OBJECTTYPE.item(lstTypes.ItemData(j)).the_comment
      VerifyType model.OBJECTTYPE.item(lstTypes.ItemData(j))
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
  txtLog.SelStart = fres
Else
  MsgBox "Ошибок не обнаружено", vbOKOnly
  txtLog.SelStart = 0
End If
End Sub

Private Sub cmdGen_Click()
On Error GoTo bye
  Dim t As GENERATOR_TARGET
  Dim i As Long, j As Long
  Dim o As Object
  Dim cnt As Long
  Dim xmlFile As String, prjPath As String, DONE As Boolean
  
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
  If cnt = 0 Then cnt = 1
  pb.Min = 0
  pb.Max = cnt
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
              Log o.Run(model, gen, tid, model.OBJECTTYPE.item(lstTypes.ItemData(j)).ID)
              Set o = Nothing
              Log "Save file"
              txtLog.SelStart = 0
              On Error Resume Next
              MkDir App.path & "\" & t.Name
              gen.Save App.path & "\" & t.Name & "\" & model.OBJECTTYPE.item(lstTypes.ItemData(j)).Name & ".xml"
              MkDir App.path & "\" & t.Name & "\" & model.OBJECTTYPE.item(lstTypes.ItemData(j)).Name
              pb.Value = pb.Value + 1
              DoEvents
              
              If t.QueueName <> "" Then
                  Log "Add project to queque"
                  cnt = GetSetting(t.QueueName, "ToDo", "Count", 0)
                  cnt = cnt + 1
                  Call SaveSetting(t.QueueName, "ToDo", "Count", cnt)
                  SaveSetting t.QueueName, "ToDo", "DONE" & cnt, False
                  Call SaveSetting(t.QueueName, "ToDo", "XML" & cnt, App.path & "\" & t.Name & "\" & model.OBJECTTYPE.item(lstTypes.ItemData(j)).Name & ".xml")
                  On Error GoTo bye
                  Call SaveSetting(t.QueueName, "ToDo", "PATH" & cnt, App.path & "\" & t.Name & "\" & model.OBJECTTYPE.item(lstTypes.ItemData(j)).Name)
                  
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
          Set gen = New MTZGenerator.Response
          Log "Create object " & t.GeneratorProgID
          Set o = CreateObject(t.GeneratorProgID)
          Log "call Run method"
          Log o.Run(model, gen, tid)
          Set o = Nothing
          Log "Save file"
          txtLog.SelStart = 0
          
          
          
          On Error Resume Next
          MkDir App.path & "\" & t.Name
          gen.Save App.path & "\" & t.Name & "\all.xml"
          
          pb.Value = pb.Value + lstTypes.SelCount
          DoEvents
          
          If t.QueueName <> "" Then
              Log "Add project to queque"
              cnt = GetSetting(t.QueueName, "ToDo", "Count", 0)
              cnt = cnt + 1
              Call SaveSetting(t.QueueName, "ToDo", "Count", cnt)
              SaveSetting t.QueueName, "ToDo", "DONE" & cnt, False
              Call SaveSetting(t.QueueName, "ToDo", "XML" & cnt, App.path & "\" & t.Name & "\all.xml")
              On Error GoTo bye
              Call SaveSetting(t.QueueName, "ToDo", "PATH" & cnt, App.path & "\" & t.Name)
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


Private Sub cmdGenSetup_Click()
  tvTarget_DblClick
End Sub

Private Sub cmdSelAll_Click()
Dim i As Long
For i = 0 To lstTypes.ListCount - 1
    lstTypes.Selected(i) = True
Next
End Sub

Private Sub Form_Load()
  Dim t As GENERATOR_TARGET, i, j
  Dim n As Node
  tvTarget.Nodes.Clear
  For i = 1 To model.GENPACKAGE.Count    '
    Set n = tvTarget.Nodes.Add(, , model.GENPACKAGE.item(i).ID, model.GENPACKAGE.item(i).Name)
    n.Tag = "PACKAGE"
    For j = 1 To model.GENPACKAGE.item(i).GENERATOR_TARGET.Count
        tvTarget.Nodes.Add(n.Key, tvwChild, model.GENPACKAGE.item(i).GENERATOR_TARGET.item(j).ID, model.GENPACKAGE.item(i).GENERATOR_TARGET.item(j).Name).Tag = "TARGET"
    Next
  Next
  
  lstTypes.Clear
  model.OBJECTTYPE.Sort = "Comment"
  For i = 1 To model.OBJECTTYPE.Count
    With model.OBJECTTYPE.item(i)
      lstTypes.AddItem .Package.Name & "->" & .the_comment
      lstTypes.ItemData(lstTypes.NewIndex) = i
    End With
  Next
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Set gen = Nothing
End Sub

Private Sub mnuClearQue_Click()
End Sub

Private Sub mnuExit_Click()
  Unload frmLogin
  Unload Me
End Sub


Private Sub mnuRun_Click()
End Sub

Private Sub mnuVerify_Click()
End Sub



Private Sub VerifyType(ot As MTZMetaModel.OBJECTTYPE)
  Dim P As PART
  If ot.PART.Count = 0 Then
    Log "  ERROR-->не определен ни один раздел"
  End If
  
  If Not IsValidFieldName2(ot.Name) Then
    Log "  ERROR-->Имя типа " & ot.Name & " является ключевым словом, или имеет неверный формат"
  End If
  Dim i As Long
  ' проверяем  разделы
  For i = 1 To ot.PART.Count
    VerifyPart ot.PART.item(i)
  Next
  
  ' проверяем режимы работы
  
End Sub


Private Sub VerifyPart(P As PART)
  Dim fld As MTZMetaModel.Field
  Log "  Раздел: " & P.Caption
  If P.Field.Count = 0 Then
    Log "    ERROR-->не определено ни одного поля"
  End If
  
  If Not IsValidFieldName2(P.Name) Then
    Log "  ERROR-->Имя раздела " & P.Name & " является ключевым словом, или имеет неверный формат"
  End If
  
  Dim i As Long, j As Long
  Dim BriefCnt As Integer
  
  BriefCnt = 0
  
  ' проверяем поля
  For i = 1 To P.Field.Count
    VerifyField P.Field.item(i)
    If P.Field.item(i).IsBrief = Boolean_Da Then BriefCnt = BriefCnt + 1
  Next
  
  If BriefCnt = 0 Then
    Log "    ERROR-->не определены поля для краткого отображения"
  End If
  
  Dim uc As UNIQUECONSTRAINT
  Dim ft As MTZMetaModel.FieldType
  
  ' проверяем описания ограничений
  For i = 1 To P.UNIQUECONSTRAINT.Count
    Set uc = P.UNIQUECONSTRAINT.item(i)
    For j = 1 To uc.CONSTRAINTFIELD.Count
      Set fld = uc.CONSTRAINTFIELD.item(i).TheField
      If fld Is Nothing Then
        Log "    ERROR-->ошибка в определении уникального ограничения"
        Log "    поле  указывает на отсутствующий компонент"
      Else
        If fld.Parent.Parent.ID <> P.ID Then
          Log "    ERROR-->ошибка в определении уникального ограничения"
          Log "    поле " & fld.Caption & " не  пренадлежит данному разделу"
        End If
        Set ft = fld.FieldType
        
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

  For i = 1 To P.PARTVIEW.Count
      Set v = P.PARTVIEW.item(i)
      VerifyView v, P
  Next
 
  
  ' проверяем зависимые разделы
  For i = 1 To P.PART.Count
    VerifyPart P.PART.item(i)
  Next
End Sub

Private Sub VerifyView(v As PARTVIEW, P As MTZMetaModel.PART)
  Dim vc As ViewColumn
  Dim i As Long
  Log "  View: " & v.Name & "(" & v.the_Alias & ")"
  If v.Name = "" Then
      Log "  ERROR-->Не определено имя "
  End If
  If v.the_Alias = "" Then
      Log "  ERROR-->Не определено псевдоним "
  End If
  
  For i = 1 To v.ViewColumn.Count
    Set vc = v.ViewColumn.item(i)
    If vc.Field Is Nothing Then
      Log "  ERROR-->Для колонки " & vc.Name & "(" & vc.the_Alias & ") не определено поле - источник"
    'ElseIf vc.Field.Parent.Parent.ID <> p.ID Then
    '  Log "  ERROR-->Для колонки " & vc.Name & "(" & vc.the_alias & ") поле - источник"
    End If
    
  Next
  
End Sub

Private Sub VerifyField(f As MTZMetaModel.Field)
  Dim ft As MTZMetaModel.FieldType
  Set ft = f.FieldType
  If f.Name = "" Then
    Log "  ERROR-->Для поля #" & f.Sequence & "  не определено имя "
  End If
  If f.Caption = "" Then
    Log "  ERROR-->Для поля " & f.Name & "  не определен заголовок "
  End If
  
  If ft Is Nothing Then
    Log "  ERROR-->Для поля " & f.Name & " не определен тип"
  End If
  If f.IsBrief And UCase(f.FieldType.Name) = "FILE" Then
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


Private Sub VerifyFieldType(f As MTZMetaModel.Field, ft As MTZMetaModel.FieldType)
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
  
  If ft.FIELDTYPEMAP.Count < 3 Then
        Log "  Поле: " & f.Caption
        Log "    Тип данных: " & ft.Name
        Log "      ERROR-->не определено отображение типа данных для генераторов "
  End If

End Sub


Private Sub mnuWordDoc_Click()
End Sub





Private Sub gen_OnStatus(s As String, progress As Long)
  On Error Resume Next
  pb.Value = pb.Value + progress
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
  pb.Min = 0
  pb.Max = cnt + 1
  pb.Value = 0
  pb.Visible = True
  Label1.Visible = True
  DoEvents
  If MsgBox("Включить описания типов документов?", vbYesNo, "Документация") = vbYes Then
    For j = 0 To lstTypes.ListCount - 1
      If lstTypes.Selected(j) Then
      
       ' describe object types
        ObjectTypeToWord model.OBJECTTYPE.item(lstTypes.ItemData(j))
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
  Dim ft As MTZMetaModel.FieldType
  Dim s As String
  Dim sp As Long, ep As Long

  wh.H = -1
  wh.NextHeader
  wh.OutStr "Описание типов полей"
  wh.Header
  
  model.FieldType.Sort = "Name"
  Dim i As Long, j As Long, k As Long
  For i = 1 To model.FieldType.Count
      Set ft = model.FieldType.item(i)
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

Private Sub ObjectTypeToWord(ByVal ot As MTZMetaModel.OBJECTTYPE)
  wh.H = -1
  wh.NextHeader
  wh.OutStr "Описание документа: " & ot.the_comment & " ( " & ot.Name & " )"
  wh.Header
  Dim P As PART
  
  Dim pkg As MTZMetaModel.MTZAPP
  Dim sm As MTZMetaModel.SHAREDMETHOD
  Dim i As Long, j As Long, k As Long
  Set pkg = ot.Package
  wh.OutStr "Документ входит в состав приложения: " & pkg.Name
  
  If ot.IsSingleInstance Then
    wh.OutStr "Допускается существование только одного документа данного типа в информационной системе"
  End If
  
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
  
  If ot.TYPEMENU.Count > 0 Then
    wh.NextHeader
    wh.OutStr "Операции над объектом"
    wh.Header
    
    Dim tm As MTZMetaModel.TYPEMENU
    For i = 1 To ot.TYPEMENU
      Set tm = ot.TYPEMENU.item(i)
      wh.OutStr "Операция: " & tm.Caption & "(" & tm.Name & ")"
      Set sm = tm.the_Action
      wh.OutStr "Операция основана на методе: " & sm.the_comment & "(" & sm.Name & ")"
    Next
    wh.PrevHeader
  End If
  On Error GoTo nxt
  If ot.OBJECTMODE.Count > 0 Then
    wh.NextHeader
    wh.OutStr "Режимы исполнения объекта"
    wh.Header
    Dim otm As OBJECTMODE
    Dim sr As STRUCTRESTRICTION
    For i = 1 To ot.OBJECTMODE.Count
      Set otm = ot.OBJECTMODE.item(i)
      If otm.DefaultMode = Boolean_Da Then
        wh.OutStr "Режим '" & otm.Name & "' - основной режим работы"
      Else
       wh.OutStr "Режим '" & otm.Name & "'"
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
nxt:
'    If Err.Number > 0 Then
'      Stop
'      Resume
'    End If
    wh.PrevHeader
  End If
  
  ot.PART.Sort = "sequence"
  For i = 1 To ot.PART.Count
    PartToWord ot.PART.item(i)
  Next
  
  wh.PrevHeader
End Sub

Private Sub PartToWord(ByVal P As MTZMetaModel.PART)
  wh.NextHeader
  wh.OutStr "Описание раздела: " & P.Caption & "(" & P.Name & ")"
  wh.Header
  wh.OutStr P.the_comment
  Dim s As String, sp As Long, ep As Long
  Dim f As MTZMetaModel.Field
  Dim ft As MTZMetaModel.FieldType
  Dim i As Long, j As Long, k As Long
  If P.PartType = PartType_Stroka Then
    wh.OutStr "Структура (коллекция с одной строкой)"
  End If

  If P.PartType = PartType_Kollekciy Then
    wh.OutStr "Коллекция строк"
  End If
  
  If P.PartType = PartType_Derevo Then
    wh.OutStr "Древовидная структура"
  End If
  
  wh.OutStr "Структура раздела"
  wh.Bold
  P.Field.Sort = "sequence"
  sp = wh.wdoc.Paragraphs.Count
  s = "Название" & vbTab & "Псевдоним" & vbTab & "Тип" & vbTab & "Можно не задавать" & vbTab & "кратко" & vbTab & " размер / ссылка на"
  wh.OutStr s
  For i = 1 To P.Field.Count
    Set f = P.Field.item(i)
    s = f.Caption & vbTab & f.Name
    Set ft = f.FieldType
    s = s & vbTab & ft.the_comment & "(" & ft.Name & ")"
    If f.AllowNull Then
      s = s & vbTab & "Да"
    Else
      s = s & vbTab & "Нет"
    End If
    
    If f.IsBrief Then
      s = s & vbTab & "Да"
    Else
      s = s & vbTab & "Нет"
    End If
    
    Dim rp As PART
    Dim rt As OBJECTTYPE
    
    If ft.AllowSize Then
      s = s & vbTab & f.DataSize
      
    ElseIf ft.TypeStyle = TypeStyle_Ssilka Then
      If f.ReferenceType = ReferenceType_Na_ob_ekt_ Then
        s = s & vbTab & "ссылка на объект "
        
        Set rt = f.RefToType
        If Not rt Is Nothing Then
          s = s & "типа: " & rt.the_comment
        End If
      End If
      If f.ReferenceType = ReferenceType_Na_stroku_razdela Then
        s = s & vbTab & "ссылка на строку раздела"
    
        Set rp = f.RefToPart
        If Not rp Is Nothing Then
           Set rt = TypeForStruct(rp)
           s = s & ": " & rp.Caption & "(в документе: " & rt.the_comment & ")"
        End If
        
      End If
    End If
    wh.OutStr s
    wh.Italic
  Next
  ep = wh.wdoc.Paragraphs.Count
  wh.MakeTable sp, ep, ep - sp + 1, 6
  
  If P.UNIQUECONSTRAINT.Count > 0 Then
    wh.OutStr "Уникальные сочетания полей в разделе"
    wh.Bold
    Dim unc As MTZMetaModel.UNIQUECONSTRAINT
    Dim uncf As MTZMetaModel.CONSTRAINTFIELD
    For j = 1 To P.UNIQUECONSTRAINT.Count
      Set unc = P.UNIQUECONSTRAINT.item(j)
      If unc.PerParent Then
        wh.OutStr "Ограничение №" & j & " - в рамках родительского раздела"
      Else
        wh.OutStr "Ограничение №" & j & " - глобальное"
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
  P.PART.Sort = "sequence"
  For i = 1 To P.PART.Count
    PartToWord P.PART.item(i)
  Next
  
  wh.PrevHeader
End Sub

