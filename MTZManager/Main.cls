VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 510
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3B8F879700B8"
Attribute VB_Ext_KEY = "Member0" ,"Sessions"
Option Explicit

Dim mOpenInstances As OpenInstances
Dim mOpenGUI As Collection
Dim mSessions As Sessions
Dim mCurSite As String
Dim mTempFiles As Collection
Private mFinder As Object
Private m_BD As BufferData
Private mLogger As MTZUtil.Logger
Private GetObjCnt As Long
Private Forms As FormCash

Private m_HideAdditionalButtons As Boolean
Private m_CustomObjects As NamedValues
Private mServerUserName As String
Private mServerUserPassword As String
Private mServerDBName As String
Private mServerRootDBName As String

'название базы данных
'Parameters:
'[IN][OUT]  NewVal , тип параметра: String  - название базы данных
'See Also:
'  AddCustomObjects
'  ClearBuffer
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeAllInstanses
'  FreeInstanceObject
'  GetBuffer
'  GetCustomObjects
'  GetFinderDialog
'  GetFullTextDialog
'  GetIDFromXMLField
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialog2
'  GetObjectListDialogEx
'  GetObjectListDialogEx3
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx2
'  GetReferenceDialogEx3
'  GetSession
'  GetSQLDataDialog
'  HideAditionalButtons
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  RemoveCustomObjects
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  SetBuffer
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'  VerifyCode
'Example:
' dim value as Variant
' value = ...значение...
' me.ServerDBName = value
Public Property Let ServerDBName(NewVal As String)
Attribute ServerDBName.VB_HelpID = 685
  mServerDBName = NewVal
End Property

'название стартовой базы данных
'Parameters:
'[IN][OUT]  NewVal , тип параметра: String  - название стартовой базы данных
'See Also:
'  AddCustomObjects
'  ClearBuffer
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeAllInstanses
'  FreeInstanceObject
'  GetBuffer
'  GetCustomObjects
'  GetFinderDialog
'  GetFullTextDialog
'  GetIDFromXMLField
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialog2
'  GetObjectListDialogEx
'  GetObjectListDialogEx3
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx2
'  GetReferenceDialogEx3
'  GetSession
'  GetSQLDataDialog
'  HideAditionalButtons
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  RemoveCustomObjects
'  ServerDBName
'  ServerUserName
'  ServerUserPassword
'  SetBuffer
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'  VerifyCode
'Example:
' dim value as Variant
' value = ...значение...
' me.ServerRootDBName = value
Public Property Let ServerRootDBName(NewVal As String)
Attribute ServerRootDBName.VB_HelpID = 690
  mServerRootDBName = NewVal
End Property

'пользователь
'Parameters:
'[IN][OUT]  NewVal , тип параметра: String  - пользователь
'See Also:
'  AddCustomObjects
'  ClearBuffer
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeAllInstanses
'  FreeInstanceObject
'  GetBuffer
'  GetCustomObjects
'  GetFinderDialog
'  GetFullTextDialog
'  GetIDFromXMLField
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialog2
'  GetObjectListDialogEx
'  GetObjectListDialogEx3
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx2
'  GetReferenceDialogEx3
'  GetSession
'  GetSQLDataDialog
'  HideAditionalButtons
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  RemoveCustomObjects
'  ServerDBName
'  ServerRootDBName
'  ServerUserPassword
'  SetBuffer
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'  VerifyCode
'Example:
' dim value as Variant
' value = ...значение...
' me.ServerUserName = value
Public Property Let ServerUserName(NewVal As String)
Attribute ServerUserName.VB_HelpID = 695
  mServerUserName = NewVal
End Property


'пароль
'Parameters:
'[IN][OUT]  NewVal , тип параметра: String  - пароль
'See Also:
'  AddCustomObjects
'  ClearBuffer
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeAllInstanses
'  FreeInstanceObject
'  GetBuffer
'  GetCustomObjects
'  GetFinderDialog
'  GetFullTextDialog
'  GetIDFromXMLField
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialog2
'  GetObjectListDialogEx
'  GetObjectListDialogEx3
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx2
'  GetReferenceDialogEx3
'  GetSession
'  GetSQLDataDialog
'  HideAditionalButtons
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  RemoveCustomObjects
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  SetBuffer
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'  VerifyCode
'Example:
' dim value as Variant
' value = ...значение...
' me.ServerUserPassword = value
Public Property Let ServerUserPassword(NewVal As String)
Attribute ServerUserPassword.VB_HelpID = 700
  mServerUserPassword = NewVal
End Property

'добавить объект в коллекцию хранимых объектов
'Parameters:
'[IN][OUT]   obj , тип параметра: Object - что добавляем,
'[IN]   Name , тип параметра: String  - ключ
'Returns:
' Boolean, семантика результата:
'   true  - добавлен
'   false - нет
'See Also:
'  ClearBuffer
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeAllInstanses
'  FreeInstanceObject
'  GetBuffer
'  GetCustomObjects
'  GetFinderDialog
'  GetFullTextDialog
'  GetIDFromXMLField
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialog2
'  GetObjectListDialogEx
'  GetObjectListDialogEx3
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx2
'  GetReferenceDialogEx3
'  GetSession
'  GetSQLDataDialog
'  HideAditionalButtons
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  RemoveCustomObjects
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  SetBuffer
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'  VerifyCode
'Example:
' dim variable as Boolean
' variable = me.AddCustomObjects(...параметры...)
Public Function AddCustomObjects(ByRef obj As Object, ByVal Name As String) As Boolean
Attribute AddCustomObjects.VB_HelpID = 515
  On Error Resume Next
  err.Clear
  Call m_CustomObjects.Add(Name, obj)
  AddCustomObjects = (err.Number = 0)
  ' Form Cash und other settings
  
  Dim objMSettings As NamedValues
  Set objMSettings = GetCustomObjects("ManagerSettings")
  If objMSettings Is Nothing Then
    UseFormCash = True
  Else
    Dim oNVL As NamedValue
    Set oNVL = objMSettings.Item("UseFormCash")
    If oNVL Is Nothing Then
        UseFormCash = True
    Else
        If oNVL.Value = True Then
            UseFormCash = True
        Else
            UseFormCash = False
        End If
    End If
  End If
End Function

'получить сохрененный объект
'Parameters:
'[IN]   Name , тип параметра: String  - ключ
'Returns:
'  объект любого класса Visual Basic - объект из коллекции
'  ,или Nothing
'See Also:
'  AddCustomObjects
'  ClearBuffer
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeAllInstanses
'  FreeInstanceObject
'  GetBuffer
'  GetFinderDialog
'  GetFullTextDialog
'  GetIDFromXMLField
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialog2
'  GetObjectListDialogEx
'  GetObjectListDialogEx3
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx2
'  GetReferenceDialogEx3
'  GetSession
'  GetSQLDataDialog
'  HideAditionalButtons
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  RemoveCustomObjects
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  SetBuffer
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'  VerifyCode
'Example:
' dim variable as Object
' Set variable = me.GetCustomObjects(...параметры...)
Public Function GetCustomObjects(ByVal Name As String) As Object
Attribute GetCustomObjects.VB_HelpID = 565
  On Error Resume Next
  Set GetCustomObjects = m_CustomObjects.Item(Name).Value
End Function

'удалить сохраненный объект
'Parameters:
'[IN]   Name , тип параметра: String  - ключ
'Returns:
' Boolean, семантика результата:
'   true  - удален
'   false - нет
'See Also:
'  AddCustomObjects
'  ClearBuffer
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeAllInstanses
'  FreeInstanceObject
'  GetBuffer
'  GetCustomObjects
'  GetFinderDialog
'  GetFullTextDialog
'  GetIDFromXMLField
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialog2
'  GetObjectListDialogEx
'  GetObjectListDialogEx3
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx2
'  GetReferenceDialogEx3
'  GetSession
'  GetSQLDataDialog
'  HideAditionalButtons
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  SetBuffer
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'  VerifyCode
'Example:
' dim variable as Boolean
' variable = me.RemoveCustomObjects(...параметры...)
Public Function RemoveCustomObjects(ByVal Name As String) As Boolean
Attribute RemoveCustomObjects.VB_HelpID = 680
  On Error Resume Next
  err.Clear
  Call m_CustomObjects.Remove(Name)
  RemoveCustomObjects = (err.Number = 0)
End Function

'Текущий сайт
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'Example:
' dim variable as String
' variable = me.CurSite
Public Property Get CurSite() As String
Attribute CurSite.VB_HelpID = 530
 CurSite = mCurSite
End Property

'Текущий сайт
'Parameters:
'[IN][OUT]  SiteName , тип параметра: String  - название сайта
'See Also:
'Example:
' dim value as Variant
' value = <значение>
' me.CurSite = value
Public Property Let CurSite(SiteName As String)
 mCurSite = SiteName
End Property



Private Sub Class_Initialize()
  Logger.Message "INIT"
  Set mOpenInstances = New OpenInstances
  Set mOpenGUI = New Collection
  Set m_CustomObjects = New NamedValues
  UseFormCash = True
End Sub


Private Sub Class_Terminate()
  CloseClass
  Set mLogger = Nothing
  DebugOutput "MtzManager.Main.Terminate"""
  Set m_CustomObjects = Nothing
End Sub

