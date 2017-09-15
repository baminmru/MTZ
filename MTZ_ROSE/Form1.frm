VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "ROSE 2000 Документатор"
   ClientHeight    =   3825
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7305
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   3825
   ScaleWidth      =   7305
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command8 
      Caption         =   "Зафиксировать зависимость"
      Enabled         =   0   'False
      Height          =   375
      Left            =   3960
      TabIndex        =   14
      Top             =   3360
      Width           =   3255
   End
   Begin VB.CommandButton cmdRose_MTZ 
      Caption         =   "Экспорт типа в ""Муромец"""
      Enabled         =   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   13
      Top             =   2880
      Width           =   3015
   End
   Begin VB.CommandButton cmdMTZ_Rose 
      Caption         =   "Импорт модели из ""Муромца"""
      Enabled         =   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   12
      Top             =   2400
      Width           =   3015
   End
   Begin VB.CommandButton Command7 
      Caption         =   "Комментарий к модели"
      Enabled         =   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   11
      Top             =   1920
      Width           =   3015
   End
   Begin VB.CommandButton Command6 
      Caption         =   "Translit Class"
      Enabled         =   0   'False
      Height          =   375
      Left            =   3960
      TabIndex        =   10
      Top             =   2880
      Width           =   3255
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   200
      Left            =   3240
      Top             =   2040
   End
   Begin VB.CommandButton cmdfile 
      Caption         =   "..."
      Height          =   375
      Left            =   6720
      TabIndex        =   9
      Top             =   480
      Width           =   495
   End
   Begin MSComDlg.CommonDialog cdlg 
      Left            =   3240
      Top             =   2640
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
      DialogTitle     =   "Выбор файла"
   End
   Begin VB.CommandButton Command5 
      Caption         =   "Откомментировать параметры методов"
      Enabled         =   0   'False
      Height          =   375
      Left            =   3960
      TabIndex        =   8
      Top             =   2400
      Width           =   3255
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Закрыть модель"
      Enabled         =   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   7
      Top             =   1440
      Width           =   3015
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Скопировать класс"
      Enabled         =   0   'False
      Height          =   375
      Left            =   3960
      TabIndex        =   6
      Top             =   1920
      Width           =   3255
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Скопировать операции класса"
      Enabled         =   0   'False
      Height          =   375
      Left            =   3960
      TabIndex        =   5
      Top             =   1440
      Width           =   3255
   End
   Begin VB.CommandButton cmdOpen 
      Caption         =   "Открыть модель"
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   960
      Width           =   3015
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Скопировать атрибуты класса"
      Enabled         =   0   'False
      Height          =   375
      Left            =   3960
      TabIndex        =   3
      Top             =   960
      Width           =   3255
   End
   Begin VB.TextBox txtModel 
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   6495
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Сформировать WORD документ "
      Enabled         =   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   3360
      Width           =   3015
   End
   Begin VB.Label lbnInfo 
      Height          =   315
      Left            =   3240
      TabIndex        =   15
      Top             =   90
      Width           =   3615
   End
   Begin VB.Shape State 
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   255
      Left            =   6960
      Shape           =   4  'Rounded Rectangle
      Top             =   120
      Width           =   255
   End
   Begin VB.Label Label1 
      Caption         =   "Полный путь к файлу модели"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   4215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'--------------------------------------------------------------------------------
'SaveAllDiagramsToWord.ebs
'
' Script help to save all Use Case diagrams and State Machine diagrams  as Word Document.
'
' Created by Michael M Baranov
' (C) Copyright Michael M Baranov  1999,2002   All Rights Reserved
'--------------------------------------------------------------------------------
Dim Blink As Boolean
Dim PrevColor As Long
Dim PrevWord As String
Dim bBuildFullDiagramm As Boolean
Dim FullKC As RoseClassDiagram

Function Plain(ByVal s As String) As String
Plain = Replace(Replace(Replace(Replace(s, vbTab, " "), vbCrLf, "  "), vbCr, " "), vbLf, " ")

End Function

' Добавить параграф
Sub OutStr(s As String)
   Dim p As Long
   p = wdoc.Paragraphs.Count()
   wdoc.Paragraphs(p).Range.InsertAfter s
   wdoc.Paragraphs.Add
   Normal
End Sub



' оформить как заголовок уровня H
Sub Header()
      If h > -2 Then h = -2
      If h < -10 Then h = -10
      On Error Resume Next
      Dim p As Long
      p = wdoc.Paragraphs.Count()
      wdoc.Paragraphs(p - 1).Format.Style = h
End Sub

' Вставить разрыв страницы
Sub PageBreak()
      On Error Resume Next
      Dim p As Long
      p = wdoc.Paragraphs.Count()
      wdoc.Paragraphs(p).Range.InsertBreak wdPageBreak
End Sub


'Выравнивание вправо
Sub RightAlign()
      On Error Resume Next
      Dim p As Long
      p = wdoc.Paragraphs.Count()
      wdoc.Paragraphs.Item(p - 1).Alignment = wdAlignParagraphRight
End Sub


' Оформить жирным шрифом
Sub Bold()
      On Error Resume Next
      Dim p As Long
      p = wdoc.Paragraphs.Count()
      wdoc.Paragraphs(p - 1).Range.Font.Bold = True
End Sub
' Оформить как подчеркивание
Sub Underline()
      On Error Resume Next
      Dim p As Long
      p = wdoc.Paragraphs.Count()
      wdoc.Paragraphs(p - 1).Range.Font.Underline = True
End Sub


' Оформить курсивом
Sub Italic()
  On Error Resume Next
  Dim p As Long
  p = wdoc.Paragraphs.Count()
  wdoc.Paragraphs(p - 1).Range.Font.Italic = True
End Sub

Sub Normal()
      On Error Resume Next
      Dim p As Long
      p = wdoc.Paragraphs.Count()
      wdoc.Paragraphs(p - 1).Range.Font.Bold = False
      wdoc.Paragraphs(p - 1).Range.Font.Italic = False
End Sub


Private Sub NextHeader()
  If h > -10 Then
    h = h - 1
  End If
End Sub

Private Sub PrevHeader()
  If h < -2 Then
    h = h + 1
  End If
End Sub

Private Sub PrevHeader2()
  PrevHeader
  PrevHeader
End Sub

Public Sub PrintStateMachine(C As RoseClassDiagram)
    NextHeader
    Dim i As Long, j As Long
    For i = 1 To C.GetUseCases.Count
      If Not C.GetUseCases.GetAt(i).StateMachine Is Nothing Then
            OutStr "Блок-схема для транзакции: '" + C.GetUseCases.GetAt(i).Name & "'"
            Header
            PrintMethodAlgorithm C.GetUseCases.GetAt(i).StateMachine
      End If
    Next
    PrevHeader
