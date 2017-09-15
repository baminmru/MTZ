VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmSmartArm 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Скоростная подготовка"
   ClientHeight    =   6270
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5925
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6270
   ScaleWidth      =   5925
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox chkbDoNotDeleteAUTO 
      Caption         =   "Оставлять АВТО вьхи"
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   4380
      Value           =   1  'Checked
      Width           =   3375
   End
   Begin VB.CheckBox chkCreateARM 
      Caption         =   "Создавать АРМ"
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   4080
      Value           =   1  'Checked
      Width           =   3375
   End
   Begin VB.CommandButton cmdSelAll 
      Caption         =   "Выбрать все"
      Height          =   315
      Left            =   3330
      TabIndex        =   2
      Top             =   4800
      Width           =   1215
   End
   Begin VB.CommandButton cmdClearAll 
      Caption         =   "Отменить"
      Height          =   315
      Left            =   4650
      TabIndex        =   3
      Top             =   4800
      Width           =   1215
   End
   Begin VB.ListBox lstTypes 
      Height          =   3900
      IntegralHeight  =   0   'False
      Left            =   30
      Sorted          =   -1  'True
      Style           =   1  'Checkbox
      TabIndex        =   0
      Top             =   0
      Width           =   5865
   End
   Begin VB.CommandButton cmdStart 
      Caption         =   "Запуск"
      Height          =   315
      Left            =   60
      TabIndex        =   1
      Top             =   4815
      Width           =   1175
   End
   Begin MSComctlLib.ProgressBar pb 
      Height          =   300
      Left            =   30
      TabIndex        =   4
      Top             =   5250
      Visible         =   0   'False
      Width           =   5820
      _ExtentX        =   10266
      _ExtentY        =   529
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.Label Label1 
      BorderStyle     =   1  'Fixed Single
      Height          =   480
      Left            =   30
      TabIndex        =   5
      Top             =   5655
      Visible         =   0   'False
      Width           =   5850
      WordWrap        =   -1  'True
   End
End
Attribute VB_Name = "frmSmartArm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim col As Collection
Dim ARMName As String

Private Sub cmdClearAll_Click()
Dim i As Long
For i = 0 To lstTypes.ListCount - 1
    lstTypes.Selected(i) = False
Next
End Sub

Private Sub cmdSelAll_Click()
Dim i As Long
For i = 0 To lstTypes.ListCount - 1
    lstTypes.Selected(i) = True
Next
End Sub

Private Sub cmdStart_Click()
  Dim i As Long, j As Long
  Dim cnt As Long
  cnt = 0
  If chkCreateARM.Value = vbChecked Then
    ARMName = InputBox("Название АРМ", "Подготовка АРМ", "АРМ " & Now)
  End If
  cnt = lstTypes.SelCount * 3 + 1
  
  pb.min = 0
  pb.max = cnt
  pb.Value = 0
  pb.Visible = True
  Label1.Visible = True
  For i = 0 To lstTypes.ListCount - 1
    If lstTypes.Selected(i) Then
      MakeType col.item(lstTypes.ItemData(i))
      DoEvents
    End If
  Next
  If chkCreateARM.Value = vbChecked Then
    MakeArm
  End If
  pb.Visible = False
  Label1.Visible = False
  MsgBox "Подготовка АРМа завершена"
End Sub

Private Sub Form_Load()
  lstTypes.Clear
  Set col = New Collection
  model.objectType.Sort = "Comment"
  Dim i As Long
  For i = 1 To model.objectType.Count
    With model.objectType.item(i)
      lstTypes.AddItem .package.Name & "->" & .the_comment
      Call col.Add(model.objectType.item(i), model.objectType.item(i).ID)
      lstTypes.ItemData(lstTypes.NewIndex) = col.Count
    End With
  Next
End Sub

Private Sub MakeType(ot As objectType)

'
pb.Value = pb.Value + 1
Label1.Caption = "Views for type " & ot.Name

ProcessView ot.PART

pb.Value = pb.Value + 1
Label1.Caption = "Journal for type " & ot.Name

ProcessFilter ot


pb.Value = pb.Value + 1
Label1.Caption = "Filter for type " & ot.Name

ProcessJournal ot

End Sub