'Закрытие всех объектов
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Public Sub CloseClass()
Attribute CloseClass.VB_HelpID = 525
  On Error Resume Next
  Set m_BD = Nothing
  Logger.Message "CloseClass"
  
  Set m_CustomObjects = Nothing

  If Not mOpenGUI Is Nothing Then
    Dim gobj As OpenCard
    For Each gobj In mOpenGUI
      If Not gobj.GUI Is Nothing Then
        gobj.GUI.CloseClass
        Set gobj.GUI = Nothing
      End If
    Next
  End If
  Set mOpenGUI = Nothing
  
  KillForms
  
  KillTempFiles
  
  If Not mOpenInstances Is Nothing Then mOpenInstances.CloseClass
  Set mOpenInstances = Nothing
  
  
  
  If Not mFinder Is Nothing Then
    mFinder.CloseClass
    Set mFinder = Nothing
  End If
  
  Set mSessions = Nothing
  
End Sub

'получить коллекцию сессий
Friend Property Get Sessions() As Sessions
  If mSessions Is Nothing Then
    Set mSessions = New MTZManager.Sessions
  End If
  Set Sessions = mSessions
End Property


Private Function TuneSite(ByVal site As String) As String
  If site = "" Then
    site = CurSite
  End If
  If CurSite = "" Then
    CurSite = site
  End If
  TuneSite = site
End Function

'Получить объект - документ по идентификатору
'Parameters:
'[IN]   InstanceiD , тип параметра: String - идентификатор,
'[IN]   site , тип параметра: String = ""  - сайт
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FreeInstanceObject
'  GetInstanceGUI
'  GetInstanceObjectFromXML
'  GetNewObject
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  UnLockInstanceObject
'Example:
' dim variable as Object
' Set variable = me.GetInstanceObject(<параметры>)
Public Function GetInstanceObject(ByVal InstanceiD As String, Optional ByVal site As String = "") As Object
Attribute GetInstanceObject.VB_HelpID = 590
  Dim o As Object
  Dim s As MTZSession.session
  site = TuneSite(site)
  GetObjCnt = GetObjCnt + 1
  If GetObjCnt = 1000 Then
    'MsgBox "Демонстрационная версия. Менеджер.", vbOKOnly, "ХАСАН"
    GetObjCnt = 0
  End If
  
  On Error Resume Next
  Set s = Sessions.Item(site)
  On Error GoTo 0
  
  If s Is Nothing Then
    err.Raise 10000, "MTZManager.GetInstanceObject", "No connection to data site"
    Exit Function
  End If
  
  If Not s.Connected Then
    err.Raise 10000, "MTZManager.GetInstanceObject", "Wrong data site"
    Exit Function
  End If
  
  
  If s.sessionid = "" Then
    err.Raise 10000, "MTZManager.GetInstanceObject", "Session not open"
    Exit Function
  End If
  
  ' kill broken object
  If Not mOpenInstances.Item(InstanceiD) Is Nothing Then
    If mOpenInstances.Item(InstanceiD).COMobject Is Nothing Then
      mOpenInstances.Remove InstanceiD
    ElseIf mOpenInstances.Item(InstanceiD).COMobject.manager Is Nothing Then
      mOpenInstances.Remove InstanceiD
    ElseIf mOpenInstances.Item(InstanceiD).COMobject.MTZSession Is Nothing Then
      mOpenInstances.Remove InstanceiD
    End If
  End If
  
  
  If mOpenInstances.Item(InstanceiD) Is Nothing Then
    On Error GoTo bye
    Dim nv As NamedValues
    Dim rs As ADODB.Recordset
    Set rs = s.GetRow("Instance", InstanceiD)
    Dim InstanceIDResult As String
    On Error Resume Next
    InstanceIDResult = rs!InstanceiD
    On Error GoTo bye
    
    If InstanceIDResult <> "" Then
      With mOpenInstances.Add(InstanceiD)
        Set .COMobject = CreateObject(rs!ObjType & ".Application")
        Set .COMobject.manager = Me
        Set .COMobject.MTZSession = s
        .site = site
        .COMobject.ID = ""
        .COMobject.Name = rs!Name & ""
        .COMobject.ID = InstanceiD
        On Error Resume Next
        .COMobject.SecureStyleID = rs!SecurityStyleID & ""
        On Error GoTo bye
      End With
    End If
    Set rs = Nothing
  End If
  Set GetInstanceObject = mOpenInstances.Item(InstanceiD).COMobject
 Exit Function
bye:
End Function

'Получить интерфейс пользователя для объекта
'Parameters:
'[IN]   InstanceiD , тип параметра: String - идентификатор ,
'[IN]   site , тип параметра: String = ""  - сайт
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FreeInstanceObject
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetSession
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  UnLockInstanceObject
'Example:
' dim variable as Object
' Set variable = me.GetInstanceGUI(<параметры>)
Public Function GetInstanceGUI(ByVal InstanceiD As String, Optional ByVal site As String = "") As Object
Attribute GetInstanceGUI.VB_HelpID = 585
  Dim obj As Object
  Set obj = GetInstanceObject(InstanceiD, site)
  If obj Is Nothing Then Exit Function
  Dim GUI As Object
  Dim OC As OpenCard
  Dim gobj As Object
  On Error Resume Next
  Set OC = mOpenGUI.Item(obj.TypeName)
  If OC Is Nothing Then
    Set gobj = CreateObject(obj.TypeName & "GUI.GUI")
    
'    If Not VerifyCode(gobj.GUIPath) Then
'      If MsgBox("Код не подписан" & vbCrLf & "Разрешить запуск?", vbInformation + vbYesNo, "Предупреждение") = vbNo Then
'        Set GetInstanceGUI = Nothing
'        Set gobj = Nothing
'        Exit Function
'      End If
'    End If
    Set OC = New OpenCard
    Set OC.GUI = gobj
    OC.TypeName = obj.TypeName
    mOpenGUI.Add OC, obj.TypeName
  Else
'    If Not VerifyCode(OC.GUI.GUIPath) Then
'      If MsgBox("Код не подписан" & vbCrLf & "Разрешить запуск?", vbInformation + vbYesNo, "Предупреждение") = vbNo Then
'        Set GetInstanceGUI = Nothing
'       Exit Function
'      End If
'    End If
  End If
  Set GetInstanceGUI = OC.GUI
End Function

'Зарегестрировать нестандартный интерфейс пользователя для типобъектов
'Parameters:
'[IN][OUT]   GUI , тип параметра: Object -иинтерфейсный объект,
'[IN]   TypeName , тип параметра: String  - тип
'See Also:
'  CurSite
'  FormCount
'  GetFinderDialog
'  GetFullTextDialog
'  GetInstanceGUI
'  GetObjectListDialog
'  GetReferenceDialog
'  GetReferenceDialogEx
'  ShowSecurityDialog
'  StoreTempFileData
'Example:
'  call me.RegisterGUI(<параметры>)
Public Sub RegisterGUI(ByRef GUI As Object, ByVal TypeName As String)
Attribute RegisterGUI.VB_HelpID = 675
  Dim OC As OpenCard
  On Error Resume Next
  Set OC = New OpenCard
  Set OC.GUI = GUI
  OC.TypeName = TypeName
  mOpenGUI.Add OC, TypeName
End Sub

'Количество активных форм редактирования для текущего объекта
'Parameters:
'[IN]   InstanceiD , тип параметра: String  - идентификатор
'Returns:
'  значение типа Long
'See Also:
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FreeInstanceObject
'  GetFinderDialog
'  GetFullTextDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetSession
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'Example:
' dim variable as Long
' variable = me.FormCount(<параметры>)
Public Function FormCount(ByVal InstanceiD As String) As Long
Attribute FormCount.VB_HelpID = 545
  Dim cnt As Long
  Dim OC As OpenCard
  On Error Resume Next
  cnt = 0
  For Each OC In mOpenGUI
    cnt = cnt + OC.GUI.FormCount(InstanceiD)
  Next
  FormCount = cnt
End Function

'Получить окно для выбора ссылки
'Parameters:
'[IN]   TableName , тип параметра: String - имя раздела,
'[IN]   site , тип параметра: String = ""  - сайт
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeInstanceObject
'  GetFinderDialog
'  GetFullTextDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetReferenceDialogEx
'  GetSession
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'Example:
' dim variable as Object
' Set variable = me.GetReferenceDialog(<параметры>)
Public Function GetReferenceDialog(ByVal TableName As String, Optional ByVal site As String = "") As Object
Attribute GetReferenceDialog.VB_HelpID = 625
  site = TuneSite(site)
  Dim frm As frmDialog
  Set frm = New frmDialog
  frm.site = site
  frm.TableName = TableName
  Set frm.Runner = Me
  Set GetReferenceDialog = frm
End Function

'Расширенный диалог выбора ссылки
'Parameters:
'[IN]   TableName , тип параметра: String - имя раздела,
'[IN]   site , тип параметра: String = "" - сайт,
'[IN][OUT]   Optional Filter , тип параметра: String = ""  - строка фильтра
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeInstanceObject
'  GetFinderDialog
'  GetFullTextDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetReferenceDialog
'  GetSession
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'Example:
' dim variable as Object
' Set variable = me.GetReferenceDialogEx(<параметры>)
Public Function GetReferenceDialogEx(ByVal TableName As String, Optional ByVal site As String = "", Optional Filter As String = "") As Object
Attribute GetReferenceDialogEx.VB_HelpID = 630
  site = TuneSite(site)
  Dim frm As Form
  
  
  Dim rs As ADODB.Recordset, i
  Dim session As MTZSession.session
  Set session = GetSession(site)
  Dim s As String
  s = session.GetPartViewAlias(TableName)
  If s = "" Then
    Set GetReferenceDialogEx = GetReferenceDialog(TableName, site)
    Set rs = Nothing
    Exit Function
  End If
