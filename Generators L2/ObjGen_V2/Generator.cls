VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Generator"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Dim m As MTZMetaModel.Application
Dim o As MTZGenerator.Response
Dim tid As String
Dim log As String


Public Sub Setup()
  MsgBox "Этот генератор не требует настройки", vbInformation, "Генератор объектной модели"
End Sub



' method for activate generation process
Public Function Run(Model As Object, Output As Object, targetid As String, Optional TypeID As String = "") As String
 Set m = Model
 Set o = Output
 tid = targetid
 log = ""
 
 Dim i As Long, j As Long
 Dim desc As String, body As String
 Dim os As PART
 
 On Error GoTo bye
 o.Project.Attributes.Add("Type").Value = "dll"
 
'Reference=*\G{F5078F18-C551-11D3-89B9-0000F81FE221}#3.0#0#E:\WINDOWS\System32\msxml3.dll#Microsoft XML, v3.0
'Reference=*\G{58DF4A4A-346E-4A52-82D1-1DC4A6CB4A60}#3.0#0#..\..\MTZManager\MTZManager.dll#MTZManager
'Reference=*\G{27532C15-381F-49B2-83D7-087D2BB897B8}#4.1#0#..\..\MTZUtil\MTZUtil.dll#MTZUtil
'Reference=*\G{45D6DB85-69D5-45C6-AD58-BB2DA56CCC79}#5.0#0#..\..\MTZSession\MTZSession.dll#MTZSession
'Reference=*\G{EF53050B-882E-4776-B643-EDA472E8E3F2}#2.7#0#E:\Program Files\Common Files\system\ado\msado15.dll#Microsoft ActiveX Data Objects 2.7 Library

 o.Project.Attributes.Add("References").Value = "{2A75196C-D9EB-4129-B803-931327F72D5C};{45D6DB85-69D5-45C6-AD58-BB2DA56CCC79};{27532C15-381F-49B2-83D7-087D2BB897B8};{58DF4A4A-346E-4A52-82D1-1DC4A6CB4A60};{F5078F18-C551-11D3-89B9-0000F81FE221}"
  
 Dim ot As OBJECTTYPE
  If TypeID = "" Then
    log = log & vbCrLf & "Define TYPE ID!!!"
    Exit Function
  End If
  Set ot = m.OBJECTTYPE.item(TypeID)
  If ot Is Nothing Then
    log = log & vbCrLf & "Wrong TYPE ID!!!"
    Exit Function
  End If
  
  
  o.Project.Attributes.Add("Name").Value = ot.name
  o.Project.Attributes.Add("Description").Value = ot.the_comment
  log = log & vbCrLf & "Create code for type " & ot.name
  
  ' crate application class
  MakeApplication ot, desc, body
  
  ' save to package
  o.Module = "Application"
  o.Project.Modules.item(o.Module).Attributes.Add("Type").Value = "class"
  o.Project.Modules.item(o.Module).Attributes.Add("Instancing").Value = "multiuse"
  o.Block = "'description"
  o.Project.Modules.item(o.Module).Blocks.item(o.Block).Attributes.Add("Type").Value = "description"
  o.OutNL desc
  
  o.Module = "Application"
  o.Block = "'codebody"
  o.Project.Modules.item(o.Module).Blocks.item(o.Block).Attributes.Add("Type").Value = "code"
  o.OutNL body
  
  ' create classes for each part
  For j = 1 To ot.PART.Count
    Set os = ot.PART.item(j)
    
    #If TRIAL = 1 Then
      If Date < DateSerial(2010, 4, 1) Then
        MakeRow os, ot.name
      End If
    #Else
      MakeRow os, ot.name
    #End If
    
    MakeCollection os, ot.name
  Next
  
  ' return results
  Run = log

 Exit Function
bye:
 log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
 'Resume
 MsgBox Err.Description
 'Stop
 'Resume
 Run = log

End Function





' return script code for specified generation target
Private Function MapScript(ByVal sc As SCRIPT_COL) As String
On Error GoTo bye
  Dim i
  
  For i = 1 To sc.Count
    If sc.item(i).Target.ID = tid Then
      MapScript = sc.item(i).code
      Exit Function
    End If
  Next
  
  Exit Function
bye:
log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
'Stop
'  Resume
End Function


' same as MAPFT, but return fieldtypemap object
Private Function MapFTObj(ByVal TypeID As String) As FIELDTYPEMAP
On Error GoTo bye
  
  Dim i, s
  Dim ft As FIELDTYPE
  Set ft = m.FIELDTYPE.item(TypeID)
  If ft Is Nothing Then Exit Function
  For i = 1 To ft.FIELDTYPEMAP.Count
    If ft.FIELDTYPEMAP.item(i).Target.ID = tid Then
      Set MapFTObj = ft.FIELDTYPEMAP.item(i)
      Exit For
    End If
  Next
  Exit Function
bye:
log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
  'Stop
  'Resume