End Sub

Public Sub PrintMethodAlgorithm(stm As RoseStateMachine)
    Dim zzz As Long
    For zzz = 1 To stm.Diagrams.Count
      WMFID = WMFID + 1
      stm.Diagrams.GetAt(zzz).RenderEnhanced WMF(WMFID)
      AddWMF WMFID
    Next
End Sub


Public Sub PrintCategory(C As RoseCategory)
    Dim rcdc As RoseClassDiagramCollection
    Dim rcd As RoseClassDiagram
    Dim C2 As RoseCategoryCollection
    Dim i As Long, j As Long, k As Long
    Dim SP As Long, EP As Long, NR As Long
    Dim operation As RoseOperation
    Dim attr As RoseAttribute
    Dim Range As Word.Range
    Dim Class As RoseClass
    Dim op As Long
    Dim par As Long
    Dim OK As Boolean
        
    On Error Resume Next
    
    NextHeader
    OutStr C.Name
    Header
   
    If C.Documentation <> "" Then
      OutStr PrintDocInfo(Plain(C.Documentation))
    End If

    ' рисуем диаграммы
    Set rcdc = C.ClassDiagrams
    NextHeader
    If rcdc.Count > 0 Then
      If rcdc.Count > 1 Then
        OutStr "Диаграммы"
        Header
      End If
      
      ' вставляем картинки в документ
      For i = 1 To rcdc.Count
        Set rcd = rcdc.GetAt(i)
        On Error Resume Next
        
        If rcd.Name <> "Main" Then
          NextHeader
          OutStr rcd.Name
          Header
          PrevHeader
        End If

        If rcd.Documentation <> "" Then
           OutStr PrintDocInfo(Plain(rcd.Documentation))
        End If

        OutStr " "

        WMFID = WMFID + 1
        rcd.RenderEnhanced WMF(WMFID)
        AddWMF WMFID
        
        ' вставляем блок-схемы
        PrintStateMachine rcd
        DoEvents
    

          ' список классов с комментариями
          If rcd.GetClasses().Count > 0 Then
            OK = False
            
            For k = 1 To rcd.GetClasses().Count
              Set Class = rcd.GetClasses().GetAt(k)
              If Class.ParentCategory.Name = C.Name Then
                OK = True
                Exit For
              End If
            Next
            
            If OK Then
              NextHeader
              OutStr "Классы и Интерфейсы "
              Header
            
              For k = 1 To rcd.GetClasses().Count
                DoEvents
                
                Set Class = rcd.GetClasses().GetAt(k)
                lbnInfo.Caption = Class.Name
                DoEvents
                If Class.ParentCategory.Name = C.Name Then
                  NextHeader
                  OutStr Class.Name
                  Header
                  
                  If Class.Stereotype <> "" Then
                    OutStr "(" + rcd.GetClasses.GetAt(k).Stereotype + ")"
                  End If
      
                  If Class.Documentation <> "" Then
                    OutStr "Описание : "
                    Italic
                    OutStr PrintDocInfo(Plain(Class.Documentation))
                    OutStr " "
                  End If
                  
                  ' список методов
                  If Class.Operations.Count > 0 Then
                    NextHeader
                    OutStr "Методы"
                    Header
                    PrevHeader
                    NR = 0
                    
                    SP = wdoc.Paragraphs.Count
                    OutStr "Имя метода/параметра " & vbTab & "Возвращает/Тип параметра" & vbTab & "Описание" & vbTab & "Видимость" & vbTab & "Нач. значение"
                    Bold
                    NR = NR + 1
                    For op = 1 To Class.Operations.Count
                      DoEvents
                      With Class.Operations.GetAt(op)
                      OutStr .Name & vbTab & .ReturnType & vbTab & PrintDocInfo(Plain(.Documentation)) & vbTab & .ExportControl.Name & vbTab
                      End With
                      NR = NR + 1
                      For par = 1 To Class.Operations.GetAt(op).Parameters.Count
                        With Class.Operations.GetAt(op).Parameters.GetAt(par)
                        OutStr "  " & .Name & vbTab & _
                        .Type & " " & .Stereotype & vbTab & PrintDocInfo(Plain(.Documentation)) & vbTab & .ExportControl.Name & vbTab & .InitValue
                        End With
                        Italic
                        NR = NR + 1
                      Next
                      OutStr " " & vbTab & " " & vbTab & " "
                      NR = NR + 1
                    Next
                    EP = wdoc.Paragraphs.Count
                    MakeTable SP, EP, NR, 5
                    
                    ' вставляем блок-схемы алгоритмов методов
                    For op = 1 To Class.Operations.Count
                      DoEvents
                      Dim sm As Long
                      With Class.Operations.GetAt(op)
                        If .StateMachineOwner.StateMachines.Count > 0 Then
                          OutStr "Блок схема для метода " & Class.Name & "->" & Class.Operations.GetAt(op).Name
                          For sm = 1 To .StateMachineOwner.StateMachines.Count
                            PrintMethodAlgorithm .StateMachineOwner.StateMachines.GetAt(sm)
                          Next
                        End If
                      End With
                    Next
                  End If
                    
                  ' список атрибутов
                  If Class.Attributes.Count > 0 Then
                    DoEvents
                    NextHeader
                    OutStr "Атрибуты"
                    Header
                    PrevHeader
                    NR = 0
                    SP = wdoc.Paragraphs.Count
                    OutStr "Имя атрибута" & vbTab & "Тип" & vbTab & "Описание" & vbTab & "Видимость" & vbTab & "Нач. Значение"
                    Bold
                    NR = NR + 1
                    For op = 1 To Class.Attributes.Count
                      With Class.Attributes.GetAt(op)
                       OutStr .Name & vbTab & .Type & " " & .Stereotype & vbTab & PrintDocInfo(Plain(.Documentation)) & vbTab & .ExportControl.Name & vbTab & .InitValue
                      End With
                      NR = NR + 1
                    Next
                    EP = wdoc.Paragraphs.Count
                    MakeTable SP, EP, NR, 5
                  End If
                End If
                PrevHeader
              Next ' classes
              PrevHeader
            End If
            
          End If ' classes
                  
          If rcd.GetUseCases().Count > 0 Then
            OK = False
            For k = 1 To rcd.GetUseCases().Count
                If rcd.GetUseCases.GetAt(k).Documentation <> "" Then
                    OK = True
                End If
            Next
            
            If OK Then
               DoEvents
               NextHeader
               OutStr "Транзакции"
               Header
               For k = 1 To rcd.GetUseCases().Count
                  If C.Name = rcd.GetUseCases.GetAt(k).ParentCategory.Name Then
                    NextHeader
                    OutStr rcd.GetUseCases.GetAt(k).Name
                    Header
                    PrevHeader
                    If rcd.GetUseCases.GetAt(k).Stereotype <> "" Then
                      OutStr "(" + rcd.GetUseCases.GetAt(k).Stereotype + ")"
                    End If
        
                    If rcd.GetUseCases.GetAt(k).Documentation <> "" Then
                      OutStr "Описание: "
                      OutStr PrintDocInfo(Plain(rcd.GetUseCases.GetAt(k).Documentation))
                      OutStr " "
                    End If
                  End If
               Next
               PrevHeader
            End If
          End If
        Next
    End If
    
    PrevHeader
    On Error Resume Next
    
    For i = 1 To rcdc.Count
        DoEvents
        Set rcd = rcdc.GetAt(i)
        On Error Resume Next

        Set C2 = rcd.GetCategories
        For j = 1 To C2.Count
           PrintCategory C2.GetAt(j)
        Next
    Next
    
    PrevHeader