GetFromView:

  If Forms Is Nothing Then
    Set Forms = New FormCash
  End If
  On Error Resume Next
  Dim fc As FormCashItem
  Set fc = Forms.Item(TableName & "_" & Filter)
  
  If fc Is Nothing Then
    Set frm = New frmDialogEx
    frm.site = site
    frm.TableName = TableName
    
    frm.Filter = Filter
    Set frm.Runner = Me
    Set frm.Sess = session
    frm.pvAlias = s
    If UseFormCash Then Forms.Add frm, TableName, Filter
    frm.Caption = getReadablePartName(session, TableName)
    
'    Dim sql As String
'    sql = "Select the_Comment from Part where Name='" & TableName & "'"
'    Dim rsC As Recordset
'    Set rsC = session.GetData(sql)
'    If (Not rsC Is Nothing) Then
'      If (Not rsC.EOF) Then
'        frm.Caption = rsC(0).Value & vbNullString
'      End If
'    End If
  Else
    Set frm = fc.f
    Set frm.Runner = Me
    Set frm.Sess = session
    frm.TableName = TableName
    frm.Caption = getReadablePartName(session, TableName)
    frm.Filter = Filter
  End If
  
  'смотрим через View
  Set GetReferenceDialogEx = frm
End Function

'поиск строки в разделе
'Parameters:
'[IN]   TableName , тип параметра: String - имя раздела, ,
'[IN][OUT]   ID , тип параметра: String - результат идетнтификатор,
'[IN][OUT]   Brief , тип параметра: String - результат кратнкое название,
'[IN]   InstanceiD , тип параметра: String = "" - ID объекта для поиска внутри объекта ,
'[IN]   site , тип параметра: String = "" - сайт,
'[IN]   Filter , тип параметра: String = ""  - - строка фильтра
'Returns:
' Boolean, семантика результата:
'   true  - установлен
'   false - не выбран
'See Also:
'  AddCustomObjects
'  ClearBuffer
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeAllInstanses
'  FreeInstanceObject
'  GetBuffer
'  GetCustomObjects
'  GetFinderDialog
'  GetFullTextDialog
'  GetIDFromXMLField
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialog2
'  GetObjectListDialogEx
'  GetObjectListDialogEx3
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx3
'  GetSession
'  GetSQLDataDialog
'  HideAditionalButtons
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  RemoveCustomObjects
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  SetBuffer
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'  VerifyCode
'Example:
' dim variable as Boolean
' variable = me.GetReferenceDialogEx2(...параметры...)
Public Function GetReferenceDialogEx2(ByVal TableName As String, ByRef ID As String, ByRef Brief As String, Optional ByVal InstanceiD As String = "", Optional ByVal site As String = "", Optional ByVal Filter As String = "") As Boolean
Attribute GetReferenceDialogEx2.VB_HelpID = 635
  site = TuneSite(site)
  Dim frm As Form
  
  
  Set frm = GetReferenceDialogEx(TableName, site, Filter)
  
'  Dim rs As ADODB.Recordset, i
'  Dim obj As Object, model As Object
'  Dim Session As MtzSession.Session
'  Set Session = GetSession(site)
'  Dim s As String
'  s = Session.GetPartViewAlias(TableName)
'
'  If s = "" Then
'    Set frm = GetReferenceDialog(TableName, site)
'  Else
'    Set frm = New frmDialogEx
'    frm.site = site
'    frm.TableName = TableName
'    Set frm.Runner = Me
'    frm.pvAlias = s
'  End If
'
'GetFromView:
'  frm.Filter = Filter
  frm.InstanceiD = InstanceiD
  frm.Show vbModal
  If frm.ok Then
    ID = frm.ID
    Brief = frm.Brief
    GetReferenceDialogEx2 = True
  End If
  
End Function

'выбор строки с управлением кнопками
'Parameters:
'Parameters:
'[IN]   TableName , тип параметра: String - имя раздела, ,
'[IN][OUT]   ID , тип параметра: String - результат идетнтификатор,
'[IN][OUT]   Brief , тип параметра: String - результат кратнкое название,
'[IN]   InstanceiD , тип параметра: String = "" - ID объекта для поиска внутри объекта ,
'[IN]   site , тип параметра: String = "" - сайт,
'[IN]   Filter , тип параметра: String = ""  - - строка фильтра
'[IN][OUT]   Optional AllowAdd , тип параметра: Boolean = False - показ кнопки добавить,
'[IN][OUT]   Optional AllowSetup , тип параметра: Boolean = False  - паказ кнопки настройка
'Returns:
' Boolean, семантика результата:
'   true  - установлен
'   false - не выбран
'See Also:
'  AddCustomObjects
'  ClearBuffer
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeAllInstanses
'  FreeInstanceObject
'  GetBuffer
'  GetCustomObjects
'  GetFinderDialog
'  GetFullTextDialog
'  GetIDFromXMLField
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialog2
'  GetObjectListDialogEx
'  GetObjectListDialogEx3
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx2
'  GetSession
'  GetSQLDataDialog
'  HideAditionalButtons
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  RemoveCustomObjects
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  SetBuffer
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'  VerifyCode
'Example:
' dim variable as Boolean
' variable = me.GetReferenceDialogEx3(...параметры...)
Public Function GetReferenceDialogEx3(ByVal TableName As String, ByRef ID As String, ByRef Brief As String, Optional ByVal InstanceiD As String = "", Optional ByVal site As String = "", Optional ByVal Filter As String = "", Optional AllowAdd As Boolean = False, Optional AllowSetup As Boolean = False) As Boolean
Attribute GetReferenceDialogEx3.VB_HelpID = 640
  site = TuneSite(site)
  Dim frm As Form

  Set frm = GetReferenceDialogEx(TableName, site, Filter)
  frm.IsHide_Setup = Not (AllowSetup)
  frm.IsHide_Add = Not (AllowAdd)

  frm.InstanceiD = InstanceiD
  frm.Prepare
  
  frm.Show vbModal
  If frm.ok Then
    ID = frm.ID
    Brief = frm.Brief
    GetReferenceDialogEx3 = True
  End If
  
End Function

