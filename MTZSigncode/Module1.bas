Attribute VB_Name = "Module1"
Option Explicit
Public Manager As MTZManager.Main
Public Session As MTZSession.Session
Public UsersID As String
Public UserName As String
Public PrivateStoreID As String
Public SysStoreID As String
Public site As String
Public LastChat As Date
Public NextReminder As Date
Public DeltaReminder As String
Public usr As MTZUsers.Application
Public MyUser As MTZUsers.Users
Public model As MTZMetaModel.Application
Public Data(0 To 5, 1 To 100) As Variant
Public ReminderVisible As Boolean
Public journal As MTZJrnl.Application
Public BasePartID As String
Public BasePart As PART
Public BaseType As OBJECTTYPE
Public viCol As Collection
Private SysStore As Object
Private sysGUI As Object
Public NewViewName As String
Public NewViewAlias As String
Public NewForChoose As Boolean



Sub Main()
  Dim f As frmLogin
  Set f = New frmLogin
  Set Manager = New MTZManager.Main

again:
    f.Show vbModal
    If Not f.ok Then
      Unload f
      Set f = Nothing
      Set Manager = Nothing
      Exit Sub
    End If
    site = f.txtSite
    
    Set Session = Manager.GetSession(site)
    If Session Is Nothing Then
      MsgBox "Не определен сайт с таким именем", vbCritical, "Ошибка"
      GoTo again
    End If
    
    If Not Session.Login(f.txtUserName, f.txtPassword) Then
      Set Session = Nothing
      MsgBox "Неверные данные регистрации", vbCritical, "Ошибка"
      GoTo again
    End If
    UserName = f.txtUserName
    Unload f
    Set f = Nothing
 
 
  
    Dim rs As ADODB.Recordset
    Set rs = Manager.ListInstances(site, "MTZMetaModel")
    Set model = Manager.GetInstanceObject(rs!InstanceID)
    Manager.LockInstanceObject model.ID
    Set rs = Nothing
    
    Set rs = Manager.ListInstances(site, "MTZUsers")
    Set usr = Manager.GetInstanceObject(rs!InstanceID)
    Manager.LockInstanceObject usr.ID
    Set rs = Nothing
    Set MyUser = usr.FindRowObject("Users", Session.GetSessionUserID())
    Set rs = Nothing
    Dim g As GUI
  
  On Error Resume Next
   Dim intFile As Integer
   intFile = FreeFile
   Open App.path & "\Licenses.txt" For Input As #intFile
   Dim strKey As String, strprogid As String
   ' On the client machine, read the license key from the file.
   
   
   While Not EOF(intFile)
    strprogid = ""
    strKey = ""
    Input #intFile, strprogid, strKey
    If strprogid <> "" Then
      Licenses.Add strprogid, strKey
      
    Else
      GoTo closefile
    End If
   Wend

closefile:
  Close #intFile
   
  
'  Dim i As Long
'  For i = 1 To model.OBJECTTYPE.Count
'    If model.OBJECTTYPE.item(i).Package.Name = "Ядро" Or model.OBJECTTYPE.item(i).Package.Name = "СТД" Or model.OBJECTTYPE.item(i).Package.Name = "Ядро2" Then
'      Set g = New GUI
'      g.Init model.OBJECTTYPE.item(i).Name
'      Manager.RegisterGUI g, model.OBJECTTYPE.item(i).Name
'    End If
'  Next
'
  Load frmMain
  frmMain.Show
  
End Sub


Public Function CountOfID(ByVal ID As String, ByVal n As Node) As Long
  Dim nn As Node, cnt As Long
  cnt = 0
  Set nn = n
  While Not n Is Nothing
    If Left(n.Key, 38) = ID Then
      cnt = cnt + 1
    End If
    Set n = n.Parent
  Wend
  CountOfID = cnt
End Function


Public Sub ExractLevel(ByVal Key As String, ByRef ID As String, ByRef level As String)
  ID = Left(Key, 38)
  level = Right(Key, 38)