End Sub


Public Function WMF(ByVal ID As Long) As String
  WMF = App.Path & "\TMPWMF" & CStr(WMFID) & ".wmf"
End Function

Public Sub PrintSubsystem(C As RoseSubsystem)
    Dim rcdc As RoseModuleDiagramCollection
    Dim rcd As RoseModuleDiagram
    Dim rmod As RoseModule
    
    Dim C2 As RoseSubsystemCollection
    Dim i As Long, j As Long, k As Long

   NextHeader
   OutStr C.Name
   Header

   
    Set rcdc = C.ModuleDiagrams
    NextHeader
   
    For i = 1 To rcdc.Count
        DoEvents
        Set rcd = rcdc.GetAt(i)
        On Error Resume Next

        If rcd.GetModules().Count > 0 Then
           NextHeader
           OutStr "Модули"
           Header

            For k = 1 To rcd.GetModules().Count
              If rcd.GetModules().GetAt(k).ParentSubsystem.Name = C.Name Then
                  Set rmod = rcd.GetModules().GetAt(k)
              
                  NextHeader
                  OutStr rmod.Name
                  Header
                  PrevHeader
                      
                  If rmod.Type <> "" Then
                    OutStr "(" + rmod.Type + ")"
                  End If

                  If rmod.Documentation <> "" Then
                    OutStr ""
                    OutStr "Описание : "
                    Italic
                    OutStr Plain(rmod.Documentation)
                  End If
                  Dim mm As Long
                  If rmod.GetAssignedClasses.Count > 0 Then
                    OutStr " "
                    OutStr "Реализует интерфейсы"
                    Italic
                    For mm = 1 To rmod.GetAssignedClasses.Count
                      OutStr rmod.GetAssignedClasses.GetAt(mm).Name
                    Next
                  End If
              End If
            Next
            PrevHeader
        End If
        
        OutStr rcd.Name
        Header

        If rcd.Documentation <> "" Then
              OutStr Plain(rcd.Documentation)
        End If

        OutStr " "
        WMFID = WMFID + 1
        rcd.RenderEnhanced WMF(WMFID)
        On Error Resume Next
        
        AddWMF WMFID
        
        Set C2 = C.Subsystems
        For j = 1 To C2.Count
           PrintSubsystem C2.GetAt(j)
        Next

    Next

    PrevHeader2

End Sub


Public Sub PrintDeployment(C As RoseDeploymentDiagram)
   On Error Resume Next
   NextHeader
   OutStr C.Name
   Header
   OutStr " "
   WMFID = WMFID + 1
   C.RenderEnhanced WMF(WMFID)
   AddWMF WMFID
   PrevHeader
End Sub


Sub SaveAllDiagram()
WMFID = 0
Dim rucc As RoseCategoryCollection
Dim i As Integer, j As Integer, k As Integer, ID As Integer
On Error Resume Next
h = -1
wdoc.Paragraphs.Add

NextHeader
OutStr "Техническое задание"
Header


OutStr "Модель Rational Rose: " & rm.Name
Bold

OutStr "Введение"
Header

If rm.Documentation <> "" Then
OutStr Plain(rm.Documentation)
End If


OutStr "Описание"
Header


' Use Case
h = -2
PrintCategory rm.RootUseCaseCategory
DoEvents
PageBreak

' Logical View
h = -2
PrintCategory rm.RootCategory
DoEvents
PageBreak

'Component View
h = -2
PrintSubsystem rm.RootSubsystem
DoEvents
PageBreak

'Deployment
h = -2
PrintDeployment rm.DeploymentDiagram
DoEvents


End Sub



Sub MakeDocument()
        Dim fn As String
        
        On Error GoTo err2
        Set wrd = CreateObject("Word.Application")
        On Error GoTo err1
        
       
        cdlg.Filter = "Документ|*.doc"
        cdlg.FileName = PrevWord
        cdlg.ShowOpen
        fn = cdlg.FileName

        PrevWord = fn
        SaveSetting App.Title, "Recent", "LastWord", fn
        
        wrd.Visible = True
        'wrd.Visible = False
        wrd.Documents.Add
        wrd.ScreenUpdating = False
        Me.SetFocus
        DoEvents
        Set wdoc = wrd.ActiveDocument
        
        On Error Resume Next
        Kill fn
        On Error GoTo err1
        Me.MousePointer = vbHourglass
        wdoc.SaveAs fn
        
        DoEvents
        SaveAllDiagram
        
        h = -1
        NextHeader
        OutStr "Лист изменений"
        Header
        
        Dim SP As Long, EP As Long
        SP = wdoc.Paragraphs.Count
        OutStr "№" & vbTab & "Дата" & vbTab & "Описание  изменения" & vbTab & "Подпись"

        
        EP = wdoc.Paragraphs.Count
        MakeTable SP, EP, EP - SP + 1, 4
        
        
        
        
        OutStr ""
        OutStr "Утверждено:"
        Underline
        Italic
        Bold
        
        RightAlign
        OutStr "Руководитель проекта: / Фамилия  И.О. ./      _______________"
        RightAlign
        OutStr ""
        RightAlign
        
        
        OutStr "Согласовано:"
        RightAlign
        Underline
        Italic
        Bold
        
        
        OutStr "Ведущий разработчик: / Фамилия И.О. /     _______________"
        RightAlign
        OutStr "Разработчик: / Фамилия И.О. /     _______________"
        RightAlign

        

        ' Вставляем оглавление
        Dim myRange As Word.Range
        
        Set myRange = wdoc.Range(0, 0)
        wdoc.TablesOfContents.Add Range:=myRange, _
        UseFields:=False, UseHeadingStyles:=True, LowerHeadingLevel:=9, _
        UpperHeadingLevel:=1

        wdoc.Close -1
        Set wdoc = Nothing
        wrd.ScreenUpdating = True
        wrd.Visible = False
        wrd.Quit
        Set wrd = Nothing
        
        On Error Resume Next
        ' Locked By MS Word ....
        Kill App.Path & "\TMPWMF*.wmf"
        Me.MousePointer = vbNormal
        Exit Sub
