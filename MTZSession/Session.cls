VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Session"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 235
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'Description:
'Главный интерфейс компонента

Option Base 0
Option Explicit

Private Path As String
Private GetRowsCnt As Long
Private GetRowCnt As Long
Private mTempPath As String
Private mLicCode As String

'тип блокировки
Public Enum LockStyle
  NoLock = 0 'нет блокировки
  LockSession = 1 ' временная блокировка
  LockPermanent = 2 'постоянная блокировка
  ExternalLockSession = 3 'чужая временная блокировка
  ExternalLockPermanent = 4 'чужая постоянная блокировка
End Enum


Private ADOProvider As String
Private mvarMap As NamedValues
Private mLogger As MTZUtil.Logger

' Соеднинение с помощью ADO
' ADO connect options
Private mAlias As String
Private mDataBaseName As String
Private mUserName As String
Private mServer As String
Private mPassword As String
Private mLoginTimeOut As Integer
Private msite As String
Private Integrated As Boolean

' real connection
Private ADOConnected As Boolean
Private mADOConnection As ADODB.Connection
Private mTheDataSource As DataSource 'local copy
Private mFinder As Finder
Public SymbolAt As String
Attribute SymbolAt.VB_VarHelpID = 575
Public FuncPrefix As String
Attribute FuncPrefix.VB_VarHelpID = 315
Public ProcPrefix As String
Attribute ProcPrefix.VB_VarHelpID = 490
Public KernelPrefix As String
Attribute KernelPrefix.VB_VarHelpID = 435

Private mSessionID As String

Private mServerUserName As String
Private mServerUserPassword As String
Private mServerDBName As String
Private mServerRootDBName As String
Private m_Language As String
'пользователь
'Parameters:
'[IN][OUT]  NewVal , тип параметра: String  - пользователь
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim value as Variant
' value = ...значение...
' me.ServerUserName = value
Public Property Let ServerUserName(NewVal As String)
Attribute ServerUserName.VB_HelpID = 530
  mServerUserName = NewVal
End Property
'пароль
'Parameters:
'[IN][OUT]  NewVal , тип параметра: String  - пароль
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim value as Variant
' value = ...значение...
' me.ServerUserPassword = value
Public Property Let ServerUserPassword(NewVal As String)
Attribute ServerUserPassword.VB_HelpID = 535
  mServerUserPassword = NewVal
End Property
' имя базы данных
'Parameters:
'[IN][OUT]  NewVal , тип параметра: String  - имя базы данных
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim value as Variant
' value = ...значение...
' me.ServerDBName = value
Public Property Let ServerDBName(NewVal As String)
Attribute ServerDBName.VB_HelpID = 520
  mServerDBName = NewVal
End Property
' коренвая база
'Parameters:
'[IN][OUT]  NewVal , тип параметра: String  - коренвая база
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim value as Variant
' value = ...значение...
' me.ServerRootDBName = value
Public Property Let ServerRootDBName(NewVal As String)
Attribute ServerRootDBName.VB_HelpID = 525
  mServerRootDBName = NewVal
End Property
' язык
'Parameters:
'[IN][OUT]  NewVal , тип параметра: String  - язык
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim value as Variant
' value = ...значение...
' me.Language = value
Public Property Let Language(NewVal As String)
Attribute Language.VB_HelpID = 440
    If m_Language <> NewVal Then
        m_Language = NewVal
        Call GetData("update the_session set Lang='" + m_Language + "' where the_Sessionid='" + sessionid + "'")
    End If
End Property
' язык
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as String
' variable = me.Language
Public Property Get Language() As String
Dim objrs As ADODB.RecordSet
    If m_Language = "" Then
        Set objrs = GetData("select Lang from the_session where the_Sessionid='" + sessionid + "'")
        If Not objrs Is Nothing Then
            If objrs.EOF = False And objrs.BOF = False Then
                If Not IsNull(objrs!Lang) Then
                    m_Language = objrs!Lang
                End If
                m_Language = ""
            End If
            m_Language = ""
        End If
    End If
    Language = m_Language
End Property

'Отладочный объект
'Parameters:
' параметров нет
'Returns:
'  объект класса MTZUtil.Logger
'  ,или Nothing
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as MTZUtil.Logger
' Set variable = me.Logger
Public Property Get Logger() As MTZUtil.Logger
Attribute Logger.VB_HelpID = 460
  If mLogger Is Nothing Then
    Set mLogger = New MTZUtil.Logger
    mLogger.CreateLog "Session", "Session"
  End If
  Set Logger = mLogger
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as String
' variable = me.sessionid
Property Get sessionid() As String
Attribute sessionid.VB_HelpID = 540
  sessionid = mSessionID
End Property

'Идентификатор сессии
'Parameters:
'[IN]   NewSession , тип параметра: String  - идентификатор уже открытой сессии
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim value as Variant
' value = <значение>
' me.sessionid = value
Property Let sessionid(ByVal NewSession As String)
   mSessionID = Left(NewSession, 38)
End Property

'Объект - приложение (сам этот класс)
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as Object
' Set variable = me.Application
Property Get Application() As Object
Attribute Application.VB_HelpID = 240
  Set Application = Me
End Property

'объект родитель - всегда Nothing
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as Object
' Set variable = me.Parent
Property Get Parent() As Object
Attribute Parent.VB_HelpID = 485
  Set Parent = Nothing
End Property


' класс,реализующий доступ к базе даных
Friend Property Get TheDataSource() As DataSource
    Set TheDataSource = mTheDataSource
End Property

' класс,реализующий утилиты поиска
'Parameters:
' параметров нет
'Returns:
'  объект класса Finder
'  ,или Nothing
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'Example:
' dim variable as Finder
' Set variable = me.TheFinder
Public Property Get TheFinder() As Finder
Attribute TheFinder.VB_HelpID = 590
    If mFinder Is Nothing Then
      Set mFinder = New Finder
      Set mFinder.Application = Me
    End If
    Set TheFinder = mFinder
End Property

' login to database and init DataSource object
Private Function ServerLogIn() As Boolean
   If Not ADOConnected Then
      On Error Resume Next
      Dim bresult As Boolean
      If (mServerUserName <> vbNullString) Then
        ADOProvider = "sqloledb"
        Integrated = False
        mLoginTimeOut = 100
        SymbolAt = "@"
        bresult = ADOLogin(mServerDBName, mServerRootDBName, mServerUserName, mServerUserPassword, mLoginTimeOut, Integrated)
      Else
        bresult = ADOLogin(mServer, mDataBaseName, mUserName, mPassword, mLoginTimeOut, Integrated)
      End If
      If bresult Then
         Set mTheDataSource = New DataSource
         Call mTheDataSource.Init(Me)
         mTheDataSource.SetConnection mADOConnection
         ADOConnected = True
      End If
   End If
   ServerLogIn = ADOConnected
End Function

