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
Public ViewForChange As PARTVIEW
Public BaseType As objectType
Public viCol As Collection
Private SysStore As Object
Private sysGUI As Object
Public NewViewName As String
Public NewViewAlias As String
Public NewForChoose As Boolean
Public NewForChooseObject As Boolean
Public DelOtherView As Boolean
Public CreatedView As PARTVIEW


Public frmProgress As frmProgress
Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

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
    If rs.EOF Then
      MsgBox "Отсутствует описние объекта <<Спец:МетаМодель>>" & vbCrLf & "Используйте Утилиту загрузки", vbOKOnly + vbCritical, "Ошибка"
      Session.Logout
      Set Session = Nothing
      Manager.CloseClass
      Set Manager = Nothing
      End
    End If
    
    Set model = Manager.GetInstanceObject(rs!InstanceID)
    Manager.LockInstanceObject model.ID
    Set rs = Nothing
    
    Set rs = Manager.ListInstances(site, "MTZUsers")
    If rs.EOF Then
      MsgBox "Отсутствует описние объекта <<Пользователи системы>>" & vbCrLf & "База создана неверно", vbOKOnly + vbCritical, "Ошибка"
      Session.Logout
      Set Session = Nothing
      Manager.CloseClass
      Set Manager = Nothing
      End
    End If
    
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
   
  
  Dim i As Long
  For i = 1 To model.objectType.Count
    If model.objectType.item(i).package.Name = "Ядро" Or model.objectType.item(i).package.Name = "СТД" Or model.objectType.item(i).package.Name = "Ядро2" Or model.objectType.item(i).package.Name = "Репликация" Then
      Set g = New GUI
      g.Init model.objectType.item(i).Name
      Manager.RegisterGUI g, model.objectType.item(i).Name
    End If
  Next
  
  Load frmMain
  frmMain.Show
  
End Sub


Public Function CountOfID(ByVal ID As String, ByVal n As Node) As Long
  Dim nn As Node, cnt As Long
  cnt = 0
  Set nn = n
  While Not n Is Nothing
    If left(n.Key, 38) = ID Then
      cnt = cnt + 1
    End If
    Set n = n.Parent
  Wend
  CountOfID = cnt
End Function


Public Sub ExractLevel(ByVal Key As String, ByRef ID As String, ByRef Level As String)
  ID = left(Key, 38)
  Level = Right(Key, 38)
End Sub

Public Sub SaveView()
model.LockResource False
If model.IsLocked <> NoLock Then
Dim i As Long
Dim pv As PARTVIEW
Dim vc As ViewColumn
Dim vi As ViewItems
Dim fld As MTZMetaModel.Field
Dim bReplacedView As Boolean

    bReplacedView = False
  Screen.MousePointer = vbHourglass
  BasePart.PARTVIEW.Refresh
  
  
  
  If ViewForChange Is Nothing Then
    If DelOtherView Then
        For i = BasePart.PARTVIEW.Count To 1 Step -1
            BasePart.PARTVIEW.item(i).Delete
        Next
    End If
    BasePart.PARTVIEW.Refresh
    Set pv = BasePart.PARTVIEW.Add()
    pv.Name = NewViewName & "(" & BasePart.Caption & ")"
    pv.the_Alias = NewViewAlias
  Else
    Dim iid As String
    Dim sNM As String
    Dim sAliace As String
    bReplacedView = True
    iid = ViewForChange.ID
    sNM = ViewForChange.Name
    sAliace = ViewForChange.the_Alias
    ViewForChange.Delete
    BasePart.PARTVIEW.Refresh
    
    If DelOtherView Then
        For i = BasePart.PARTVIEW.Count To 1 Step -1
            BasePart.PARTVIEW.item(i).Delete
        Next
    End If
    BasePart.PARTVIEW.Refresh
    Set pv = BasePart.PARTVIEW.Add(iid)
    pv.Name = sNM
    pv.the_Alias = sAliace
  End If
  
  
  If NewForChoose Then
    pv.ForChoose = Boolean_Da
  Else
    pv.ForChoose = Boolean_Net
  End If
  
  pv.Save
  
  'Теперь надо ли делать для выбора объекта?
  If NewForChooseObject Then
    Set BaseType.ChooseView = pv
    BaseType.Save
  End If
  
  Set CreatedView = pv
  
  For i = 1 To viCol.Count
     
    On Error Resume Next
    Set vi = viCol.item(i)
    
    Set fld = model.FindObject("FIELD", vi.FieldID)
    If Not fld Is Nothing Then
      Dim ft As FIELDTYPE
      Set ft = fld.FIELDTYPE
      If ft.TypeStyle <> TypeStyle_Element_oformleniy Then
        
        Set vc = pv.ViewColumn.Add()
        
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
        vc.Name = fld.Caption & " (" & fld.Parent.Parent.Caption & ")"
        vc.the_Alias = fld.Parent.Parent.Name & "_" & fld.Name
        Set vc.FromPart = fld.Parent.Parent
        Set vc.Field = fld
        vc.sequence = i
        vc.Save
      End If
      
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
Public Function TypeForStruct(ByVal s As PART) As objectType
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

Public Function GetPath(Caption As String, hwnd As Long) As String
    Dim bi As browseinfo
    Dim lngPath As Long
    Dim lngBrowse As Long
    Dim path As String
    Dim inull As Integer
    
    GetPath = path
    
    'Call SHGetSpecialFolderLocation(Me.hwnd, 17, lngPath)
    Call SHGetSpecialFolderLocation(hwnd, 17, lngPath)

    bi.hwndOwner = hwnd
    bi.lpszTitle = Caption
    bi.pszDisplayName = String(MAX_PATH, 0)
    bi.pidlRoot = lngPath
    bi.lpfn = 0
    bi.ulFlags = 1
    bi.lParam = 0
    
    lngBrowse = SHBrowseForFolder(bi)
    
    path = String(MAX_PATH, 0)
    
    Call SHGetPathFromIDList(lngBrowse, path)
    
    inull = InStr(path, vbNullChar)
    
    If inull Then
      path = left(path, inull - 1)
    End If
    
    If path <> vbNullString Then
      If Right(path, 1) <> "\" Then
        path = path + "\"
      End If
    End If
    
    GetPath = path
End Function


' ****************************************************************************************
Public Function GetDictionary(objectType As String) As Object
On Error GoTo Error_Detected
    
    Dim objRecordset As ADODB.Recordset

    
    Set objRecordset = Manager.ListInstances("", objectType)
    
    If Not (objRecordset.BOF And objRecordset.EOF) Then
        Set GetDictionary = Manager.GetInstanceObject(CStr(objRecordset("InstanceID")))
        objRecordset.Close
        Set objRecordset = Nothing
    Else
        Dim newGUID As String
        newGUID = CreateGUID2
        
        If Not Manager.NewInstance(newGUID, objectType, GetDefaultObjectName(objectType)) Then
            Exit Function
        End If
        
        Set GetDictionary = Manager.GetInstanceObject(newGUID)
    End If
    
    Exit Function
Error_Detected:
    Set GetDictionary = Nothing
End Function


Public Function GetDefaultObjectName(ByVal objectType As String) As String
Dim objRecordset As ADODB.Recordset
On Error GoTo Error_Detected
    Set objRecordset = Manager.GetSession.GetData("select the_Comment from objecttype where Name='" + objectType + "'")
    If Not (objRecordset.BOF And objRecordset.EOF) Then
       GetDefaultObjectName = objRecordset!the_comment
    Else
       GetDefaultObjectName = " "
    End If
    Exit Function
Error_Detected:
    GetDefaultObjectName = " "
End Function