Private Sub ProcessFilter(ot As objectType)
  Dim p As PART
  Set p = JournalPart(ot)
  Dim pv As PARTVIEW
  Dim i As Long
  Dim f As MTZMetaModel.Field
  Dim ft As FIELDTYPE
  Dim fltr As MTZFltr.Application
  Dim ID As String
  Dim fg As FilterFieldGroup
  
  For i = 1 To p.PARTVIEW.Count
    Set pv = p.PARTVIEW.item(i)
    If UCase(pv.the_Alias) = "AUTO" & UCase(p.Name) Then
      Exit For
    End If
  Next
  
  If pv Is Nothing Then
    MsgBox "Ошибка получения ПартВью для объекта " + ot.Name
    Exit Sub
  End If
  
  Set fltr = FindFilter(ot)
  If Not fltr Is Nothing Then
    ID = fltr.ID
    Manager.DeleteInstance ID
  Else
    ID = CreateGUID2
    
  End If
  Manager.NewInstance ID, "MTZFltr", ot.Name
  Set fltr = Manager.GetInstanceObject(ID)
  
  With fltr.Filters.Add
    .Name = ot.Name
    .TheCaption = "Фильтр для " & ot.the_comment
    .TheComment = ot.TheComment
    .Save
  End With
  
  Set fg = fltr.FilterFieldGroup.Add
  With fg
    .Name = "fGroup"
    .Caption = p.Caption
    .Save
  End With
  
  Dim seq As Long
  seq = 0
  
  pv.ViewColumn.Sort = "sequence"
  
  For i = 1 To pv.ViewColumn.Count
  
    Set f = pv.ViewColumn.item(i).Field
    Set ft = f.FIELDTYPE
    If ft.TypeStyle <> TypeStyle_Element_oformleniy Then
      If ft.GridSortType = ColumnSortType_As_Date Then
        
        With fg.FileterField.Add
          .sequence = seq
          .Name = f.Name & "_GE"
          .Caption = f.Caption & " C"
          Set .FIELDTYPE = ft
          .RefType = f.ReferenceType
          Set .RefToPart = f.RefToPart
          Set .RefToType = f.RefToType
          .ValueArray = Boolean_Net
          .FieldSize = f.DataSize
          seq = seq + 1
          .Save
        End With
          
        With fg.FileterField.Add
          .sequence = seq
          .Name = f.Name & "_LE"
          .Caption = f.Caption & " по"
          Set .FIELDTYPE = ft
          .RefType = f.ReferenceType
          Set .RefToPart = f.RefToPart
          Set .RefToType = f.RefToType
          .ValueArray = Boolean_Net
          .FieldSize = f.DataSize
          seq = seq + 1
          .Save
        End With
  
      End If
      
      If ft.GridSortType = ColumnSortType_As_Numeric Then
        With fg.FileterField.Add
          .sequence = seq
          .Name = f.Name & "_GE"
          .Caption = f.Caption & " больше или равно"
          Set .FIELDTYPE = ft
           .RefType = f.ReferenceType
          Set .RefToPart = f.RefToPart
          Set .RefToType = f.RefToType
          .ValueArray = Boolean_Net
          .FieldSize = f.DataSize
          seq = seq + 1
          .Save
        End With
        With fg.FileterField.Add
          .sequence = seq
          .Name = f.Name & "_LE"
          .Caption = f.Caption & " меньше или равно"
          Set .FIELDTYPE = ft
          .RefType = f.ReferenceType
          Set .RefToPart = f.RefToPart
          Set .RefToType = f.RefToType
          .ValueArray = Boolean_Net
          .FieldSize = f.DataSize
          seq = seq + 1
          .Save
        End With
  
      End If
      
      If ft.GridSortType = ColumnSortType_As_String Then
  '      If ft.TypeStyle = TypeStyle_Ssilka Then
  '
  '      Else
  '
  '      End If
  
        With fg.FileterField.Add
            .sequence = seq
            .Name = f.Name
            .Caption = f.Caption
            Set .FIELDTYPE = ft
             .RefType = f.ReferenceType
            Set .RefToPart = f.RefToPart
            Set .RefToType = f.RefToType
            .ValueArray = Boolean_Net
            .FieldSize = f.DataSize
            seq = seq + 1
            .Save
          End With
      End If
      
      
      
  '    With fg.FileterField.Add
  '      .sequence = seq
  '      .Name = f.Name
  '      .Caption = f.Caption
  '      Set .FIELDTYPE = ft
  '      Set .RefType = f.ReferenceType
  '      Set .RefToPart = f.RefToPart
  '      Set .RefToType = f.RefToType
  '      .ValueArray = Boolean_Net
  '      .FieldSize = f.DataSize
  '      seq = seq + 1
  '      .Save
  '    End With
    End If
    
  Next
  
   
   