err1:
        
        Resume err2
err2:
        Err.Clear
        On Error Resume Next
        wdoc.Close -1
        Set wrd = Nothing
        Kill App.Path & "\TMPWMF*.wmf"
        Me.MousePointer = vbNormal
End Sub

' вставка картинки в документ
Private Sub AddWMF(WMFID As Long)
  OutStr " "
  wdoc.Paragraphs(wdoc.Paragraphs.Count - 1).Range.InlineShapes.AddPicture FileName:=WMF(WMFID), LinkToFile:=False, SaveWithDocument:=True, Range:=wdoc.Paragraphs(wdoc.Paragraphs.Count - 1).Range
  OutStr " "
End Sub

'оформить группу параграфов как таблицу (3 колонки)
Private Sub MakeTable(ByVal SP As Long, ByVal EP As Long, ByVal NRow As Long, Optional ByVal NCol As Long = 3)
  Dim Range As Word.Range
  Set Range = wdoc.Range(wdoc.Paragraphs(SP).Range.Start, wdoc.Paragraphs(EP).Range.End)
  Range.ConvertToTable Separator:=wdSeparateByTabs, NumColumns:=NCol, _
  NumRows:=NRow, Format:=wdTableFormatNone, ApplyBorders:=True, ApplyShading:= _
  True, ApplyFont:=True, ApplyColor:=True, ApplyHeadingRows:=True, _
  ApplyLastRow:=False, ApplyFirstColumn:=True, ApplyLastColumn:=False, _
  AutoFit:=True, AutoFitBehavior:=wdAutoFitFixed
End Sub

Private Sub cmdClose_Click()
  On Error Resume Next
  Set rm = Nothing
  rose.CurrentModel.Save
  rose.CurrentModel.Unload
  rose.Visible = False
  rose.Exit
  Set rose = Nothing
  State.FillColor = RGB(255, 0, 0)
  PrevColor = State.FillColor
  Blink = False
  
  Command1.Enabled = False
  Command2.Enabled = False
  Command3.Enabled = False
  Command4.Enabled = False
  Command5.Enabled = False
  Command6.Enabled = False
  Command7.Enabled = False
  Command8.Enabled = False
  cmdClose.Enabled = False
  cmdMTZ_Rose.Enabled = False
  cmdRose_MTZ.Enabled = False
  cmdOpen.Enabled = True
  cmdfile.Enabled = True
  txtModel.Enabled = True
  
  
End Sub

Private Sub cmdfile_Click()
On Error GoTo bye
cdlg.FileName = txtModel


cdlg.Filter = "Модель|*.mdl"
cdlg.ShowOpen
txtModel = cdlg.FileName
bye:
End Sub

Private Sub cmdMTZ_Rose_Click()
 On Error GoTo bye
Dim f As frmLogin
    If MsgBox("Построить полную диаграмму?", vbYesNo, "Внимание!") = vbYes Then
        bBuildFullDiagramm = True
    Else
        bBuildFullDiagramm = False
    End If
  Set f = New frmLogin
again:
  f.Show vbModal
  If Not f.OK Then Exit Sub
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
  FillMTZModel
  m.GetSession(site).Logout
  Set m = Nothing
  Exit Sub
bye:
  MsgBox Err.Description
End Sub

Private Sub cmdOpen_Click()
  On Error GoTo bye
  Set rose = New RationalRose.RoseApplication
  rose.Visible = True
  rose.OpenModel txtModel
  SaveSetting App.Title, "Recent", "LastFile", txtModel
  
  Set rm = rose.CurrentModel
  State.FillColor = RGB(0, 255, 0)
  PrevColor = State.FillColor
  Blink = False
  Command1.Enabled = True
  Command2.Enabled = True
  Command3.Enabled = True
  Command4.Enabled = True
  Command5.Enabled = True
  Command6.Enabled = True
  Command7.Enabled = True
  Command8.Enabled = True
  cmdMTZ_Rose.Enabled = True
  cmdRose_MTZ.Enabled = True
  cmdClose.Enabled = True
  cmdfile.Enabled = False
  cmdOpen.Enabled = False
  txtModel.Enabled = False
  Exit Sub
bye:
  MsgBox Err.Description
End Sub

Private Sub cmdRose_MTZ_Click()
On Error GoTo bye
Dim sc As RoseCategoryCollection
Dim cat As RoseCategory
Set sc = rose.CurrentModel.GetSelectedCategories()
'If sc.Count > 1 Then
'  MsgBox "Надо выбрать одну категорию"
'End If
Set cat = sc.GetAt(1)
If cat.Stereotype <> "Документ" And cat.Stereotype <> "Приложение" Then
  MsgBox "Надо выбрать категорию со стереотипом <<Документ>> или <<Приложение>>"
End If

Dim f As frmLogin
  Set f = New frmLogin
again:
  f.Show vbModal
  If Not f.OK Then Exit Sub
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
  If cat.Stereotype = "Приложение" Then
    Dim cat2 As RoseCategory, i As Long
    For i = 1 To cat.Categories.Count
      Set cat2 = cat.Categories.GetAt(i)
      If cat2.Stereotype = "Документ" Then
        ExportMTZModel cat2
      End If
    Next
  End If
  If cat.Stereotype = "Документ" Then
    ExportMTZModel cat
  End If
  
  
  m.GetSession(site).Logout
  Set m = Nothing
  Exit Sub
bye:
  MsgBox Err.Description
  Set m = Nothing
  
End Sub

Private Sub ExportMTZModel(cat As RoseCategory)
On Error GoTo bye
'Dim sc As RoseCategoryCollection
'Dim cat As RoseCategory
Dim ot As OBJECTTYPE
Dim meta As mtzmetamodel.Application
Dim i As Long, j As Long, k As Long
Dim cls As RoseClass
  
Set rs = m.ListInstances("", "MTZMetaModel")
Set meta = m.GetInstanceObject(rs!InstanceID)

'Set sc = rose.CurrentModel.GetSelectedCategories()
'Set cat = sc.GetAt(1)
'

Set ot = TypeByName(cat.Name, meta)

