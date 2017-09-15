Attribute VB_Name = "Module1"
Option Explicit
Public Manager As MTZManager.Main
Public session As MTZSession.session
Public Site As String
Public model As MTZMetaModel.Application
Public BasePartID As String
Public BasePart As PART
Public BaseType As OBJECTTYPE
Public viCol As Collection


'Public OPnAMES()

Sub Main()

  Dim f As frmLogin
  Set f = New frmLogin
  Set Manager = New MTZManager.Main

again:
  f.Show vbModal
  If Not f.OK Then
    Unload f
    Set f = Nothing
    Set Manager = Nothing
    Exit Sub
  End If
  Site = f.txtSite
  Set session = Manager.GetSession(Site)
  If session Is Nothing Then
    MsgBox "Не определен сайт с таким именем", vbCritical, "Ошибка"
    GoTo again
  End If
  
  If Not session.Login(f.txtUserName, f.txtPassword) Then
    Set session = Nothing
    MsgBox "Неверные данные регистрации", vbCritical, "Ошибка"
    GoTo again
  End If
  'UserName = f.txtUserName
  Unload f
  Set f = Nothing
  
  
  Dim rs As ADODB.Recordset
'  Set rs = Session.GetRow("session", Session.sessionid)
'  UsersID = rs!UsersID
'  Set rs = Nothing
  Set rs = Manager.ListInstances(Site, "MTZMetaModel")
  Dim id As String
  If Not rs.EOF Then
    id = rs!InstanceID
  Else
    End
  End If
  Set model = Manager.GetInstanceObject(id)
 
nextOne:
  frmStep1.Show vbModal
  If frmStep1.OK Then
     Set viCol = New Collection
     Set BasePart = model.FindObject("PART", BasePartID)
     frmStep2.Show vbModal
     
     If frmStep2.OK Then
       frmStep3.txtName = BasePart.Caption
       frmStep3.txtAlias = "view" & BasePart.Name
       frmStep3.Show vbModal
       If frmStep3.OK Then
         'save view definition
          SaveView
          If MsgBox("Завершить работу?", vbQuestion + vbYesNo, "Построение представлений") = vbNo Then
            Unload frmStep1
            Unload frmStep2
            Unload frmStep3
            Set viCol = Nothing
            GoTo nextOne
          End If
       End If
       Unload frmStep3
     End If
     Unload frmStep2
     Set viCol = Nothing
  End If
  
  
  Set model = Nothing
  session.Logout
  Manager.CloseClass

  Set session = Nothing
  Set Manager = Nothing

  Unload frmStep1
End Sub


Public Function CountOfID(ByVal id As String, ByVal n As Node) As Long
  Dim nn As Node, cnt As Long
  cnt = 0
  Set nn = n
  While Not n Is Nothing
    If Left(n.Key, 38) = id Then
      cnt = cnt + 1
    End If
    Set n = n.Parent
  Wend
  CountOfID = cnt
End Function


Public Sub ExractLevel(ByVal Key As String, ByRef id As String, ByRef level As String)
  id = Left(Key, 38)
  level = Right(Key, 38)
End Sub

Private Sub SaveView()
model.LockResource False
If model.IsLocked <> NoLock Then
Dim i As Long
Dim pv As PARTVIEW
Dim vc As ViewColumn
Dim vi As ViewItems
Dim fld As FIELD

  BasePart.PARTVIEW.Refresh
  Set pv = BasePart.PARTVIEW.Add()
  pv.Name = frmStep3.txtName & "(" & BasePart.Caption & ")"
  pv.Alias = frmStep3.txtAlias
  pv.Save
  For i = 1 To viCol.Count
     Set vc = pv.ViewColumn.Add()
     Set vi = viCol.Item(i)
     If vi.Aggregation = "" Then
      vc.Aggregation = AggregationType_none
     ElseIf vi.Aggregation = "COUNT" Then
      vc.Aggregation = AggregationType_COUNT
     ElseIf vi.Aggregation = "SUM" Then
      vc.Aggregation = AggregationType_SUM
     ElseIf vi.Aggregation = "AVG" Then
      vc.Aggregation = AggregationType_AVG
     ElseIf vi.Aggregation = "MIN" Then
      vc.Aggregation = AggregationType_MIN
     ElseIf vi.Aggregation = "MAX" Then
      vc.Aggregation = AggregationType_MAX
     End If
     On Error Resume Next
     
     Set fld = model.FindObject("FIELD", vi.FieldID)
     If Not fld Is Nothing Then
     vc.Name = fld.Caption & " (" & fld.Parent.Parent.Caption & ")"
     vc.Alias = fld.Parent.Parent.Name & "_" & fld.Name
     Set vc.FromPart = fld.Parent.Parent
     Set vc.FIELD = fld
     vc.Save
     End If
  Next
  model.UnLockResource
End If

End Sub