End Sub


Private Sub ProcessJournal(ot As objectType)
  Dim p As PART
  Dim pv As PARTVIEW
  Set p = JournalPart(ot)
  Dim i As Long
  Dim f As MTZMetaModel.Field
  Dim jr As MTZJrnl.Application
  Dim ID As String
  Dim jsrc As JournalSrc
  Dim jc As JournalColumn
  Dim ft As FIELDTYPE
  
  
  For i = 1 To p.PARTVIEW.Count
    Set pv = p.PARTVIEW.item(i)
    If UCase(pv.the_Alias) = "AUTO" & UCase(p.Name) Then
      Exit For
    End If
  Next
  
  Set jr = FindJournal(ot)
  If Not jr Is Nothing Then
    ID = jr.ID
    Manager.DeleteInstance ID
  Else
    ID = CreateGUID2
  End If
    
  'pv.ViewColumn.item(1).the_Alias
  Manager.NewInstance ID, "MTZJrnl", ot.Name
  Set jr = Manager.GetInstanceObject(ID)
  On Error Resume Next
  With jr.journal.Add
    .Name = ot.the_comment
    .the_Alias = ot.the_comment
    .TheComment = "Журнал для документов типа: " & ot.TheComment
    .Save
  End With
  ID = CreateGUID2
  Set jsrc = jr.JournalSrc.Add(ID)
  With jsrc
    .ViewAlias = pv.the_Alias
    .PARTVIEW = pv.ID
    .OnRun = OnJournalRowClick_Otkrit__dokument
    .OpenMode = ""
    .Save
  End With
  
  pv.ViewColumn.Sort = "sequence"
  
  For i = 1 To pv.ViewColumn.Count
    Set jc = jr.JournalColumn.Add
    With jc
      .sequence = i
      Set f = pv.ViewColumn.item(i).Field
      .Name = f.Caption
      Set ft = f.FIELDTYPE
      .ColSort = ft.GridSortType
      .ColumnAlignment = VHAlignment_Left_Top
      .GroupAggregation = AggregationType_none
      .Save
    End With
    With jc.JColumnSource.Add
      .ViewField = pv.ViewColumn.item(i).the_Alias
      Set .SrcPartView = jsrc
      .Save
    End With
  Next
  
  Dim j As Long
  Dim LastI As Long
  LastI = i
  
  
  
  For j = 1 To pv.PARTVIEW_LNK.Count
    pv.PARTVIEW_LNK.item(j).TheView.ViewColumn.Sort = "sequence"
    For i = 1 To pv.PARTVIEW_LNK.item(j).TheView.ViewColumn.Count
        LastI = LastI + 1
        Set jc = jr.JournalColumn.Add
        With jc
            .sequence = LastI
            Set f = pv.PARTVIEW_LNK.item(j).TheView.ViewColumn.item(i).Field
            .Name = f.Caption
            Set ft = f.FIELDTYPE
            .ColSort = ft.GridSortType
            .ColumnAlignment = VHAlignment_Left_Top
            .GroupAggregation = AggregationType_none
            .Save
        End With
        With jc.JColumnSource.Add
            .ViewField = pv.PARTVIEW_LNK.item(j).TheView.ViewColumn.item(i).the_Alias
            Set .SrcPartView = jsrc
            .Save
        End With
    Next
  Next

End Sub


Private Function JournalPart(ot As objectType) As PART
  Dim p As PART
  Dim i As Long
  If ot.PART.Count = 0 Then Exit Function
  ot.PART.Sort = "sequence"
  For i = 1 To ot.PART.Count
    Set p = ot.PART.item(i)
    If p.PartType = PartType_Stroka Then
      Set JournalPart = p
      Exit Function
    End If
  Next
  Set JournalPart = ot.PART.item(1)
End Function