End Function


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Create Application class for library
Private Sub MakeApplication(obj As OBJECTTYPE, decl As String, body As String)

  On Error GoTo bye
  Dim s As PART, s1 As PART, pack As String, unpack As String, brief As String
  Dim pd As FIELD
  Dim st As PART
  
  Dim CloseClassText As String, FindObject As String, Compact As String
  
  Dim ok As Boolean, i As Long, j As Long
  
  CloseClassText = ""
  FindObject = ""
  Compact = ""
  
  
  'Manager
  
  decl = "'корневой интерфейс документа (" & NoLF(obj.the_comment) & ")"
  decl = decl & vbCrLf & "private m_Logger as MTZUtil.Logger"
  decl = decl & vbCrLf & "private m_MTZSession as MTZSession.Session"
  decl = decl & vbCrLf & "private m_Manager as MTZManager.Main"
  decl = decl & vbCrLf & "Private findCash As Collection"
  decl = decl & vbCrLf & "private m_ID as string"
  decl = decl & vbCrLf & "private m_SecureStyleID as string"
  decl = decl & vbCrLf & "private m_StatusID as string"
  decl = decl & vbCrLf & "private m_Name as string"
  decl = decl & vbCrLf & "private const m_TypeName as string=""" & obj.name & """"
  decl = decl & vbCrLf & "private m_WorkOffline as boolean"
  decl = decl & vbCrLf & "private m_AutoLoadPart as boolean"
    
  decl = decl & vbCrLf & ""
  decl = decl & vbCrLf & MakeEnums
  
  'Typename
  body = ""
  body = body & vbCrLf
  body = body & vbCrLf & CommentItem("public property get TypeName() as string", "Название типа")
  body = body & vbCrLf & "  TypeName = m_TypeName"
  body = body & vbCrLf & "end property"
  
  
  
  
  
  'Logger
  body = body & vbCrLf
  body = body & vbCrLf & CommentItem("public property get Logger() as MTZUtil.Logger", "Отладочный компонент")
  body = body & vbCrLf & "  if m_Logger is nothing then"
  body = body & vbCrLf & "    set m_Logger = new MTZUtil.Logger"
  body = body & vbCrLf & "    m_Logger.CreateLog TypeName & ""_"" & ID ,TypeName"
  body = body & vbCrLf & "  end if"
  body = body & vbCrLf & "  set Logger = m_Logger"
  body = body & vbCrLf & "end property"
  
  
  'Instance Name
  body = body & vbCrLf
  body = body & vbCrLf & CommentItem("public property get Name() as string", "Получить Название документа")
  body = body & vbCrLf & "  Name = m_Name"
  body = body & vbCrLf & "end property"
  
  body = body & vbCrLf
  body = body & vbCrLf & CommentItem("public property Let Name(n as string)", "Задать название документа")
  body = body & vbCrLf & "  m_Name = n"
  body = body & vbCrLf & "end property"
  
  
  
  'manager
  body = body & vbCrLf
  body = body & vbCrLf & CommentItem("public property get Manager() as MTZManager.Main", "Получить корневой объект системы - менеджер документов")
  body = body & vbCrLf & "  set Manager = m_Manager"
  body = body & vbCrLf & "end property"
  
  body = body & vbCrLf
  body = body & vbCrLf & CommentItem("public property Set Manager(m as MTZManager.Main)", "Задать менеджер документов")
  body = body & vbCrLf & "  if not m_Manager is nothing then exit property"
  body = body & vbCrLf & "  set m_Manager = m"
  body = body & vbCrLf & "  Logger.Message ""Manager defined"""
  body = body & vbCrLf & "end property"
           
           
  'Session
  body = body & vbCrLf
  body = body & vbCrLf & CommentItem("public property get MTZSession() as MTZSession.Session", "Получить текущую сессию пользователя")
  body = body & vbCrLf & "  set MTZSession = m_MTZSession"
  body = body & vbCrLf & "end property"
           
  body = body & vbCrLf
  body = body & vbCrLf & CommentItem("public property Set MTZSession(m as MTZSession.Session)", "Задть текущую сессию пользователя")
  body = body & vbCrLf & "  if not m_MTZSession is nothing then exit property"
  body = body & vbCrLf & "  set m_MTZSession = m"
  body = body & vbCrLf & "  Logger.Message ""Session defined"""
  body = body & vbCrLf & "  m_AutoLoadPart=true"
  body = body & vbCrLf & "end property"
           
  'WorkOffline
  body = body & vbCrLf
  body = body & vbCrLf & CommentItem("public property Get WorkOffline() as boolean", "Признак - работа без соединения с базой")
  body = body & vbCrLf & "    WorkOffline = m_WorkOffline"
  body = body & vbCrLf & "end property"
      
  body = body & vbCrLf
  body = body & vbCrLf & CommentItem("public property Let WorkOffline(v as boolean)", "Получить значение признака работы без соединения")
  body = body & vbCrLf & "  if MTZSession is nothing then "
  body = body & vbCrLf & "    m_WorkOffline = false"
  body = body & vbCrLf & "  else "
  body = body & vbCrLf & "    m_WorkOffline = v"
  body = body & vbCrLf & "  end if "
  body = body & vbCrLf & "end property"
           
  'AutoLoadPart
  body = body & vbCrLf
  body = body & vbCrLf & CommentItem("public property Get AutoLoadPart() as boolean", "Получить признак автоматической загрузки всеех полей")
  body = body & vbCrLf & "    AutoLoadPart = m_AutoLoadPart"
  body = body & vbCrLf & "end property"
      
  body = body & vbCrLf
  body = body & vbCrLf & CommentItem("public property Let AutoLoadPart(v as boolean)", "Признак загрузки всех полей (не только идентификатора)")
  body = body & vbCrLf & "    m_AutoLoadPart = v"
  body = body & vbCrLf & "end property"
           
  ' ID
  body = body & vbCrLf
  body = body & vbCrLf & CommentItem("public property Get ID() as string", "Идентификатор документа")
  body = body & vbCrLf & "  ID = m_ID"
  body = body & vbCrLf & "end property"
      
  body = body & vbCrLf
  body = body & vbCrLf & CommentItem("public property Let ID(v as string)", "Задать идентификатор документа")
  body = body & vbCrLf & "  m_ID=v"
  body = body & vbCrLf & "end property"
    
      
  ' Parent & Application
  body = body & vbCrLf
  body = body & vbCrLf & CommentItem("public property Get Parent() as object", "Родительский объект в иерархии документа")
  body = body & vbCrLf & "  set Parent = nothing"
  body = body & vbCrLf & "end property"
    
  body = body & vbCrLf
  body = body & vbCrLf & CommentItem("public property Get Application() as Application", "Корневой объект в иерархии документа")
  body = body & vbCrLf & "  set Application = me"
  body = body & vbCrLf & "end property"
      
      
  ' FindCash support functions
  body = body & vbCrLf
  body = body & vbCrLf & CommentItem("public Sub AddToCash( byval Key as string, byval Item as Object)", "Добавить в оптимизтор поиска строку раздела документа")
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  findCash.Add Item,Key"
  body = body & vbCrLf & "end sub"
    
  body = body & vbCrLf
  body = body & vbCrLf & CommentItem("public Sub RemoveFromCash( byval Key as string)", "Исключить из оптимизатора сторку раздела документа")
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  findCash.Remove Key"
  body = body & vbCrLf & "end sub"
    
    
  ' SecureStyleID
  body = body & vbCrLf & CommentItem("public property let SecureStyleID(byval newID as string)", "Задать идентификатор стиля защиты")
  body = body & vbCrLf & "  Secure newID"
  body = body & vbCrLf & "  GetStatus"
  body = body & vbCrLf & "end property"
  
  body = body & vbCrLf & CommentItem("public property Get SecureStyleID() as string", "Получить идентификатор стиля защиты")
  body = body & vbCrLf & "  GetStatus"
  body = body & vbCrLf & "  SecureStyleID = m_SecureStyleID"
  body = body & vbCrLf & "end property"
    
    
  ' StatusID
  body = body & vbCrLf & CommentItem("public property let StatusID(byval newID as string)", "Задать идентификатор сосотяния документа")
  body = body & vbCrLf & "    SetStatus newID"
  body = body & vbCrLf & "    GetStatus"
  body = body & vbCrLf & "end property"
  
  body = body & vbCrLf & CommentItem("public property Get StatusID() as string", "Получить идентификатор состояния")
  body = body & vbCrLf & "  GetStatus"
  body = body & vbCrLf & "  StatusID = m_StatusID"
  body = body & vbCrLf & "end property"
    
  body = body & vbCrLf & CommentItem("public property Get StatusName() as string", "Получить название состояния")
  body = body & vbCrLf & "  GetStatus"
  body = body & vbCrLf & "  StatusName="""""
  For i = 1 To obj.OBJSTATUS.Count
    body = body & vbCrLf & "if statusid =""" & obj.OBJSTATUS.item(i).ID & """ then StatusName = """ & obj.OBJSTATUS.item(i).name & """ : exit property"
  Next
  body = body & vbCrLf & "end property"
    
    
    
  ' register children (first level) parts
    
  For i = 1 To obj.PART.Count
    Set s1 = obj.PART.item(i)
      
    
    decl = decl & vbCrLf & "private m_" & MakeValidName(s1.name) & " as " & MakeValidName(s1.name) & "_col"
            
    FindObject = FindObject & vbCrLf & " if m_FindObject is nothing then"
    FindObject = FindObject & vbCrLf & "   set m_FindObject =  " & MakeValidName(s1.name) & ".FindObject(StrID,InstID)"
    FindObject = FindObject & vbCrLf & " end if"
        
    Compact = Compact & vbCrLf & MakeValidName(s1.name) & ".Compact"
        
    CloseClassText = CloseClassText & vbCrLf & "  if not m_" & MakeValidName(s1.name) & " is nothing then "
    CloseClassText = CloseClassText & vbCrLf & "    m_" & MakeValidName(s1.name) & ".CloseClass "
    CloseClassText = CloseClassText & vbCrLf & "    set m_" & MakeValidName(s1.name) & " = nothing "
    CloseClassText = CloseClassText & vbCrLf & "  end if"
              
       
    body = body & vbCrLf & CommentItem("public property Get " & MakeValidName(s1.name) & " (optional byval Refresh as boolean = true) as " & MakeValidName(s1.name) & "_col", "Даные раздела " & s1.Caption)
    body = body & vbCrLf & " if m_" & MakeValidName(s1.name) & " is nothing then"
    body = body & vbCrLf & "   set  m_" & MakeValidName(s1.name) & " = new " & MakeValidName(s1.name) & "_col"
    body = body & vbCrLf & "   set m_" & MakeValidName(s1.name) & ".Parent = me"
    body = body & vbCrLf & "   set m_" & MakeValidName(s1.name) & ".Application = me.Application"
    body = body & vbCrLf & "   if Refresh then m_" & MakeValidName(s1.name) & ".Refresh"
    body = body & vbCrLf & " end if"
    body = body & vbCrLf & " set  " & MakeValidName(s1.name) & " = m_" & MakeValidName(s1.name)
    body = body & vbCrLf & "end property"

  Next


  'CloseClass
  body = body & vbCrLf & CommentItem("Public sub CloseClass()", "Деструктор")
  body = body & vbCrLf & " on error resume next"
  body = body & vbCrLf & " Set findCash = Nothing"
  body = body & vbCrLf & CloseClassText
  body = body & vbCrLf & "  if not m_manager is nothing then"
  body = body & vbCrLf & "    set m_manager = nothing"
  body = body & vbCrLf & "  end if"
  body = body & vbCrLf & "  if not m_MTZSession is nothing then"
  body = body & vbCrLf & "    set m_MTZSession = nothing"
  body = body & vbCrLf & "  end if"
  body = body & vbCrLf & "  if not m_Logger is nothing then"
  body = body & vbCrLf & "    m_Logger.Message ""Application.CloseClass"" "
  body = body & vbCrLf & "    set m_Logger = nothing"
  body = body & vbCrLf & "  end if"
  body = body & vbCrLf & "end sub"


  'FindRowObject
   body = body & vbCrLf & CommentItem("Public Function FindRowObject(ByVal StrID As String, ByVal RowID As String) As Object", "Поиск  строки раздела по ключу и названию раздела во всех документах")
   body = body & vbCrLf & "  Dim obj As Object"
   body = body & vbCrLf & "  Dim Rowobj As Object"
   body = body & vbCrLf & "  Dim i As Long"
   
   body = body & vbCrLf & "Dim m_FindObject As Object"
   body = body & vbCrLf & ""
   body = body & vbCrLf & "If StrID = """" Then Exit Function"
   body = body & vbCrLf & "If RowID = """" Then Exit Function"
   body = body & vbCrLf & "If findCash Is Nothing Then"
   body = body & vbCrLf & " Set findCash = New Collection"
   body = body & vbCrLf & "End If"
   body = body & vbCrLf & "On Error Resume Next"
   body = body & vbCrLf & "Set m_FindObject = findCash.Item(StrID & RowID)"
   body = body & vbCrLf & "If Not m_FindObject Is Nothing Then"
   body = body & vbCrLf & "  If m_FindObject.Application Is Nothing Then"
   body = body & vbCrLf & "    Set m_FindObject = Nothing"
   body = body & vbCrLf & "    findCash.Remove StrID & RowID"
   body = body & vbCrLf & "  Else"
   body = body & vbCrLf & "   Set FindRowObject = m_FindObject"
   body = body & vbCrLf & "   Exit Function"
   body = body & vbCrLf & "  End If"
   body = body & vbCrLf & "End If"
   body = body & vbCrLf & ""
   body = body & vbCrLf & "  Dim rpl As RowParentList"
   body = body & vbCrLf & "  Set rpl = MTZSession.TheFinder.RowParents(StrID, RowID)"
   body = body & vbCrLf & "  If rpl.Count > 0 Then"
   body = body & vbCrLf & ""
   body = body & vbCrLf & " If rpl.Item(1).RowID = ID Then"
   body = body & vbCrLf & "    Set Rowobj = Me"
   body = body & vbCrLf & "    For i = 2 To rpl.Count"
   body = body & vbCrLf & "     Set Rowobj = Rowobj.FindObject(rpl.Item(i).PartName, rpl.Item(i).RowID)"
   body = body & vbCrLf & "    Next"
   body = body & vbCrLf & ""
   body = body & vbCrLf & "' reference from another object"
   body = body & vbCrLf & " Else"
   body = body & vbCrLf & "   Set obj = Manager.GetInstanceObject(rpl.Item(1).RowID)"
   body = body & vbCrLf & "   If obj Is Nothing Then Exit Function"
   body = body & vbCrLf & "   Set Rowobj = obj.FindRowObject(StrID, RowID)"
   body = body & vbCrLf & " End If"
   body = body & vbCrLf & ""
   body = body & vbCrLf & "  Else"
   body = body & vbCrLf & "' use old search style"
   body = body & vbCrLf & " Set Rowobj = FindObject(StrID, RowID)"
   body = body & vbCrLf & " If Rowobj Is Nothing Then"
   body = body & vbCrLf & "   Set obj = Manager.FindInstanceByRow(StrID, RowID)"
   body = body & vbCrLf & "   If obj Is Nothing Then Exit Function"
   body = body & vbCrLf & "   Set Rowobj = obj.FindObject(StrID, RowID)"
   body = body & vbCrLf & " End If"
   body = body & vbCrLf & "  End If"
  
'  body = body & vbCrLf & "  Set Rowobj = FindObject(StrID, RowID)"
'  body = body & vbCrLf & "  If Rowobj Is Nothing Then "
'  body = body & vbCrLf & "    Set obj = Manager.FindInstanceByRow(StrID, RowID)"
'  body = body & vbCrLf & "    If obj Is Nothing Then Exit Function"
'  body = body & vbCrLf & "    Set Rowobj = obj.FindObject(StrID, RowID)"
'  body = body & vbCrLf & "  end if"
  body = body & vbCrLf & "  If Rowobj Is Nothing Then Exit Function"
  body = body & vbCrLf & "  Set FindRowObject = Rowobj"
  body = body & vbCrLf & "  Set Rowobj = Nothing"
  body = body & vbCrLf & "  Set obj = Nothing"
  body = body & vbCrLf & "End Function"
  body = body & vbCrLf
    
  'FindObject
  body = body & vbCrLf & CommentItem("public function FindObject(byval StrID as string, byval InstID as string) as object", "Поиск строки только в текщем документе")
  body = body & vbCrLf & " dim m_FindObject as object"
  body = body & vbCrLf & " static inFindObject as boolean"
  body = body & vbCrLf & " if StrID = """" then exit function"
  body = body & vbCrLf & " if InstID = """" then exit function"
  body = body & vbCrLf & " if inFindObject then exit function"
  body = body & vbCrLf & " inFindObject = true"
  body = body & vbCrLf & "  If findCash Is Nothing Then"
  body = body & vbCrLf & "  Set findCash = New Collection"
  body = body & vbCrLf & " End If"
 
  body = body & vbCrLf & " On Error Resume Next"
  body = body & vbCrLf & " Set m_FindObject = findCash.item(StrID & InstID)"
  body = body & vbCrLf & " if  not m_FindObject is nothing then"
  body = body & vbCrLf & "   if  m_FindObject.application is nothing then"
  body = body & vbCrLf & "     set m_FindObject = nothing"
  body = body & vbCrLf & "     findCash.remove StrID & InstID"
  body = body & vbCrLf & "   end if"
  body = body & vbCrLf & " end if"
  body = body & vbCrLf & FindObject
  
  body = body & vbCrLf & " If findCash.item(StrID & InstID) Is Nothing Then"
  body = body & vbCrLf & "   findCash.Add m_FindObject, StrID & InstID"
  body = body & vbCrLf & " End If"
  body = body & vbCrLf & " set FindObject = m_findobject"
  body = body & vbCrLf & " set m_FindObject = nothing"
  body = body & vbCrLf & " inFindObject = false"
  body = body & vbCrLf & "end function"
  body = body & vbCrLf
  body = body & vbCrLf & CommentItem("public sub Compact()", "Оптимизировать объем занятой памяти")
  body = body & vbCrLf & Compact
  body = body & vbCrLf & "end sub"
   
   
  ' Secure
   body = body & vbCrLf & CommentItem("public sub Secure(byval SecurityStyleID as string)", "Задать стиль защиты документа")
   body = body & vbCrLf & "  if application.WorkOffline then exit sub"
   body = body & vbCrLf & "  On Error goto bye"
   body = body & vbCrLf & "  M_SecureStyleID =Application.MTZSession.Secure(""INSTANCE"" ,ID,SecurityStyleID)"
   body = body & vbCrLf & "  exit sub"
   body = body & vbCrLf & "bye:"
   body = body & vbCrLf & "  err.raise err.number,""APPLICATION.Secure"",err.description"
   body = body & vbCrLf & "end sub"
   
  ' Propagate
   body = body & vbCrLf & CommentItem("public sub Propagate()", "Распространить стиль защиты на все строки документа")
   body = body & vbCrLf & "  if application.WorkOffline then exit sub"
   body = body & vbCrLf & "  On Error goto bye"
   body = body & vbCrLf & "  Application.MTZSession.Propagate ""INSTANCE"", ID"
   body = body & vbCrLf & "  exit sub"
   body = body & vbCrLf & "bye:"
   body = body & vbCrLf & "  err.raise err.number,""APPLICATION.Propagate"",err.description"
   body = body & vbCrLf & "end sub"
   
   
  ' Save
   body = body & vbCrLf & CommentItem("public sub Save()", "Сохранить изменения (новое имя)")
   body = body & vbCrLf & "  if application.WorkOffline then exit sub"
   body = body & vbCrLf & "  On Error goto bye"
   body = body & vbCrLf & "  Application.MTZSession.NewInstance ID, TypeName, Name"
   body = body & vbCrLf & "  exit sub"
   body = body & vbCrLf & "bye:"
   body = body & vbCrLf & "  err.raise err.number,""APPLICATION.Save"",err.description"
   body = body & vbCrLf & "end sub"
   
   ' Status
   body = body & vbCrLf & CommentItem("private sub SetStatus(byval StatusID as string)", "Задать состояние")
   body = body & vbCrLf & "  if application.WorkOffline then exit sub"
   body = body & vbCrLf & "  On Error goto bye"
   body = body & vbCrLf & "  Application.MTZSession.SetStatus id,StatusID"
   body = body & vbCrLf & "  exit sub"
   body = body & vbCrLf & "bye:"
   body = body & vbCrLf & "  err.raise err.number,""APPLICATION.SetStatus"",err.description"
   body = body & vbCrLf & "end sub"
   
   'Read status
   body = body & vbCrLf & CommentItem("private sub GetStatus() ", "Получтиь актуальное состояние")
   body = body & vbCrLf & "if application.WorkOffline then exit sub"
   body = body & vbCrLf & "Dim rs as adodb.recordset"
   body = body & vbCrLf & "On Error goto bye"
   body = body & vbCrLf & "set rs =application.MTZSession.GetRow( ""INSTANCE"", ID)"
   body = body & vbCrLf & "m_statusid=rs!status & """" "
   body = body & vbCrLf & "m_SecureStyleID = rs!SecurityStyleID & """" "
   body = body & vbCrLf & "exit sub"
   body = body & vbCrLf & "bye:"
   body = body & vbCrLf & "  err.raise err.number,""APPLICATION.SetStatus"",err.description"
   body = body & vbCrLf & "end sub"
      
   'XML
   MakeXMLApplication obj, body
  
  
  
  ''' METHODS '''''''''''''''''''''''''''''''''''''
  
  body = body & vbCrLf & CommentItem("public function Brief() as string", "Краткое название")
  body = body & vbCrLf & " Brief= Name " '& ""; ("" & Typename & "")"" "
  body = body & vbCrLf & "end function"
  
  
  ' Fill all object to tree
  AppFillTreeGlobal obj, body
  
  ' Function for Expand global tree
  body = body & vbCrLf & AppExpandTreeGlobal(obj)
  
  body = body & vbCrLf & CommentItem("public property Get ItemCollection( Item as object, byval CollectionName as string) as object", "Получить дочерний раздел по имени")
  body = body & vbCrLf & "  set ItemCollection = CallByName(Item,CollectionName,vbGet)"
  body = body & vbCrLf & "end property"
  
  MakeLockable decl, body, False, Nothing
  
  MakeApplicationBatchUpdate obj, body
  
  
  Exit Sub
bye:
  log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
  'Stop
  'Resume
End Sub



' used for scaning menu for application and create methods for this menu inside Application class
Private Function ScanTypeMenu(menus As TYPEMENU_COL, prev As String) As String
Dim item As typemenu, i
Dim out As String
Dim mt As SHAREDMETHOD, typemenu As typemenu
  On Error GoTo bye
  out = vbCrLf
  For i = 1 To menus.Count
    Set item = menus.item(i)
    If Not item.the_Action Is Nothing Then
       If InStr(1, out, "'" & item.the_Action.ID) = 0 Then
          If InStr(1, prev, "'" & item.the_Action.ID) = 0 Then
            out = out & MakeMethodCode(item.the_Action)
          End If
       End If
    End If
  Next
  ScanTypeMenu = out
  Exit Function
bye:

'Stop
'  Resume
End Function


' used for scaning menu for part and create methods for this menu inside this class
Private Function ScanStructMenu(menus As PARTMENU_COL, prev As String) As String
Dim item As PARTMENU, i
Dim out As String
Dim mt As SHAREDMETHOD
  On Error GoTo bye
  out = vbCrLf
  For i = 1 To menus.Count
    Set item = menus.item(i)
    If Not item.the_Action Is Nothing Then
       If InStr(1, out, "'" & item.the_Action.ID) = 0 Then
          If InStr(1, prev, "'" & item.the_Action.ID) = 0 Then
            out = out & MakeMethodCode(item.the_Action)
          End If
       End If
    End If
  Next
  ScanStructMenu = out
  Exit Function
bye:
'Stop
 ' Resume
End Function



' Create custom code for class code extracted from Meta model
Private Function MakeMethodCode(sm As SHAREDMETHOD) As String

 
 Dim out As String, i As Long, P As Parameters, scr As String
 scr = MapScript(sm.SCRIPT)
 If scr = "" Then Exit Function
 
 
  out = out & vbCrLf & "'" & NoLF(sm.the_comment)
  out = out & vbCrLf & "'" & sm.ID
 
 If sm.ReturnType Is Nothing Then
   out = out & vbCrLf & "public sub Run_" & sm.name & " ("
 Else
   out = out & vbCrLf & "public function Run_" & sm.name & " ("
 End If
 
 Dim params As PARAMETERS_COL
 Set params = GetParameters(sm.SCRIPT, tid)
 For i = 1 To params.Count
   Set P = params.item(i)
   If i > 1 Then out = out & ","
   If P.AllowNull Then out = out & " Optional "
   out = out & P.name & " as " & MapFT(m, P.TypeOfParm.ID, tid)
 Next
 out = out & ")"
 out = out & vbCrLf & scr
  

 If sm.ReturnType Is Nothing Then
   out = out & vbCrLf & "end sub"
 Else
   out = out & vbCrLf & "end function"
 End If
 out = out & vbCrLf
 out = out & vbCrLf
 MakeMethodCode = out
End Function



' create class for all part
Private Sub MakeRow(os As PART, typename As String)
  On Error GoTo bye
  Dim s As PART, s1 As PART, pack As String, unpack As String, brief As String
  Dim unpackrs As String
  Dim pd As FIELD, decl As String, body As String, ft As FIELDTYPE
  
  Dim n As PART, pos As Long, txt As String
  Dim CloseClassText As String, FindObject As String, Compact As String

  Dim ok As Boolean, i As Long, j As Long
  pos = 0
  

    CloseClassText = ""
    FindObject = ""
    Compact = ""


    ' declare variables
    decl = "'строка раздела " & NoLF(os.the_comment)
    decl = decl & vbCrLf & "private m_ID as string"
    decl = decl & vbCrLf & "private m_SecureStyleID as string"
    decl = decl & vbCrLf & "private m_RowRetrived as boolean"
    decl = decl & vbCrLf & "private m_Changed as boolean"
    decl = decl & vbCrLf & "private m_Deleted as boolean"
    decl = decl & vbCrLf & "private m_RetriveTime as date"
    decl = decl & vbCrLf & "private m_ChangeTime as date"
    decl = decl & vbCrLf & "private m_AccessTime as date"
    decl = decl & vbCrLf & "private m_Parent as Object"
    decl = decl & vbCrLf & "private m_Application as Application"
    
    
    'Deleted
    body = body & vbCrLf & CommentItem("public property Get Deleted() as boolean", "Признак удаления")
    body = body & vbCrLf & "  Deleted = m_Deleted"
    body = body & vbCrLf & "end property"
    
    'Changed
    body = body & vbCrLf & CommentItem("public property Get Changed() as boolean", "Признак изменения")
    body = body & vbCrLf & "  Changed = m_Changed"
    body = body & vbCrLf & "end property"

    body = body & vbCrLf & CommentItem("friend property Let Changed(newChanged as boolean)", "Установить признак изменения")
    body = body & vbCrLf & "  m_Changed = newChanged"
    body = body & vbCrLf & "end property"

    ' ID
    body = body & vbCrLf & CommentItem("friend property let ID(byval newID as string)", "Задать идентификатор строки")
    body = body & vbCrLf & "  if m_ID = """" then"
    body = body & vbCrLf & "    m_ID = newID"
    body = body & vbCrLf & "  end if"
    body = body & vbCrLf & "end property"
    
    body = body & vbCrLf & CommentItem("public property Get ID() as string", "Идентификатор строки")
    body = body & vbCrLf & "  if  m_ID="""" then m_ID= createguid2"
    body = body & vbCrLf & "  ID = m_ID"
    body = body & vbCrLf & "end property"
    
    
    ' SecureStyleID
    body = body & vbCrLf & CommentItem("friend property let SecureStyleID(byval newID as string)", "Задать стиль защиты")
    body = body & vbCrLf & "    m_SecureStyleID = newID"
    body = body & vbCrLf & "end property"
    
    body = body & vbCrLf & CommentItem("public property Get SecureStyleID() as string", "Стиль защиты")
    body = body & vbCrLf & "  SecureStyleID = m_SecureStyleID"
    body = body & vbCrLf & "end property"
    
    
    ' Name of storage table for row
    body = body & vbCrLf & CommentItem("public property Get PartName() as string", "Название таблицы раздела")
    body = body & vbCrLf & "  PartName = """ & os.name & """" 'Parent.ChildPartName
    body = body & vbCrLf & "end property"
    
    
    ' Parent & Application
    body = body & vbCrLf & CommentItem("friend property Set Parent(newParent as object)", "Задать родительский объект")
    body = body & vbCrLf & "  set m_Parent = newParent"
    body = body & vbCrLf & "end property"
    
    body = body & vbCrLf & CommentItem("public property Get Parent() as object", "Получить родительский объект")
    body = body & vbCrLf & "  set Parent = m_Parent"
    body = body & vbCrLf & "end property"
    
    
    body = body & vbCrLf & CommentItem("friend property Set Application(newApplication as Application)", "Задать корневой объект")
    body = body & vbCrLf & "  set m_Application = newApplication"
    body = body & vbCrLf & "  m_Application.Logger.Message  """ & os.name & ".Init"""
    body = body & vbCrLf & "end property"
    
    body = body & vbCrLf & CommentItem("public property Get Application() as Application", "Корневой объект")
    body = body & vbCrLf & "  set Application = m_Application"
    body = body & vbCrLf & "end property"
    
    
    body = body & vbCrLf & CommentItem("private sub CloseParents()", "Разрушить иерархическую зависимость объектов")
    body = body & vbCrLf & "  set m_Application = nothing"
    body = body & vbCrLf & "  set m_Parent = nothing"
    body = body & vbCrLf & "end sub"

    ' RowRetrived
    body = body & vbCrLf & CommentItem("friend property Let RowRetrived(newRetrived as boolean)", "Установить признак - считано из базы")
    body = body & vbCrLf & "  m_RowRetrived = newRetrived"
    body = body & vbCrLf & "end property"
    
    body = body & vbCrLf & CommentItem("public property Get RowRetrived() as boolean", "получить признак - считано из базы")
    body = body & vbCrLf & "  RowRetrived = m_RowRetrived"
    body = body & vbCrLf & "end property"

    ' RetriveTime
    body = body & vbCrLf & CommentItem("friend property Let RetriveTime(newRetriveTime as date)", "Задать Дату и время считывания из базы")
    body = body & vbCrLf & "  m_RetriveTime = newRetriveTime"
    body = body & vbCrLf & "end property"
    
    body = body & vbCrLf & CommentItem("public property Get RetriveTime() as date", "Дата и время считывания из базы")
    body = body & vbCrLf & "  RetriveTime = m_RetriveTime"
    body = body & vbCrLf & "end property"


    'ChangeTime
    body = body & vbCrLf & CommentItem("friend property Let ChangeTime(newChangeTime as date)", "Задать Дату и время изменения")
    body = body & vbCrLf & "  m_ChangeTime = newChangeTime"
    body = body & vbCrLf & "end property"
    
    body = body & vbCrLf & CommentItem("public property Get ChangeTime() as date", "Получить Дату и время изменения")
    body = body & vbCrLf & " ChangeTime = m_ChangeTime"
    body = body & vbCrLf & "end property"



    ' AccessTime
    body = body & vbCrLf & CommentItem("friend property Let AccessTime(newAccessTime as date)", "Задать время обращения")
    body = body & vbCrLf & "  m_AccessTime = newAccessTime"
    body = body & vbCrLf & "  if m_AccessTime <= m_RetriveTime then m_AccessTime = m_RetriveTime +0.001"
    body = body & vbCrLf & "end property"
    
    body = body & vbCrLf & CommentItem("public property Get AccessTime() as date", "Получить время обращения")
    body = body & vbCrLf & "  AccessTime = m_AccessTime"
    body = body & vbCrLf & "end property"
    
    body = body & vbCrLf & "private function  GetFromXML(ByVal XML as string, ByVal TagName as string) as string"
    body = body & vbCrLf & "  Dim res As String"
    body = body & vbCrLf & "  On Error GoTo err"
    body = body & vbCrLf & "  Dim XMLDoc As New DOMDocument"
    body = body & vbCrLf & "  Call XMLDoc.loadXML(XML)"
    body = body & vbCrLf & "  Dim Node As MSXML2.IXMLDOMNode"
    body = body & vbCrLf & "  For Each Node In XMLDoc.childNodes.item(0).childNodes"
    body = body & vbCrLf & "    If (UCase(Node.baseName) = ""BRIEF"") Then"
    body = body & vbCrLf & "      res = Node.Text"
    body = body & vbCrLf & "      Exit For"
    body = body & vbCrLf & "    End If"
    body = body & vbCrLf & "  Next"
    body = body & vbCrLf & "err:"
    body = body & vbCrLf & "  GetFromXML = res"
    body = body & vbCrLf & "End function "

    'Register Tree children
    If os.PartType = 2 Then
      Set s1 = os
      decl = decl & vbCrLf & "private m_" & MakeValidName(s1.name) & " as " & MakeValidName(s1.name) & "_col"
      
      FindObject = FindObject & vbCrLf & " if m_FindObject is nothing then"
      FindObject = FindObject & vbCrLf & "   set m_FindObject =  " & MakeValidName(s1.name) & ".FindObject(StrID,InstID)"
      FindObject = FindObject & vbCrLf & " end if"
  
      Compact = Compact & vbCrLf & MakeValidName(s1.name) & ".Compact"
  
      CloseClassText = CloseClassText & vbCrLf & "if not m_" & MakeValidName(s1.name) & " is nothing then "
      CloseClassText = CloseClassText & vbCrLf & "  m_" & MakeValidName(s1.name) & ".CloseClass "
      CloseClassText = CloseClassText & vbCrLf & "  set m_" & MakeValidName(s1.name) & " = nothing "
      CloseClassText = CloseClassText & vbCrLf & "end if"
  
      body = body & vbCrLf & CommentItem("public property Get " & MakeValidName(s1.name) & " (optional byval Refresh as boolean = true) as " & MakeValidName(s1.name) & "_col", "Данные поддерева раздела " & s1.Caption)
      body = body & vbCrLf & " if m_" & MakeValidName(s1.name) & " is nothing then"
      body = body & vbCrLf & "   set  m_" & MakeValidName(s1.name) & " = new " & MakeValidName(s1.name) & "_col"
      body = body & vbCrLf & "   set m_" & MakeValidName(s1.name) & ".Parent = me"
      body = body & vbCrLf & "   set m_" & MakeValidName(s1.name) & ".Application = me.Application"
      body = body & vbCrLf & "   if Refresh then m_" & MakeValidName(s1.name) & ".Refresh"
      body = body & vbCrLf & " end if"
      body = body & vbCrLf & " set  " & MakeValidName(s1.name) & " = m_" & MakeValidName(s1.name)
      body = body & vbCrLf & "end property"
    End If

    ' register children
    For i = 1 To os.PART.Count
     Set s1 = os.PART.item(i)
        
     decl = decl & vbCrLf & "private m_" & MakeValidName(s1.name) & " as " & MakeValidName(s1.name) & "_col"
     
     FindObject = FindObject & vbCrLf & " if m_FindObject is nothing then"
     FindObject = FindObject & vbCrLf & "   set m_FindObject =  " & MakeValidName(s1.name) & ".FindObject(StrID,InstID)"
     FindObject = FindObject & vbCrLf & " end if"

     Compact = Compact & vbCrLf & MakeValidName(s1.name) & ".Compact"

     CloseClassText = CloseClassText & vbCrLf & "if not m_" & MakeValidName(s1.name) & " is nothing then "
     CloseClassText = CloseClassText & vbCrLf & "  m_" & MakeValidName(s1.name) & ".CloseClass "
     CloseClassText = CloseClassText & vbCrLf & "  set m_" & MakeValidName(s1.name) & " = nothing "
     CloseClassText = CloseClassText & vbCrLf & "end if"

     body = body & vbCrLf & CommentItem("public property Get " & MakeValidName(s1.name) & " (optional byval Refresh as boolean = true) as " & MakeValidName(s1.name) & "_col", "Данные дочернего раздела " & s1.Caption)
     body = body & vbCrLf & " if m_" & MakeValidName(s1.name) & " is nothing then"
     body = body & vbCrLf & "   set  m_" & MakeValidName(s1.name) & " = new " & MakeValidName(s1.name) & "_col"
     body = body & vbCrLf & "   set m_" & MakeValidName(s1.name) & ".Parent = me"
     body = body & vbCrLf & "   set m_" & MakeValidName(s1.name) & ".Application = me.Application"
     body = body & vbCrLf & "   if Refresh then m_" & MakeValidName(s1.name) & ".Refresh"
     body = body & vbCrLf & " end if"
     body = body & vbCrLf & " set  " & MakeValidName(s1.name) & " = m_" & MakeValidName(s1.name)
     body = body & vbCrLf & "end property"
    Next



    ' register properties
    pack = ""
    unpack = ""
    unpackrs = ""
    brief = """"""
    Dim ptype As String
    Dim setlet As String
    Dim setlet2 As String
    Dim Expand As String
    Dim Expand2 As String
    Dim def As String
    Dim arr() As String, l As Long


    If os.PartType = 2 Then
      pack = pack & vbCrLf & "If typename(Me.Parent.Parent) = typename(Me) Then"
      pack = pack & vbCrLf & "  Set nvi = nv.Add(""ParentRowID"", Me.Parent.Parent.ID)"
      pack = pack & vbCrLf & "  nvi.ORACLE_GUID"
      pack = pack & vbCrLf & "Else"
      pack = pack & vbCrLf & "  Set nvi = nv.Add(""ParentRowID"", Null)"
      pack = pack & vbCrLf & "  nvi.ORACLE_GUID"
      pack = pack & vbCrLf & "End If"
    End If
   

    Set n = os
    n.FIELD.Sort = "sequence"
    
    For i = 1 To n.FIELD.Count
      If (n.FIELD.item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
      Set pd = n.FIELD.item(i)
      Set ft = pd.FIELDTYPE
      def = ""
      Expand = ""
      Expand2 = ""

      
      If ft.TypeStyle = TypeStyle_Ssilka Then
        If pd.ReferenceType = ReferenceType_Skalyrnoe_pole_OPN_ne_ssilkaCLS Then
          MsgBox "Ссыслка " & s1.name & "." & pd.name & " неверно определена"
          GoTo ref_err
        End If
        ' ссылка на строку объекта
        
        ' ссылка на строку объекта
        If pd.ReferenceType = ReferenceType_Na_stroku_razdela Or pd.ReferenceType = ReferenceType_Na_istocnik_dannih Then
          ptype = "object"
          setlet = " set "
          setlet2 = "'  set "
          If pd.ReferenceType = ReferenceType_Na_istocnik_dannih Then
            ptype = "string"
            setlet = "  let "
            setlet2 = "  "
          End If
          If pd.RefToPart Is Nothing And pd.ReferenceType <> ReferenceType_Na_istocnik_dannih Then
            MsgBox "Неверно определена ссылка для поля '" & pd.name & "' в таблице '" & n.name & "'"
            GoTo ref_err
          End If
          If pd.FIELDSRCDEF.Count = 0 And pd.ReferenceType = ReferenceType_Na_istocnik_dannih Then
            MsgBox "Неверно определена ссылка для поля '" & pd.name & "' в таблице '" & n.name & "'"
            GoTo ref_err
          End If
          
          If pd.ReferenceType <> ReferenceType_Na_istocnik_dannih Then
            pack = pack & vbCrLf & " ' Reference to " & pd.RefToPart.name
            pack = pack & vbCrLf & "    if m_" & pd.name & "_ID=""""  then "
            pack = pack & vbCrLf & "       set nvi=nv.Add (""" & pd.name & ""","""")"
            pack = pack & vbCrLf & "    else "
            pack = pack & vbCrLf & "       set nvi=nv.Add (""" & pd.name & """,m_" & pd.name & "_ID)"
            pack = pack & vbCrLf & "    end if "
            pack = pack & vbCrLf & "    nvi.ORACLE_GUID "
            ' дополнительная переменная для хранения идентификатора
            def = "Dim m_" & pd.name & "_ID as string"
            ' дополнительная переменная для хранения отображения в режиме OFFLINE
            def = def & vbCrLf & "Dim m_" & pd.name & "_ID_BRIEF as string"
          Else
            pack = pack & vbCrLf & "       set nvi=nv.Add (""" & pd.name & """, m_" & pd.name & ")"
            pack = pack & vbCrLf & "       nvi.ValueSize = Len(m_" & pd.name & ")"
          End If
          
          If pd.ReferenceType = ReferenceType_Na_istocnik_dannih Then
            unpack = unpack & vbCrLf & "  m_" & pd.name & " =" & "nv.item( """ & pd.name & """).Value"
            unpackrs = unpackrs & vbCrLf & "  m_" & pd.name & " =" & "nv.fields( """ & pd.name & """).Value"
          Else
            unpack = unpack & vbCrLf & "  m_" & pd.name & "_ID=" & "nv.item( """ & pd.name & """).Value"
            unpackrs = unpackrs & vbCrLf & "  m_" & pd.name & "_ID=" & "nv.fields( """ & pd.name & """).Value"
          End If
          
          If pd.ReferenceType <> ReferenceType_Na_istocnik_dannih Then
            Expand = "dim tmp_" & pd.name & " as object"
            Expand = Expand & vbCrLf & "if  m_" & pd.name & "_ID<>"""" then "
            Expand = Expand & vbCrLf & "  set tmp_" & pd.name & "=Application.FindRowObject(""" & pd.RefToPart.name & """,m_" & pd.name & "_ID)"
            Expand = Expand & vbCrLf & "  if tmp_" & pd.name & " is nothing then"
            Expand = Expand & vbCrLf & "    m_" & pd.name & "_ID_BRIEF = """" "
            Expand = Expand & vbCrLf & "  else"
            Expand = Expand & vbCrLf & "    m_" & pd.name & "_ID_BRIEF = tmp_" & pd.name & ".Brief"
            Expand = Expand & vbCrLf & "  end if"
            Expand = Expand & vbCrLf & "  '''''' Speed optimization ONLY '''''''''"
            Expand = Expand & vbCrLf & "  Application.AddToCash """ & pd.RefToPart.name & """ & m_" & pd.name & "_ID, tmp_" & pd.name
            Expand = Expand & vbCrLf & "  set " & pd.name & "=tmp_" & pd.name & ""
            Expand = Expand & vbCrLf & "  exit property"
            Expand = Expand & vbCrLf & "end if"
    
            Expand2 = "on error resume next"
            Expand2 = Expand2 & vbCrLf & "m_" & pd.name & "_ID="""""
            Expand2 = Expand2 & vbCrLf & "m_" & pd.name & "_ID=newValue.id"
    
            CloseClassText = CloseClassText & vbCrLf & " m_" & pd.name & "_ID="""""
          End If
          
          If (pd.ReferenceType = ReferenceType_Na_istocnik_dannih) Then
            CloseClassText = CloseClassText & vbCrLf & " m_" & pd.name & "= """""
          Else
            CloseClassText = CloseClassText & vbCrLf & " set m_" & pd.name & "= nothing"
          End If
        End If
        
        
        'ссылка на объект
        If pd.ReferenceType = ReferenceType_Na_ob_ekt_ Then
          ptype = "object"
          setlet = " set "
          setlet2 = "' set "
          pack = pack & vbCrLf & " ' Reference to object"
          'pack = pack & vbCrLf & "  if m_" & pd.name & " is nothing then "
          pack = pack & vbCrLf & "    if m_" & pd.name & "_ID=""""  then "
          pack = pack & vbCrLf & "       set nvi=nv.Add (""" & pd.name & ""","""")"
          pack = pack & vbCrLf & "    else "
          pack = pack & vbCrLf & "       set nvi=nv.Add (""" & pd.name & """,m_" & pd.name & "_ID)"
          pack = pack & vbCrLf & "    end if "
          pack = pack & vbCrLf & "    nvi.oracle_guid "
          'pack = pack & vbCrLf & "  else "
          'pack = pack & vbCrLf & "     nv.Add """ & pd.name & """,m_" & pd.name & ".ID"
          'pack = pack & vbCrLf & "  end if"
          
          ' дополнительная переменная для хранения идентификатора
          def = "Dim m_" & pd.name & "_ID as string"
          ' дополнительная переменная для хранения отображения в режиме OFFLINE
          def = def & vbCrLf & "Dim m_" & pd.name & "_ID_BRIEF as string"
          
          unpack = unpack & vbCrLf & "  m_" & pd.name & "_ID=" & "nv.item( """ & pd.name & """).Value"
          unpackrs = unpackrs & vbCrLf & "  m_" & pd.name & "_ID=" & "nv.fields( """ & pd.name & """).Value"
          'Expand = "if m_" & pd.name & " is nothing and m_" & pd.name & "_ID<>"""" then "
          Expand = "if  m_" & pd.name & "_ID<>"""" then "
          Expand = Expand & vbCrLf & "  set " & pd.name & "=application.Manager.GetInstanceObject(right(m_" & pd.name & "_ID,38))"
          Expand = Expand & vbCrLf & " EXIT PROPERTY"
          Expand = Expand & vbCrLf & "end if"
  
          Expand2 = "on error resume next"
          Expand2 = Expand2 & vbCrLf & "m_" & pd.name & "_ID="""""
          Expand2 = Expand2 & vbCrLf & "m_" & pd.name & "_ID=newValue.id"
  
          CloseClassText = CloseClassText & vbCrLf & " m_" & pd.name & "_ID="""""
          CloseClassText = CloseClassText & vbCrLf & " set m_" & pd.name & "= nothing"
        End If
        
ref_err:
      
      Else ' not reference
        ptype = MapFT(m, ft.ID, tid)
        setlet = " let "
        setlet2 = " "
        
        If UCase(ft.name) <> "PASSWORD" Then
          pack = pack & vbCrLf & "  set nvi=nv.Add( """ & pd.name & """,m_" & pd.name & ")"
          unpack = unpack & vbCrLf & "m_" & pd.name & "=nv.item( """ & pd.name & """).Value"
          unpackrs = unpackrs & vbCrLf & "m_" & pd.name & "=nv.fields( """ & pd.name & """).Value"
          If UCase(ft.name) = "DATE" Then
            pack = pack & vbCrLf & "nvi.ValueType = adDate "
          End If
          If UCase(ft.name) = "DATETIME" Then
            pack = pack & vbCrLf & "nvi.ValueType = adDBTimeStamp "
          End If
          If UCase(ft.name) = "TIME" Then
            pack = pack & vbCrLf & "nvi.ValueType = adDBTime "
          End If
          If UCase(ft.name) = "INTEGER" Then
            pack = pack & vbCrLf & "nvi.ValueType = adInteger "
          End If
          If UCase(ft.name) = "NUMERIC" Then
            pack = pack & vbCrLf & "nvi.ValueType =  adDouble "
          End If
          
          If pd.DataSize <> 0 Then
            pack = pack & vbCrLf & "nvi.ValueSize = " & pd.DataSize
          End If
          
          If ft.TypeStyle = TypeStyle_Interval Or ft.TypeStyle = TypeStyle_Perecislenie Then
            pack = pack & vbCrLf & "nvi.ValueType = adInteger "
          End If
        
          
        Else
          ' write only field!
          If UCase(ft.name) = "IMAGE" Then
            pack = pack & vbCrLf & "set nvi=nv.Add( """ & pd.name & """,m_" & pd.name & ")"
            pack = pack & vbCrLf & "nvi.ValueType = adLongVarBinary"
            pack = pack & vbCrLf & "nvi.ValueSize = Len(m_" & pd.name & ")"
          Else
            pack = pack & vbCrLf & "set nvi=nv.Add( """ & pd.name & """,m_" & pd.name & ")"
          End If
          
        End If
        
        If UCase(ft.name) = "FILE" Then
          pack = pack & vbCrLf & "set nvi =nv.Add (""" & pd.name & "_EXT"",m_" & pd.name & "_EXT)"
          pack = pack & vbCrLf & "nvi.valueSize=10"
          unpack = unpack & vbCrLf & "m_" & pd.name & "_EXT=nv.item( """ & pd.name & "_EXT"").Value"
          unpackrs = unpackrs & vbCrLf & "m_" & pd.name & "_EXT=nv.fields( """ & pd.name & "_EXT"").Value"
          decl = decl & vbCrLf & "private m_" & pd.name & "_EXT as string"
        End If
        
        Expand = ""
        Expand2 = ""
      End If

      
      ' save file extention automatically
      If UCase(ft.name) = "FILE" Then
        body = body & vbCrLf & "' let "
        body = body & CommentSplit(vbCrLf & "'", pd.name)
        body = body & vbCrLf & "Public property Let " & pd.name & "_EXT(byval newValue as string)"
        body = body & vbCrLf & " LoadFromDatabase"
        body = body & vbCrLf & "if CanChange then"
        body = body & vbCrLf & " ChangeTime=Now "
        body = body & vbCrLf & " Changed=true"
        body = body & vbCrLf & " OnChange """ & pd.name & "_EXT""," & pd.name & "_EXT,newvalue"
        body = body & vbCrLf & " m_" & pd.name & "_EXT= newValue"
        body = body & vbCrLf & "end if"
        body = body & vbCrLf & "end property"
       
        body = body & vbCrLf & CommentItem("public property Get " & pd.name & "_EXT() as string", pd.Caption)
        body = body & vbCrLf & " LoadFromDatabase"
        body = body & vbCrLf & " AccessTime=Now"
        body = body & vbCrLf & "  " & pd.name & "_EXT = m_" & pd.name & "_EXT"
        body = body & vbCrLf & "end property"
      End If
      
      
      decl = decl & vbCrLf & "private m_" & pd.name & " as " & ptype
      
      If def <> "" Then decl = decl & vbCrLf & def
        body = body & vbCrLf & "' let "
        body = body & CommentSplit(vbCrLf & "'", pd.Caption)
        body = body & vbCrLf & CommentItem("Public property " & setlet & pd.name & "(byval newValue as " & ptype & ")", pd.Caption)
        body = body & vbCrLf & " LoadFromDatabase"
        body = body & vbCrLf & "if CanChange then"
        body = body & vbCrLf & " ChangeTime=Now "
        body = body & vbCrLf & " Changed=true"
        body = body & vbCrLf & " OnChange """ & pd.name & """," & pd.name & ",newvalue"
        body = body & vbCrLf & Expand2
        body = body & vbCrLf & setlet2 & "  m_" & pd.name & "= newValue"
        body = body & vbCrLf & "end if"
        body = body & vbCrLf & "end property"
        
       
       '(application.workoffline and CanChangeoffLine) or ((not application.workoffline) and canchangeonline)
        
        body = body & vbCrLf & CommentItem("public property Get " & pd.name & "() as " & ptype, pd.Caption)
        body = body & vbCrLf & " LoadFromDatabase"
        body = body & vbCrLf & " AccessTime=Now"
        body = body & vbCrLf & Expand
        body = body & vbCrLf & "  " & setlet2 & pd.name & " = m_" & pd.name
        body = body & vbCrLf & "end property"
      End If
    Next 'pd

    
    
    'Pack
    body = body & vbCrLf & CommentItem("public sub Pack(byref nv as NamedValues)", "Упаковать поля в именованную коллекцию")
    body = body & vbCrLf & "  dim nvi as NamedValue"
    body = body & vbCrLf & "  set nv = Nothing"
    body = body & vbCrLf & "  set nv = new NamedValues"
    body = body & vbCrLf & pack
    body = body & vbCrLf & "end sub"
       
    
    'Brief
    
    decl = decl & vbCrLf & "private m_Brief as string"
    
    body = body & vbCrLf & CommentItem("public function  Brief( optional byval UseServer as boolean = false) as string", "Краткое название строки")
    body = body & vbCrLf & " dim s as string"
    body = body & vbCrLf & " if Application.WorkOffline then"
    
    body = body & vbCrLf & MakeOfflineBriefProc(os)
    
    body = body & vbCrLf & " else"
    body = body & vbCrLf & "  on error goto bye"
    body = body & vbCrLf & "   if UseServer or m_Brief="""" then"
    body = body & vbCrLf & "     application.MTZSession.GetBrief PartName, ID, s"
    body = body & vbCrLf & "     if len(s) > 255 then"
    body = body & vbCrLf & "       Brief  =  left(s,255) & ""..."""
    body = body & vbCrLf & "     else"
    body = body & vbCrLf & "       Brief  =  s"
    body = body & vbCrLf & "     end if"
    body = body & vbCrLf & "       m_Brief  =  Brief"
    body = body & vbCrLf & "   else"
    body = body & vbCrLf & "     Brief = m_Brief"
    body = body & vbCrLf & "   end if"
    body = body & vbCrLf & " end if"
    body = body & vbCrLf & "exit function"
    body = body & vbCrLf & "bye:"
    body = body & vbCrLf & "    Brief = ""! доступ запрещен ! ("" & err.description  & "")"" "
    body = body & vbCrLf & "end function"
    
    
    ' UnPack
    body = body & vbCrLf & CommentItem("public sub UnPack(byref nv as object)", "Распаковать значения полей из именованной коллекции")
    body = body & vbCrLf & " on error resume next"
    body = body & vbCrLf & "if typename(nv) = ""NamedValues"" then"
    body = body & vbCrLf & unpack
    body = body & vbCrLf & "else"
    body = body & vbCrLf & unpackrs
    body = body & vbCrLf & "end if"
    body = body & vbCrLf & "end sub"
    

    'CleanFields
    body = body & vbCrLf & CommentItem("Public Sub CleanFields()", "Очистить поля")
    body = body & vbCrLf & "   dim nv as namedvalues"
    body = body & vbCrLf & "   dim o as " & MakeValidName(os.name)
    body = body & vbCrLf & "   set o = new " & MakeValidName(os.name)
    body = body & vbCrLf & "   set o.Application = me.Application"
    body = body & vbCrLf & "   set o.parent = me.parent"
    body = body & vbCrLf & "   o.pack nv"
    body = body & vbCrLf & "   unpack nv"
    body = body & vbCrLf & "   set o = nothing"
    body = body & vbCrLf & "end sub"
    

    'Save
    body = body & vbCrLf & CommentItem("Public Function Save() as boolean", "Сохранить изменение")
    body = body & vbCrLf & "   LoadFromDatabase"
    
    'if object work offline do nothing
    body = body & vbCrLf & "   if Application.WorkOffline then exit function"
    body = body & vbCrLf & "   If Not CanChangeONLine Then Exit Function"
    body = body & vbCrLf & "   dim nv as namedvalues"
    body = body & vbCrLf & "   pack nv"
    body = body & vbCrLf & "   on error goto bye"
    
    If os.PartType = 2 Then
      body = body & vbCrLf & "   dim tmpParent as object"
      body = body & vbCrLf & "   set tmpParent =me"
      body = body & vbCrLf & "   while  typename(tmpparent.parent.parent)=""" & MakeValidName(os.name) & """"
      body = body & vbCrLf & "     set tmpparent = tmpparent.parent.parent"
      body = body & vbCrLf & "   wend"
      body = body & vbCrLf & "     application.MTZSession.SaveRow2 PartName,  id,  tmpParent.Parent.Parent.id ,nv,application.id"
    Else
      body = body & vbCrLf & "     application.MTZSession.SaveRow2 PartName,  id,  me.Parent.Parent.id ,nv,application.id"
    End If
    body = body & vbCrLf & "   Changed = false"
    body = body & vbCrLf & "   Save = true"
    body = body & vbCrLf & "exit function"
    body = body & vbCrLf & "bye:"
    body = body & vbCrLf & "  err.raise err.number,""" & os.name & ".Save"",err.description"
    body = body & vbCrLf & "End Function"
    

    'Delete
    body = body & vbCrLf & CommentItem("Public Function Delete() as boolean", "Удалить строку")
    body = body & vbCrLf & "   Dim i As Long, ok as boolean"
    body = body & vbCrLf & "if Application.WorkOffline then "
    body = body & vbCrLf & "  If Not CanChangeOffLine Then Exit Function"
    body = body & vbCrLf & "   on error goto bye"
    If os.PartType = 2 Then
      body = body & vbCrLf & "   for i=1 to " & MakeValidName(os.name) & ".Count"
      body = body & vbCrLf & "     " & MakeValidName(os.name) & ".delete(i) "
      body = body & vbCrLf & "   next"
    End If
    body = body & vbCrLf & "  m_Deleted = True"
    body = body & vbCrLf & "  Delete = True"
    body = body & vbCrLf & "else"
    body = body & vbCrLf & "  If Not CanChangeONLine Then Exit Function"
    ' дерево приходится удалять на уровне объектной модели
    If os.PartType = 2 Then
      body = body & vbCrLf & "   ok = true"
      body = body & vbCrLf & "   while OK and " & MakeValidName(os.name) & ".Count>0"
      body = body & vbCrLf & "     ok=" & MakeValidName(os.name) & ".delete(1) "
      body = body & vbCrLf & "   wend"
      body = body & vbCrLf & "   if not OK then exit function"
    End If
    
    body = body & vbCrLf & "   Delete=application.MTZSession.DeleteRow2( PartName, id, Application.ID) "
    body = body & vbCrLf & "   Changed = false"
    body = body & vbCrLf & "   'Compact"
    body = body & vbCrLf & "   Closeclass"
    body = body & vbCrLf & "end if"
    body = body & vbCrLf & "exit function"
    body = body & vbCrLf & "bye:"
    body = body & vbCrLf & "  err.raise err.number,""" & os.name & ".Delete"",err.description"
    body = body & vbCrLf & "End Function"

   
    ' Secure
    body = body & vbCrLf & CommentItem("public sub Secure(byval SecurityStyleID as string)", "Задать стиль защиты")
    body = body & vbCrLf & "if application.WorkOffline then exit sub"
    body = body & vbCrLf & "On Error goto bye"
    body = body & vbCrLf & "  M_SecureStyleID =Application.MTZSession.Secure(""" & os.name & """ ,ID,SecurityStyleID)"
    body = body & vbCrLf & "exit sub"
    body = body & vbCrLf & "bye:"
    body = body & vbCrLf & "  err.raise err.number,""" & os.name & ".Secure"",err.description"
    body = body & vbCrLf & "end sub"
    
    
    ' Propagate
    body = body & vbCrLf & CommentItem("public sub Propagate()", "Распространить права на дочерние строки и разделы")
    body = body & vbCrLf & "if application.WorkOffline then exit sub"
    body = body & vbCrLf & "  Application.MTZSession.Propagate """ & os.name & """, ID"
    body = body & vbCrLf & "exit sub"
    body = body & vbCrLf & "bye:"
    body = body & vbCrLf & "  err.raise err.number,""" & os.name & ".Propagate"",err.description"
    body = body & vbCrLf & "end sub"
    
    
   
    ' CloseClass
    body = body & vbCrLf & CommentItem("Friend sub CloseClass()", "Деструктор")
    body = body & vbCrLf & " on error resume next"
    body = body & vbCrLf & CloseClassText
    body = body & vbCrLf & " if not Application is nothing then Application.Logger.Message """ & os.name & ".CloseClass"""
    body = body & vbCrLf & " CloseParents"
    body = body & vbCrLf & "end sub"

    'Refresh
    body = body & vbCrLf & CommentItem("Public sub Refresh()", "Обновить")
    body = body & vbCrLf & "    on error resume next"
    body = body & vbCrLf & "    RowRetrived = false "
    body = body & vbCrLf & "    m_Brief ="""""
    body = body & vbCrLf & "End sub"
    
    body = body & vbCrLf & CommentItem("Public sub LoadFromDatabase () ", "Загрузить из базы данных")
    body = body & vbCrLf & "    on error resume next"
    body = body & vbCrLf & "   If ID="""" then exit sub"
    body = body & vbCrLf & "   If Application.WorkOffline then "
    body = body & vbCrLf & "     RowRetrived = true"
    body = body & vbCrLf & "     RetriveTime = now"
    body = body & vbCrLf & "     exit sub"
    body = body & vbCrLf & "   end if"
    body = body & vbCrLf & "   dim rs as adodb.recordset"
    body = body & vbCrLf & "   If not RowRetrived then"
    body = body & vbCrLf & "     CleanFields"
    body = body & vbCrLf & "     set rs =application.MTZSession.GetRow( PartName, id)"
    body = body & vbCrLf & "     Unpack rs"
    body = body & vbCrLf & "     m_SecureStyleID = rs!SecurityStyleID"
    body = body & vbCrLf & "     RowRetrived = true"
    body = body & vbCrLf & "     RetriveTime = now"
    body = body & vbCrLf & "   end if"
    body = body & vbCrLf & "end sub"
   

    'FindObject
    body = body & vbCrLf & CommentItem("public function FindObject(byval StrID as string, byval InstID as string) as object", "Найти строку раздела в дочерних объектах")
    body = body & vbCrLf & " dim m_FindObject as object"
    body = body & vbCrLf & " static inFindObject as boolean"
    body = body & vbCrLf & " if StrID = """" then exit function"
    body = body & vbCrLf & " if InstID = """" then exit function"
    body = body & vbCrLf & " if inFindObject then exit function"
    body = body & vbCrLf & " inFindObject = true"
    body = body & vbCrLf & " if StrID = PartName then "
    body = body & vbCrLf & "   if InstID = ID then"
    body = body & vbCrLf & "     set m_FindObject=me"
    body = body & vbCrLf & "   end if"
    body = body & vbCrLf & " end if"
    body = body & vbCrLf & FindObject
    body = body & vbCrLf & " set FindObject = m_findobject"
    body = body & vbCrLf & " set m_FindObject = nothing"
    body = body & vbCrLf & " inFindObject = false"
    body = body & vbCrLf & "end function"
   

    'Compact
    body = body & vbCrLf & CommentItem("public sub Compact()", "Оптимизировать занятую объектом память")
    body = body & vbCrLf & " if not Changed then"
    body = body & vbCrLf & "   CleanFields"
    body = body & vbCrLf & "   RowRetrived = false"
    body = body & vbCrLf & " end if"
    body = body & vbCrLf & Compact
    body = body & vbCrLf & "end sub"
   
   
  ' Events declaration
  decl = decl & vbCrLf & CommentItem("Public Event Change( byval fieldName as string, byval OldValue, byref NewValue)", "Сообщение об изменении строки")
  
  
  
  body = body & vbCrLf & CommentItem("friend sub OnChange(byval fieldName as string, byval OldValue, byref NewValue)", "Регистрация изменения значения строки")
  body = body & vbCrLf & "RaiseEvent Change(fieldname,OldValue,NewValue)"
  body = body & vbCrLf & "end sub"
   
   
   ''' METHODS '''''''''''''''''''''''''''''''''''''
  
  body = body & vbCrLf & ScanStructMenu(os.PARTMENU, "")
  
  
  ''' METHODS '''''''''''''''''''''''''''''''''''''
    
    MakeXMLRow os, decl, body, m, tid
    MakeLockable decl, body, False, os
    
    MakeRowBatchUpdate os, body
    
    ' expand global tree
    body = body & vbCrLf & PartExpandTreeGlobal(os)
    
    
    ' tree style part load & expand
    If os.PartType = 2 Then
      body = body & vbCrLf & PartTreeLocalSupport(os)
    End If
    
    o.Module = MakeValidName(os.name)
    o.Project.Modules.item(o.Module).Attributes.Add("Type").Value = "class"
    o.Project.Modules.item(o.Module).Attributes.Add("Instancing").Value = "publicnotcreatable"
    o.Block = "declaration"
    o.Project.Modules.item(o.Module).Blocks.item(o.Block).Attributes.Add("Type").Value = "description"
    o.OutNL decl
    
    o.Module = MakeValidName(os.name)
    o.Block = "codebody"
    o.Project.Modules.item(o.Module).Blocks.item(o.Block).Attributes.Add("Type").Value = "code"
    o.OutNL body
    
    
    ' create class for child part
    For i = 1 To os.PART.Count
      MakeRow os.PART.item(i), typename
    Next
  
  Exit Sub
bye:
  MsgBox Err.Description
  'Stop
  'Resume
End Sub



'Make _COL class for each part
Private Sub MakeCollection(s As PART, ByVal typename As String)
    On Error GoTo bye
    Dim pos As Long, txt As String, decl As String
    
    ' MakeValidName(s.name) & "_col"

    'Declaration
    decl = "'раздел " & NoLF(s.the_comment)
    decl = decl & vbCrLf & "dim mcol as SortableCollection"
    decl = decl & vbCrLf & "dim m_Parent as object"
    decl = decl & vbCrLf & "dim m_Application as Application"
    decl = decl & vbCrLf & "dim m_Filter as string"
    
    
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("Friend property Get ChildPartName() as string", "Название таблицы раздела")
    txt = txt & vbCrLf & "  ChildPartName = """ & s.name & """"
    txt = txt & vbCrLf & "end property"

      'Parent
      
      txt = txt & vbCrLf
      txt = txt & vbCrLf & CommentItem("friend property Set Parent(newParent as object)", "Задать родительский объект в иерархии документа")
      txt = txt & vbCrLf & "  set m_Parent = newParent"
      txt = txt & vbCrLf & "end property"
      

      txt = txt & vbCrLf
      txt = txt & vbCrLf & CommentItem("public property Get Parent() as object", "Получить родительский объект в иерархии документа")
      txt = txt & vbCrLf & "  set Parent = m_Parent"
      txt = txt & vbCrLf & "end property"
      
      'Application
      txt = txt & vbCrLf
      txt = txt & vbCrLf & CommentItem("friend property Set Application(newApplication as object)", "Задать корневой объект")
      txt = txt & vbCrLf & "  set m_Application = newApplication"
      txt = txt & vbCrLf & "  m_Application.Logger.Message  """ & s.name & ".Init"""
      txt = txt & vbCrLf & "end property"
    

      
      txt = txt & vbCrLf
      txt = txt & vbCrLf & CommentItem("public property Get Application() as Application", "Получить корневой объект")
      txt = txt & vbCrLf & " if m_Parent is nothing then"
      txt = txt & vbCrLf & "    set Application = me"
      txt = txt & vbCrLf & "  else"
      txt = txt & vbCrLf & "    set Application = m_Application"
      txt = txt & vbCrLf & "  end if"
      txt = txt & vbCrLf & "end property"
      

      'Filter
      
      txt = txt & vbCrLf
      txt = txt & vbCrLf & CommentItem("public property Let Filter(byval newFilter as string)", "Задать дополнительный фильтр коллекции")
      txt = txt & vbCrLf & "  m_Filter = newFilter"
      txt = txt & vbCrLf & "  Refresh"
      txt = txt & vbCrLf & "end property"
      

      
      txt = txt & vbCrLf
      txt = txt & vbCrLf & CommentItem("public property Get Filter() as string", "Получить значение фильтра ")
      txt = txt & vbCrLf & "    Filter = m_Filter"
      txt = txt & vbCrLf & "end property"
      



      'closeParents
      
      txt = txt & vbCrLf
      txt = txt & vbCrLf & CommentItem("private sub CloseParents()", "Разрушить иерархическую связку с родительскими объектами")
      txt = txt & vbCrLf & "  set m_Application = nothing"
      txt = txt & vbCrLf & "  set m_Parent = nothing"
      txt = txt & vbCrLf & "end sub"
      

    ' Add
    
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("Public function Add(optional ID as string="""") as  " & MakeValidName(s.name), "Добавить строку в раздел (но не в базу данных)")
    If s.PartType = 0 Then
      txt = txt & vbCrLf & "   if mcol.count>0 then exit function"
    End If
    txt = txt & vbCrLf & " dim LID as  string"
    txt = txt & vbCrLf & " dim o as  " & MakeValidName(s.name)
    
    txt = txt & vbCrLf & " if ID="""" then "
    txt = txt & vbCrLf & "   LID = createguid2() "
    txt = txt & vbCrLf & " else "
    txt = txt & vbCrLf & "   LID = left(ID,38) "
    txt = txt & vbCrLf & " endif  "
    txt = txt & vbCrLf & " on error resume next  "
    txt = txt & vbCrLf & " if mcol.count > 0  then  "
    txt = txt & vbCrLf & "   if mcol.item(Lid) is nothing  then  "
    txt = txt & vbCrLf & "   goto addnew  "
    txt = txt & vbCrLf & "   else"
    txt = txt & vbCrLf & "     set Add = mcol.Item( LID)"
    txt = txt & vbCrLf & "     exit function"
    txt = txt & vbCrLf & "   end if"
    txt = txt & vbCrLf & " end if"
    txt = txt & vbCrLf & " addnew: "
    txt = txt & vbCrLf & "  set o = new  " & MakeValidName(s.name)
    txt = txt & vbCrLf & "  o.ID =LID"
    txt = txt & vbCrLf & "  o.RowRetrived = False"
    txt = txt & vbCrLf & "  Set o.Parent = Me"
    txt = txt & vbCrLf & "  Set o.Application = Me.Application"
    txt = txt & vbCrLf & "  me.application.AddToCash childPartName & lid , o"
    txt = txt & vbCrLf & "  set add = o"
    txt = txt & vbCrLf & "  mcol.AddItem o,o.ID"
    txt = txt & vbCrLf & "  set  o = nothing"
    txt = txt & vbCrLf & "end function"
    


    'Item
    
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("Public function Item(byval ID as variant) as " & MakeValidName(s.name), "Получить строку раздела")
    txt = txt & vbCrLf & "Attribute Item.VB_MemberFlags = ""200"""
    txt = txt & vbCrLf & " on error resume next  "
    txt = txt & vbCrLf & " dim o as " & MakeValidName(s.name)
    txt = txt & vbCrLf & " If Not mCol.Item(ID) Is Nothing Then"
    txt = txt & vbCrLf & "   Set o = mCol.Item(ID)"
    txt = txt & vbCrLf & "   set Item = o"
    txt = txt & vbCrLf & "   set  o = nothing"
    txt = txt & vbCrLf & "   exit function"
    txt = txt & vbCrLf & " end if"
    txt = txt & vbCrLf & "end function"
    


    'FindObject
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("public function FindObject(byval StrID as string, byval InstID as string) as object", "Найти строку по идентификатору в дочерней иерархии")
    txt = txt & vbCrLf & " dim m_FindObject as object,  i as long"
    txt = txt & vbCrLf & " if StrID = """" then exit function"
    txt = txt & vbCrLf & " if InstID = """" then exit function"
    txt = txt & vbCrLf & " If Not application.MTZSession.IsDescendant(StrID, ChildPartName) Then Exit Function"
    txt = txt & vbCrLf & " if StrID = ChildPartName then "
    txt = txt & vbCrLf & "   set m_FindObject = Item(Instid)"
    txt = txt & vbCrLf & "   if  not  m_FindObject is nothing then goto OK"
    txt = txt & vbCrLf & " end if"
    txt = txt & vbCrLf & " for i = 1 to Count"
    txt = txt & vbCrLf & "   set m_FindObject = Item(i).FindObject(StrID,InstID)"
    txt = txt & vbCrLf & "   if  not  m_FindObject is nothing then exit for"
    txt = txt & vbCrLf & " next"
    txt = txt & vbCrLf & " OK:"
    txt = txt & vbCrLf & " set FindObject = m_findobject"
    txt = txt & vbCrLf & " set m_FindObject = nothing"
    txt = txt & vbCrLf & "end function"
    
    


    'Compact
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("public sub Compact()", "Оптимизировать использование памяти")
    txt = txt & vbCrLf & " dim  i as long"
    txt = txt & vbCrLf & " for i = 1 to Count"
    txt = txt & vbCrLf & "   Item(i).Compact"
    txt = txt & vbCrLf & " next"
    txt = txt & vbCrLf & "end sub"
    
    
    'Sort
    txt = txt & vbCrLf & CommentItem("public property let Sort(byval Name as string)", "Задать поле по которому будем сортировать")
    txt = txt & vbCrLf & " mcol.Sort name "
    txt = txt & vbCrLf & "end property"
    
    txt = txt & vbCrLf & CommentItem("public property get Sort() as string", "Получить значения поля - основы сортировки")
    txt = txt & vbCrLf & " Sort = mcol.sortname "
    txt = txt & vbCrLf & "end property"

    ' Index op
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("Public function GetEQ(byval Value as variant) as " & MakeValidName(s.name), "Получить строку в кот. поле сортировки равно значению")
    txt = txt & vbCrLf & "   set GetEQ = mcol.getEQ(Value)"
    txt = txt & vbCrLf & "end function"
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("Public function GetLE(byval Value as variant) as " & MakeValidName(s.name), "Получить строку в кот. поле сортировки меньше или равно значению")
    txt = txt & vbCrLf & "   set GetLE = mcol.getLE(Value)"
    txt = txt & vbCrLf & "end function"
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("Public function GetLT(byval Value as variant) as " & MakeValidName(s.name), "Получить строку в кот. поле сортировки меньше значения")
    txt = txt & vbCrLf & "   set GetLT = mcol.getLT(Value)"
    txt = txt & vbCrLf & "end function"
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("Public function GetGE(byval Value as variant) as " & MakeValidName(s.name), "Получить строку в кот. поле сортировки больше или равно значению")
    txt = txt & vbCrLf & "   set GetGE = mcol.getGE(Value)"
    txt = txt & vbCrLf & "end function"
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("Public function GetGT(byval Value as variant) as " & MakeValidName(s.name), "Получить строку в кот. поле сортировки больше значения")
    txt = txt & vbCrLf & "   set GetGT = mcol.getGT(Value)"
    txt = txt & vbCrLf & "end function"

    ' Index position
    
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("Public function GetEQPos(byval Value as variant) as  long", "Получить номер строки в кот. поле сортировки равно значению")
    txt = txt & vbCrLf & "   GetEQPos = mcol.getEQpos(Value)"
    txt = txt & vbCrLf & "end function"
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("Public function GetLEPos(byval Value as variant) as  long", "Получить номер строки в кот. поле сортировки меньше или равно значению")
    txt = txt & vbCrLf & "   GetLEPos = mcol.getLEpos(Value)"
    txt = txt & vbCrLf & "end function"
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("Public function GetLTPos(byval Value as variant) as  long", "Получить номер строки в кот. поле сортировки меньше значения")
    txt = txt & vbCrLf & "   GetLTPos = mcol.getLTpos(Value)"
    txt = txt & vbCrLf & "end function"
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("Public function GetGEPos(byval Value as variant) as  long", "Получить номер строки в кот. поле сортировки больше или равно значению")
    txt = txt & vbCrLf & "   GetGEPos = mcol.getGEpos(Value)"
    txt = txt & vbCrLf & "end function"
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("Public function GetGTPos(byval Value as variant) as  long", "Получить номер строки в кот. поле сортировки больше значения")
    txt = txt & vbCrLf & "   GetGTPos = mcol.getGTpos(Value)"
    txt = txt & vbCrLf & "end function"



    'CloseClass
    
    txt = txt & vbCrLf
    
    txt = txt & vbCrLf & CommentItem("Friend sub CloseClass()", "Деструктор")
    txt = txt & vbCrLf & " on error resume next  "
    txt = txt & vbCrLf & " dim i as long  "
    txt = txt & vbCrLf & " dim o as  " & MakeValidName(s.name)
    txt = txt & vbCrLf & "    For i = 1 To mcol.Count"
    txt = txt & vbCrLf & "       Set o = mcol.Item(i)"
    txt = txt & vbCrLf & "        o.CloseClass"
    txt = txt & vbCrLf & "    Next"
    txt = txt & vbCrLf & " if not Application is nothing then Application.Logger.Message """ & s.name & ".CloseClass"""
    txt = txt & vbCrLf & " CloseParents"
    txt = txt & vbCrLf & " set mcol = nothing"
    txt = txt & vbCrLf & "end sub"
    


    'Class_Initialize
    
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("Private Sub Class_Initialize()", "Инициализация коллекции")
    txt = txt & vbCrLf & " set mcol = new SortableCollection"
    txt = txt & vbCrLf & "End Sub"
    

    'Count
    
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("Public Property Get Count() As Long", "Количетсво строк в коллекции")
    txt = txt & vbCrLf & "    count = mCol.count"
    txt = txt & vbCrLf & "End Property"
    

    'Remove
    
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("public Sub Remove(byval vntIndexKey As Variant)", "Удалить строку из коллекции")
    txt = txt & vbCrLf & "    on error resume next "
    txt = txt & vbCrLf & "    me.application.RemoveFromCash childPartName & item(vntIndexKey).id "
    txt = txt & vbCrLf & "    mCol.Remove vntIndexKey"
    txt = txt & vbCrLf & "End Sub"
    


    'NewEnum
    '
    'txt = txt & vbcrlf
    'txt = txt & vbCrLf & "Public Property Get NewEnum() As IUnknown"
    'txt = txt & vbCrLf & "Attribute Item.VB_UserMemId = -4" & vbCrLf & "Attribute Item.VB_MemberFlags = ""40"""
    'txt = txt & vbCrLf & "    Set NewEnum = mCol.[_NewEnum]"
    'txt = txt & vbCrLf & "End Property"
    '


    'Update
    
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("Public Function Update(byval vntIndexKey As Variant) as boolean", "Сохранить изменения в строке")
    txt = txt & vbCrLf & " if not Item(vntIndexKey) is nothing then "
    txt = txt & vbCrLf & "   Update = Item(vntIndexKey).Save "
    txt = txt & vbCrLf & " else"
    txt = txt & vbCrLf & "   Update = false"
    txt = txt & vbCrLf & " end if"
    txt = txt & vbCrLf & "End Function"
    

    'Delete
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("Public Function Delete(byval vntIndexKey As Variant) as boolean", "Удалить строку")
    txt = txt & vbCrLf & "on error goto bye"
    txt = txt & vbCrLf & "Dim o As " & MakeValidName(s.name)
    txt = txt & vbCrLf & "Set o = item(vntIndexKey)"
    txt = txt & vbCrLf & "If o Is Nothing Then Exit Function"
    txt = txt & vbCrLf & "If o.Delete Then"
    txt = txt & vbCrLf & "  Delete = True"
    txt = txt & vbCrLf & "  mcol.Remove vntIndexKey"
    txt = txt & vbCrLf & "End If"
    txt = txt & vbCrLf & "Exit Function"
    txt = txt & vbCrLf & "bye:"
    txt = txt & vbCrLf & "Err.Raise Err.Number, ""Delete"", Err.Description"
    txt = txt & vbCrLf & "End Function"

    

    'Refresh
    
    txt = txt & vbCrLf
    txt = txt & vbCrLf & CommentItem("Public Sub Refresh()", "Обновить")
    txt = txt & vbCrLf & "    On Error Resume Next"
    txt = txt & vbCrLf & "    Dim mcol2  As SortableCollection"
    txt = txt & vbCrLf & "    Set mcol2 = mcol"
    txt = txt & vbCrLf & "    Set mcol = Nothing"
    txt = txt & vbCrLf & "    Set mcol = New SortableCollection"
    txt = txt & vbCrLf & "    Dim rs As ADODB.recordset"
    txt = txt & vbCrLf & "    if application.WorkOffline then exit sub"
    txt = txt & vbCrLf & "    Dim o As " & MakeValidName(s.name)
    
    
    txt = txt & vbCrLf & "    dim tmpParent as object"
    txt = txt & vbCrLf & "    dim tID as string"
    txt = txt & vbCrLf & "    dim SSID as string"
    txt = txt & vbCrLf & "    dim rtime as date"
    
    txt = txt & vbCrLf & "    rtime =Now"
    txt = txt & vbCrLf & "    rtime =application.MTZSession.GetServertime()"
    'AutoLoadPart
     txt = txt & vbCrLf & "    if application.AutoLoadPart then"
        
    ' дерево
    If s.PartType = 2 Then
       txt = txt & vbCrLf & "    if typename(me.parent)=""" & MakeValidName(s.name) & """ then"
       txt = txt & vbCrLf & "      set tmpParent =me.parent"
       txt = txt & vbCrLf & "      while  typename(tmpparent.parent.parent)=""" & MakeValidName(s.name) & """"
       txt = txt & vbCrLf & "        set tmpparent = tmpparent.parent.parent"
       txt = txt & vbCrLf & "      wend"
       txt = txt & vbCrLf & "      set rs =application.MTZSession.GetRows( ChildPartName, tmpParent.parent.parent.id,Parent.ID,Filter)"
       txt = txt & vbCrLf & "    else"
       txt = txt & vbCrLf & "      set rs =application.MTZSession.GetRows( ChildPartName, Parent.id,""NULL"",Filter)"
       txt = txt & vbCrLf & "    end if"
    Else
      txt = txt & vbCrLf & "    set rs =application.MTZSession.GetRows( ChildPartName, Parent.id,,Filter)"
    End If
    
    'AutoLoadPart
    txt = txt & vbCrLf & "    else"
    
    ' дерево
    If s.PartType = 2 Then
       txt = txt & vbCrLf & "    if typename(me.parent)=""" & MakeValidName(s.name) & """ then"
       txt = txt & vbCrLf & "      set tmpParent =me.parent"
       txt = txt & vbCrLf & "      while  typename(tmpparent.parent.parent)=""" & MakeValidName(s.name) & """"
       txt = txt & vbCrLf & "        set tmpparent = tmpparent.parent.parent"
       txt = txt & vbCrLf & "      wend"
       txt = txt & vbCrLf & "      set rs =application.MTZSession.GetIDs( ChildPartName, tmpParent.parent.parent.id,Parent.ID,Filter)"
       txt = txt & vbCrLf & "    else"
       txt = txt & vbCrLf & "      set rs =application.MTZSession.GetIDs( ChildPartName, Parent.id,""NULL"",Filter)"
       txt = txt & vbCrLf & "    end if"
    Else
      txt = txt & vbCrLf & "    set rs =application.MTZSession.GetIDs( ChildPartName, Parent.id,,Filter)"
    End If
    
    'AutoLoadPart
    txt = txt & vbCrLf & "    end if"
    
    txt = txt & vbCrLf & "    If mcol2 Is Nothing Then Set mcol2 = New SortableCollection"
    txt = txt & vbCrLf & "    dim idx as long"
    txt = txt & vbCrLf & "    if not rs is nothing then ' wrong database structure"
    txt = txt & vbCrLf & "    while not rs.eof"

    'AutoLoadPart
    txt = txt & vbCrLf & "      if application.AutoLoadPart then"
    txt = txt & vbCrLf & "        tID = rs!" & MakeValidName(s.name) & "ID"
    txt = txt & vbCrLf & "      else"
    txt = txt & vbCrLf & "        tid=rs!id"
    
    
    txt = txt & vbCrLf & "      end if"
    txt = txt & vbCrLf & "      on error resume next"
    txt = txt & vbCrLf & "      SSid=rs!SecurityStyleID & """" "
    
    txt = txt & vbCrLf & "      If mcol2.Item(tID) Is Nothing Then"
    txt = txt & vbCrLf & "        Set o = Add(tID)"
    txt = txt & vbCrLf & "        if application.AutoLoadPart then"
    txt = txt & vbCrLf & "          o.unpack rs"
    txt = txt & vbCrLf & "          o.RowRetrived = True"
    txt = txt & vbCrLf & "          o.RetriveTime = rtime"
    txt = txt & vbCrLf & "        end if"
    txt = txt & vbCrLf & "      Else"
    txt = txt & vbCrLf & "        Set o = mcol2.Item(tID)"
    txt = txt & vbCrLf & "        If o.RowRetrived Then"
    txt = txt & vbCrLf & "          If o.RetriveTime < rs!ChangeStamp Then"
    
    txt = txt & vbCrLf & "             if application.AutoLoadPart then"
    txt = txt & vbCrLf & "               o.CleanFields"
    txt = txt & vbCrLf & "               o.unpack rs"
    txt = txt & vbCrLf & "               o.RetriveTime = rtime"
    txt = txt & vbCrLf & "             else"
    txt = txt & vbCrLf & "               o.RowRetrived = False"
    txt = txt & vbCrLf & "             end if"
    
    txt = txt & vbCrLf & "          End If"
    
    txt = txt & vbCrLf & "        else"
    
    txt = txt & vbCrLf & "          if application.AutoLoadPart then"
    txt = txt & vbCrLf & "            o.CleanFields"
    txt = txt & vbCrLf & "            o.unpack rs"
    txt = txt & vbCrLf & "            o.RetriveTime = rtime"
    txt = txt & vbCrLf & "          end if"
    txt = txt & vbCrLf & "        End If"
    txt = txt & vbCrLf & "        mcol.AddItem o, tID"
    txt = txt & vbCrLf & "        mcol2.Remove tID"
    txt = txt & vbCrLf & "      End If"
    txt = txt & vbCrLf & "      o.SecureStyleID = SSID"
    txt = txt & vbCrLf & "    rs.MoveNext"
    txt = txt & vbCrLf & "    wend"
    txt = txt & vbCrLf & "    end if ' rs is nothing"
    txt = txt & vbCrLf & "    For idx = 1 To mcol2.Count"
    txt = txt & vbCrLf & "       Set o = mcol2.Item(idx)"
    txt = txt & vbCrLf & "       o.CloseClass"
    txt = txt & vbCrLf & "    Next"
    txt = txt & vbCrLf & "    Set mcol2 = Nothing"
    txt = txt & vbCrLf & "End Sub"

    MakeXMLCollection s, decl, txt
    
    MakeLockable decl, txt, True, s

    txt = txt & vbCrLf & PartFillTreeLocal(s)
    txt = txt & vbCrLf & PrepareGrid(s)
    txt = txt & vbCrLf & MakeGridUnboundRead(s)
    
    
    MakeColBatchUpdate txt
    
    o.Module = MakeValidName(s.name & "_COL")
    o.Project.Modules.item(o.Module).Attributes.Add("Type").Value = "class"
    o.Project.Modules.item(o.Module).Attributes.Add("Instancing").Value = "publicnotcreatable"
    o.Block = "declaration"
    o.Project.Modules.item(o.Module).Blocks.item(o.Block).Attributes.Add("Type").Value = "description"
    o.OutNL decl
    
    o.Module = MakeValidName(s.name & "_COL")
    o.Block = "codebody"
    o.Project.Modules.item(o.Module).Blocks.item(o.Block).Attributes.Add("Type").Value = "code"
    o.OutNL txt
    
    Dim i As Long
    For i = 1 To s.PART.Count
      MakeCollection s.PART.item(i), typename
    Next
    
    On Error GoTo bye
    Exit Sub
bye:
  MsgBox Err.Description
  'Stop
  'Resume

End Sub








' when class work in offline mode - offline brief algoritm used
Private Function MakeOfflineBriefProc(os As PART) As String
Dim st As PART
Set st = os
Dim chos As PART, i As Long, j As Long, f As FIELD
Dim s As String

On Error GoTo bye

s = s & vbCrLf & "  m_BRIEF="""""
st.FIELD.Sort = "sequence"
For i = 1 To st.FIELD.Count
  If (st.FIELD.item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
    If st.FIELD.item(i).IsBrief Then
      Set f = st.FIELD.item(i)
      's = s & vbCrLf & "  m_BRIEF= m_BRIEF & """ & NoLF(f.Caption) & "="""
      
      'enum
      If st.FIELD.item(i).FIELDTYPE.TypeStyle = TypeStyle_Perecislenie Then
        s = s & vbCrLf & "select case " & st.FIELD.item(i).name
        For j = 1 To st.FIELD.item(i).FIELDTYPE.ENUMITEM.Count
          s = s & vbCrLf & "case " & MakeValidName(st.FIELD.item(i).FIELDTYPE.name) & "_" & MakeValidName(st.FIELD.item(i).FIELDTYPE.ENUMITEM.item(j).name)
          s = s & vbCrLf & "   m_BRIEF=m_BRIEF &  """ & st.FIELD.item(i).FIELDTYPE.ENUMITEM.item(j).name & "; """
        Next
        s = s & vbCrLf & "end select '" & st.FIELD.item(i).name
      ElseIf st.FIELD.item(i).FIELDTYPE.TypeStyle = TypeStyle_Ssilka Then
        If (st.FIELD.item(i).ReferenceType = ReferenceType_Na_istocnik_dannih) Then
          s = s & vbCrLf & "   if  " & st.FIELD.item(i).name & " <> """" then "
          s = s & vbCrLf & "     m_BRIEF=m_BRIEF & ""{"" & GetFromXML(m_" & st.FIELD.item(i).name & ", ""BRIEF"") & "" }; """
          s = s & vbCrLf & "   end if"
        Else
          s = s & vbCrLf & "   if  " & st.FIELD.item(i).name & " is nothing then "
          s = s & vbCrLf & "     m_BRIEF=m_BRIEF & ""{"" & m_" & st.FIELD.item(i).name & "_ID_BRIEF & ""}; """
          s = s & vbCrLf & "   else"
          s = s & vbCrLf & "     m_BRIEF=m_BRIEF & ""{"" & " & st.FIELD.item(i).name & ".Brief  & ""}; """
          s = s & vbCrLf & "   end if"
        End If
      Else
        s = s & vbCrLf & " m_BRIEF= m_BRIEF & " & st.FIELD.item(i).name & " & ""; """
        
      End If
    End If
  End If
Next
s = s & vbCrLf & " BRIEF= m_BRIEF"
MakeOfflineBriefProc = s

Exit Function
bye:
log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
'Resume

End Function


'Insert enum declarations to Application class
Private Function MakeEnums() As String
Dim i As Long, s As String, j As Long

For i = 1 To m.FIELDTYPE.Count
  With m.FIELDTYPE.item(i)
  If .TypeStyle = TypeStyle_Perecislenie Then
  
  s = s & vbCrLf & "enum enum" & MakeValidName(.name) & "'" & NoLF(.the_comment)
  For j = 1 To .ENUMITEM.Count
    s = s & vbCrLf & "  " & MakeValidName(.name) & "_" & MakeValidName(.ENUMITEM.item(j).name) & "=" & .ENUMITEM.item(j).NameValue & "'" & .ENUMITEM.item(j).name
  Next
  s = s & vbCrLf & "end enum "
  End If
  End With
Next

MakeEnums = s

End Function



' Lock / Unlock support for all classes
Private Sub MakeLockable(ByRef decl As String, ByRef body As String, ByVal Coll As Boolean, pt As PART)
  On Error GoTo bye
  

    ' declare variables
  decl = decl & vbCrLf & "private m_IsLocked as  LockStyle"
    
    
  'CanChange
  body = body & vbCrLf & CommentItem("public property Get CanChange() as boolean", "может ли быть изменено")
  body = body & vbCrLf & "   if application.workoffline then"
  body = body & vbCrLf & "     CanChange =  CanChangeoffLine "
  body = body & vbCrLf & "   else  "
  body = body & vbCrLf & "     CanChange =  canchangeonline"
  body = body & vbCrLf & "   end if"
  body = body & vbCrLf & "end property"
  
  
    
  ' CanChangeOffline
  body = body & vbCrLf & CommentItem("public property Get CanChangeOffline() as boolean", "может ли быть изменено в режиме Offline")
  body = body & vbCrLf & "  dim test as boolean"
  body = body & vbCrLf & "  if not parent is nothing then"
  body = body & vbCrLf & "   test = parent.CanChangeOffline"
  body = body & vbCrLf & "  end if"
  body = body & vbCrLf & "  if not test  then "
  body = body & vbCrLf & "   test = (IsLocked = LockPermanent)"
  body = body & vbCrLf & "  end if"
  body = body & vbCrLf & "   CanChangeOffline = test"
  body = body & vbCrLf & "end property"
  
  ' CanChangeONline
  body = body & vbCrLf & CommentItem("public property Get CanChangeONLine() as boolean", "может ли быть изменено в режиме ONline")
  body = body & vbCrLf & "  dim test as boolean"
  body = body & vbCrLf & "  if not parent is nothing then"
  body = body & vbCrLf & "   test = parent.CanChangeONLine"
  body = body & vbCrLf & "  end if"
  body = body & vbCrLf & "  if  not test then "
  body = body & vbCrLf & "   test = (IsLocked < ExternalLockSession)"
  body = body & vbCrLf & "  end if"
  body = body & vbCrLf & "   CanChangeOnline = test"
  body = body & vbCrLf & "end property"
  
 
  'IsLocked
  body = body & vbCrLf & CommentItem("friend property Let IsLocked(newIsLocked as LockStyle)", "Задать тип блокировки")
  body = body & vbCrLf & "  m_IsLocked = newIsLocked"
  body = body & vbCrLf & "end property"
  
  
  body = body & vbCrLf & CommentItem("public property Get IsLocked() as LockStyle", "Текущий тип блокировки")
  body = body & vbCrLf & "  if m_IsLocked <> LockSession and m_IsLocked <> LockPermanent then CheckLock"
  body = body & vbCrLf & "  IsLocked = m_IsLocked"
  body = body & vbCrLf & "end property"
  
  ' CheckLock
  body = body & vbCrLf & CommentItem("private sub CheckLock()", "Проверить блокировку")
  body = body & vbCrLf & "static LastCheckTime as date"
  body = body & vbCrLf & "if application.WorkOffline then exit sub"
  body = body & vbCrLf & "If Now - LastCheckTime < CDbl(CDate(""00:00:10"")) Then Exit Sub"
  body = body & vbCrLf & "On Error Resume Next"
  If pt Is Nothing Then
    body = body & vbCrLf & "m_IsLocked = Application.MTZSession.IsLocked(""INSTANCE"", ID)"
  Else
    If Not Coll Then
      body = body & vbCrLf & "m_IsLocked = Application.MTZSession.IsLocked(""" & pt.name & """, ID)"
    Else
      If typename(pt.Parent.Parent) = "OBJECTTYPE" Then
        body = body & vbCrLf & "m_IsLocked = Application.MTZSession.IsLocked(""INSTANCE"", parent.ID)"
      Else
        body = body & vbCrLf & "m_IsLocked = Application.MTZSession.IsLocked(""" & pt.Parent.Parent.name & """, parent.ID)"
      End If
    End If
  End If
  body = body & vbCrLf & "LastCheckTime = now"
  body = body & vbCrLf & "end sub"
  
  
  body = body & vbCrLf & CommentItem("public function LockResource(optional byval Permanent as boolean=false ) as boolean", "Заблокировать")
  body = body & vbCrLf & "if application.WorkOffline then exit function"
  body = body & vbCrLf & "  dim OK "
     
  If pt Is Nothing Then
    body = body & vbCrLf & " ok = Application.MTZSession.LockResource(""INSTANCE"", ID, Permanent)"
  Else
    If Not Coll Then
      body = body & vbCrLf & "ok = Application.MTZSession.LockResource(""" & pt.name & """, ID, Permanent)"
      
    Else
      If typename(pt.Parent.Parent) = "OBJECTTYPE" Then
        body = body & vbCrLf & "ok = Application.MTZSession.LockResource(""INSTANCE"", parent.id, Permanent)"
      Else
        body = body & vbCrLf & "ok = Application.MTZSession.LockResource(""" & pt.Parent.Parent.name & """, parent.id, Permanent)"
      End If
    End If
  End If
  
  body = body & vbCrLf & "  if OK then  "
  body = body & vbCrLf & "    if Permanent then m_IsLocked = LockPermanent else m_IsLocked = LockSession"
  body = body & vbCrLf & "  else"
  body = body & vbCrLf & "    m_IsLocked = NoLock"
  body = body & vbCrLf & "  end if"
  
  body = body & vbCrLf & "bye:"
  
  body = body & vbCrLf & "end function"
  
  body = body & vbCrLf & CommentItem("public function UnLockResource() as boolean", "Снять блокировку ресурса")
  body = body & vbCrLf & "if application.WorkOffline then exit function"
  
  body = body & vbCrLf & "On Error GoTo bye"
  If pt Is Nothing Then
    body = body & vbCrLf & "Application.MTZSession.UnlockResource ""INSTANCE"", ID"
  Else
    If Not Coll Then
      body = body & vbCrLf & "Application.MTZSession.UnlockResource """ & pt.name & """, ID"
    Else
      If typename(pt.Parent.Parent) = "OBJECTTYPE" Then
        body = body & vbCrLf & "Application.MTZSession.UnlockResource ""INSTANCE"", parent.id"
      Else
        body = body & vbCrLf & "Application.MTZSession.UnlockResource """ & pt.Parent.Parent.name & """, parent.id"
      End If
    End If
  End If
  
  body = body & vbCrLf & "m_IsLocked = NoLock"
  body = body & vbCrLf & "bye:"
  body = body & vbCrLf & "end function"
  
  
  body = body & vbCrLf & CommentItem("public function CanLock() as boolean", "Возможно блокирование")
  body = body & vbCrLf & "if application.WorkOffline then exit function"
  
  body = body & vbCrLf & "On Error Resume Next"
  
  If pt Is Nothing Then
    body = body & vbCrLf & "CanLock = Application.MTZSession.CanLock(""INSTANCE"", ID)"
  Else
    If Not Coll Then
      body = body & vbCrLf & "CanLock = Application.MTZSession.CanLock(""" & pt.name & """,ID)"
    Else
      If typename(pt.Parent.Parent) = "OBJECTTYPE" Then
        body = body & vbCrLf & "CanLock = Application.MTZSession.CanLock(""INSTANCE"", parent.ID)"
      Else
        body = body & vbCrLf & "CanLock = Application.MTZSession.CanLock(""" & pt.Parent.Parent.name & """,parent.ID)"
      End If
    End If
  End If
  body = body & vbCrLf & "end function"
bye:
End Sub