End Sub

Public Sub SaveView()
model.LockResource False
If model.IsLocked <> NoLock Then
Dim i As Long
Dim pv As PARTVIEW
Dim vc As ViewColumn
Dim vi As ViewItems
Dim fld As MTZMetaModel.Field
  Screen.MousePointer = vbHourglass
  BasePart.PARTVIEW.Refresh
  Set pv = BasePart.PARTVIEW.Add()
  pv.Name = NewViewName & "(" & BasePart.Caption & ")"
  pv.the_Alias = NewViewAlias
  If NewForChoose Then
    pv.ForChoose = Boolean_Da
  Else
    pv.ForChoose = Boolean_Net
  End If
  pv.Save
  For i = 1 To viCol.Count
     Set vc = pv.ViewColumn.Add()
     Set vi = viCol.item(i)
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
     vc.the_Alias = fld.Parent.Parent.Name & "_" & fld.Name
     Set vc.FromPart = fld.Parent.Parent
     Set vc.Field = fld
     vc.Save
     End If
  Next
  Screen.MousePointer = vbNormal
  model.UnLockResource
End If

End Sub





Public Function FileToArray(ByVal path As String)
   Dim i As Long, ff As Integer
   Dim TB() As Byte
   On Error GoTo IconError
    ff = FreeFile
    Open path For Binary As #ff   ' Read into byte array.
    i = 0
    i = LOF(ff)                     ' Get the file size.
    ReDim TB(i + 1) As Byte        ' Resize the array.
    i = 0
    Do Until EOF(ff)
       Get #ff, , TB(i)             ' Read data into array.
       i = i + 1
    Loop
    Close #ff
    FileToArray = TB

 Exit Function

IconError:
   FileToArray = Null
End Function


Public Function ArrayToFile(ByVal path As String, ByVal TB As Variant) As Boolean

   Dim ff As Integer
   Dim i As Long
   On Error GoTo bye
   If Not IsArray(TB) Then Exit Function
   
   ff = FreeFile
   Open path For Binary As #ff

   For i = LBound(TB) To UBound(TB)
      Put #ff, , CByte(TB(i))
   Next i
   Close #ff
   ArrayToFile = True
bye:
   ArrayToFile = False
End Function

'Utils
Public Function TypeForStruct(ByVal s As PART) As OBJECTTYPE
Dim i As Long
Dim obj As Object
Set obj = s.Parent.Parent

' ищем что за тип объекта
While TypeName(obj) <> "OBJECTTYPE"
  Set obj = obj.Parent.Parent
Wend

Set TypeForStruct = obj

End Function




Public Sub CallSys()
  Dim rs As ADODB.Recordset
  Set rs = Session.GetRows("InfoStoreDef", "", "", "TheUser is null")
  If Not rs Is Nothing Then
    If Not rs.EOF Then
      SysStoreID = rs!InstanceID
      Set SysStore = Manager.GetInstanceObject(SysStoreID, site)
      SysStore.AutoLoadPart = True
      'SysStore.LockResource False
      
    Else
      SysStoreID = CreateGUID2
      Call Manager.NewInstance(SysStoreID, "STDInfoStore", "Общий каталог", site)
      Set SysStore = Manager.GetInstanceObject(SysStoreID, site)
      SysStore.AutoLoadPart = True
      'SysStore.LockResource False
      
      With SysStore.InfoStoreDef.Add()
        .InfoStoreType = InfoStoreType_cls__Obsiy
        .Name = "Общий каталог"
        .Save
      End With
      
      With SysStore.Folder.Add()
        .Name = "Общие папки"
        .FolderType = FolderType_cls__
        .Save
      End With
      
      
    End If
    
    Dim o As Object
    Set o = Manager.GetInstanceGUI(SysStore.ID)
    Manager.LockInstanceObject SysStore.ID
    o.Show "", SysStore
  End If
End Sub