Private Sub ProcessView(parts As PART_COL)
  Dim p As PART, i As Long, j As Long, k As Long
  Dim vi As ViewItems
  Dim pv As PARTVIEW
  Dim HasDefault As Boolean
  Dim AutoID As String
  For i = 1 To parts.Count
    Set p = parts.item(i)
    AutoID = ""
    For j = 1 To p.PARTVIEW.Count
      Set pv = p.PARTVIEW.item(j)
      If pv.ForChoose = Boolean_Da Then
        HasDefault = True
      End If
      If UCase(pv.the_Alias) = "AUTO" & UCase(p.Name) Then
        AutoID = pv.ID
         If pv.ForChoose = Boolean_Da Then
            HasDefault = False
         End If
      End If
    Next
    
    If chkbDoNotDeleteAUTO.Value = vbUnchecked Then
        If AutoID <> "" Then
          p.PARTVIEW.Delete (AutoID)
        End If
        
        Set viCol = New Collection
        
        p.Field.Sort = "sequence"
        
        For k = 1 To p.Field.Count
          Set vi = New ViewItems
          vi.FieldID = p.Field.item(k).ID
          vi.Aggregation = ""
          viCol.Add vi, CreateGUID2
        Next
        
        NewViewName = p.Caption & " авто"
        NewViewAlias = "AUTO" & p.Name
        
        If p.PartType <> PartType_Derevo Then
          NewForChoose = Not HasDefault
        Else
          NewForChoose = False
        End If
        
        Set BasePart = p
        SaveView 'AutoID
    Else
        Set BasePart = p
    End If
    
    ProcessView p.PART
  Next

End Sub

Private Sub MakeArm()
Dim arm As MTZwp.Application
Dim ID As String
Dim ot As objectType
ID = CreateGUID2
Call Manager.NewInstance(ID, "MTZwp", ARMName)
Set arm = Manager.GetInstanceObject(ID)

pb.Value = pb.Value + 1
Label1.Caption = "Combine WorkPlace "
arm.Name = ARMName
arm.Save

With arm.WorkPlace.Add
  .Name = ARMName
  .Caption = ARMName
  .Save
End With

Dim i As Long
  ' добавили типы
  For i = 0 To lstTypes.ListCount - 1
    If lstTypes.Selected(i) Then
     With arm.ARMTypes.Add
      Set .TheDocumentType = col.item(lstTypes.ItemData(i))
      .Save
     End With
    End If
  Next
  
  ' Формируем Меню
   
  Dim dicMenu As MTZwp.EntryPoints
  Dim jrnlMenu As MTZwp.EntryPoints
  
  Set dicMenu = arm.EntryPoints.Add
  dicMenu.Name = "mnuDictionary"
  dicMenu.TheComment = "Меню для справочников"
  dicMenu.Caption = "Справочники"
  dicMenu.ActionType = MenuActionType_Nicego_ne_delat_
  dicMenu.Save
  
  Set jrnlMenu = arm.EntryPoints.Add
  jrnlMenu.Name = "mnuJRNL"
  jrnlMenu.Caption = "Журналы"
  jrnlMenu.TheComment = " "
  jrnlMenu.ActionType = MenuActionType_Nicego_ne_delat_
  jrnlMenu.Save
  'dicmenu.
   
  Dim mseq As Long
  mseq = 1
  For i = 0 To lstTypes.ListCount - 1
    If lstTypes.Selected(i) Then
     
      Set ot = col.item(lstTypes.ItemData(i))
      If ot.IsSingleInstance = Boolean_Da Then
        With dicMenu.EntryPoints.Add
          .sequence = mseq
          mseq = mseq + 1
          .Name = "mnu" & ot.Name
          .Caption = ot.the_comment
          .ActionType = MenuActionType_Otkrit__dokument
          Set .objectType = ot
          .Save
        End With
        
      Else
      
        ' сразу можно сделать журналы по состояниям  ???
        
        If ot.OBJSTATUS.Count = 0 Then
        
            ID = CreateGUID2
            With jrnlMenu.EntryPoints.Add(ID)
              .sequence = mseq
              mseq = mseq + 1
              .Name = "mnu" & ot.Name
              .Caption = ot.the_comment
              .ActionType = MenuActionType_Otkrit__gurnal
              Set .journal = FindJournal(ot)
              Set .TheFilter = FindFilter(ot)
              .Save
            End With
            
            MakeFilterMapping jrnlMenu.EntryPoints.item(ID), ot
        
        Else
            Dim TypeMenu As EntryPoints
            ID = CreateGUID2
            Set TypeMenu = jrnlMenu.EntryPoints.Add(ID)
            
            With TypeMenu
              .sequence = mseq
              mseq = mseq + 1
              .Name = "mnu" & ot.Name
              .Caption = ot.the_comment
              .ActionType = MenuActionType_Nicego_ne_delat_
              .Save
            End With
            
            ID = CreateGUID2
            With TypeMenu.EntryPoints.Add(ID)
              .sequence = mseq
              mseq = mseq + 1
              .Name = "mnuAll" & ot.Name
              .Caption = ot.the_comment & " - все состояния"
              .ActionType = MenuActionType_Otkrit__gurnal
              Set .journal = FindJournal(ot)
              Set .TheFilter = FindFilter(ot)
              .Save
            End With
            MakeFilterMapping TypeMenu.EntryPoints.item(ID), ot

            Dim ii As Long
            For ii = 1 To ot.OBJSTATUS.Count
            
              ID = CreateGUID2
              With TypeMenu.EntryPoints.Add(ID)
                .sequence = mseq
                mseq = mseq + 1
                .Name = "mnu" & ot.Name & "_" & ii
                .Caption = ot.the_comment & " :" & ot.OBJSTATUS.item(ii).Name
                .ActionType = MenuActionType_Otkrit__gurnal
                Set .journal = FindJournal(ot)
                Set .TheFilter = FindFilter(ot)
                 .JournalFixedQuery = " INTSANCEStatusID='" & ot.OBJSTATUS.item(ii).ID & "'"
                .Save
              End With
              MakeFilterMapping TypeMenu.EntryPoints.item(ID), ot
            Next
        End If

      End If
     
    End If
  Next