If ot Is Nothing Then
  Set ot = meta.OBJECTTYPE.Add()
  ot.Name = cat.Name
  ot.the_comment = cat.Documentation
  Set ot.Package = AppByName(cat.ParentCategory.Name, meta)
End If

ot.IsSingleInstance = cat.Global
ot.Save

Dim p As Part
Dim f As mtzmetamodel.Field
Dim ft As mtzmetamodel.FIELDTYPE
Dim att As RoseAttribute
Dim iis As InfoItems
Dim ii As InfoItem
Dim cntr As New InfoItems

Set iis = New InfoItems
For i = 1 To cat.Classes.Count
  Set cls = cat.Classes.GetAt(i)
  iis.Add cls, cls.Name

Next

For i = 1 To cat.Classes.Count
  Set cls = cat.Classes.GetAt(i)
  For j = 1 To cls.GetHasRelations.Count
    iis.Item(cls.GetHasRelations.GetAt(j).GetSupplier.Name).Count = iis.Item(cls.GetHasRelations.GetAt(j).GetSupplier.Name).Count + 1
  Next
Next


For i = 1 To cat.Classes.Count
  Set cls = cat.Classes.GetAt(i)
  If iis.Item(cls.Name).Count = 0 Then
    Set p = Nothing
    Set p = PartByName(cls.Name, ot)
    If p Is Nothing Then
      Set p = ot.Part.Add()
      p.Name = cls.Name
      p.sequence = GetNewSequence(ot.Part)
    End If
    
    p.the_comment = IIf(Trim(cls.Documentation & "") = "", cls.Name, cls.Documentation)
    p.Caption = IIf(Trim(cls.Documentation & "") = "", cls.Name, cls.Documentation)
    
    If cls.Stereotype = "Дерево" Then
      p.PartType = PartType_Derevo
    ElseIf cls.Stereotype = "Строка" Then
      p.PartType = PartType_Stroka
    Else
      p.PartType = PartType_Kollekciy
    End If
    p.Save
    
    For j = 1 To cls.Attributes.Count
      Set att = cls.Attributes.GetAt(j)
      Set f = Nothing
      
      Set f = FieldByName(att.Name, p)
      If f Is Nothing Then
        Set f = p.Field.Add()
        f.Name = att.Name
        f.sequence = GetNewSequence(p.Field)
      End If
      If Trim(att.Documentation & "") = "" Then
         f.Caption = att.Name
      Else
        f.Caption = att.Documentation
      End If
      
      If att.Stereotype <> "" Then
        f.DataSize = Val(att.Stereotype)
      End If
      MakeFieldType f, att
      If UCase(att.InitValue) = "NULL" Then
        f.AllowNull = Boolean_Da
      End If
      If att.ExportControl.Name = "PublicAccess" Then
        f.IsBrief = Boolean_Da
      Else
        f.IsBrief = Boolean_Net
      End If
      f.Save
    Next
    AddSuppliers ot, p, cat, cls
  End If
Next
Exit Sub
bye:
  MsgBox Err.Description
End Sub

Private Sub AddSuppliers(ot As OBJECTTYPE, p2 As Part, cat As RoseCategory, cls As RoseClass)
On Error GoTo bye
Dim i As Long, j As Long
Dim p As Part, f As mtzmetamodel.Field
Dim att As RoseAttribute
Dim cls2 As RoseClass
For i = 1 To cls.GetHasRelations.Count
  Set cls2 = cls.GetHasRelations.GetAt(i).GetSupplierClass
  Set p = Nothing
  Set p = PartByName(cls2.Name, ot)
  If p Is Nothing Then
    Set p = p2.Part.Add()
    p.Name = cls2.Name
    p.sequence = GetNewSequence(p2.Part)
  End If
  If Trim(cls2.Documentation & "") = "" Then
    p.Caption = cls2.Name
  Else
    p.Caption = cls2.Documentation
  End If
  If cls2.Stereotype = "Дерево" Then
    p.PartType = PartType_Derevo
  ElseIf cls2.Stereotype = "Строка" Then
    p.PartType = PartType_Stroka
  Else
    p.PartType = PartType_Kollekciy
  End If
  p.the_comment = cls2.Documentation
  p.Save
  
  For j = 1 To cls2.Attributes.Count
    Set att = cls2.Attributes.GetAt(j)
    Set f = Nothing
    Set f = FieldByName(att.Name, p)
    If f Is Nothing Then
      Set f = p.Field.Add()
      f.Name = att.Name
      f.sequence = GetNewSequence(p.Field)
    End If
    If Trim(att.Documentation & "") <> "" Then
      f.Caption = att.Documentation
    Else
      f.Caption = att.Name
    End If
    If att.Stereotype <> "" Then
      f.DataSize = Val(att.Stereotype)
    End If
    MakeFieldType f, att
    If UCase(att.InitValue) = "NULL" Then
      f.AllowNull = Boolean_Da
    End If
    If att.ExportControl.Name = "PublicAccess" Then
      f.IsBrief = Boolean_Da
    Else
      f.IsBrief = Boolean_Net
    End If
    
    f.Save
  Next
  AddSuppliers ot, p, cat, cls2
Next
Exit Sub
bye:
  MsgBox Err.Description
  'Resume
End Sub


Private Sub Command1_Click()
State.FillColor = vbYellow
PrevColor = State.FillColor
Blink = False
Command1.Enabled = False
Command2.Enabled = False
Command3.Enabled = False
Command4.Enabled = False
Command5.Enabled = False
Command6.Enabled = False
Command7.Enabled = False
Command8.Enabled = False
cmdMTZ_Rose.Enabled = False
cmdRose_MTZ.Enabled = False
cmdClose.Enabled = False
MakeDocument
State.FillColor = RGB(0, 255, 0)
PrevColor = State.FillColor
Blink = False
cmdMTZ_Rose.Enabled = True
cmdRose_MTZ.Enabled = True
Command1.Enabled = True
Command2.Enabled = True
Command3.Enabled = True
Command4.Enabled = True
Command5.Enabled = True
Command6.Enabled = True
Command7.Enabled = True
Command8.Enabled = True
cmdClose.Enabled = True
lbnInfo.Caption = ""
End Sub


Sub CopyClsAttr(DestCls As RoseClass, TargCls As RoseClass)
  Dim a As RoseAttribute, i As Long
  Dim B As RoseAttribute
  On Error GoTo bye
  For i = 1 To DestCls.Attributes.Count
    Set a = DestCls.Attributes.GetAt(i)
    Set B = TargCls.AddAttribute(a.Name, a.Type, a.InitValue & "")
    B.Documentation = a.Documentation & ""
    B.Stereotype = a.Stereotype & ""
    B.ExportControl.Name = a.ExportControl.Name
  Next
  Exit Sub
