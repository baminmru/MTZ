Attribute VB_Name = "BatchUpdate"
Option Explicit


Public Sub MakeRowBatchUpdate(ByVal P As PART, ByRef body As String)
  Dim i As Long
  body = body & vbCrLf & CommentItem("PUBLIC sub BatchUpdate()", "Массовое обновление измененных строк")
  body = body & vbCrLf & "If not Application.WorkOffline Then"
  body = body & vbCrLf & "  If Deleted Then"
  body = body & vbCrLf & "    Delete"
  body = body & vbCrLf & "    Exit Sub"
  body = body & vbCrLf & "  End If"
  body = body & vbCrLf & "  If Changed Then Save"
  
  For i = 1 To P.PART.Count
    body = body & vbCrLf & " " & MakeValidName(P.PART.item(i).name) & ".BatchUpdate"
  Next
  If P.PartType = PartType_Derevo Then
   body = body & vbCrLf & "  " & MakeValidName(P.name) & ".BatchUpdate"
  End If
  body = body & vbCrLf & "End If"
  body = body & vbCrLf & "End sub"

  body = body & vbCrLf & CommentItem("friend sub LoadAll()", "Загрузить все данные документа из базы")
  body = body & vbCrLf & "If not Application.WorkOffline Then"
  body = body & vbCrLf & "  LoadFromDatabase"
  For i = 1 To P.PART.Count
    body = body & vbCrLf & "  " & MakeValidName(P.PART.item(i).name) & ".LoadAll"
  Next
  If P.PartType = 2 Then
    body = body & vbCrLf & "    " & MakeValidName(P.name) & ".LoadAll"
  End If
  body = body & vbCrLf & "End If"
  body = body & vbCrLf & "End sub"


End Sub


Public Sub MakeColBatchUpdate(ByRef body As String)
  body = body & vbCrLf & CommentItem("friend sub BatchUpdate()", "Массовое обновление измененных строк коллекции")
  body = body & vbCrLf & " on error goto bye"
  body = body & vbCrLf & "If not Application.WorkOffline Then"
  body = body & vbCrLf & " dim i as long"
  body = body & vbCrLf & " again: "
  body = body & vbCrLf & " for i=1 to count "
  body = body & vbCrLf & "    If item(i) Is Nothing Then Exit For"
  body = body & vbCrLf & "    If item(i).Deleted Then"
  body = body & vbCrLf & "      If Delete(i) Then GoTo again"
  body = body & vbCrLf & "    Else"
  body = body & vbCrLf & "      on error resume next"
  body = body & vbCrLf & "      item(i).BatchUpdate"
  body = body & vbCrLf & "      on error goto bye"
  body = body & vbCrLf & "    End If"
  body = body & vbCrLf & " next"
  body = body & vbCrLf & "End If"
  body = body & vbCrLf & "bye:"
  body = body & vbCrLf & "End sub"
  
  
  body = body & vbCrLf & CommentItem("friend sub LoadAll()", "Загрузка данных из базы")
  body = body & vbCrLf & "on error goto bye"
  body = body & vbCrLf & "If not Application.WorkOffline Then"
  body = body & vbCrLf & " dim i as long"
  body = body & vbCrLf & " Refresh"
  body = body & vbCrLf & " for i=1 to count "
  body = body & vbCrLf & "     item(i).LoadAll"
  body = body & vbCrLf & " next"
  body = body & vbCrLf & "End If"
  body = body & vbCrLf & "bye:"
  body = body & vbCrLf & "End sub"

End Sub


Public Sub MakeApplicationBatchUpdate(ByVal obt As OBJECTTYPE, ByRef body As String)
  Dim i As Long
  body = body & vbCrLf & CommentItem("public sub BatchUpdate()", "Массовое обновление строк")
  body = body & vbCrLf & "If not Application.WorkOffline Then"
    For i = 1 To obt.PART.Count
      body = body & vbCrLf & "    " & MakeValidName(obt.PART.item(i).name) & ".BatchUpdate"
    Next
  body = body & vbCrLf & "End If"
  body = body & vbCrLf & "End sub"
  
  body = body & vbCrLf & CommentItem("public sub LoadAll()", "Загрузка всех данных из базы")
  body = body & vbCrLf & "dim prevAutoLoad as boolean"
  body = body & vbCrLf & "If not Application.WorkOffline Then"
  body = body & vbCrLf & "prevAutoLoad= Application.autoloadpart"
  body = body & vbCrLf & "Application.autoloadpart = true"
    For i = 1 To obt.PART.Count
      body = body & vbCrLf & "    " & MakeValidName(obt.PART.item(i).name) & ".LoadAll"
    Next
  body = body & vbCrLf & "Application.autoloadpart = prevAutoLoad"
  body = body & vbCrLf & "End If"
  body = body & vbCrLf & "End sub"

End Sub