'constructor
Private Sub Class_Initialize()
On Error Resume Next
    Logger.Message "init"
    Path = MTZGetSetting("MTZ", "CONFIG", "XMLPATH", App.Path & "\MTZ.XML")
    mTempPath = GetSetting("MTZ", "CONFIG", "TEMPPATH", App.Path & "\TEMP\")
    ADOConnected = False
    App.StartLogging App.Path & "\env.log", vbLogThreadID + vbLogToFile
    
End Sub

'destructor
Private Sub Class_Terminate()
On Error Resume Next
    CloseClass
    Logger.Message "Terminate"
    Set mLogger = Nothing
End Sub

'Регистрация
'Parameters:
'[IN][OUT]  UID , тип параметра: String - пользователь,
'[IN][OUT]   PWD , тип параметра: String  - пароль
'Returns:
' Boolean, семантика результата:
'   true  -открыта сессия
'   false -ошибка
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as Boolean
' variable = me.Login(<параметры>)
Public Function Login(UID As String, PWD As String) As Boolean
Attribute Login.VB_HelpID = 465
       Dim cursession As String
       On Error GoTo login_err
       
       If Not ADOConnected Then
         Err.Raise 10000, "MTZSession.Session.Login", "Set valid site name befor login"
         Exit Function
       End If
       
       Dim p As NamedValues
       
       Login = False
       
       Set p = New NamedValues
       Dim p1 As NamedValue
       
       
       Set p1 = p.Add(SymbolAt & "the_Session", Null)
       p1.ValueDirection = adParamOutput
       p1.ValueType = adChar
       p1.ValueSize = 38
       
       Set p1 = p.Add(SymbolAt & "PWD", PWD)
       p1.ValueDirection = adParamInput
       p1.ValueType = adChar
       p1.ValueSize = 80
       
       Set p1 = p.Add(SymbolAt & "USR", UID)
       p1.ValueDirection = adParamInput
       p1.ValueType = adChar
       p1.ValueSize = 255
       
       On Error Resume Next
       Err.Clear
       TheDataSource.ExecuteProc "MTZLogin", p ' Это сделано для GreenWay
       If (Err.Number = 0) Then
          cursession = p.Item(SymbolAt & "the_Session").Value
       End If
       If cursession <> vbNullString Then
          sessionid = cursession
          Login = True
          
          On Error Resume Next
          TheDataSource.Execute ("CREATE TABLE [#Pager] (" & _
            "[PagerID] [uniqueidentifier] NOT NULL ," & _
            "[ViewID] [uniqueidentifier] NOT NULL ," & _
            "[Sequence] [numeric](18, 0) IDENTITY (1, 1) NOT NULL ," & _
            "[SessionID] [uniqueidentifier] NULL ," & _
            " PRIMARY KEY  CLUSTERED" & _
            "(" & _
            "  [PagerID]," & _
            "  [ViewID]," & _
            "  [Sequence]" & _
            ")" & _
          ")")
          If Err.Number <> 0 Then
            MsgBox Err.Description
          End If
       Else
         TheDataSource.ExecuteProc "Login", p ' Это совместимость со старыми версиями
         cursession = p.Item(SymbolAt & "the_Session").Value
         If cursession <> vbNullString Then
           sessionid = cursession
           Login = True
           
          On Error Resume Next
          TheDataSource.Execute ("CREATE TABLE [#Pager] (" & _
            "[PagerID] [uniqueidentifier] NOT NULL ," & _
            "[ViewID] [uniqueidentifier] NOT NULL ," & _
            "[Sequence] [numeric](18, 0) IDENTITY (1, 1) NOT NULL ," & _
            "[SessionID] [uniqueidentifier] NULL ," & _
            " PRIMARY KEY  CLUSTERED" & _
            "(" & _
            "  [PagerID]," & _
            "  [ViewID]," & _
            "  [Sequence]" & _
            ")" & _
          ")")
          
          If Err.Number <> 0 Then
            MsgBox Err.Description
          End If
           
         End If
       End If
       
       If Login = True Then
        'Check Registry Settings
        If GetSetting("MTZ", "CONFIG", "LAYOUTS", "") = "" Then
            Call SaveSetting("MTZ", "CONFIG", "CFGFRM", MTZGetSetting("MTZ", "CONFIG", "CFGFRM"))
            Call SaveSetting("MTZ", "CONFIG", "CFGJRNL", MTZGetSetting("MTZ", "CONFIG", "CFGJRNL"))
            Call SaveSetting("MTZ", "CONFIG", "IMAGEPATH", MTZGetSetting("MTZ", "CONFIG", "IMAGEPATH"))
            Call SaveSetting("MTZ", "CONFIG", "LAYOUTS", MTZGetSetting("MTZ", "CONFIG", "LAYOUTS"))
            Call SaveSetting("MTZ", "CONFIG", "TEMPPATH", MTZGetSetting("MTZ", "CONFIG", "TEMPPATH"))
        End If
       End If
       
       Exit Function
login_err:
       Login = False
End Function

'Регистрация по данным текущей Windows сессии
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  - удача
'   false - ошибка
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as Boolean
'  variable = me.IntegratedLogin()
Public Function IntegratedLogin() As Boolean
Attribute IntegratedLogin.VB_HelpID = 400
       Dim cursession As String
       On Error GoTo IntegratedLogin_err
       
       If Not ADOConnected Then
         Err.Raise 10000, "MTZSession.Session.IntegratedLogin", "Set valid site name befor IntegratedLogin"
         Exit Function
       End If
       
       Dim p As NamedValues
       
       IntegratedLogin = False
       
       Set p = New NamedValues
       p.Add SymbolAt & "the_Session", Null
       p.Add SymbolAt & "USR", GetNTUser()
       p.Add SymbolAt & "PWD", "INTEGRATED"
       
       TheDataSource.ExecuteProc "Login", p
       cursession = p.Item(SymbolAt & "the_session").Value
       
       If cursession <> "" Then
        sessionid = cursession
        IntegratedLogin = True
       End If
       Exit Function
IntegratedLogin_err:
       IntegratedLogin = False
End Function

'Закрытие сесии
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -удача
'   false -ошибка
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as Boolean
'  variable = me.Logout()
Public Function Logout() As Boolean
Attribute Logout.VB_HelpID = 470
    On Error Resume Next
    Dim nv As NamedValues, nvi As NamedValue
    Dim realname As String
    Set nv = New NamedValues
    
    If IsORACLE Then
      Set nvi = nv.Add(SymbolAt & "CURSESSION", sessionid)
      nvi.ORACLE_GUID
    End If
    
    Logout = TheDataSource.ExecuteProc("Logout", nv)
  
    sessionid = ""
    Set nv = Nothing
    
End Function






'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'
' Built in ADO Support
'
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' phisical connect to database thru ADO
'##ModelId=3B8F800E00DC
Private Function ADOLogin(ByVal Server As String, ByVal DataBase As String, ByVal User As String, ByVal Pass As String, ByVal aLoginTimeOut As Integer, ByVal Integrated As Boolean) As Boolean
  Dim mConnectString As String
  On Error GoTo bye
  ADOLogin = False
  Set mADOConnection = New ADODB.Connection
  
  
  If UCase(ADOProvider) = "SQLOLEDB" Then
    If Integrated Then
      mConnectString = "Server=" + Server + ";DataBase=" + DataBase + ";Trusted_Connection=yes"
    Else
      mConnectString = "Server=" + Server + ";DataBase=" + DataBase + ";UID=" + User + ";Pwd=" + Pass + ";"
    End If
  Else
     mConnectString = "User ID=" & User & ";Password=" & Pass & ";Data Source=" & Server & ";Persist Security Info=False"
  End If
  
  mADOConnection.Provider = ADOProvider
  mADOConnection.ConnectionTimeout = aLoginTimeOut
  mADOConnection.CommandTimeout = aLoginTimeOut
  
  Call mADOConnection.Open(mConnectString)
  If Not (mADOConnection.State = adStateOpen) Then
    ADOConnected = False
  Else
    ADOConnected = True
  End If
  ADOLogin = ADOConnected
  Exit Function
bye:
   App.LogEvent Err.Description, 1
   Set mADOConnection = Nothing
   'Err.Raise Err.Number, Err.Source, Err.Description
End Function

'phisical ADO connection close
'##ModelId=3B8F800E019A
Private Sub ADOLogOff()
  If ADOConnected Then
   On Error Resume Next
    mADOConnection.Close
    ADOConnected = False
    Set mADOConnection = Nothing
    mTheDataSource.SetConnection Nothing
  End If
End Sub

' активно ли соединение с базой
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as Boolean
' variable = me.Connected
Public Property Get Connected() As Boolean
Attribute Connected.VB_HelpID = 280
'Test for Works & docs connection
  Connected = ADOConnected
End Property

'Деструктор
'Parameters:
' параметров нет
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
'  call me.CloseClass()
Public Sub CloseClass()
Attribute CloseClass.VB_HelpID = 270
On Error Resume Next
    Logger.Message "CloseClass"
    If ADOConnected And sessionid <> "" Then Logout
    If ADOConnected Then ADOLogOff
    If Not mTheDataSource Is Nothing Then
        mTheDataSource.CloseClass
        Set mTheDataSource = Nothing
    End If
End Sub

' проверить соединение с базой
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  Application
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as Boolean
'  variable = me.CheckConnection()
Public Function CheckConnection() As Boolean
Attribute CheckConnection.VB_HelpID = 260
    On Error Resume Next
    CheckConnection = TheDataSource.CheckConnection
End Function


'##ModelId=3B8F800E021C
Friend Property Get MAP() As NamedValues
  Set MAP = mvarMap
End Property

'Текущий сайт
'Parameters:
'[IN]   s , тип параметра: String  - сайт
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim value as Variant
' value = <значение>
' me.Site = value
Public Property Let Site(ByVal s As String)
       msite = s
       
       If (mServerUserName = "") Then
       On Error GoTo login_err
       Dim xdom As MSXML2.DOMDocument
       Dim I As Long
       Set xdom = New MSXML2.DOMDocument
       xdom.async = False
       xdom.Load Path
       
       For I = 0 To xdom.lastChild.childNodes.Length - 1
         If UCase(xdom.lastChild.childNodes.Item(I).Attributes.getNamedItem("Name").nodeValue) = UCase(s) Then
           With xdom.lastChild.childNodes.Item(I).Attributes
              mServer = .getNamedItem("Server").nodeValue
              mDataBaseName = .getNamedItem("DB").nodeValue
              mUserName = .getNamedItem("USER").nodeValue
              mPassword = .getNamedItem("PASSWORD").nodeValue
              mLoginTimeOut = .getNamedItem("TIMEOUT").nodeValue
              ADOProvider = .getNamedItem("PROVIDER").nodeValue
              SymbolAt = .getNamedItem("AT").nodeValue
              Integrated = .getNamedItem("INTEGRATED").nodeValue
              FuncPrefix = .getNamedItem("FUNC").nodeValue
              ProcPrefix = .getNamedItem("PROC").nodeValue
              KernelPrefix = .getNamedItem("KERNEL").nodeValue
            

           End With
           Exit For
         End If
      Next
      Set xdom = Nothing
      End If
'       mServer = GetSetting("MTZ", msite, "Server", "")
'       mDataBaseName = GetSetting("MTZ", msite, "DB", "")
'       mUserName = GetSetting("MTZ", msite, "USER", "sa")
'       mPassword = GetSetting("MTZ", msite, "PASSWORD", "")
'       mLoginTimeOut = GetSetting("MTZ", msite, "TIMEOUT", "100")
'       ADOProvider = GetSetting("MTZ", msite, "PROVIDER", "sqloledb")
'       SymbolAt = GetSetting("MTZ", msite, "AT", "@")
       
       If Not ServerLogIn Then
        App.LogEvent "Connection to SQL Server failed", 1
        Err.Raise 10000, "MTZ.Env.Site", "Connection to SQL Server failed"
        Exit Property
       End If
       
       ' load stored map
       On Error Resume Next
       LoadMap
       
       Exit Property
login_err:

End Property

'сайт
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as String
' variable = me.Site
Public Property Get Site() As String
Attribute Site.VB_HelpID = 570
  Site = msite
End Property
       


'##ModelId=3B8F800E0295
Private Sub LoadMap()
    On Error GoTo bye
    Dim rs As ADODB.RecordSet, s As String, mn As String
    
    If Not IsORACLE Then
      On Error GoTo tryProc
      Set rs = TheDataSource.OpenRecordset("select name,Value,optiontype from sysoptions order by optiontype,name")
      GoTo NormalFlow
tryProc:
On Error GoTo bye
      Dim Parameter As NamedValues
      Set Parameter = New NamedValues
      Set rs = TheDataSource.ExecuteRSProc("MTZGetSysOptions", Parameter)
    Else
      Set rs = TheDataSource.OpenRecordset("select name,theValue,optiontype from sysoptions order by optiontype,name")
    End If
NormalFlow:
    Set mvarMap = New NamedValues
    If rs Is Nothing Then Exit Sub
    If rs.EOF Then Exit Sub
    While Not rs.EOF
    
    
    If Not IsORACLE Then
      s = CStr(rs!Value)
    Else
      s = CStr(rs!theValue)
    End If
    
     
     mn = rs!optiontype & "." & rs!Name
On Error Resume Next
     mvarMap.Add mn, s
On Error GoTo bye
     rs.MoveNext
    Wend
    rs.Close
    Set rs = Nothing
bye:
End Sub

'Получить идентификаторы строк раздела
'Parameters:
'[IN]   Table , тип параметра: String - раздел,
'[IN]   ParentID , тип параметра: String = "" - родительская строка,
'[IN]   ParentRowID = "",, тип параметра: Variant - родитель в дереве
'[IN]   Optional Filter , тип параметра: String = ""  - дополнительный фильтр
'Returns:
'  объект класса ADODB.RecordSet
'  ,или Nothing
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as ADODB.RecordSet
' Set variable = me.GetIDs(<параметры>)
Public Function GetIDs(ByVal Table As String, Optional ByVal ParentID As String = "", Optional ByVal ParentRowID = "", Optional Filter As String = "") As ADODB.RecordSet
Attribute GetIDs.VB_HelpID = 335
Dim rs As RecordSet
Dim qry As String

If ParentID <> "" Then
  If HasParent(Table) Then
    qry = "select " & Table & "id ID, ChangeStamp, SecurityStyleID from " & Table & " where ParentStructRowID='" & ParentID & "' "
    
  Else
    qry = "select " & Table & "id ID, ChangeStamp, SecurityStyleID from " & Table & " where InstanceID='" & ParentID & "' "
  End If
  
  If LCase(ParentRowID) = "null" Then
    qry = qry & " and ParentrowID is null "
  ElseIf ParentRowID <> "" Then
    qry = qry & " and ParentrowID='" & ParentRowID & "'"
  End If
  
  If Filter <> "" Then
    Set rs = TheDataSource.OpenRecordset(qry & " and ( " & Filter & ")")
  Else
    Set rs = TheDataSource.OpenRecordset(qry)
  End If
  If rs Is Nothing Then Exit Function
  
  Set rs.ActiveConnection = Nothing
  Set GetIDs = rs
  
  Set rs = Nothing
Else
  qry = "select " & Table & "id ID , ChangeStamp from " & Table
  If LCase(ParentRowID) = "null" Then
    qry = qry & " where ParentrowID is null "
  ElseIf ParentRowID <> "" Then
    qry = qry & " where ParentrowID='" & ParentRowID & "'"
  Else
   qry = qry & " where 1=1 "
  End If
  If Filter <> "" Then
    Set rs = TheDataSource.OpenRecordset(qry & " and ( " & Filter & ")")
  Else
    Set rs = TheDataSource.OpenRecordset(qry)
  End If
  If rs Is Nothing Then Exit Function
  Set rs.ActiveConnection = Nothing
  Set GetIDs = rs
  
  Set rs = Nothing
End If

End Function

'Получить строку по идентификатору
'Parameters:
'[IN]   Table , тип параметра: String - раздел,
'[IN]   RowID , тип параметра: String  - идентификатор строки
'Returns:
'  объект класса ADODB.RecordSet
'  ,или Nothing
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as ADODB.RecordSet
' Set variable = me.GetRow(<параметры>)
Public Function GetRow(ByVal Table As String, ByVal RowID As String) As ADODB.RecordSet
Attribute GetRow.VB_HelpID = 365
  On Error GoTo bye
  Dim rs As RecordSet
  
  GetRowCnt = GetRowCnt + 1
  If GetRowCnt = 50000 Then
    'MsgBox "Демонстрационная версия. Сессия.", vbOKOnly, "ХАСАН"
    GetRowCnt = 0
  End If

  On Error GoTo tryProc
  Set rs = TheDataSource.OpenRecordset("select * from " & Table & " where " & Table & "id='" & RowID & "'")
tryProc:
  If rs Is Nothing Then
    Dim Parameters As NamedValues
    Set Parameters = New NamedValues
    Parameters.Add(Table & "ID", RowID).ValueType = adGUID
    Set rs = ExecRS("MTZGet" & Table, Parameters)
  End If
  
  If rs Is Nothing Then Exit Function
  If rs.BOF Or rs.EOF Then Exit Function
  
  'Set rs.ActiveConnection = Nothing
  Set GetRow = rs
  Set rs = Nothing
  Exit Function
bye:
  'Stop
  'Resume
End Function

'Получить строки раздела
'Parameters:
'[IN]   Table , тип параметра: String - раздел,
'[IN]   ParentID , тип параметра: String = "" - родительская строка,
'[IN]   ParentRowID = "",, тип параметра: Variant - родитель в дереве
'[IN]   Optional Filter , тип параметра: String = ""  - дополнительный фильтр
'Returns:
'  объект класса ADODB.RecordSet
'  ,или Nothing
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as ADODB.RecordSet
' Set variable = me.GetRows(<параметры>)
Public Function GetRows(ByVal Table As String, Optional ByVal ParentID As String = "", Optional ByVal ParentRowID = "", Optional Filter As String = "") As ADODB.RecordSet
Attribute GetRows.VB_HelpID = 370
Dim rs As RecordSet
Dim qry As String
GetRowsCnt = GetRowsCnt + 1
If GetRowsCnt = 20000 Then
  'MsgBox "Демонстрационная версия. Сессия.", vbOKOnly, "ХАСАН"
  GetRowsCnt = 0
End If

If ParentID <> "" Then
  If HasParent(Table) Then
    qry = "select " & Table & ".* from " & Table & " where ParentStructRowID='" & ParentID & "' "
  Else
    qry = "select " & Table & ".* from " & Table & " where InstanceID='" & ParentID & "' "
  End If
  
  If LCase(ParentRowID) = "null" Then
    qry = qry & " and ParentrowID is null "
  ElseIf ParentRowID <> "" Then
    qry = qry & " and ParentrowID='" & ParentRowID & "'"
  End If
  If Filter <> "" Then
    Set rs = TheDataSource.OpenRecordset(qry & " and ( " & Filter & ")")
  Else
   Set rs = TheDataSource.OpenRecordset(qry)
  End If
  If rs Is Nothing Then Exit Function
  
  Set rs.ActiveConnection = Nothing
  Set GetRows = rs
  Set rs = Nothing
Else
  qry = "select " & Table & ".* from " & Table
  If LCase(ParentRowID) = "null" Then
    qry = qry & " where ParentrowID is null "
  ElseIf ParentRowID <> "" Then
    qry = qry & " where ParentrowID='" & ParentRowID & "'"
  Else
   If Filter <> "" Then qry = qry & " where 1=1 "
  End If
  If Filter <> "" Then
    Set rs = TheDataSource.OpenRecordset(qry & " and ( " & Filter & ")")
  Else
   Set rs = TheDataSource.OpenRecordset(qry)
  End If
  If rs Is Nothing Then Exit Function
  Set rs.ActiveConnection = Nothing
  Set GetRows = rs
  Set rs = Nothing
End If
End Function
'Получить строки раздела
'Parameters:
'[IN]   Table , тип параметра: String - раздел,
'[IN]   ParentID , тип параметра: String = "" - родительская строка,
'[IN]   ParentRowID = "",, тип параметра: Variant - родитель в дереве
'[IN]   Optional Filter , тип параметра: String = ""  - дополнительный фильтр
'[IN][OUT]   Optional SortOrder , тип параметра: String = ""  - порядок сортировки
'Returns:
'  объект класса ADODB.RecordSet
'  ,или Nothing
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as ADODB.RecordSet
' Set variable = me.GetRowsEx(...параметры...)
Public Function GetRowsEx(ByVal Table As String, Optional ByVal ParentID As String = "", Optional ByVal ParentRowID = "", Optional Filter As String = "", Optional SortOrder As String = "") As ADODB.RecordSet
Attribute GetRowsEx.VB_HelpID = 375
Dim rs As RecordSet
Dim qry As String

GetRowsCnt = GetRowsCnt + 1
If GetRowsCnt = 20000 Then
  'MsgBox "Демонстрационная версия. Сессия.", vbOKOnly, "ХАСАН"
  GetRowsCnt = 0
End If


If ParentID <> "" Then
  If HasParent(Table) Then
    qry = "select " & Table & ".* from " & Table & " where ParentStructRowID='" & ParentID & "' "
    
  Else
    qry = "select " & Table & ".* from " & Table & " where InstanceID='" & ParentID & "' "
  End If
  
  If LCase(ParentRowID) = "null" Then
    qry = qry & " and ParentrowID is null "
  ElseIf ParentRowID <> "" Then
    qry = qry & " and ParentrowID='" & ParentRowID & "'"
  End If
  If Filter <> "" Then
    Set rs = TheDataSource.OpenRecordset(qry & " and ( " & Filter & ")" & " " & SortOrder)
  Else
   Set rs = TheDataSource.OpenRecordset(qry & " " & SortOrder)
  End If
  If rs Is Nothing Then Exit Function
  
  Set rs.ActiveConnection = Nothing
  Set GetRowsEx = rs
  Set rs = Nothing
Else
  qry = "select " & Table & ".* from " & Table
  If LCase(ParentRowID) = "null" Then
    qry = qry & " where ParentrowID is null "
  ElseIf ParentRowID <> "" Then
    qry = qry & " where ParentrowID='" & ParentRowID & "'"
  Else
   If Filter <> "" Then qry = qry & " where 1=1 "
  End If
  If Filter <> "" Then
    Set rs = TheDataSource.OpenRecordset(qry & " and ( " & Filter & ")" & " " & SortOrder)
  Else
   Set rs = TheDataSource.OpenRecordset(qry & " " & SortOrder)
  End If
  If rs Is Nothing Then Exit Function
  Set rs.ActiveConnection = Nothing
  Set GetRowsEx = rs
  Set rs = Nothing
End If
End Function

'Удалить строку
'Parameters:
'[IN]   Table , тип параметра: String - раздел,
'[IN]   RowID , тип параметра: String  - идентификатор раздела
'Returns:
' Boolean, семантика результата:
'   true  -удалена
'   false -ошибка
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as Boolean
' variable = me.DeleteRow(<параметры>)
Public Function DeleteRow(ByVal Table As String, ByVal RowID As String) As Boolean
Attribute DeleteRow.VB_HelpID = 290
  Dim nv As NamedValues
  Set nv = New NamedValues
  nv.Add SymbolAt & Table & "id", RowID
  Dim realname As String
  If UCase(Table) = "INSTANCE" Then
    realname = Replace(KernelPrefix & Table, "%Type%", "")
    DeleteRow = TheDataSource.ExecuteProc(realname & "_DELETE", nv)
  Else
    realname = Replace(ProcPrefix & Table, "%Type%", TableToType(Table))
    DeleteRow = TheDataSource.ExecuteProc(realname & "_DELETE", nv)
  End If
End Function
'удалить строку
'Parameters:
'[IN]   Table , тип параметра: String - раздел,
'[IN]   RowID , тип параметра: String идентификатор строки,
'[IN]   InstanceID , тип параметра: String  - идентификатор объекта
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as Boolean
' variable = me.DeleteRow2(...параметры...)
Public Function DeleteRow2(ByVal Table As String, ByVal RowID As String, ByVal InstanceID As String) As Boolean
Attribute DeleteRow2.VB_HelpID = 295
  Dim nv As NamedValues, nvi As NamedValue
  Dim realname As String
  Set nv = New NamedValues
  
  If IsORACLE Then
    Set nvi = nv.Add(SymbolAt & "CURSESSION", sessionid)
    nvi.ORACLE_GUID
  End If
  
  Set nvi = nv.Add(SymbolAt & Table & "id", RowID)
  nvi.ORACLE_GUID
  Set nvi = nv.Add(SymbolAt & "Instanceid", InstanceID)
  
  
   If UCase(Table) = "INSTANCE" Then
    realname = Replace(KernelPrefix & Table, "%Type%", "")
    DeleteRow2 = TheDataSource.ExecuteProc(realname & "_DELETE", nv)
  Else
    realname = Replace(ProcPrefix & Table, "%Type%", TableToType(Table), , , vbTextCompare)
    DeleteRow2 = TheDataSource.ExecuteProc(realname & "_DELETE", nv)
  End If
End Function

'Сохранить строку
'Parameters:
'[IN]   Table , тип параметра: String - раздел,
'[IN]   RowID , тип параметра: String - идентификатор строки,
'[IN]   ParentID , тип параметра: String - родительская строка (существенна пока только для добавления),
'[IN]   Values , тип параметра: NamedValues  - коллекция значений полей
'Returns:
' Boolean, семантика результата:
'   true  -сохранено
'   false -ошибка
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as Boolean
' variable = me.SaveRow(<параметры>)
Public Function SaveRow(ByVal Table As String, ByVal RowID As String, ByVal ParentID As String, ByVal Values As NamedValues) As Boolean
Attribute SaveRow.VB_HelpID = 505
  Dim nv As NamedValues, I As Long, nvi As NamedValue
  Set nv = New NamedValues
  
  
  On Error Resume Next
  
  Dim mm As NamedValue
  Set mm = MAP.Item("PARENT." & Table)
  
  If IsORACLE Then
    Set nvi = nv.Add(SymbolAt & "CURSESSION", sessionid)
    nvi.ORACLE_GUID
  End If
  
  Set nvi = nv.Add(SymbolAt & UCase(Table) & "ID", RowID)
  nvi.ORACLE_GUID
  
  If mm Is Nothing Then
    Set nvi = nv.Add(SymbolAt & "INSTANCEID", ParentID)
    nvi.ORACLE_GUID
    
  Else
    Set nvi = nv.Add(SymbolAt & "PARENTSTRUCTROWID", ParentID)
    nvi.ORACLE_GUID
  End If
  
  For I = 1 To Values.Count
    Set nvi = nv.Add(SymbolAt & UCase(Values.Item(I).TheName), Values.Item(I).Value)
    If nvi.Value = "" Then
      nvi.Value = Null
    End If
    nvi.ValueDirection = Values.Item(I).ValueDirection
    nvi.ValueSize = Values.Item(I).ValueSize
    nvi.ValueType = Values.Item(I).ValueType
  Next
  On Error GoTo 0
  
  Dim realname As String
  If UCase(Table) = "INSTANCE" Then
    realname = Replace(KernelPrefix & Table, "%Type%", "")
    SaveRow = TheDataSource.ExecuteProc(realname & "_save", nv)
  Else
    realname = Replace(ProcPrefix & Table, "%Type%", TableToType(Table))
    SaveRow = TheDataSource.ExecuteProc(realname & "_save", nv)
  End If
  Set nv = Nothing
End Function

'Сохранить строку
'Parameters:
'[IN]   Table , тип параметра: String - раздел,
'[IN]   RowID , тип параметра: String - идентификатор строки,
'[IN]   ParentID , тип параметра: String - родительская строка (существенна пока только для добавления),
'[IN]   Values , тип параметра: NamedValues  - коллекция значений полей
'[IN]   InstanceID , тип параметра: String  - идентификатор документа
'Returns:
' Boolean, семантика результата:
'   true  - сохранено
'   false -
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as Boolean
' variable = me.SaveRow2(...параметры...)
Public Function SaveRow2(ByVal Table As String, ByVal RowID As String, ByVal ParentID As String, ByVal Values As NamedValues, ByVal InstanceID As String) As Boolean
Attribute SaveRow2.VB_HelpID = 510
  Dim nv As NamedValues, I As Long, nvi As NamedValue
  Set nv = New NamedValues
  
  
  On Error Resume Next
  
  Dim mm As NamedValue
  Set mm = MAP.Item("PARENT." & Table)
  
  If IsORACLE Then
    Set nvi = nv.Add(SymbolAt & "CURSESSION", sessionid)
    nvi.ORACLE_GUID
  End If
  
  Set nvi = nv.Add(SymbolAt & UCase(Table) & "ID", RowID)
  nvi.ORACLE_GUID
  
  Set nvi = nv.Add(SymbolAt & "INSTANCEID", InstanceID)
  nvi.ORACLE_GUID
  
  
  If mm Is Nothing Then
  Else
    Set nvi = nv.Add(SymbolAt & "PARENTSTRUCTROWID", ParentID)
    nvi.ORACLE_GUID
  End If
  
  For I = 1 To Values.Count
    Set nvi = nv.Add(SymbolAt & UCase(Values.Item(I).TheName), Values.Item(I).Value)
    Err.Clear
    
    If nvi.Value = "" Then
      If Err.Number = 0 Then
        nvi.Value = Null
      End If
    End If
    nvi.ValueDirection = Values.Item(I).ValueDirection
    nvi.ValueSize = Values.Item(I).ValueSize
    nvi.ValueType = Values.Item(I).ValueType
  Next
  On Error GoTo 0
  Dim realname As String
  If UCase(Table) = "INSTANCE" Then
    realname = Replace(KernelPrefix & Table, "%Type%", "", , , vbTextCompare)
  Else
    realname = Replace(ProcPrefix & Table, "%Type%", TableToType(Table), , , vbTextCompare)
   
  End If
   SaveRow2 = TheDataSource.ExecuteProc(realname & "_save", nv)
  Set nv = Nothing
End Function
'получить реальное имя процедуры
'Parameters:
'[IN]   Table , тип параметра: String  - имя
'Returns:
'  значение типа String
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as String
' variable = me.GetProcName(...параметры...)
Public Function GetProcName(ByVal Table As String) As String
Attribute GetProcName.VB_HelpID = 355
Dim realname As String
  If UCase(Table) = "INSTANCE" Then
    GetProcName = Replace(KernelPrefix & Table, "%Type%", "", , , vbTextCompare)
  Else
   GetProcName = Replace(ProcPrefix & Table, "%Type%", TableToType(Table), , , vbTextCompare)
  End If
End Function
'получить реальное название функции
'Parameters:
'[IN]   Table , тип параметра: String  - ...
'Returns:
'  значение типа String
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as String
' variable = me.GetFuncName(...параметры...)
Public Function GetFuncName(ByVal Table As String) As String
Attribute GetFuncName.VB_HelpID = 330
   Dim realname As String
   GetFuncName = Replace(FuncPrefix & Table, "%Type%", TableToType(Table), , , vbTextCompare)
  
End Function

'Исполнить метод
'Parameters:
'[IN]   Method , тип параметра: String - имя метода,
'[IN]   Values , тип параметра: NamedValues  - список значений параметров
'Returns:
' Boolean, семантика результата:
'   true  -удача
'   false -ошибка
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as Boolean
' variable = me.Exec(<параметры>)
Public Function Exec(ByVal Method As String, ByVal Values As NamedValues) As Boolean
Attribute Exec.VB_HelpID = 305
  Dim n As String, I As Long
  On Error Resume Next
  
  
  n = Method
  Dim nv As NamedValues
  Set nv = New NamedValues
  Dim nvi As NamedValue
  If Not Values Is Nothing Then
    For I = 1 To Values.Count
      Set nvi = nv.Add(SymbolAt & UCase(Values.Item(I).TheName), Values.Item(I).Value)
      nvi.ValueDirection = Values.Item(I).ValueDirection
      nvi.ValueType = Values.Item(I).ValueType
      nvi.ValueSize = Values.Item(I).ValueSize
    Next
  End If
  
  On Error GoTo 0
  Exec = TheDataSource.ExecuteProc(n, nv)
  
  On Error Resume Next
  If Not Values Is Nothing Then
    For I = 1 To Values.Count
      Values.Item(I).Value = nv.Item(I).Value
    Next
  End If
  Set nv = Nothing
  Err.Clear
End Function
'исполнить запрос для получения рекордсета
'Parameters:
'[IN]   Method , тип параметра: String, - запрос
'[IN]   Values , тип параметра: NamedValues  - параметры
'Returns:
'  объект класса RecordSet - результат
'  ,или Nothing
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as RecordSet
' Set variable = me.ExecRS(...параметры...)
Public Function ExecRS(ByVal Method As String, ByVal Values As NamedValues) As RecordSet
Attribute ExecRS.VB_HelpID = 310
  Dim n As String, I As Long
  On Error Resume Next
  
  
  n = Method
  Dim nv As NamedValues
  Set nv = New NamedValues
  Dim nvi As NamedValue
  If Not Values Is Nothing Then
    For I = 1 To Values.Count
      Set nvi = nv.Add(SymbolAt & UCase(Values.Item(I).TheName), Values.Item(I).Value)
      nvi.ValueDirection = Values.Item(I).ValueDirection
      nvi.ValueType = Values.Item(I).ValueType
      nvi.ValueSize = Values.Item(I).ValueSize
    Next
  End If
  
  On Error GoTo 0
  Set ExecRS = TheDataSource.ExecuteRSProc(n, nv)
  
  On Error Resume Next
  If Not Values Is Nothing Then
    For I = 1 To Values.Count
      Values.Item(I).Value = nv.Item(I).Value
    Next
  End If
  Set nv = Nothing
  Err.Clear
End Function

'Является ли раздел разделом первого уровня
'Parameters:
'[IN]   Table , тип параметра: String  - имя раздела
'Returns:
' Boolean, семантика результата:
'   true  - не является
'   false - является
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as Boolean
' variable = me.HasParent(<параметры>)
Public Function HasParent(ByVal Table As String) As Boolean
Attribute HasParent.VB_HelpID = 395
 Dim tmp As String
 On Error Resume Next
 tmp = ""
 tmp = MAP.Item("PARENT." & Table).Value & ""
 If tmp = "" Then
  HasParent = False
 Else
  HasParent = True
 End If
End Function
' получить родителя для раздела
'Parameters:
'[IN]   Table , тип параметра: String  - раздел
'Returns:
'  значение типа String -родитель
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as String
' variable = me.TableParent(...параметры...)
Public Function TableParent(ByVal Table As String) As String
Attribute TableParent.VB_HelpID = 580
 Dim tmp As String
 On Error Resume Next
 tmp = ""
 tmp = MAP.Item("PARENT." & Table).Value & ""
 TableParent = tmp
 
End Function

'Создать объект
'Parameters:
'[IN]   InstanceID , тип параметра: String - идентификатор,
'[IN]   ObjType , тип параметра: String - тип объекта,
'[IN]   Name , тип параметра: String  - название
'Returns:
' Boolean, семантика результата:
'   true  - создан
'   false - ошибка
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as Boolean
' variable = me.NewInstance(<параметры>)
Public Function NewInstance(ByVal InstanceID As String, ByVal ObjType As String, ByVal Name As String) As Boolean
Attribute NewInstance.VB_HelpID = 480
  Dim nv As NamedValues, I As Long, nvi As NamedValue
  Set nv = New NamedValues
  
  
  On Error Resume Next
  
  
  If IsORACLE Then
    Set nvi = nv.Add(SymbolAt & "CURSESSION", sessionid)
    nvi.ORACLE_GUID
  End If
    
  Set nvi = nv.Add(SymbolAt & "INSTANCEID", InstanceID)
  nvi.ORACLE_GUID
  nv.Add SymbolAt & "ObjType", ObjType
  nv.Add SymbolAt & "Name", Name
  
  Dim realname As String
  
  realname = Replace(KernelPrefix & "INSTANCE", "%Type%", "", , , vbTextCompare)
  
  NewInstance = TheDataSource.ExecuteProc(realname & "_SAVE", nv)
  Set nv = Nothing
End Function

'Удалить объект
'Parameters:
'[IN]   InstanceID , тип параметра: String  - идентификатор
'Returns:
' Boolean, семантика результата:
'   true  - удален
'   false -ошибка
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as Boolean
' variable = me.DeleteInstance(<параметры>)
Public Function DeleteInstance(ByVal InstanceID As String) As Boolean
Attribute DeleteInstance.VB_HelpID = 285
  Dim nv As NamedValues, nvi As NamedValue
  Dim realname As String
  Set nv = New NamedValues
  
  If IsORACLE Then
    Set nvi = nv.Add(SymbolAt & "CURSESSION", sessionid)
    nvi.ORACLE_GUID
  End If
  
  Set nvi = nv.Add(SymbolAt & "InstanceID", InstanceID)
  nvi.ORACLE_GUID
  
  DeleteInstance = TheDataSource.ExecuteProc(KernelPrefix & "Instance_DELETE", nv)
  Set nv = Nothing
End Function

'Получить краткое название
'Parameters:
'[IN]   Table,, тип параметра: Variant - таблица
'[IN]   RowID , тип параметра: String - идентификатор строки,
'[IN][OUT]   Brief , тип параметра: String  - результат
'Returns:
' Boolean, семантика результата:
'   true  -удача
'   false -ошибка
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as Boolean
' variable = me.GetBrief(<параметры>)
Public Function GetBrief(ByVal Table, ByVal RowID As String, ByRef Brief As String) As Boolean
Attribute GetBrief.VB_HelpID = 320
  Dim nv As NamedValues, nvi As NamedValue
  Dim realname As String
  Set nv = New NamedValues
  
  If IsORACLE Then
    Set nvi = nv.Add(SymbolAt & "CURSESSION", sessionid)
    nvi.ORACLE_GUID
  End If
  
  Set nvi = nv.Add(SymbolAt & Table & "id", RowID)
  nvi.ORACLE_GUID
  
  Set nvi = nv.Add(SymbolAt & "BRIEF", Brief)
  nvi.ValueDirection = adParamOutput
  
   If UCase(Table) = "INSTANCE" Then
    realname = Replace(KernelPrefix & Table, "%Type%", "", , , vbTextCompare)
   Else
    realname = Replace(ProcPrefix & Table, "%Type%", TableToType(Table), , , vbTextCompare)
   End If
 
  On Error GoTo 0
  GetBrief = TheDataSource.ExecuteProc(realname & "_BRIEF", nv)
  On Error Resume Next
  Brief = nv.Item(SymbolAt & "BRIEF").Value
  Set nv = Nothing
End Function

'Проверить права на действие
'Parameters:
'[IN]   Resource , тип параметра: String - идентификатор стиля защиты,
'[IN]   Verb , тип параметра: String  - действие
'Returns:
' Boolean, семантика результата:
'   true  -разрешено
'   false -запрещено
'See Also:
'  Application
'  CheckConnection
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as Boolean
' variable = me.CheckRight(<параметры>)
Public Function CheckRight(ByVal Resource As String, ByVal Verb As String) As Boolean
Attribute CheckRight.VB_HelpID = 265
    Dim p As NamedValues
    Set p = New NamedValues
    Dim access As Integer
    CheckRight = False
    p.Add SymbolAt & "resource", Resource
    p.Add SymbolAt & "verb", Verb
    p.Add SymbolAt & "access", access
    
    If TheDataSource.ExecuteProc("CheckVerbRight", p) Then
      CheckRight = (p.Item(SymbolAt & "access").Value <> 0)
    End If
    Set p = Nothing
End Function
'очистить потерянные номера в нумераторах
'Parameters:
' параметров нет
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
'  call me.EraseLostNumbers()
Public Sub EraseLostNumbers()
Attribute EraseLostNumbers.VB_HelpID = 300
  
  On Error GoTo bye
  Dim nvs As NamedValues
  
  Set nvs = New NamedValues
  
  On Error Resume Next
  Call TheDataSource.ExecuteProc("ClearNumerators", nvs)
  Exit Sub
bye:
  Debug.Print Err.Description
End Sub

'Проверить потенциальную зависимость разделов
'Parameters:
'[IN]   ChildStructID , тип параметра: String - раздел который проверяем,
'[IN]   CheckID , тип параметра: String  - с чем сравниваем
'Returns:
' Boolean, семантика результата:
'   true  - зависимый раздел
'   false - нет зависимости
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as Boolean
' variable = me.IsDescendant(<параметры>)
Public Function IsDescendant(ByVal ChildStructID As String, ByVal CheckID As String) As Boolean
Attribute IsDescendant.VB_HelpID = 410
 Dim tmp As String
 On Error Resume Next
 tmp = ChildStructID
 While tmp <> ""
  If CheckID = tmp Then
    IsDescendant = True
    Exit Function
  End If
  If MAP.Item("PARENT." & tmp) Is Nothing Then
    tmp = ""
  Else
    
    tmp = MAP.Item("PARENT." & tmp).Value
  End If
 Wend
 IsDescendant = False
End Function

'Проверка существования строки
'Parameters:
'[IN]   Table , тип параметра: String - раздел,
'[IN]   RowID , тип параметра: String  - идентификатор строки
'Returns:
' Boolean, семантика результата:
'   true  - существует
'   false - нет
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as Boolean
' variable = me.IsRowExists(<параметры>)
Public Function IsRowExists(ByVal Table As String, ByVal RowID As String) As Boolean
Attribute IsRowExists.VB_HelpID = 425
  Dim rs As RecordSet
  IsRowExists = False
  Set rs = TheDataSource.OpenRecordset("select 1 from " & Table & " where " & Table & "ID='" & RowID & "'")
  If rs Is Nothing Then Exit Function
  If rs.EOF Then Exit Function
  IsRowExists = True
  rs.Close
  Set rs = Nothing
End Function

'Получить имя типа по разделу
'Parameters:
'[IN]   Table , тип параметра: String  - имя раздела
'Returns:
'  значение типа String - имя типа
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TheFinder
'Example:
' dim variable as String
' variable = me.TableToType(<параметры>)
Public Function TableToType(ByVal Table As String) As String
Attribute TableToType.VB_HelpID = 585
Dim s As String
On Error Resume Next
s = MAP.Item("STRUCT_TYPE." & Table).Value
TableToType = s
End Function

'Получить идентификатор текущего пользователя
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as String
'  variable = me.GetSessionUserID()
Public Function GetSessionUserID() As String
Attribute GetSessionUserID.VB_HelpID = 385
  If sessionid <> "" Then
    Dim rs As RecordSet
    On Error Resume Next
    Set rs = TheDataSource.OpenRecordset("select UsersID from the_Session where closed =0 and the_sessionID='" & sessionid & "'")
    If rs Is Nothing Then
      Dim Parameters As NamedValues
      Set Parameters = New NamedValues
      Call Parameters.Add("the_SessionID", sessionid)
      Call Parameters.Add("closed", 0)
      Set rs = ExecRS("MTZGetthe_Session", Parameters)
    End If
    If rs Is Nothing Then Exit Function
    If rs.EOF Then Exit Function
    GetSessionUserID = rs!usersid
    rs.Close
    Set rs = Nothing
  End If
End Function

'Установить умолчательные права для типа
'Parameters:
'[IN]   TypeName , тип параметра: String - тип объекта,
'[IN]   SecurityStyleid , тип параметра: String  - идентификатор стиля защиты
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetOwner
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
'  call me.SetDefaultSecurityStyle(<параметры>)
Public Sub SetDefaultSecurityStyle(ByVal TypeName As String, ByVal SecurityStyleID As String)
Attribute SetDefaultSecurityStyle.VB_HelpID = 550
  If sessionid <> "" Then
    Dim rs As RecordSet
    Dim oldStyle As String
    On Error GoTo bye
    Set rs = TheDataSource.OpenRecordset("select SecurityStyleID from typelist where name ='" & TypeName & "'")
    If rs Is Nothing Then Exit Sub
    If rs.EOF Then Exit Sub
    oldStyle = rs!SecurityStyleID & ""
    rs.Close
    Set rs = Nothing
    If CheckRight(oldStyle, "DEFAULT") Then
      If SecurityStyleID = "" Then
        TheDataSource.Execute "update typelist set SecurityStyleID = null  where name ='" & TypeName & "'"
      Else
        TheDataSource.Execute "update typelist set SecurityStyleID ='" & SecurityStyleID & "'  where name ='" & TypeName & "'"
      End If
    Else
      Err.Raise 10000, "SetDefaultStyle", "Нет прав на назначение стиля защиты для типа '" & TypeName & "'"
    End If
  End If
  Exit Sub
bye:
   Err.Raise Err.Number, Err.Source, Err.Description
End Sub

'Установить строку - владельца для объекта
'Parameters:
'[IN]   InstanceID , тип параметра: String -идентификатор объекта,
'[IN]   OwnerTable , тип параметра: String - раздел строки - владельца,
'[IN]   OwnerRowID , тип параметра: String  - идентификатор строки - владельца
'Returns:
' Boolean, семантика результата:
'   true  -установлен
'   false -ошибка
'See Also:
'  Application
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  Exec
'  GetBrief
'  GetIDs
'  GetRow
'  GetRows
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsRowExists
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  SaveRow
'  sessionid
'  SetDefaultSecurityStyle
'  Site
'  SymbolAt
'  TableToType
'  TheFinder
'Example:
' dim variable as Boolean
' variable = me.SetOwner(<параметры>)
Public Function SetOwner(ByVal InstanceID As String, ByVal OwnerTable As String, ByVal OwnerRowID As String) As Boolean
Attribute SetOwner.VB_HelpID = 560
   
  Dim nv As NamedValues, nvi As NamedValue
  Dim realname As String
  Set nv = New NamedValues
  
  If IsORACLE Then
    Set nvi = nv.Add(SymbolAt & "CURSESSION", sessionid)
    nvi.ORACLE_GUID
  End If
  
  Set nvi = nv.Add(SymbolAt & "InstanceID", InstanceID)
  nvi.ORACLE_GUID
  
  nv.Add SymbolAt & "OwnerPartName", OwnerTable
  
  Set nvi = nv.Add(SymbolAt & "OwnerRowID", OwnerRowID)
  nvi.ORACLE_GUID
  
  SetOwner = TheDataSource.ExecuteProc(KernelPrefix & "Instance_OWNER", nv)
  Set nv = Nothing
End Function

' оповещение о работоспособности сесии
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  - удачно
'   false -
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as Boolean
'  variable = me.SessionTouch()
Public Function SessionTouch() As Boolean
Attribute SessionTouch.VB_HelpID = 545
   
  Dim nv As NamedValues, nvi As NamedValue
  Dim realname As String
  Set nv = New NamedValues
  
  If IsORACLE Then
    Set nvi = nv.Add(SymbolAt & "CURSESSION", sessionid)
    nvi.ORACLE_GUID
  End If
  
  SessionTouch = TheDataSource.ExecuteProc("SessionTouch", nv)
  
  Set nv = Nothing
End Function
' время сервера базы данных
'Parameters:
' параметров нет
'Returns:
'  значение типа Date
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as Date
'  variable = me.GetServerTime()
Public Function GetServerTime() As Date
Attribute GetServerTime.VB_HelpID = 380
 'Return

  On Error Resume Next
  Dim nv As NamedValues
  Dim nvi As NamedValue
  Set nv = New NamedValues
  Set nvi = nv.Add(SymbolAt & "ServerTime", Null)
  nvi.ValueDirection = adParamOutput
  nvi.ValueType = adDBTimeStamp
  
  Dim dd As Date
  If TheDataSource.ExecuteProc("GetServerTime", nv) Then
    dd = nv.Item(SymbolAt & "ServerTime").Value
  Else
    dd = 0
  End If
  
'  If dd > CDate("01/10/2004") Then
'    MsgBox "Время работы демонстрационной версии истекло" & vbCrLf & "mailto:bami@v-Real.ru", vbOKOnly, "Свяжитесь с разработчиками"
'    StopApplication
'  End If
  
  GetServerTime = dd
End Function


' получить имя VIEw для выбора из раздела
'Parameters:
'[IN]   TableName , тип параметра: String  - раздел
'Returns:
'  значение типа String
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as String
' variable = me.GetPartViewAlias(...параметры...)
Public Function GetPartViewAlias(ByVal TableName As String) As String
Attribute GetPartViewAlias.VB_HelpID = 345
  On Error Resume Next
  Dim s As String
  s = MAP.Item("DEFVIEW." & TableName).Value
  GetPartViewAlias = s
  Debug.Print s
End Function

' получить название VIEW  для выбора типа
'Parameters:
'[IN]   TypeName , тип параметра: String  - ...
'Returns:
'  значение типа String
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as String
' variable = me.GetTypeViewAlias(...параметры...)
Public Function GetTypeViewAlias(ByVal TypeName As String) As String
Attribute GetTypeViewAlias.VB_HelpID = 390
  On Error Resume Next
  Dim s As String
  s = MAP.Item("TDEFVIEW." & TypeName).Value
  GetTypeViewAlias = s
End Function
'получиь имя провайдера
'Parameters:
' параметров нет
'Returns:
'  значение типа String - провайдер
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as String
'  variable = me.GetProvider()
Public Function GetProvider() As String
Attribute GetProvider.VB_HelpID = 360
  On Error Resume Next
  GetProvider = ADOProvider
End Function
'проверка типа провайдера на базу ORACLE
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  - oracle
'   false - нет
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as Boolean
'  variable = me.IsORACLE()
Public Function IsORACLE() As Boolean
Attribute IsORACLE.VB_HelpID = 420
  On Error Resume Next
  If UCase(ADOProvider) = "SQLOLEDB" Then
    IsORACLE = False
  Else
    IsORACLE = True
  End If
  
End Function

Friend Function GetCNString() As String
  On Error Resume Next
  Dim mConnectString As String
  If UCase(ADOProvider) = "SQLOLEDB" Then
  
    If Integrated Then
      mConnectString = "Server=" + mServer + ";DataBase=" + mDataBaseName + ";Trusted_Connection=yes"
    Else
      mConnectString = "Server=" + mServer + ";DataBase=" + mDataBaseName + ";UID=" + mUserName + ";Pwd=" + mPassword + ";"
    End If
  Else
     mConnectString = "User ID=" & mUserName & ";Password=" & mPassword & ";Data Source=" & mServer & ";Persist Security Info=False"
  End If
  
  GetCNString = mConnectString
End Function
' блокирован или нет
'Parameters:
'[IN]   Table , тип параметра: String - раздел,
'[IN]   ID , тип параметра: String  - идентификатор строки
'Returns:
'  объект класса LockStyle - состояние блокировки
'  ,или Nothing
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as LockStyle
' Set variable = me.IsLocked(...параметры...)
Public Function IsLocked(ByVal Table As String, ByVal ID As String) As LockStyle
Attribute IsLocked.VB_HelpID = 415
Dim nv As NamedValues, LockType As Long
Set nv = New NamedValues
Dim nvi As NamedValue
If IsORACLE Then
  Set nvi = nv.Add("CURSESSION", sessionid)
  nvi.ORACLE_GUID
End If

Set nvi = nv.Add("ROWID", ID)
nvi.ORACLE_GUID
Set nvi = nv.Add("IsLocked", 0)
nvi.ValueDirection = adParamOutput
nvi.ValueType = adInteger

Dim realname As String
If UCase(Table) = "INSTANCE" Then
  realname = Replace(KernelPrefix & Table, "%Type%", "", , , vbTextCompare)
Else
  realname = Replace(ProcPrefix & Table, "%Type%", TableToType(Table), , , vbTextCompare)
 
End If
On Error Resume Next


Exec realname & "_ISLOCKED", nv
IsLocked = nv.Item("ISLocked").Value
Set nv = Nothing

End Function
'блокировка строки или документа
'Parameters:
'[IN]   Table , тип параметра: String - раздел,
'[IN]   ID , тип параметра: String - идентификатор,
'[IN]   Permanent , тип параметра: Boolean  - постоянная блокировка
'Returns:
' Boolean, семантика результата:
'   true  - заблокирован
'   false - неудача
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as Boolean
' variable = me.LockResource(...параметры...)
Public Function LockResource(ByVal Table As String, ByVal ID As String, ByVal Permanent As Boolean) As Boolean
Attribute LockResource.VB_HelpID = 445

  Dim nv As NamedValues, nvi As NamedValue
  Set nv = New NamedValues
  
  If IsORACLE Then
    Set nvi = nv.Add("CURSESSION", sessionid)
    nvi.ORACLE_GUID
  End If

  Set nvi = nv.Add("ROWID", ID)
  nvi.ORACLE_GUID
  
  On Error GoTo bye
  If Permanent Then
     Set nvi = nv.Add("LOCKMODE", 2)
  Else
      Set nvi = nv.Add("LOCKMODE", 1)
  End If
  nvi.ValueType = adInteger
  
  Dim realname As String
  If UCase(Table) = "INSTANCE" Then
    realname = Replace(KernelPrefix & Table, "%Type%", "", , , vbTextCompare)
  Else
    realname = Replace(ProcPrefix & Table, "%Type%", TableToType(Table), , , vbTextCompare)
  End If

  
  LockResource = Exec(realname & "_LOCK", nv)
  
bye:
  Set nv = Nothing
End Function
' можно блокировать
'Parameters:
'[IN]   Table , тип параметра: String - раздел,
'[IN]   ID , тип параметра: String  - идентификатор строки
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  Application
'  BginTran
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as Boolean
' variable = me.CanLock(...параметры...)
Public Function CanLock(ByVal Table As String, ByVal ID As String) As Boolean
Attribute CanLock.VB_HelpID = 250
Dim nv As NamedValues
Dim nvi As NamedValue
Set nv = New NamedValues

  If IsORACLE Then
    Set nvi = nv.Add("CURSESSION", sessionid)
    nvi.ORACLE_GUID
  End If

  Set nvi = nv.Add("ROWID", ID)
  nvi.ORACLE_GUID
  

Set nvi = nv.Add("LockMode", 0)
nvi.ValueDirection = adParamOutput
nvi.ValueType = adInteger

Dim realname As String
  If UCase(Table) = "INSTANCE" Then
    realname = Replace(KernelPrefix & Table, "%Type%", "", , , vbTextCompare)
  Else
    realname = Replace(ProcPrefix & Table, "%Type%", TableToType(Table), , , vbTextCompare)
  End If

On Error Resume Next
Exec realname & "_HCL", nv

If nv.Item("LockMode").Value = 0 Then
 CanLock = True
Else
 CanLock = False
End If
Set nv = Nothing
End Function
'задать ситль защиты
'Parameters:
'[IN]   Table , тип параметра: String раздел,
'[IN]   ID , тип параметра: String идентификатор строки,
'[IN]   SecurityStyleID , тип параметра: String  - идентификатор стиля защиты
'Returns:
'  значение типа String
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as String
' variable = me.Secure(...параметры...)
Public Function Secure(ByVal Table As String, ByVal ID As String, ByVal SecurityStyleID As String) As String
Attribute Secure.VB_HelpID = 515
    Dim nv As NamedValues
    Dim nvi As NamedValue
    Set nv = New NamedValues
    
    If IsORACLE Then
      Set nvi = nv.Add("CURSESSION", sessionid)
      nvi.ORACLE_GUID
    End If
    
    Set nvi = nv.Add("ROWID", ID)
    nvi.ORACLE_GUID
    
    
    Set nvi = nv.Add("SECURITYSTYLEID", SecurityStyleID)
    nvi.ORACLE_GUID
    
    Dim realname As String
    If UCase(Table) = "INSTANCE" Then
      realname = Replace(KernelPrefix & Table, "%Type%", "", , , vbTextCompare)
    Else
      realname = Replace(ProcPrefix & Table, "%Type%", TableToType(Table), , , vbTextCompare)
    End If
    
    On Error GoTo bye
    
    Exec realname & "_SINIT", nv
    Secure = nv.Item("SECURITYSTYLEID").Value & ""
    Set nv = Nothing
    Exit Function
bye:
    Set nv = Nothing
    Err.Raise Err.Number, "Secure", Err.Description
End Function

' раздать права дочерним объектам
'Parameters:
'[IN]   Table , тип параметра: String -раздел,
'[IN]   ID , тип параметра: String  - идентификатор строки
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
'  call me.Propagate(...параметры...)
Public Sub Propagate(ByVal Table As String, ByVal ID As String)
Attribute Propagate.VB_HelpID = 495

    Dim nv As NamedValues
    Dim nvi As NamedValue
    Set nv = New NamedValues
    
    If IsORACLE Then
      Set nvi = nv.Add("CURSESSION", sessionid)
      nvi.ORACLE_GUID
    End If
    
    Set nvi = nv.Add("ROWID", ID)
    nvi.ORACLE_GUID
    
    Dim realname As String
    If UCase(Table) = "INSTANCE" Then
      realname = Replace(KernelPrefix & Table, "%Type%", "", , , vbTextCompare)
    Else
      realname = Replace(ProcPrefix & Table, "%Type%", TableToType(Table), , , vbTextCompare)
    End If
    
    On Error GoTo bye
    
    Exec realname & "_PROPAGATE", nv
    Set nv = Nothing

    Exit Sub
bye:
    Set nv = Nothing
    Err.Raise Err.Number, "Propagate", Err.Description
End Sub
' разблокировать строку
'Parameters:
'[IN]   Table , тип параметра: String раздел,
'[IN]   ID , тип параметра: String  - идентификатор строки
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'Example:
' dim variable as Boolean
' variable = me.UnLockResource(...параметры...)
Public Function UnLockResource(ByVal Table As String, ByVal ID As String) As Boolean
Attribute UnLockResource.VB_HelpID = 595

    Dim nv As NamedValues
    Dim nvi As NamedValue
    Set nv = New NamedValues
    
    If IsORACLE Then
      Set nvi = nv.Add("CURSESSION", sessionid)
      nvi.ORACLE_GUID
    End If
    
    Set nvi = nv.Add("ROWID", ID)
    nvi.ORACLE_GUID
    
    Dim realname As String
    If UCase(Table) = "INSTANCE" Then
      realname = Replace(KernelPrefix & Table, "%Type%", "", , , vbTextCompare)
    Else
      realname = Replace(ProcPrefix & Table, "%Type%", TableToType(Table), , , vbTextCompare)
    End If
On Error GoTo bye
UnLockResource = Exec(realname & "_UNLOCK", nv)


bye:
  Set nv = Nothing
End Function
'установить состояние
'Parameters:
'[IN]   InstanceID , тип параметра: String - ид. документа,
'[IN]   StatusID , тип параметра: String  - ид. состояния
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
'  call me.SetStatus(...параметры...)
Public Sub SetStatus(ByVal InstanceID As String, ByVal StatusID As String)
Attribute SetStatus.VB_HelpID = 565
  Dim nv As NamedValues, nvi As NamedValue
  Set nv = New NamedValues
    If IsORACLE Then
      Set nvi = nv.Add("CURSESSION", sessionid)
      nvi.ORACLE_GUID
    End If

    Set nvi = nv.Add("INSTANCEID", InstanceID)
    nvi.ORACLE_GUID

    Dim realname As String
    realname = Replace(KernelPrefix & "INSTANCE", "%Type%", "", , , vbTextCompare)
    Set nvi = nv.Add("Statusid", StatusID)
    nvi.ORACLE_GUID
  On Error GoTo bye
  Exec realname & "_STATUS", nv
  Set nv = Nothing
  Exit Sub
bye:
  Set nv = Nothing
  Err.Raise Err.Number, "SetStatus", Err.Description
End Sub
' начать транзакцию
'Parameters:
' параметров нет
'See Also:
'  Application
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
'  call me.BginTran()
Public Sub BginTran()
Attribute BginTran.VB_HelpID = 245
  TheDataSource.BeginTrans
End Sub
' завершить транзакцию
'Parameters:
' параметров нет
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
'  call me.CommitTran()
Public Sub CommitTran()
Attribute CommitTran.VB_HelpID = 275
  TheDataSource.CommitTrans
End Sub
' откат транзакции
'Parameters:
' параметров нет
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
'  call me.RollbackTran()
Public Sub RollbackTran()
Attribute RollbackTran.VB_HelpID = 500
  TheDataSource.RollbackTrans
End Sub
' путь к папке для временных файлов
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as String
'  variable = me.MTZTempPath()
Public Function MTZTempPath() As String
Attribute MTZTempPath.VB_HelpID = 475
    MTZTempPath = mTempPath
End Function
' исполнить процедуру
'Parameters:
'[IN]   qry , тип параметра: String  - запрос
'Returns:
'  объект класса ADODB.RecordSet - рекордсет
'  ,или Nothing
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as ADODB.RecordSet
' Set variable = me.GetProcData(...параметры...)
Public Function GetProcData(ByVal qry As String) As ADODB.RecordSet
Attribute GetProcData.VB_HelpID = 350
  Dim rs As RecordSet
  Set rs = TheDataSource.OpenProcRecordset(qry)
  
  If rs Is Nothing Then Exit Function
  'Set rs.ActiveConnection = Nothing
  Set GetProcData = rs
  Set rs = Nothing
End Function
' исполнить запрос
'Parameters:
'[IN]   qry , тип параметра: String  - запрос
'Returns:
'  объект класса ADODB.RecordSet - результат
'  ,или Nothing
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as ADODB.RecordSet
' Set variable = me.GetData(...параметры...)
Public Function GetData(ByVal qry As String) As ADODB.RecordSet
Attribute GetData.VB_HelpID = 325
  Dim rs As RecordSet
  Set rs = TheDataSource.OpenRecordset(qry)
  If rs Is Nothing Then Exit Function
  Set rs.ActiveConnection = Nothing
  Set GetData = rs
  Set rs = Nothing
End Function
'сменить пароль
'Parameters:
'[IN]   OldPassword , тип параметра: String - старый пароль,
'[IN]   NewPasswrod , тип параметра: String новый пароль,
'[IN][OUT]   ResultStr , тип параметра: String  - результат
'Returns:
' Boolean, семантика результата:
'   true  - сменен
'   false -
'See Also:
'  Application
'  BginTran
'  CanLock
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as Boolean
' variable = me.ChangePassword(...параметры...)
Public Function ChangePassword(ByVal OldPassword As String, ByVal NewPasswrod As String, ByRef ResultStr As String) As Boolean
Attribute ChangePassword.VB_HelpID = 255

'CREATE  PROCEDURE ChangePassword
'(
'  @NEWPASS varchar(80) ,
'  @OLDPASS varchar (80),
'  @USERID uniqueidentifier,
'  @USERIDOUT uniqueidentifier out
') as  begin
'set nocount on
'  declare @OLDFROMBASE as varchar(80)
'  select @OLDFROMBASE =   [PASSWORD] from users WHERE usersid =  @USERID
'  if (@OLDPASS = @OLDFROMBASE) begin
'    update users set [PASSWORD]=@NEWPASS WHERE  usersid =  @USERID
'    select @USERIDOUT = @USERID
'  End
'
'End

      Dim cursession As String
      On Error GoTo err_
      ChangePassword = False
       
      If Not ADOConnected Then
         ChangePassword = False
         Exit Function
      End If
       
      Dim p As NamedValues
      Set p = New NamedValues
      Dim p1 As NamedValue
       
      Set p1 = p.Add(SymbolAt & "NEWPASS", NewPasswrod)
      p1.ValueDirection = adParamInput
      p1.ValueType = adVarChar
      p1.ValueSize = 80
       
      Set p1 = p.Add(SymbolAt & "OLDPASS", OldPassword)
      p1.ValueDirection = adParamInput
      p1.ValueType = adVarChar
      p1.ValueSize = 80
       
      Set p1 = p.Add(SymbolAt & "USERID", GetSessionUserID)
      p1.ValueDirection = adParamInput
      p1.ValueType = adGUID
      
      Set p1 = p.Add(SymbolAt & "USERIDOUT", vbNullString)
      p1.ValueDirection = adParamOutput
      p1.ValueType = adGUID
       
      TheDataSource.ExecuteProc "ChangePassword", p
       
      If (IsNull(p.Item(SymbolAt & "USERIDOUT").Value)) Then
        ResultStr = "Старый пароль ввведён неправильно."
        ChangePassword = False
      Else
        If (GetSessionUserID <> p.Item(SymbolAt & "USERIDOUT").Value) Then
          ResultStr = "Старый пароль ввведён неправильно."
          ChangePassword = False
        Else
          ChangePassword = True
        End If
      End If
      Exit Function
err_:
End Function
' получить имя пользователя NT
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as String
'  variable = me.GetNTUsername()
Public Function GetNTUsername() As String
Attribute GetNTUsername.VB_HelpID = 340
  GetNTUsername = GetNTUser()
End Function
' получить идентификатор блокирующего пользователя
'Parameters:
'[IN][OUT]  InstanceID , тип параметра: String  - документ
'Returns:
'  значение типа String - ид. пользователя
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as String
' variable = me.LockUserID(...параметры...)
Public Function LockUserID(InstanceID As String) As String
Attribute LockUserID.VB_HelpID = 455
Dim objrs As ADODB.RecordSet
    On Error Resume Next
    LockUserID = ""
    Set objrs = GetData("Select LOCKUSERID from Instance where InstanceID='" + InstanceID + "'")
    If Not objrs Is Nothing Then
        If Not objrs.EOF And Not objrs.BOF Then
            LockUserID = objrs!LockUserID & ""
        End If
        objrs.Close
    End If
    Set objrs = Nothing
End Function
' получить блокирующую сессию
'Parameters:
'[IN][OUT]  InstanceID , тип параметра: String  - идентификатор документа
'Returns:
'  значение типа String - идентификатор сесии
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as String
' variable = me.LockSessionID(...параметры...)
Public Function LockSessionID(InstanceID As String) As String
Attribute LockSessionID.VB_HelpID = 450
Dim objrs As ADODB.RecordSet
    On Error Resume Next
    LockSessionID = ""
    Set objrs = GetData("Select LockSessionID from Instance where InstanceID='" + InstanceID + "'")
    If Not objrs Is Nothing Then
        If Not objrs.EOF And Not objrs.BOF Then
            LockSessionID = objrs!LockSessionID & ""
        End If
        objrs.Close
    End If
    Set objrs = Nothing
End Function
' задать лицензию
'Parameters:
'[IN]   MyLicCode, тип параметра: Variant  - данные
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
'  call me.SetLic(...параметры...)
Public Sub SetLic(ByVal MyLicCode)
Attribute SetLic.VB_HelpID = 555
    If mLicCode = "" Then
        mLicCode = MyLicCode
    End If
End Sub
'проверка демо лицензии
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  - демо
'   false - нет
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  IsWorkLic
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as Boolean
'  variable = me.IsDemoLic()
Public Function IsDemoLic() As Boolean
Attribute IsDemoLic.VB_HelpID = 405
    Dim LT As New LicTester
    If sessionid <> "" Then
        If LT.TestLicense(mLicCode) = LTDemoKey Then
        IsDemoLic = True
        End If
    End If


End Function
' рабочая лицензия
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  - да
'   false - нет
'See Also:
'  Application
'  BginTran
'  CanLock
'  ChangePassword
'  CheckConnection
'  CheckRight
'  CloseClass
'  CommitTran
'  Connected
'  DeleteInstance
'  DeleteRow
'  DeleteRow2
'  EraseLostNumbers
'  Exec
'  ExecRS
'  FuncPrefix
'  GetBrief
'  GetData
'  GetFuncName
'  GetIDs
'  GetNTUsername
'  GetPartViewAlias
'  GetProcData
'  GetProcName
'  GetProvider
'  GetRow
'  GetRows
'  GetRowsEx
'  GetServerTime
'  GetSessionUserID
'  GetTypeViewAlias
'  HasParent
'  IntegratedLogin
'  IsDemoLic
'  IsDescendant
'  IsLocked
'  IsORACLE
'  IsRowExists
'  KernelPrefix
'  Language
'  LockResource
'  LockSessionID
'  LockUserID
'  Logger
'  Login
'  Logout
'  MTZTempPath
'  NewInstance
'  Parent
'  ProcPrefix
'  Propagate
'  RollbackTran
'  SaveRow
'  SaveRow2
'  Secure
'  ServerDBName
'  ServerRootDBName
'  ServerUserName
'  ServerUserPassword
'  sessionid
'  SessionTouch
'  SetDefaultSecurityStyle
'  SetLic
'  SetOwner
'  SetStatus
'  Site
'  SymbolAt
'  TableParent
'  TableToType
'  TheFinder
'  UnLockResource
'Example:
' dim variable as Boolean
'  variable = me.IsWorkLic()
Public Function IsWorkLic() As Boolean
Attribute IsWorkLic.VB_HelpID = 430
    Dim LT As New LicTester
    If sessionid <> "" Then
        If LT.TestLicense(mLicCode) = LTWorkKey Then
        IsWorkLic = True
        End If
    End If
End Function