End Sub


Private Sub MakeFilterMapping(ep As EntryPoints, ot As objectType)
  Dim p As PART
  Set p = JournalPart(ot)
  Dim pv As PARTVIEW
  Dim i As Long
  Dim f As MTZMetaModel.Field
  Dim ft As FIELDTYPE
  Dim ID As String
  
  
  For i = 1 To p.PARTVIEW.Count
    Set pv = p.PARTVIEW.item(i)
    If UCase(pv.the_Alias) = "AUTO" & UCase(p.Name) Then
      Exit For
    End If
  Next
  
  

  pv.ViewColumn.Sort = "sequence"
  
  For i = 1 To pv.ViewColumn.Count
  
    Set f = pv.ViewColumn.item(i).Field
    Set ft = f.FIELDTYPE
    
    If ft.GridSortType = ColumnSortType_As_Date Then
      With ep.EPFilterLink.Add
        .RowSource = pv.the_Alias
        .FilterField = f.Name & "_GE"
        .TheExpression = pv.ViewColumn.item(i).the_Alias & ">="" & MakeMSSQLDate(fltr.dtp" & f.Name & "_GE.value)"
        .Save
      End With
      With ep.EPFilterLink.Add
        .RowSource = pv.the_Alias
        .FilterField = f.Name & "_LE"
        .TheExpression = pv.ViewColumn.item(i).the_Alias & "<="" & MakeMSSQLDate(fltr.dtp" & f.Name & "_LE.value)"
        .Save
      End With
    End If
    
    If ft.GridSortType = ColumnSortType_As_Numeric Then
     With ep.EPFilterLink.Add
        .RowSource = pv.the_Alias
        .FilterField = f.Name & "_GE"
        .TheExpression = pv.ViewColumn.item(i).the_Alias & ">="" & val(fltr.txt" & f.Name & "_GE.Text)"
        .Save
      End With
      With ep.EPFilterLink.Add
        .RowSource = pv.the_Alias
        .FilterField = f.Name & "_LE"
        .TheExpression = pv.ViewColumn.item(i).the_Alias & "<="" & val(fltr.txt" & f.Name & "_LE.Text)"
        .Save
      End With
    End If
    
    If ft.GridSortType = ColumnSortType_As_String Then
      If ft.TypeStyle = TypeStyle_Ssilka Then
        With ep.EPFilterLink.Add
          .RowSource = pv.the_Alias
          .FilterField = f.Name
          .TheExpression = pv.ViewColumn.item(i).the_Alias & "_ID='"" & fltr.txt" & f.Name & ".Tag & ""'"" "
          .Save
        End With
        
      ElseIf ft.TypeStyle = TypeStyle_Perecislenie Then
        With ep.EPFilterLink.Add
          .RowSource = pv.the_Alias
          .FilterField = f.Name
          .TheExpression = pv.ViewColumn.item(i).the_Alias & "='"" & fltr.cmb" & f.Name & ".Text & ""'"" "
          .Save
        End With
      ElseIf UCase(ft.Name) <> "FILE" And UCase(ft.Name) <> "ID" And UCase(ft.Name) <> "IMAGE" Then
        With ep.EPFilterLink.Add
          .RowSource = pv.the_Alias
          .FilterField = f.Name
          .TheExpression = pv.ViewColumn.item(i).the_Alias & " like '%"" & fltr.txt" & f.Name & ".Text & ""%'"" "
          .Save
        End With
      End If
    End If
  Next
  'доп вьюхи
  Dim j As Long
  Dim LastI As Long
  LastI = i
  
  For j = 1 To pv.PARTVIEW_LNK.Count
    
    Dim pvd As PARTVIEW
    Set pvd = pv.PARTVIEW_LNK.item(j).TheView
    pvd.ViewColumn.Sort = "sequence"
    For i = 1 To pv.PARTVIEW_LNK.item(j).TheView.ViewColumn.Count
        
        LastI = LastI + 1
        Set f = pvd.ViewColumn.item(i).Field
        Set ft = f.FIELDTYPE
        
        If ft.GridSortType = ColumnSortType_As_Date Then
          With ep.EPFilterLink.Add
            .RowSource = pvd.the_Alias
            .FilterField = f.Name & "_GE"
            .TheExpression = pvd.ViewColumn.item(i).the_Alias & ">="" & MakeMSSQLDate(fltr.dtp" & f.Name & "_GE.value)"
            .Save
          End With
          With ep.EPFilterLink.Add
            .RowSource = pvd.the_Alias
            .FilterField = f.Name & "_LE"
            .TheExpression = pvd.ViewColumn.item(i).the_Alias & "<="" & MakeMSSQLDate(fltr.dtp" & f.Name & "_LE.value)"
            .Save
          End With
        End If
        
        If ft.GridSortType = ColumnSortType_As_Numeric Then
         With ep.EPFilterLink.Add
            .RowSource = pvd.the_Alias
            .FilterField = f.Name & "_GE"
            .TheExpression = pvd.ViewColumn.item(i).the_Alias & ">="" & val(fltr.txt" & f.Name & "_GE.Text)"
            .Save
          End With
          With ep.EPFilterLink.Add
            .RowSource = pvd.the_Alias
            .FilterField = f.Name & "_LE"
            .TheExpression = pvd.ViewColumn.item(i).the_Alias & "<="" & val(fltr.txt" & f.Name & "_LE.Text)"
            .Save
          End With
        End If
        
        If ft.GridSortType = ColumnSortType_As_String Then
          If ft.TypeStyle = TypeStyle_Ssilka Then
            With ep.EPFilterLink.Add
              .RowSource = pvd.the_Alias
              .FilterField = f.Name
              .TheExpression = pvd.ViewColumn.item(i).the_Alias & "_ID='"" & fltr.txt" & f.Name & ".Tag & ""'"" "
              .Save
            End With
            
          ElseIf ft.TypeStyle = TypeStyle_Perecislenie Then
            With ep.EPFilterLink.Add
              .RowSource = pvd.the_Alias
              .FilterField = f.Name
              .TheExpression = pvd.ViewColumn.item(i).the_Alias & "='"" & fltr.cmb" & f.Name & ".Text & ""'"" "
              .Save
            End With
          ElseIf UCase(ft.Name) <> "FILE" And UCase(ft.Name) <> "ID" And UCase(ft.Name) <> "IMAGE" Then
            With ep.EPFilterLink.Add
              .RowSource = pvd.the_Alias
              .FilterField = f.Name
              .TheExpression = pvd.ViewColumn.item(i).the_Alias & " like '%"" & fltr.txt" & f.Name & ".Text & ""%'"" "
              .Save
            End With
          End If
        End If
    Next
  Next
End Sub


Private Function FindJournal(ot As objectType) As MTZJrnl.Application
  Dim rs As ADODB.Recordset
  Dim jr As MTZJrnl.Application
  Set rs = Session.GetRowsEx("INSTANCE", , , "OBJTYPE='MTZJrnl' and Name='" & ot.Name & "'")
  If Not rs Is Nothing Then
    If Not rs.EOF Then
      Set jr = Manager.GetInstanceObject(rs!InstanceID)
    End If
  End If
  Set FindJournal = jr
End Function

Private Function FindFilter(ot As objectType) As MTZFltr.Application
  Dim rs As ADODB.Recordset
  Dim jr As MTZFltr.Application
  Set rs = Session.GetRowsEx("INSTANCE", , , "OBJTYPE='MTZFltr' and Name='" & ot.Name & "'")
  If Not rs Is Nothing Then
    If Not rs.EOF Then
      Set jr = Manager.GetInstanceObject(rs!InstanceID)
    End If
  End If
  Set FindFilter = jr
End Function




