Attribute VB_Name = "JournalByView"
Option Explicit

Public Sub ProcessJournal(Optional IDView As String = "")
  'Dim p As PART
  Dim pv As PARTVIEW
  
  Dim i As Long
  Dim f As MTZMetaModel.Field
  Dim jr As MTZJrnl.Application
  Dim ID As String
  Dim jsrc As JournalSrc
  Dim jc As JournalColumn
  Dim ft As FIELDTYPE
  Dim IDv As String
  Dim Briefv As String
  
  If IDView <> "" Then
    IDv = Left(IDView, 38)
  Else
    If Not Manager.GetReferenceDialogEx3("PARTVIEW", IDv, Briefv) Then
    
        Exit Sub
    End If
    IDv = Left(IDv, 38)
  End If
  
  Set pv = MyUser.Application.FindRowObject("PARTVIEW", IDv)
  If pv Is Nothing Then Exit Sub
  
  Dim SName As String
  Dim sthe_Alias As String
  Dim sTheComment As String
  
  
  
  If MsgBox("Заменить существующий журнал?", vbYesNo) = vbYes Then
    IDv = ""
    Briefv = ""
    If Not Manager.GetObjectListDialogEx(IDv, Briefv, , "MTZJrnl") Then
        Exit Sub
    End If
    Set jr = Manager.GetInstanceObject(IDv)
    SName = jr.journal.item(1).Name
    sthe_Alias = jr.journal.item(1).the_Alias
    sTheComment = jr.journal.item(1).TheComment
    jr.CloseClass
    Set jr = Nothing
    Call Manager.DeleteInstance(IDv)
    ID = IDv
  Else
    SName = "АВТОЖУРНАЛ:" & pv.Name
    sthe_Alias = "JRNL:" & pv.the_Alias
    sTheComment = "Журнал"
    ID = CreateGUID2
  End If
    
    
  'pv.ViewColumn.item(1).the_Alias
  Manager.NewInstance ID, "MTZJrnl", SName
  Set jr = Manager.GetInstanceObject(ID)
  
  On Error Resume Next
  With jr.journal.Add
    .Name = SName
    .the_Alias = sthe_Alias
    .TheComment = sTheComment
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
  
  ProcessAditionalViews pv, i, jr, jsrc
MsgBox "Done!"
End Sub


Private Function ProcessAditionalViews(pv As PARTVIEW, ByRef i As Long, ByRef jr As MTZJrnl.Application, ByRef jsrc As JournalSrc)
  
Dim ID As String
'Dim jsrc As JournalSrc
Dim jc As JournalColumn
Dim ft As FIELDTYPE
Dim f As MTZMetaModel.Field
Dim j As Long
Dim LastI As Long
  LastI = i
  
  On Error Resume Next
  
  pv.PARTVIEW_LNK.Sort = "SEQ"
  
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
    ProcessAditionalViews pv.PARTVIEW_LNK.item(j).TheView, LastI, jr, jsrc
  Next
  i = LastI
End Function