bye:
  MsgBox Err.Description
End Sub

Sub CopyClsOp(DestCls As RoseClass, TargCls As RoseClass)
  Dim a As RoseOperation, i As Long, j As Long
  Dim B As RoseParameter, op As RoseOperation
  On Error GoTo bye
  For i = 1 To DestCls.Operations.Count
    Set a = DestCls.Operations.GetAt(i)
    With TargCls.AddOperation(a.Name, a.ReturnType)
      .Stereotype = a.Stereotype
      .ExportControl.Name = a.ExportControl.Name
      .Documentation = a.Documentation
      For j = 1 To a.Parameters.Count
       Set B = a.Parameters.GetAt(j)
       .AddParameter(B.Name, B.Type, "", j).Documentation = B.Documentation
      Next
    End With
    
    
  Next
  Exit Sub
bye:
  MsgBox Err.Description
End Sub


Sub TransCls(DestCls As RoseClass)
  Dim a As RoseAttribute, i As Long
  Dim p As RoseOperation
  
  
  
  On Error GoTo bye
  If DestCls.Documentation = "" Then
    DestCls.Documentation = DestCls.Name
  End If
  DestCls.Name = MakeValidName(DestCls.Name)
  
  For i = 1 To DestCls.Attributes.Count
    Set a = DestCls.Attributes.GetAt(i)
    If a.Documentation = "" Then
      a.Documentation = a.Name
    End If
    a.Name = MakeValidName(a.Name)
  Next
  
  For i = 1 To DestCls.Operations.Count
    Set p = DestCls.Operations.GetAt(i)
    If p.Documentation = "" Then
      p.Documentation = p.Name
    End If
    p.Name = MakeValidName(p.Name)
  Next
  Exit Sub
  
bye:
  MsgBox Err.Description
End Sub

Private Sub Command2_Click()
  On Error Resume Next
  Dim DestCls As RoseClass
  Dim TargCls As RoseClass
  Dim OK As Boolean
  OK = True
  While OK
  If MsgBox("Выбирете класс ИЗ которого будем копировать", vbOKCancel, "Копирование") = vbOK Then
    If rm.GetSelectedClasses.Count > 0 Then
      Set DestCls = rm.GetSelectedClasses.GetAt(1)
      If MsgBox("Выбирете класс В который будем копировать", vbOKCancel, "Копирование") = vbOK Then
        If rm.GetSelectedClasses.Count > 0 Then
          Set TargCls = rm.GetSelectedClasses.GetAt(1)
          CopyClsAttr DestCls, TargCls
          
        Else
          OK = False
        End If
      Else
        OK = False
      End If
     Else
      OK = False
    End If
  Else
    OK = False
  End If
  Wend
End Sub

Private Sub Command3_Click()
  On Error Resume Next
  Dim DestCls As RoseClass
  Dim TargCls As RoseClass
  Dim OK As Boolean
  OK = True
  While OK
  If MsgBox("Выбирете класс ИЗ которого будем копировать", vbOKCancel, "Копирование") = vbOK Then
    If rm.GetSelectedClasses.Count > 0 Then
      Set DestCls = rm.GetSelectedClasses.GetAt(1)
      If MsgBox("Выбирете класс В который будем копировать", vbOKCancel, "Копирование") = vbOK Then
        If rm.GetSelectedClasses.Count > 0 Then
          Set TargCls = rm.GetSelectedClasses.GetAt(1)
          CopyClsOp DestCls, TargCls
        Else
          OK = False
        End If
      Else
        OK = False
      End If
     Else
      OK = False
    End If
  Else
    OK = False
  End If
  Wend
End Sub

Private Sub Command4_Click()
  On Error Resume Next
  Dim DestCls As RoseClass
  Dim TargCls As RoseClass
  Dim OK As Boolean
  OK = True
  While OK
  If MsgBox("Выбирете класс ИЗ которого будем копировать", vbOKCancel, "Копирование") = vbOK Then
    If rm.GetSelectedClasses.Count > 0 Then
      Set DestCls = rm.GetSelectedClasses.GetAt(1)
      If MsgBox("Выбирете класс В который будем копировать", vbOKCancel, "Копирование") = vbOK Then
        If rm.GetSelectedClasses.Count > 0 Then
          Set TargCls = rm.GetSelectedClasses.GetAt(1)
          CopyClsAttr DestCls, TargCls
          CopyClsOp DestCls, TargCls
        Else
          OK = False
        End If
      Else
        OK = False
      End If
     Else
      OK = False
    End If
  Else
    OK = False
  End If
  Wend

End Sub

Private Sub Command5_Click()
  On Error Resume Next
  Dim DestCls As RoseClass
  Dim OK As Boolean
  OK = True
  While OK
  If MsgBox("Выбирете класс который надо комментировать", vbOKCancel, "Комментирование") = vbOK Then
    If rm.GetSelectedClasses.Count > 0 Then
      Set DestCls = rm.GetSelectedClasses.GetAt(1)
      Dim f As Form2
      Set f = New Form2
      Set f.cCls = DestCls
      'f.Init
      f.Show vbModal, Me
     Else
      OK = False
    End If
  Else
    OK = False
  End If
  Wend

End Sub

Private Sub Command6_Click()
  On Error Resume Next
  Dim DestCls As RoseClass
  Dim OK As Boolean, i As Long
  OK = True
  While OK
  If MsgBox("Выбирете класс(ы) который надо Транслитерировать", vbOKCancel, "Комментирование") = vbOK Then
    If rm.GetSelectedClasses.Count > 0 Then
      For i = 1 To rm.GetSelectedClasses.Count
        Set DestCls = rm.GetSelectedClasses.GetAt(i)
        TransCls DestCls
      Next
     Else
      OK = False
    End If
  Else
    OK = False
  End If
  Wend
End Sub

Private Sub Command7_Click()
Dim f As Dialog
Set f = New Dialog
Set f.m = rm
f.Show vbModal, Me
End Sub

Private Sub Command8_Click()
  On Error Resume Next
  Dim DestCls As RoseClass
  Dim TargCls As RoseClass
  Dim OK As Boolean
  OK = True
  While OK
  If MsgBox("Выбирете класс родительского раздела", vbOKCancel, "Установка подчиненности") = vbOK Then
    If rm.GetSelectedClasses.Count > 0 Then
      Set DestCls = rm.GetSelectedClasses.GetAt(1)
      If MsgBox("Выбирете класс дочернего раздела", vbOKCancel, "Установка подчиненности") = vbOK Then
        If rm.GetSelectedClasses.Count > 0 Then
          Set TargCls = rm.GetSelectedClasses.GetAt(1)
          Call DestCls.AddHas(TargCls.Name, TargCls.Name)
            
        Else
          OK = False
        End If
      Else
        OK = False
      End If
     Else
      OK = False
    End If
  Else
    OK = False
  End If
  Wend