'диалог выбора SQL строки
'Parameters:
'[IN][OUT]  Parameters , тип параметра: NamedValues  - набор параметров для инициализации диалога
'Returns:
'  объект класса NamedValues - коллекция с результатом
'  ,или Nothing
'See Also:
'  AddCustomObjects
'  ClearBuffer
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeAllInstanses
'  FreeInstanceObject
'  GetBuffer
'  GetCustomObjects
'  GetFinderDialog
'  GetFullTextDialog
'  GetIDFromXMLField
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialog2
'  GetObjectListDialogEx
'  GetObjectListDialogEx3
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx2
'  GetReferenceDialogEx3
'  GetSession
'  HideAditionalButtons
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  RemoveCustomObjects
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  SetBuffer
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'  VerifyCode
'Example:
' dim variable as NamedValues
' Set variable = me.GetSQLDataDialog(...параметры...)
Public Function GetSQLDataDialog(Parameters As NamedValues) As NamedValues
Attribute GetSQLDataDialog.VB_HelpID = 650
  On Error GoTo err
  Dim site As String
  Dim connectionstring As String
  Dim connectionprovider As String
  Dim query  As String
  Dim ID As String
  Dim IDFieldName As String
  Dim SourceIDFieldName As String
  Dim BriefFields As String
  Dim XMLDoc As New DOMDocument
  Dim XML As String
  Dim res As New NamedValues
  Dim rs As ADODB.Recordset
  Dim conn As ADODB.Connection
  Dim frm As New frmSQLSelectDialog
  Dim Permanent As String
  Dim execProc As Boolean
  execProc = False
  
  On Error Resume Next
  Permanent = Parameters.Item("permanent").Value
  XML = Parameters.Item("xml").Value
  If (XML <> vbNullString) Then
    Call XMLDoc.loadXML(XML)
    Dim Node As MSXML2.IXMLDOMNode
    For Each Node In XMLDoc.childNodes.Item(0).childNodes
      If (Node.baseName = "ID") Then
        ID = Node.Text
      ElseIf (Node.baseName = "site") Then
        site = Node.Text
      ElseIf (Node.baseName = "connectionstring") Then
        connectionstring = Node.Text
      ElseIf (Node.baseName = "connectionprovider") Then
        connectionprovider = Node.Text
      ElseIf (Node.baseName = "query") Then
        query = Node.Text
      ElseIf (Node.baseName = "IDFieldName") Then
        IDFieldName = Node.Text
      ElseIf (Node.baseName = "BriefFields") Then
        BriefFields = Node.Text
      End If
    Next
  Else
    site = Parameters.Item("site").Value
    connectionstring = Parameters.Item("connectionstring").Value
    connectionprovider = Parameters.Item("connectionprovider").Value
    query = Parameters.Item("query").Value
    IDFieldName = Parameters.Item("idfieldname").Value
    BriefFields = Parameters.Item("BriefFields").Value
  End If
  
  Dim queryToExecute As String
  Dim ParametersForProc As NamedValues
  Dim Filter As String
  
  queryToExecute = query
  If LCase(Mid(queryToExecute, 1, 4)) <> "exec" Then
    execProc = False
    Filter = Parameters.Item("filter").Value
    queryToExecute = queryToExecute & Filter
    
    If (XML <> "") Then
      For Each Node In XMLDoc.childNodes.Item(0).childNodes
        Dim RequestedID As String
        If (Node.baseName = "ID") Then
          RequestedID = Node.Text
          If (InStr(queryToExecute, "%ID%") > 0) Then
            queryToExecute = Replace(queryToExecute, "%ID%", IDFieldName & "= '" & RequestedID & "'")
            Permanent = "yes"
          End If
        End If
        If (InStr(Node.baseName, "ID") > 0) Then
          Dim IDValue1 As String
          IDValue1 = Node.Text
          If (InStr(1, queryToExecute, "%" & Node.baseName & "%") > 0) Then
            If (IDValue1 <> "") Then
              queryToExecute = Replace(queryToExecute, "%" & Node.baseName & "%", IDValue1)
            Else
              queryToExecute = ""
              Exit For
            End If
          End If
        End If
      Next
    End If
    
    
    
  Else
    execProc = True
    Set ParametersForProc = New NamedValues
    If (XML <> "") Then
      For Each Node In XMLDoc.childNodes.Item(0).childNodes
        Dim RequestedIDForProc As String
        If (Node.baseName = "ID") Then
          RequestedIDForProc = Node.Text
          Call ParametersForProc.Add(IDFieldName, RequestedIDForProc)
          Permanent = "yes"
        End If
        If (InStr(Node.baseName, "ID") > 0) Then
          Dim IDValue3 As String
          IDValue3 = Node.Text
          If (IDValue3 <> vbNullString) Then
            Call ParametersForProc.Add(Node.baseName, IDValue3)
          End If
        End If
      Next
    End If
  End If
  
    
  If (queryToExecute <> vbNullString) Then
    If (Not execProc) Then
      queryToExecute = Replace(queryToExecute, "%ID%", " 1=1 ")
    End If
    
    If (connectionprovider <> vbNullString And connectionstring <> vbNullString) Then
      Set conn = Nothing
      Set conn = GetCustomObjects(connectionprovider & connectionstring)
      If conn Is Nothing Then
        Set conn = New Connection
        conn.connectionstring = "Provider=" & connectionprovider & ";" & connectionstring

      End If
      If (conn.State <> ADODB.adStateOpen) Then
        Call conn.Open
        conn.mode = adModeRead
      End If
      If (conn.State = ADODB.adStateOpen) Then
        If (queryToExecute <> "") Then
          Set rs = conn.Execute(queryToExecute)
        End If
      End If
    Else
      site = Parameters.Item("SITE").Value
      site = TuneSite(site)
      ' Выполним запрос
      Dim session As MTZSession.session
      Set session = GetSession(site)
      If (Not execProc) Then
        Set rs = session.GetProcData(queryToExecute)
      Else
        queryToExecute = Trim(Mid(queryToExecute, 5))
        Set rs = session.ExecRS(queryToExecute, ParametersForProc)
      End If
    End If
    Call res.Add("result", "CANCEL")
    Call res.Add("xml", XML)
    
    If (rs Is Nothing) Then
       Call res.Add("brief", "")
       Call res.Add("ID", "")
       res.Item("result").Value = "OK"
    Else
      Dim coll As Collection
      Dim onevs As NamedValues
      Dim collCaptions As Collection
      Set collCaptions = New Collection
      Set coll = New Collection
      Dim bCancelCaptions As Boolean
      Dim FieldValues()  As Variant
      bCancelCaptions = False
      While Not rs.EOF
        Dim j As Long
        Set onevs = New NamedValues
        
        ReDim FieldValues(0 To rs.Fields.Count - 1)
        For j = 0 To rs.Fields.Count - 1
          Dim strCaption As String
          Dim strValue As String
          strCaption = rs.Fields(j).Name
          strValue = rs(rs.Fields(j).Name) & ""
          If (strCaption <> vbNullString) Then
            If (Not bCancelCaptions) Then
              Dim vs As NamedValue
              Set vs = onevs.Add(strCaption, strValue)
              vs.ValueType = rs(j).Type
              vs.ValueSize = j
            End If
            FieldValues(j) = strValue
          End If
          DoEvents
        Next
        If (collCaptions.Count = 0) Then
          Call collCaptions.Add(onevs)
          bCancelCaptions = True
        End If
        Call coll.Add(FieldValues)
        Call rs.MoveNext
        DoEvents
      Wend
      Set frm.DataSource = coll
      Set frm.DataColumns = collCaptions
      On Error Resume Next
      IDFieldName = Parameters.Item("IDFieldName").Value
      ID = Parameters.Item("ID").Value
      BriefFields = Parameters.Item("BriefFields").Value
      On Error GoTo err
      
      frm.IDFieldName = IDFieldName
      frm.BriefFields = BriefFields
      frm.ID = ID
      If (Permanent <> "") Then
        frm.Permanent = True
      End If
      If (frm.ShowModal) Then
        If (frm.ok) Then
          Call res.Add("brief", frm.Brief)
          Call res.Add("ID", frm.ID)
          ' Делаем XML
          If (XML = "") Then
            XML = "<SQLData>"
            XML = XML & "<ID>" & frm.ID & "</ID>"
            XML = XML & "<Brief>" & frm.Brief & "</Brief>"
            XML = XML & "<connectionstring>" & connectionstring & "</connectionstring>"
            XML = XML & "<connectionprovider>" & connectionprovider & "</connectionprovider>"
            XML = XML & "<query>" & query & "</query>"
            XML = XML & "<IDFieldName>" & IDFieldName & "</IDFieldName>"
            XML = XML & "<BriefFields>" & BriefFields & "</BriefFields>"
            XML = XML & "</SQLData>"
          Else
            Dim DocFrom As New DOMDocument
            Call DocFrom.loadXML(XML)
            Dim NodeFrom As IXMLDOMNode
            Dim bIDAdded As Boolean
            Dim bBriefAdded As Boolean
            bIDAdded = False
            bBriefAdded = False
            
            For Each NodeFrom In DocFrom.childNodes(0).childNodes
              If (NodeFrom.baseName = "ID") Then
                NodeFrom.Text = frm.ID
                bIDAdded = True
              End If
              If (NodeFrom.baseName = "Brief") Then
                NodeFrom.Text = frm.Brief
                bBriefAdded = True
              End If
              If (bIDAdded And bBriefAdded) Then
                Exit For
              End If
            Next
            If (Not bIDAdded) Then
              Dim newIDNODe1 As IXMLDOMNode
              Set newIDNODe1 = DocFrom.createNode(NODE_ELEMENT, "ID", DocFrom.namespaceURI)
              newIDNODe1.Text = frm.ID
              Call DocFrom.childNodes.Item(0).appendChild(newIDNODe1)
            End If
            If (Not bBriefAdded) Then
              Dim newBriefNode As IXMLDOMNode
              Set newBriefNode = DocFrom.createNode(NODE_ELEMENT, "Brief", DocFrom.namespaceURI)
              newBriefNode.Text = frm.Brief
              Call DocFrom.childNodes.Item(0).appendChild(newBriefNode)
            End If
            XML = DocFrom.XML
          End If
          res.Item("xml").Value = XML
          res.Item("result").Value = "OK"
        End If
      Else
        If (frm.ErrorString <> vbNullString) Then
          Call res.Add("ErrorDescription", frm.ErrorString)
        End If
      End If
    End If
  End If
  If (Not conn Is Nothing) Then
    If (conn.State = adStateOpen) Then
      Call conn.Close
    End If
  End If
  Set GetSQLDataDialog = res
  If (Not frm Is Nothing) Then
    Unload frm
    Set frm = Nothing
  End If
  Exit Function
err:
  If (Not frm Is Nothing) Then
    Unload frm
    Set frm = Nothing
  End If
  Call res.Add("ErrorDescription", err.Description)
  Call res.Add("ErrorNumber", CStr(err.Number))
End Function

'Диалог списка объектов
'Parameters:
'[IN]   site , тип параметра: String = "" - сайт,
'[IN]   TypeName , тип параметра: String = ""  - тип объекта
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeInstanceObject
'  GetFinderDialog
'  GetFullTextDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetSession
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'Example:
' dim variable as Object
' Set variable = me.GetObjectListDialog(<параметры>)
Public Function GetObjectListDialog(Optional ByVal site As String = "", Optional ByVal TypeName As String = "") As Object
Attribute GetObjectListDialog.VB_HelpID = 605
  Dim frm As Form
  site = TuneSite(site)
  
  If TypeName <> "" Then
   
      Dim rs As ADODB.Recordset, i As Long
      Dim obj As Object, model As Object
      Dim session As MTZSession.session
      Set session = GetSession(site)
      
      Dim tva As String
      tva = session.GetTypeViewAlias(TypeName)
      If tva = "" Then
          GoTo defaultdialog
      End If
      
      
     Dim fc As FormCashItem
     On Error Resume Next
     If Forms Is Nothing Then
      Set Forms = New FormCash
     End If
     Set fc = Forms.Item(TypeName & "_")
  
  If fc Is Nothing Then
    Set frm = New frmObjListEx
    frm.site = site
    frm.TypeName = TypeName
    frm.Filter = "" 'Filter
    frm.pvAlias = tva
    Set frm.Runner = Me
    frm.Caption = getReadableTypeName(session, TypeName)
    If UseFormCash Then Forms.Add frm, TypeName, ""
  Else
    Set frm = fc.f
    Set frm.Runner = Me
  End If
      
