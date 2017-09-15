Attribute VB_Name = "Module1"
Option Explicit
Public Manager As MTZManager.Main
Public session As MTZSession.session
Public Site As String
Public model As MTZMetaModel.Application
'Public BasePartID As String
'Public BasePart As PART
'Public BaseType As OBJECTTYPE
Public viCol As Collection
Public journal As MTZMetaModel.Jounal


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
  frmSplash.Show
  DoEvents
  Dim rs As adodb.Recordset, i As Long, j As Long
  Set rs = Manager.ListInstances(Site, "MTZMetaModel")
  Dim id As String
  If Not rs.EOF Then
    id = rs!InstanceID
  Else
    End
  End If
  
  frmSplash.lblWait.Caption = "загружаем модель"
  DoEvents
  Set model = Manager.GetInstanceObject(id)
  Manager.LockInstanceObject id
  model.AutoLoadPart = True
  
  frmSplash.lblWait.Caption = "загружаем список документов"
  DoEvents
  i = model.OBJECTTYPE.Count
  
  frmSplash.lblWait.Caption = "загружаем список полей"
  DoEvents
  i = model.FIELDTYPE.Count
  
  frmSplash.lblWait.Caption = "загружаем журналы"
  DoEvents
  i = model.Jounal.Count
    
  For i = 1 To model.Jounal.Count
    frmSplash.lblWait.Caption = "осталось " & model.Jounal.Count - i
    DoEvents
    For j = 1 To model.Jounal.Item(i).JournalSrc.Count
    Debug.Print model.Jounal.Item(i).JournalSrc.Item(j).PARTVIEW.id
    Next
  Next
  
  DoEvents
  
  frmSplash.Hide
  Unload frmSplash
  frmMain.Show
  
  
End Sub