End Sub

Private Sub Form_Load()
  LoadWords
  Timer1.Enabled = True
  txtModel = GetSetting(App.Title, "Recent", "LastFile", "")
  PrevWord = GetSetting(App.Title, "Recent", "LastWord", "")
End Sub

Private Sub Form_Unload(Cancel As Integer)
  cmdClose_Click
  On Error Resume Next
  wrd.Quit
  Set wrd = Nothing
End Sub

Private Sub Timer1_Timer()
Dim R As Long, G As Long, B As Long

If Not Blink Then
  PrevColor = State.FillColor
  State.FillColor = State.FillColor / 8 * 7 'RGB(192, 192, 192)
Else
  State.FillColor = PrevColor
End If
Blink = Not Blink

End Sub


Sub FillMTZModel()
  On Error GoTo bye
  Dim cat As RoseCategory
  Dim tcat As RoseCategory
  Dim pcat As RoseCategory
  Dim ot As OBJECTTYPE
  Dim meta As mtzmetamodel.Application
  Dim i As Long, j As Long, k As Long
  Dim cls As RoseClass
  
  Set rs = m.ListInstances("", "MTZMetaModel")
  Set meta = m.GetInstanceObject(rs!InstanceID)
  Set cat = rose.CurrentModel.RootCategory
  cat.Stereotype = "Модель"
  
  Set pcat = cat.AddCategory("Типы полей")
  pcat.Stereotype = "Типы"
  Set cls = pcat.AddClass("Object")
  cls.Stereotype = "Ссылка"
  cls.Documentation = "Ссылка на любой документ"
  
  Set cls = pcat.AddClass("Row")
  cls.Stereotype = "Ссылка"
  cls.Documentation = "Ссылка на строку документа. Используется для некорректных определений ссылки"

  
  
  For i = 1 To meta.FIELDTYPE.Count
    FillMTZType pcat, meta.FIELDTYPE.Item(i)
  Next
  Dim RootKC As RoseClassDiagram
  
  
  If bBuildFullDiagramm Then
    Set FullKC = cat.AddClassDiagram("Full")
  End If
  
  For i = 1 To meta.MTZAPP.Count
    Set pcat = cat.AddCategory(meta.MTZAPP.Item(i).Name)
    pcat.Stereotype = "Приложение"
    pcat.Documentation = MakeDocInfo(meta.MTZAPP.Item(i).Name, meta.MTZAPP.Item(i).TheComment)
    
    Set RootKC = cat.ClassDiagrams.GetFirst("Main")
    If RootKC Is Nothing Then
        Set RootKC = cat.AddClassDiagram("Main")
    End If
    Debug.Print RootKC.AddCategory(pcat)
  Next
  RootKC.AutosizeAll
  RootKC.Layout
  
  Dim kc As RoseClassDiagram
  For i = 1 To meta.OBJECTTYPE.Count
    Set pcat = cat.GetAllCategories().GetAt(cat.GetAllCategories().FindFirst(meta.OBJECTTYPE.Item(i).Package.Name))
    Set tcat = pcat.AddCategory(meta.OBJECTTYPE.Item(i).Name)
    
    Set kc = pcat.ClassDiagrams.GetFirst("Main")
    If kc Is Nothing Then
        Set kc = pcat.AddClassDiagram("Main")
    End If
    Call kc.AddCategory(tcat)
    tcat.Stereotype = "Документ"
    tcat.Documentation = MakeDocInfo(meta.OBJECTTYPE.Item(i).the_comment, meta.OBJECTTYPE.Item(i).TheComment)
    If meta.OBJECTTYPE.Item(i).IsSingleInstance Then
      tcat.Global = True
    End If
    Dim tkc As RoseClassDiagram
    Set tkc = tcat.AddClassDiagram("Main")
    Dim DocClass As RoseClass
    
    Set DocClass = FillDocRoot(tcat, meta.OBJECTTYPE.Item(i), tkc)
     
    For j = 1 To meta.OBJECTTYPE.Item(i).Part.Count
      FillMTZPart tcat, meta.OBJECTTYPE.Item(i).Part.Item(j), DocClass, tkc
    Next
    
    If meta.OBJECTTYPE.Item(i).OBJSTATUS.Count > 0 Then
    Dim tsd As RoseStateDiagram
    Dim rst As RoseState

    If DocClass.StateMachine Is Nothing Then
      DocClass.CreateStateMachine
    End If

    If DocClass.StateMachine.GetAllDiagrams.Count > 0 Then
      Set tsd = DocClass.StateMachine.GetAllDiagrams.GetAt(1)
      tsd.Name = "Состояния документа " & meta.OBJECTTYPE.Item(i).Name
    Else
      Set tsd = DocClass.StateMachine.GetAllDiagrams.AddStateChartDiagram("Состояния документа " & meta.OBJECTTYPE.Item(i).Name)
    End If

    Dim s1 As RoseState
    Dim s2 As RoseState
    Dim rtr As RoseTransition

    For j = 1 To meta.OBJECTTYPE.Item(i).OBJSTATUS.Count
      Set s1 = DocClass.StateMachine.AddState(meta.OBJECTTYPE.Item(i).OBJSTATUS.Item(j).Name)
    Next


    For j = 1 To meta.OBJECTTYPE.Item(i).OBJSTATUS.Count
      Set s1 = DocClass.StateMachine.States.GetAt(j)
      tsd.AddStateView s1
    Next

    For j = 1 To meta.OBJECTTYPE.Item(i).OBJSTATUS.Count
      Set s1 = DocClass.StateMachine.States.GetAt(j)
      For k = 1 To meta.OBJECTTYPE.Item(i).OBJSTATUS.Item(j).NEXTSTATE.Count
        Set s2 = DocClass.StateMachine.States.GetAt(DocClass.StateMachine.States.FindFirst(meta.OBJECTTYPE.Item(i).OBJSTATUS.Item(j).NEXTSTATE.Item(k).TheState.Name))
        If Not s2 Is Nothing Then
          Set rtr = s1.AddTransition("переход", s2)

        End If
      Next
    Next
    tsd.AutosizeAll
    tsd.Layout



    End If
    tkc.AutosizeAll
    tkc.Layout
    
    
        
  Next
  
  kc.AutosizeAll
  kc.Layout
  
  FullKC.AutosizeAll
  FullKC.Layout
  
  If bBuildFullDiagramm Then
    LinkClasses FullKC, lbnInfo
    'FullKC.AutosizeAll
    'FullKC.Layout
  End If
  
  Exit Sub