'      'смотрим через View
'      Set frm = New frmObjListEx
'      frm.site = site
'      frm.TypeName = TypeName
'      frm.Filter = "" 'Filter
'      frm.pvAlias = tva
'      Set frm.Runner = Me
      Set GetObjectListDialog = frm
      Exit Function
      
  End If
  
defaultdialog:
  
  Set frm = New frmObjList2
  frm.TypeName = TypeName
  frm.site = site
  Set frm.Runner = Me
  Set GetObjectListDialog = frm
End Function


'Диалог списка объектов
'Parameters:
'[IN][OUT]   ID , тип параметра: String - ID выбранного объекта,
'[IN][OUT]   Brief , тип параметра: String - название выбранного объекта,
'[IN]   site , тип параметра: String = "" - сайт,
'[IN]   TypeName , тип параметра: String = ""  - тип объекта
'Parameters:
'Returns:
' Boolean, семантика результата:
'   true  - получен
'   false - не выбран
'See Also:
'  AddCustomObjects
'  ClearBuffer
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeAllInstanses
'  FreeInstanceObject
'  GetBuffer
'  GetCustomObjects
'  GetFinderDialog
'  GetFullTextDialog
'  GetIDFromXMLField
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialogEx
'  GetObjectListDialogEx3
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx2
'  GetReferenceDialogEx3
'  GetSession
'  GetSQLDataDialog
'  HideAditionalButtons
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  RemoveCustomObjects
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  SetBuffer
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'  VerifyCode
'Example:
' dim variable as Boolean
' variable = me.GetObjectListDialog2(...параметры...)
Public Function GetObjectListDialog2(ByRef ID As String, ByRef Brief As String, Optional ByVal site As String = "", Optional ByVal TypeName As String = "") As Boolean
Attribute GetObjectListDialog2.VB_HelpID = 610
  Dim frm As Form
  Set frm = GetObjectListDialog(site, TypeName)
  'frm.Runner = Me
  frm.Show vbModal
  If frm.ok Then
    ID = frm.ID
    Brief = frm.Brief
    GetObjectListDialog2 = True
  End If
  On Error Resume Next
  frm.Hide
  Set frm = Nothing
End Function

Private Function GetObjectListDialogEx1(Optional ByVal site As String = "", Optional ByVal TypeName As String = "", Optional Filter As String = "", Optional AllowAdd As Boolean = True, Optional AllowOpen As Boolean = True, Optional AllowRefresh As Boolean = True, Optional AllowPrn As Boolean = True, Optional AllowFnd As Boolean = True, Optional AllowSetup As Boolean = True) As Object
  Dim frm As Form
  site = TuneSite(site)
  
  If TypeName <> "" Then
   
      Dim rs As ADODB.Recordset, i As Long
      Dim obj As Object, model As Object
      Dim session As MTZSession.session
      Set session = GetSession(site)
      
      Dim tva As String
      tva = session.GetTypeViewAlias(TypeName)
      If tva = "" Then
          GoTo defaultdialog
      End If
      
      'смотрим через View
      Set frm = New frmObjListEx
      frm.site = site
      frm.TypeName = TypeName
      frm.Filter = Filter
      frm.pvAlias = tva
      On Error Resume Next
      frm.IsHide_Add = Not (AllowAdd)
      frm.IsHide_Setup = Not (AllowSetup)
      frm.IsHide_Open = Not (AllowOpen)
      frm.IsHide_Refresh = Not (AllowRefresh)
      frm.IsHide_Prn = Not (AllowPrn)
      frm.IsHide_Find = Not (AllowFnd)
      
      
      Set frm.Runner = Me
      frm.Caption = getReadableTypeName(session, TypeName)
      Set GetObjectListDialogEx1 = frm
      Exit Function
      
  End If
  
defaultdialog:
  
  Set frm = New frmObjList2
  frm.TypeName = TypeName
  frm.site = site
  frm.Filter = Filter
  Set frm.Runner = Me
  Set GetObjectListDialogEx1 = frm
End Function
'Диалог списка объектов
'Parameters:
'[IN][OUT]   ID , тип параметра: String - ID выбранного объекта,
'[IN][OUT]   Brief , тип параметра: String - название выбранного объекта,
'[IN]   site , тип параметра: String = "" - сайт,
'[IN]   TypeName , тип параметра: String = ""  - тип объекта
'[IN][OUT]   Optional AllowAdd , тип параметра: Boolean = False - кнопка добавить,
'[IN][OUT]   Optional AllowOpen , тип параметра: Boolean = False - кнопка открыть,
'[IN][OUT]   Optional AllowRefresh , тип параметра: Boolean = False - кнопка обновить,
'[IN][OUT]   Optional AllowPrn , тип параметра: Boolean = False - кнопка печать,
'[IN][OUT]   Optional AllowFnd , тип параметра: Boolean = False - кнопка поиск,
'[IN][OUT]   Optional AllowSetup , тип параметра: Boolean = False  - кнопка настройка
'Returns:
' Boolean, семантика результата:
'   true  - получен
'   false - не выбран
'See Also:
'  AddCustomObjects
'  ClearBuffer
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeAllInstanses
'  FreeInstanceObject
'  GetBuffer
'  GetCustomObjects
'  GetFinderDialog
'  GetFullTextDialog
'  GetIDFromXMLField
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialog2
'  GetObjectListDialogEx
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx2
'  GetReferenceDialogEx3
'  GetSession
'  GetSQLDataDialog
'  HideAditionalButtons
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  RemoveCustomObjects
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  SetBuffer
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'  VerifyCode
'Example:
' dim variable as Boolean
' variable = me.GetObjectListDialogEx3(...параметры...)
Public Function GetObjectListDialogEx3(ByRef ID As String, ByRef Brief As String, Optional ByVal site As String = "", Optional ByVal TypeName As String = "", Optional ByVal Filter As String = "", Optional AllowAdd As Boolean = False, Optional AllowOpen As Boolean = False, Optional AllowRefresh As Boolean = False, Optional AllowPrn As Boolean = False, Optional AllowFnd As Boolean = False, Optional AllowSetup As Boolean = False) As Boolean
Attribute GetObjectListDialogEx3.VB_HelpID = 620

  Dim frm As Form
  
  If Forms Is Nothing Then
    Set Forms = New FormCash
  End If
  On Error Resume Next
  Dim fc As FormCashItem
  Set fc = Forms.Item(TypeName & "_" & Filter)
  
  If fc Is Nothing Then
    Set frm = GetObjectListDialogEx1(site, TypeName, Filter, AllowAdd, AllowOpen, AllowRefresh, AllowPrn)
    If UseFormCash Then Forms.Add frm, TypeName, Filter
  Else
    Set frm = fc.f
  End If
  frm.ok = False
  Set frm.Runner = Me
  frm.Show vbModal
  If frm.ok Then
    ID = frm.ID
    Brief = frm.Brief
    GetObjectListDialogEx3 = True
  End If
  frm.Hide
  Set frm = Nothing
End Function

''Диалог списка объектов
'Parameters:
'[IN][OUT]   ID , тип параметра: String - ID выбранного объекта,
'[IN][OUT]   Brief , тип параметра: String - название выбранного объекта,
'[IN]   site , тип параметра: String = "" - сайт,
'[IN]   TypeName , тип параметра: String = ""  - тип объекта
'[IN]   Filter , тип параметра: String = ""  - Фильтр
'Parameters:
'Returns:
' Boolean, семантика результата:
'   true  - получен
'   false - не выбран
'See Also:
'  AddCustomObjects
'  ClearBuffer
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeAllInstanses
'  FreeInstanceObject
'  GetBuffer
'  GetCustomObjects
'  GetFinderDialog
'  GetFullTextDialog
'  GetIDFromXMLField
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialog2
'  GetObjectListDialogEx3
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx2
'  GetReferenceDialogEx3
'  GetSession
'  GetSQLDataDialog
'  HideAditionalButtons
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  RemoveCustomObjects
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  SetBuffer
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'  VerifyCode
'Example:
' dim variable as Boolean
' variable = me.GetObjectListDialogEx(...параметры...)
Public Function GetObjectListDialogEx(ByRef ID As String, ByRef Brief As String, Optional ByVal site As String = "", Optional ByVal TypeName As String = "", Optional ByVal Filter As String = "") As Boolean
Attribute GetObjectListDialogEx.VB_HelpID = 615
  Dim frm As Form
  
  If Forms Is Nothing Then
    Set Forms = New FormCash
  End If
  On Error Resume Next
  Dim fc As FormCashItem
  Set fc = Forms.Item(TypeName & "_" & Filter)
  
  If fc Is Nothing Then
    Set frm = GetObjectListDialogEx1(site, TypeName, Filter)
    If UseFormCash Then Forms.Add frm, TypeName, Filter
  Else
    Set frm = fc.f
  End If
  frm.ok = False
  Set frm.Runner = Me
  frm.Show vbModal
  If frm.ok Then
    ID = frm.ID
    Brief = frm.Brief
    GetObjectListDialogEx = True
  End If
  frm.Hide
  Set frm = Nothing
End Function

'Диалог для создания нового объекта
'Parameters:
'[IN]   site , тип параметра: String = ""  - сайт
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeInstanceObject
'  GetFinderDialog
'  GetFullTextDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetObjectListDialog
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetSession
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'Example:
' dim variable as Object
' Set variable = me.GetNewObject(<параметры>)
Public Function GetNewObject(Optional ByVal site As String = "") As Object
Attribute GetNewObject.VB_HelpID = 600
  Dim frm As frmTypeList
  site = TuneSite(site)
  Set frm = New frmTypeList
  frm.site = site
  Set frm.Runner = Me
  frm.Show vbModal
  If frm.ok Then
    Set GetNewObject = frm.NewObject
  End If
  Set frm = Nothing
End Function

'Диалог атрибутивного поиска
'Parameters:
'[IN]   site , тип параметра: String = "" - сайт,
'[IN]   TypeName , тип параметра: String = ""  - тип объекта
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeInstanceObject
'  GetFullTextDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetSession
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'Example:
' dim variable as Object
' Set variable = me.GetFinderDialog(<параметры>)
Public Function GetFinderDialog(Optional ByVal site As String = "", Optional ByVal TypeName As String = "") As Object
Attribute GetFinderDialog.VB_HelpID = 570
  Dim result As Object
  Set result = Nothing
  
  If mFinder Is Nothing Then
    Set mFinder = CreateObject("MTZFindGUI.GUI")
    ' Создадим метамодель
    Dim rs As ADODB.Recordset
    Set rs = ListInstances(site, "MTZMetaModel")
    Dim ID As String
    Dim MetaModel As Object
    Dim session As MTZSession.session
    Set session = GetSession(site)
    If Not (session Is Nothing) Then
      If Not rs.EOF Then
        ID = rs!InstanceiD
        Set MetaModel = GetInstanceObject(ID)
        Call mFinder.Init(session, MetaModel, Me)
      End If
    End If
  End If
  If Not (mFinder Is Nothing) Then
    Set result = mFinder.GetFindForm(site, TypeName)
  End If
  Set GetFinderDialog = result
End Function

'Диалог полнотекстового поиска
'Parameters:
'[IN]   site , тип параметра: String = ""  - сайт
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeInstanceObject
'  GetFinderDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetSession
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'Example:
' dim variable as Object
' Set variable = me.GetFullTextDialog(<параметры>)
Public Function GetFullTextDialog(Optional ByVal site As String = "") As Object
Attribute GetFullTextDialog.VB_HelpID = 575
  Dim result As Object
  Set result = Nothing
  
  If mFinder Is Nothing Then
    Set mFinder = CreateObject("MTZFindGUI.GUI")
    ' Создадим метамодель
    Dim rs As ADODB.Recordset
    Set rs = ListInstances(site, "MTZMetaModel")
    Dim ID As String
    Dim MetaModel As Object
    Dim session As MTZSession.session
    Set session = GetSession(site)
    If Not (session Is Nothing) Then
      If Not rs.EOF Then
        ID = rs!InstanceiD
        Set MetaModel = GetInstanceObject(ID)
        Call mFinder.Init(session, MetaModel, Me)
      End If
    End If
  End If
  If Not (mFinder Is Nothing) Then
    Set result = mFinder.GetFullTextFindForm(site, "")
  End If
  Set GetFullTextDialog = result
End Function

'Получить список объектов
'Parameters:
'[IN]   site , тип параметра: String - сайт,
'[IN]   ObjType , тип параметра: String = ""  - тип объекта
'Returns:
'  объект класса ADODB.Recordset
'  ,или Nothing
'See Also:
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeInstanceObject
'  GetFinderDialog
'  GetFullTextDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetSession
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'Example:
' dim variable as ADODB.Recordset
' Set variable = me.ListInstances(<параметры>)
Public Function ListInstances(ByVal site As String, Optional ByVal ObjType As String = "") As ADODB.Recordset
Attribute ListInstances.VB_HelpID = 660

site = TuneSite(site)
Dim rs As ADODB.Recordset
Dim Parameters As NamedValues

If ObjType = "" Then
On Error GoTo tryProc1
  Set rs = Sessions.Item(site).GetRows("V_Instance")
  If (rs Is Nothing) Then
    GoTo tryProc1
  End If
  GoTo NormalFlow
tryProc1:
  Set Parameters = New NamedValues
  Set rs = Sessions.Item(site).ExecRS("MTZGetV_Instance", Parameters)
Else
  On Error GoTo tryProc2
  Set rs = Sessions.Item(site).GetRows("V_Instance", "", "", " ObjType='" & ObjType & "'")
  If (rs Is Nothing) Then
    GoTo tryProc2
  End If
  GoTo NormalFlow
tryProc2:
  Set Parameters = New NamedValues
  Call Parameters.Add("ObjType", ObjType)
  Set rs = Sessions.Item(site).ExecRS("MTZGetV_Instance", Parameters)
End If
NormalFlow:
Set ListInstances = rs
End Function

'Получить имя типа по имени раздела
'Parameters:
'[IN]   site , тип параметра: String - сайт,
'[IN]   TableName , тип параметра: String  - раздел
'Returns:
'  значение типа String - тип
'See Also:
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeInstanceObject
'  GetFinderDialog
'  GetFullTextDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetSession
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  ShowSecurityDialog
'  StoreTempFileData
'  UnLockInstanceObject
'Example:
' dim variable as String
' variable = me.TableToType(<параметры>)
Public Function TableToType(ByVal site As String, ByVal TableName As String) As String
Attribute TableToType.VB_HelpID = 720
site = TuneSite(site)
Dim rs As ADODB.Recordset

TableToType = Sessions.Item(site).TableToType(TableName)
End Function

'Удалить документ
'Parameters:
'[IN]   InstanceiD , тип параметра: String - идентификатор,
'[IN]   site , тип параметра: String = ""  - сайт
'Returns:
' Boolean, семантика результата:
'   true  - удален
'   false - ошибка
'See Also:
'  CloseClass
'  CurSite
'  FindInstanceByRow
'  FormCount
'  FreeInstanceObject
'  GetFinderDialog
'  GetFullTextDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetSession
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'Example:
' dim variable as Boolean
' variable = me.DeleteInstance(<параметры>)
Public Function DeleteInstance(ByVal InstanceiD As String, Optional ByVal site As String = "") As Boolean
Attribute DeleteInstance.VB_HelpID = 535
  site = TuneSite(site)
  Dim s As session
  Dim GUI As Object
  Set GUI = GetInstanceGUI(InstanceiD, site)
  Set s = Sessions.Item(site)
  If s.DeleteInstance(InstanceiD) Then
    ' проверяем нет ли открытых форм.ю которые работают с этим объектом
    If GUI.FormCount(InstanceiD) = 0 Then
      FreeInstanceObject InstanceiD
    End If
  End If
  Set s = Nothing
End Function

'Создать документ
'Parameters:
'[IN]   InstanceiD , тип параметра: String - идентификатор,
'[IN]   ObjType , тип параметра: String - тип документа,
'[IN]   Name , тип параметра: String - название,
'[IN]   site , тип параметра: String = ""  - сайт
'Returns:
' Boolean, семантика результата:
'   true  - создан
'   false -ошибка
'See Also:
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeInstanceObject
'  GetFinderDialog
'  GetFullTextDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetSession
'  ListInstances
'  LockInstanceObject
'  RegisterGUI
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'Example:
' dim variable as Boolean
' variable = me.NewInstance(<параметры>)
Public Function NewInstance(ByVal InstanceiD As String, ByVal ObjType As String, ByVal Name As String, Optional ByVal site As String = "") As Boolean
Attribute NewInstance.VB_HelpID = 670
  site = TuneSite(site)
  Dim s As session
  Set s = Sessions.Item(site)
  NewInstance = s.NewInstance(InstanceiD, ObjType, Name)
  Set s = Nothing
End Function

'Найти документ по строке из раздела
'Parameters:
'[IN]   Table,, тип параметра: Variant - имя раздела
'[IN]   RowID , тип параметра: String  - идентификатор строки
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  CloseClass
'  CurSite
'  DeleteInstance
'  FormCount
'  FreeInstanceObject
'  GetFinderDialog
'  GetFullTextDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetSession
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'Example:
' dim variable as Object
' Set variable = me.FindInstanceByRow(<параметры>)
Public Function FindInstanceByRow(ByVal Table, ByVal RowID As String) As Object
Attribute FindInstanceByRow.VB_HelpID = 540
  Dim s As session
  Dim instid As String
  Dim nv As NamedValues
  Set nv = New NamedValues
  Dim nvi As NamedValue
  
  Set nvi = nv.Add("InstanceID", Null)
  nvi.ORACLE_GUID
  nvi.ValueDirection = adParamOutput
  
  
  
  Set nvi = nv.Add("RowID", RowID)
  nvi.ORACLE_GUID
  
  nv.Add "the_Table", Table
  
  Set nvi = nv.Add("CURSESSION", "")
  nvi.ORACLE_GUID
  
  For Each s In Sessions
  On Error GoTo bye
    nvi.Value = s.sessionid
    s.Exec "RowToInstance", nv
    
    If IsGUID(nv.Item("instanceid").Value & "") Then
      Set FindInstanceByRow = GetInstanceObject(nv.Item("instanceid").Value, s.site)
      Exit For
    End If
  Next
  Set nv = Nothing
  Exit Function
bye:
 ' MsgBox Err.Description
 ' Stop
 'Resume
End Function