bye:
  MsgBox Err.Description
End Sub


Sub FillMTZType(cat As RoseCategory, ft As mtzmetamodel.FIELDTYPE)
  On Error GoTo bye
  Dim j As Long, i As Long
  Dim cls As RoseClass
  Dim att As RoseAttribute
  Set cls = cat.AddClass(ft.Name)
  If ft.TypeStyle = TypeStyle_Interval Then
    cls.Stereotype = "Интервал"
    Call cls.AddAttribute("Minimum", "Integer", ft.Minimum)
    Call cls.AddAttribute("Maximum", "Integer", ft.Maximum)
  End If
  If ft.TypeStyle = TypeStyle_Perecislenie Then
    cls.Stereotype = "Перечисление"
    For i = 1 To ft.ENUMITEM.Count
      Set att = cls.AddAttribute(ft.ENUMITEM.Item(i).Name, "integer", ft.ENUMITEM.Item(i).NameValue)
      att.Documentation = ft.ENUMITEM.Item(i).Name
    Next
  End If
  
  If ft.TypeStyle = TypeStyle_Skalyrniy_tip Then
    cls.Stereotype = "Скалярный тип"
  End If
  
  If ft.TypeStyle = TypeStyle_Ssilka Then
    cls.Stereotype = "Ссылка"
  End If
  
  If ft.TypeStyle = TypeStyle_Viragenie Then
    cls.Stereotype = "Выражение"
  End If
    
  cls.Documentation = ft.the_comment
  Exit Sub
bye:
  MsgBox Err.Description
End Sub


Sub FillMTZPart(cat As RoseCategory, p As mtzmetamodel.Part, parent As RoseClass, tkc As RoseClassDiagram)
  On Error GoTo bye
  Dim j As Long, i As Long, f As mtzmetamodel.Field, ft As mtzmetamodel.FIELDTYPE
  Dim cls As RoseClass
  Dim att As RoseAttribute
  Set cls = cat.AddClass(p.Name)
  If p.PartType = PartType_Derevo Then cls.Stereotype = "Дерево"
  If p.PartType = PartType_Kollekciy Then cls.Stereotype = "Коллекция"
  If p.PartType = PartType_Stroka Then cls.Stereotype = "Строка"
  cls.Documentation = MakeDocInfo(p.Caption, p.the_comment)
  
  If Not parent Is Nothing Then
    Call parent.AddHas(cls.Name, cls.Name)
  End If
  
  
  For i = 1 To p.Field.Count
   Set f = p.Field.Item(i)
   Set ft = f.FIELDTYPE
   If ft Is Nothing Then
      If f.AllowNull Then
        Set att = cls.AddAttribute(f.Name, "NONE", "NULL")
      Else
        Set att = cls.AddAttribute(f.Name, "NONE", "")
      End If
   
   ElseIf ft.TypeStyle = TypeStyle_Ssilka Then
    If f.ReferenceType = ReferenceType_Na_ob_ekt_ Then
     If f.RefToType Is Nothing Then
      If f.AllowNull Then
        Set att = cls.AddAttribute(f.Name, "Object", "NULL")
      Else
        Set att = cls.AddAttribute(f.Name, "Object", "")
      End If
     Else
      If f.AllowNull Then
        Set att = cls.AddAttribute(f.Name, f.RefToType.Name, "NULL")
      Else
        Set att = cls.AddAttribute(f.Name, f.RefToType.Name, "")
      End If
     End If
    
    ElseIf f.ReferenceType = ReferenceType_Na_stroku_razdela Then
         
    If f.RefToPart Is Nothing Then
      If f.AllowNull Then
        Set att = cls.AddAttribute(f.Name, "Row", "NULL")
      Else
        Set att = cls.AddAttribute(f.Name, "Row", "")
      End If
     Else
      If f.AllowNull Then
        Set att = cls.AddAttribute(f.Name, f.RefToPart.Name, "NULL")
      Else
        Set att = cls.AddAttribute(f.Name, f.RefToPart.Name, "")
      End If
     End If
    Else
      If f.AllowNull Then
        Set att = cls.AddAttribute(f.Name, f.FIELDTYPE.Name, "NULL")
      Else
        Set att = cls.AddAttribute(f.Name, f.FIELDTYPE.Name, "")
      End If
    End If
    
   Else
    If f.AllowNull Then
      Set att = cls.AddAttribute(f.Name, f.FIELDTYPE.Name, "NULL")
      If ft.AllowSize Then
        att.Stereotype = f.DataSize
      End If
    Else
      Set att = cls.AddAttribute(f.Name, f.FIELDTYPE.Name, "")
      If ft.AllowSize Then
        att.Stereotype = f.DataSize
      End If
    End If
   End If
   att.Documentation = f.Caption
   If f.IsBrief Then
     att.ExportControl.Name = "PublicAccess"
   Else
     att.ExportControl.Name = "PrivateAccess"
   End If
  Next
  
  For j = 1 To p.Part.Count
    FillMTZPart cat, p.Part.Item(j), cls, tkc
  Next
  
  tkc.AddClass cls
  If bBuildFullDiagramm Then
    FullKC.AddClass cls
  End If
  Exit Sub
bye:
  MsgBox Err.Description
  'Resume
End Sub


Function FillDocRoot(cat As RoseCategory, t As mtzmetamodel.OBJECTTYPE, tkc As RoseClassDiagram) As RoseClass
  On Error GoTo bye
  Dim j As Long, i As Long, f As mtzmetamodel.Field, ft As mtzmetamodel.FIELDTYPE
  Dim cls As RoseClass
  Dim att As RoseAttribute
  Set cls = cat.AddClass("instance_for_" & t.Name)
  cls.Stereotype = "Корень документа"
  cls.Documentation = MakeDocInfo(t.TheComment, t.the_comment)
  
  Set att = cls.AddAttribute("Name", "String", "NULL")
  att.Documentation = "Название документа"
  Set att = cls.AddAttribute("InstanceID", "ID", "NULL")
  att.Documentation = "Уникальный идентификатор документа"
  Set att = cls.AddAttribute("OBJTYPE", "String", t.Name)
  att.Documentation = "Поле - признак типа документа для этого типа документов равно '" & t.Name & "'"
  Set att = cls.AddAttribute("status", "ID", "NULL")
  att.Documentation = "текущее состояние документа см. MTZMetamodel.OBJSTATUS"
  
  tkc.AddClass cls
  
  If bBuildFullDiagramm Then
    FullKC.AddClass cls
  End If
  Set FillDocRoot = cls
  Exit Function
bye:
  MsgBox Err.Description
End Function