'Запрет автоматической выгрузки данных объекта из памяти
'Parameters:
'[IN]   InstanceiD , тип параметра: String  -идентификатор
'See Also:
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeInstanceObject
'  GetFinderDialog
'  GetFullTextDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetSession
'  ListInstances
'  NewInstance
'  RegisterGUI
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'Example:
'  call me.LockInstanceObject(<параметры>)
Public Sub LockInstanceObject(ByVal InstanceiD As String)
Attribute LockInstanceObject.VB_HelpID = 665
 On Error Resume Next
 If Not mOpenInstances.Item(InstanceiD) Is Nothing Then
   mOpenInstances.Item(InstanceiD).Locked = True
 End If
End Sub

'Разрешение автоматической выгрузки из памяти
'Parameters:
'[IN]   InstanceiD , тип параметра: String  - идентификатор
'See Also:
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeInstanceObject
'  GetFinderDialog
'  GetFullTextDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetSession
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'Example:
'  call me.UnLockInstanceObject(<параметры>)
Public Sub UnLockInstanceObject(ByVal InstanceiD As String)
Attribute UnLockInstanceObject.VB_HelpID = 725
 On Error Resume Next
 If Not mOpenInstances.Item(InstanceiD) Is Nothing Then
   mOpenInstances.Item(InstanceiD).Locked = False
 End If
End Sub

'Выгрузка данных объекта из памяти
'Parameters:
'[IN]   InstanceiD , тип параметра: String  - ...
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  GetFinderDialog
'  GetFullTextDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetSession
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'Example:
' dim variable as Boolean
' variable = me.FreeInstanceObject(<параметры>)
Public Function FreeInstanceObject(ByVal InstanceiD As String) As Boolean
Attribute FreeInstanceObject.VB_HelpID = 555
  On Error Resume Next
  If mOpenInstances.Item(InstanceiD) Is Nothing Then
    FreeInstanceObject = True
 Else
   If mOpenInstances.Item(InstanceiD).COMobject Is Nothing Then
     mOpenInstances.Remove InstanceiD
     FreeInstanceObject = True
   Else
     On Error Resume Next
     If mOpenInstances.Item(InstanceiD).Locked = False Then
      If FormCount(InstanceiD) = 0 Then
        mOpenInstances.Item(InstanceiD).COMobject.CloseClass
        Set mOpenInstances.Item(InstanceiD).COMobject.manager = Nothing
        Set mOpenInstances.Item(InstanceiD).COMobject.MTZSession = Nothing
        On Error GoTo bye
        Set mOpenInstances.Item(InstanceiD).COMobject = Nothing
        mOpenInstances.Remove InstanceiD
        FreeInstanceObject = True
      Else
        FreeInstanceObject = False
      End If
     Else
       FreeInstanceObject = False
     End If
   End If
 End If
 Exit Function
bye:
  FreeInstanceObject = False
End Function

'Получить сессию, которая обслуживает текущий сайт
'Parameters:
'[IN][OUT]   site , тип параметра: String = ""  - сайт
'Returns:
'  объект класса Session
'  ,или Nothing
'See Also:
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeInstanceObject
'  GetFinderDialog
'  GetFullTextDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetReferenceDialog
'  GetReferenceDialogEx
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'Example:
' dim variable as Session
' Set variable = me.GetSession(<параметры>)
Public Function GetSession(Optional site As String = "") As session
Attribute GetSession.VB_HelpID = 645
  On Error Resume Next
  site = TuneSite(site)
  Dim s As session
  Set s = Sessions.Item(site)
  
  If s Is Nothing Then
    Sessions.ServerUserName = mServerUserName
    Sessions.ServerUserPassword = mServerUserPassword
    Sessions.ServerDBName = mServerDBName
    Sessions.ServerRootDBName = mServerRootDBName
    Set s = Sessions.Add(site)
  End If
  Set GetSession = s
  Set s = Nothing
End Function

'Создать объект в памяти по данным XML  файла
'Parameters:
'[IN]   XMLPath , тип параметра: String  - путь к файлу
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeInstanceObject
'  GetFinderDialog
'  GetFullTextDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetNewObject
'  GetObjectListDialog
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetSession
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'Example:
' dim variable as Object
' Set variable = me.GetInstanceObjectFromXML(<параметры>)
Public Function GetInstanceObjectFromXML(ByVal XMLPath As String) As Object
Attribute GetInstanceObjectFromXML.VB_HelpID = 595
  Dim o As Object
  Dim xdom As MSXML2.DOMDocument
  Set xdom = New MSXML2.DOMDocument
  xdom.Load XMLPath
  Dim InstanceiD As String, TypeName As String
  Dim anode As IXMLDOMElement
  Dim e_list As IXMLDOMNodeList
  Set anode = xdom.lastChild.firstChild
  TypeName = anode.Attributes.getNamedItem("TYPENAME").nodeValue
  InstanceiD = anode.Attributes.getNamedItem("ID").nodeValue
  
  If mOpenInstances.Item(InstanceiD) Is Nothing Then
    On Error GoTo bye
      With mOpenInstances.Add(InstanceiD)
        Set .COMobject = CreateObject(TypeName & ".Application")
        Set .COMobject.manager = Me
        Set .COMobject.MTZSession = Nothing
        .site = ""
        .COMobject.ID = InstanceiD
      End With
 End If
 Set mOpenInstances.Item(InstanceiD).COMobject.MTZSession = Nothing
 mOpenInstances.Item(InstanceiD).COMobject.XMLLoad xdom.lastChild, 1
 Set GetInstanceObjectFromXML = mOpenInstances.Item(InstanceiD).COMobject
 Set xdom = Nothing
 Exit Function
bye:
Set xdom = Nothing
End Function

'Получить диалог для назначения прав
'Parameters:
'[IN][OUT]  Item , тип параметра: Object  - форма
'Returns:
' Boolean, семантика результата:
'   true  - удача
'   false - ошибка
'See Also:
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeInstanceObject
'  GetFinderDialog
'  GetFullTextDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetSession
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'Example:
' dim variable as Boolean
' variable = me.ShowSecurityDialog(<параметры>)
Public Function ShowSecurityDialog(Item As Object) As Boolean
Attribute ShowSecurityDialog.VB_HelpID = 710
  On Error Resume Next
  If Item.Application.manager Is Nothing Then
    MsgBox "Задайте объект для определения прав", vbOKOnly, "Диалог определения стиля защиты"
    Exit Function
  End If
  Dim dlg As frmSecDialog
  Set dlg = New frmSecDialog
  Set dlg.Item = Item
  dlg.Show vbModal
  ShowSecurityDialog = dlg.ok
  Set dlg.Item = Nothing
  Set dlg = Nothing
End Function

Private Property Get Logger() As MTZUtil.Logger
  If mLogger Is Nothing Then
    Set mLogger = New MTZUtil.Logger
    mLogger.CreateLog "Manager", "Manager"
  End If
  Set Logger = mLogger
End Property

'Сохранить информацию о временном файле, для дальнейего удаления
'Parameters:
'[IN]   Path , тип параметра: String - путь,
'[IN]   PartName , тип параметра: String = "" - раздел,
'[IN]   RowID , тип параметра: String = ""  - идентификатор строки
'See Also:
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeInstanceObject
'  GetFinderDialog
'  GetFullTextDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetSession
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  ShowSecurityDialog
'  TableToType
'  UnLockInstanceObject
'Example:
'  call me.StoreTempFileData(<параметры>)
Public Sub StoreTempFileData(ByVal path As String, Optional ByVal PartName As String = "", Optional ByVal RowID As String = "")
Attribute StoreTempFileData.VB_HelpID = 715
  If mTempFiles Is Nothing Then
    Set mTempFiles = New Collection
  End If
  Dim temp As TempFileInfo
  Set temp = New TempFileInfo
  temp.PathToFile = path
  temp.RowID = RowID
  temp.PartName = PartName
  mTempFiles.Add temp
End Sub

'удалить временные файлы
Private Sub KillTempFiles()
  If mTempFiles Is Nothing Then Exit Sub
  
  Dim temp As TempFileInfo
  On Error Resume Next
  For Each temp In mTempFiles
    Kill temp.PathToFile
  Next
  Set mTempFiles = Nothing
End Sub

'выгрузить открытые формы
Private Sub KillForms()
  If Forms Is Nothing Then Exit Sub
  
  Dim f As FormCashItem
  On Error Resume Next
  For Each f In Forms
    Set f.f.Runner = Nothing
    Unload f
    Set f.f = Nothing
  Next
  Set Forms = Nothing
End Sub



Private Property Get BufferData() As BufferData
If m_BD Is Nothing Then
  Set m_BD = New BufferData
End If
Set BufferData = m_BD
End Property

'сохранить буфер копирования
'Parameters:
'[IN]   PartName , тип параметра: String - тип раздела,
'[IN]   Data , тип параметра: String  - данные
'See Also:
'  AddCustomObjects
'  ClearBuffer
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeAllInstanses
'  FreeInstanceObject
'  GetBuffer
'  GetCustomObjects
'  GetFinderDialog
'  GetFullTextDialog
'  GetIDFromXMLField
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialog2
'  GetObjectListDialogEx
'  GetObjectListDialogEx3
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx2
'  GetReferenceDialogEx3
'  GetSession
'  GetSQLDataDialog
'  HideAditionalButtons
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  RemoveCustomObjects
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'  VerifyCode
'Example:
'  call me.SetBuffer(...параметры...)
Public Sub SetBuffer(ByVal PartName As String, ByVal Data As String)
Attribute SetBuffer.VB_HelpID = 705
  BufferData.Add Data, PartName
End Sub

'получить буфер копирования
'Parameters:
'[IN]   PartName , тип параметра: String  - название раздела
'Returns:
'  значение типа String - данные буфера
'See Also:
'  AddCustomObjects
'  ClearBuffer
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeAllInstanses
'  FreeInstanceObject
'  GetCustomObjects
'  GetFinderDialog
'  GetFullTextDialog
'  GetIDFromXMLField
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialog2
'  GetObjectListDialogEx
'  GetObjectListDialogEx3
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx2
'  GetReferenceDialogEx3
'  GetSession
'  GetSQLDataDialog
'  HideAditionalButtons
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  RemoveCustomObjects
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  SetBuffer
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'  VerifyCode
'Example:
' dim variable as String
' variable = me.GetBuffer(...параметры...)
Public Function GetBuffer(ByVal PartName As String) As String
Attribute GetBuffer.VB_HelpID = 560
  GetBuffer = ""
  On Error Resume Next
  GetBuffer = BufferData.Item(PartName).Data
End Function

'очистить буфер обмена
'Parameters:
'[IN]   PartName , тип параметра: String  - раздел
'See Also:
'  AddCustomObjects
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeAllInstanses
'  FreeInstanceObject
'  GetBuffer
'  GetCustomObjects
'  GetFinderDialog
'  GetFullTextDialog
'  GetIDFromXMLField
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialog2
'  GetObjectListDialogEx
'  GetObjectListDialogEx3
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx2
'  GetReferenceDialogEx3
'  GetSession
'  GetSQLDataDialog
'  HideAditionalButtons
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  RemoveCustomObjects
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  SetBuffer
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'  VerifyCode
'Example:
'  call me.ClearBuffer(...параметры...)
Public Sub ClearBuffer(ByVal PartName As String)
Attribute ClearBuffer.VB_HelpID = 520
  BufferData.Remove PartName
End Sub

'проверка подписи кода
'Parameters:
'[IN]   path , тип параметра: String,
'[IN][OUT]   Optional SSinger , тип параметра: String - кто подписал,
'[IN][OUT]   Optional SSerial , тип параметра: String - номер,
'[IN][OUT]   Optional Description , тип параметра: String - описание,
'[IN][OUT]   Optional DescriptionURL , тип параметра: String  - URL
'Returns:
' Boolean, семантика результата:
'   true  - проверен
'   false - неверно
'See Also:
'  AddCustomObjects
'  ClearBuffer
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeAllInstanses
'  FreeInstanceObject
'  GetBuffer
'  GetCustomObjects
'  GetFinderDialog
'  GetFullTextDialog
'  GetIDFromXMLField
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialog2
'  GetObjectListDialogEx
'  GetObjectListDialogEx3
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx2
'  GetReferenceDialogEx3
'  GetSession
'  GetSQLDataDialog
'  HideAditionalButtons
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  RemoveCustomObjects
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  SetBuffer
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'Example:
' dim variable as Boolean
' variable = me.VerifyCode(...параметры...)
Public Function VerifyCode(ByVal path As String, Optional SSinger As String, Optional SSerial As String, Optional Description As String, Optional DescriptionURL As String) As Boolean
Attribute VerifyCode.VB_HelpID = 730
  
  On Error GoTo err_handler
    Dim SignedCode As CAPICOM.SignedCode
    Set SignedCode = New CAPICOM.SignedCode
    SignedCode.FileName = path
    'verify
    SignedCode.Verify
    VerifyCode = True
    Description = SignedCode.Description
    DescriptionURL = SignedCode.DescriptionURL
    SSinger = SignedCode.Signer.Certificate.GetInfo(CAPICOM_CERT_INFO_SUBJECT_DNS_NAME)
    SSerial = SignedCode.Signer.Certificate.SerialNumber
    Set SignedCode = Nothing
    Exit Function
    
err_handler:
   VerifyCode = False
   Set SignedCode = Nothing
   Exit Function
End Function

'Public Function GetOpenInstances() As OpenInstances
'    Set GetOpenInstances = mOpenInstances
'End Function


' Удаление из памяти всех открытых документов, которые могут быть выгружены из памяти
'Parameters:
' параметров нет
'See Also:
'  AddCustomObjects
'  ClearBuffer
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeInstanceObject
'  GetBuffer
'  GetCustomObjects
'  GetFinderDialog
'  GetFullTextDialog
'  GetIDFromXMLField
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialog2
'  GetObjectListDialogEx
'  GetObjectListDialogEx3
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx2
'  GetReferenceDialogEx3
'  GetSession
'  GetSQLDataDialog
'  HideAditionalButtons
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  RemoveCustomObjects
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  SetBuffer
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'  VerifyCode
'Example:
'  call me.FreeAllInstanses()
Public Sub FreeAllInstanses()
Attribute FreeAllInstanses.VB_HelpID = 550
    Dim col As Collection
    Dim ti As tmpInst
    Dim i As Long
    Debug.Print mOpenInstances.Count
    Set col = New Collection
    For i = 1 To mOpenInstances.Count
        Set ti = New tmpInst
        ti.ID = mOpenInstances.Item(i).ID
        col.Add ti
    Next
    For i = 1 To col.Count
        Set ti = col.Item(i)
        On Error Resume Next
        Debug.Print ti.ID & " " & mOpenInstances.Item(ti.ID).COMobject.TypeName
        If Not FreeInstanceObject(ti.ID) Then
            Debug.Print "Locked= " & mOpenInstances.Item(ti.ID).Locked
        End If
    Next
    Set col = Nothing
    Debug.Print mOpenInstances.Count
End Sub

'получить название типа
Friend Function getReadableTypeName(session As MTZSession.session, TypeName As String) As String
    Dim rs As ADODB.Recordset
    Dim res As String
    res = "Выбор документа"
    
    Set rs = session.GetData("select the_Comment from objecttype where Name='" & TypeName & "'")
    If rs.RecordCount = 1 Then
        res = "Выберите: " & rs!the_comment
    End If
    Set rs = Nothing
    getReadableTypeName = res
End Function

'получить название раздела
Friend Function getReadablePartName(session As MTZSession.session, PartName As String) As String
    Dim rs As ADODB.Recordset
    Dim res As String
    res = "Выбор строки"
    
    Set rs = session.GetData("select Caption from part where Name='" & PartName & "'")
    If rs.RecordCount = 1 Then
        res = "Выберите: " & rs!Caption
    End If
    Set rs = Nothing
    getReadablePartName = res
End Function

'Флаг отображения дополнительных иконок в диалогах
'Parameters:
' параметров нет
'Returns:
'  значение типа Boolean
'See Also:
'Example:
' dim variable as Boolean
' variable = True
Public Property Get HideAditionalButtons() As Boolean
Attribute HideAditionalButtons.VB_HelpID = 655
 HideAditionalButtons = m_HideAdditionalButtons
End Property

'Флаг отображения дополнительных иконок в диалогах
'Parameters:
'[IN][OUT]  Value , тип параметра: Boolean
'See Also:
'  AddCustomObjects
'  ClearBuffer
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeAllInstanses
'  FreeInstanceObject
'  GetBuffer
'  GetCustomObjects
'  GetFinderDialog
'  GetFullTextDialog
'  GetIDFromXMLField
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialog2
'  GetObjectListDialogEx
'  GetObjectListDialogEx3
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx2
'  GetReferenceDialogEx3
'  GetSession
'  GetSQLDataDialog
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  RemoveCustomObjects
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  SetBuffer
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'  VerifyCode
'Example:
' dim value as Variant
' value = ...значение...
' me.HideAditionalButtons = value
Public Property Let HideAditionalButtons(Value As Boolean)
 m_HideAdditionalButtons = Value
End Property

'получить значение поля из XML блока
'Parameters:
'[IN]   XML , тип параметра: String  - данные
'Returns:
'  значение типа String - значение поля
'See Also:
'  AddCustomObjects
'  ClearBuffer
'  CloseClass
'  CurSite
'  DeleteInstance
'  FindInstanceByRow
'  FormCount
'  FreeAllInstanses
'  FreeInstanceObject
'  GetBuffer
'  GetCustomObjects
'  GetFinderDialog
'  GetFullTextDialog
'  GetInstanceGUI
'  GetInstanceObject
'  GetInstanceObjectFromXML
'  GetNewObject
'  GetObjectListDialog
'  GetObjectListDialog2
'  GetObjectListDialogEx
'  GetObjectListDialogEx3
'  GetReferenceDialog
'  GetReferenceDialogEx
'  GetReferenceDialogEx2
'  GetReferenceDialogEx3
'  GetSession
'  GetSQLDataDialog
'  HideAditionalButtons
'  ListInstances
'  LockInstanceObject
'  NewInstance
'  RegisterGUI
'  RemoveCustomObjects
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  SetBuffer
'  ShowSecurityDialog
'  StoreTempFileData
'  TableToType
'  UnLockInstanceObject
'  VerifyCode
'Example:
' dim variable as String
' variable = me.GetIDFromXMLField(...параметры...)
Public Function GetIDFromXMLField(ByVal XML As String) As String
Attribute GetIDFromXMLField.VB_HelpID = 580
  Dim iFrom As Long
  Dim iTo As Long
  Dim m_ID As String
  iFrom = InStr(1, XML, "<ID>")
  If (iFrom > 0) Then
      iTo = InStr(iFrom, XML, "</ID>")
      m_ID = Mid(XML, iFrom + 4, iTo - iFrom - 4)
  End If
  GetIDFromXMLField = m_ID
End Function


