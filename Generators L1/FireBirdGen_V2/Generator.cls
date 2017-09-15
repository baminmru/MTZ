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
Dim ftmap As Collection

Public map As Collection

Public Function MapObjectSQL() As String
  MapObjectSQL = MapObjectSQL_
End Function

Public Sub Setup()
  Dim f As frmOptions
  Set f = New frmOptions
  frmOptions.Show vbModal
End Sub

Private Sub Kernel()
  Dim cls As New GeneratorKernal
  Call cls.GenKernal(o, log)
  Set cls = Nothing
End Sub

Public Function Run(Model As Object, Output As Object, targetid As String, Optional ObjectTypeID As String = "") As String
  Dim s As Writer
  Set m = Model
  Set o = Output
  tid = targetid
  log = ""
  MapObjectSQL_ = ""
  DebugOutput "FBGEN.Run:start"
 
  Call LoadSetting

  o.Module = "--Kernel tables"
  o.Block = "--body"
  o.OutNL " "
  
  o.Module = "--Tables"
  o.Block = "--body"
  o.OutNL " "
  
  o.Module = "--Tables"
  o.Block = "--ForeignKey"
  o.OutNL " "
  
  o.Module = "--Tables"
  o.Block = "--Index"
  o.OutNL " "
  
  o.Module = "--FunctionsHeader"
  o.Block = "--TableProc"
  o.OutNL " "
  
  o.Module = "--Functions"
  o.Block = "--TableProc"
  o.OutNL " "
  
  o.Module = "--Kernel procs"
  o.Block = "--body"
  o.OutNL " "
  
  Set s = New Writer
  s.putBuf "EXECUTE PROCEDURE MTZ_UPDATE_CLEARTABLE_INFO;" & vbCrLf
  o.Module = "--Procedures"
  o.Block = "--TableProc"
  o.OutNL s.getBuf
  Set s = Nothing
  
  o.Module = "--FullText"
  o.Block = "--create"
  o.OutNL " "
  
  o.Module = "--Procedures"
  o.Block = "--Methods"
  o.OutNL " "
  
  o.Module = "--Views--"
  o.Block = "--Views--"
  o.OutNL " "
  
  o.Module = "--Procs"
  o.Block = "--body"
  o.OutNL " "
  
  
  o.Module = "--ManualCode"
  o.Block = "--body"
  o.OutNL " "
  
  o.Module = "--Maintains"
  o.Block = "--create"
  o.OutNL " "
  
  
  o.Module = "--Options"
  o.Block = "--Load"
  o.OutNL " "
  
'  If ObjectTypeID = "" Then
'    DebugOutput "FBGEN.Run:Kernel"
'    If OptKernel Then Kernel
'  End If
    
  Dim i As Long, j As Long, k As Long
  Dim os As PART
 
  On Error GoTo bye
  DebugOutput "FBGEN.Run:Types"
  For i = 1 To m.OBJECTTYPE.Count
    If m.OBJECTTYPE.Item(i).ID = ObjectTypeID Or ObjectTypeID = "" Then
      DebugOutput "FBGEN.Run:Type " & m.OBJECTTYPE.Item(i).the_comment
      log = log & vbCrLf & "Create code for type " & m.OBJECTTYPE.Item(i).Name
      o.Module = "--Tables"
      o.Block = "--body"
      
'      If m.OBJECTTYPE.Item(i).IsAddInstance = Boolean_Da Then
'        #If TRIAL = 1 Then
'          If Date < DateSerial(2008, 1, 1) Then
'            CreateProcObject m.OBJECTTYPE.Item(i)
'          End If
'        #Else
'          CreateProcObject m.OBJECTTYPE.Item(i)
'        #End If
'      End If
      
      m.OBJECTTYPE.Item(i).PART.Sort = "sequence"
      For j = 1 To m.OBJECTTYPE.Item(i).PART.Count
        Set os = m.OBJECTTYPE.Item(i).PART.Item(j)
        DebugOutput "FBGEN.Run:Type " & m.OBJECTTYPE.Item(i).the_comment & " Part:" & os.Caption
        If OptTables Then
          Call CreateStruct(os, IIf(j = 1 And m.OBJECTTYPE.Item(i).IsAddInstance = Boolean_Da And os.PartType = PartType_Stroka, True, False))
        End If
      
'        #If TRIAL = 1 Then
'          If Date < DateSerial(2008, 1, 1) Then
'            If OptProcs Then CreateProc os
'            If OptProcs Then CreateV2Proc os
'            If OptBRIEF Then CreateBriefProc os
'            If OptViews Then MakeAllViews os, IIf(j = 1 And m.OBJECTTYPE.Item(i).IsAddInstance = Boolean_Da And os.PartType = PartType_Stroka, True, False)
'          End If
'        #Else
'          If OptProcs Then CreateProc os
'          If OptProcs Then CreateV2Proc os
'          If OptBRIEF Then CreateBriefProc os
'          If OptViews Then MakeAllViews os, IIf(j = 1 And m.OBJECTTYPE.Item(i).IsAddInstance = Boolean_Da And os.PartType = PartType_Stroka, True, False)
'        #End If
      Next
      
'      #If TRIAL = 1 Then
'        If Date < DateSerial(2008, 1, 1) Then
'          If OptProcs Then CreateTypeProcs m.OBJECTTYPE.Item(i)
'        End If
'      #Else
'        If OptProcs Then CreateTypeProcs m.OBJECTTYPE.Item(i)
'      #End If
      
      o.Status m.OBJECTTYPE.Item(i).the_comment & " done", i
    End If
  Next
  
'  If ObjectTypeID = "" Then
'
'   If OptKernel Then
'     Call CreateProc_ControlInstanceBrief
'     Call CreateProc_ControlStructInstance
'     Call CreateProc_ReturnNamePartInstance
'   End If
'
'   DebugOutput "FBGEN.Run:Methods"
'   For i = 1 To m.SHAREDMETHOD.Count
'     If OptMethod Then CreateMethod m.SHAREDMETHOD.Item(i)
'   Next
'
'   If OptManual Then
'     DebugOutput "FBGEN.Run:ManualCode"
'
'     'ManualCode
'     o.Module = "--ManualCode"
'     o.Block = "--body"
'
'     Dim targ As MTZMetaModel.GENERATOR_TARGET
'     Dim mc As MTZMetaModel.GENMANUALCODE
'     Set targ = m.FindRowObject("GENERATOR_TARGET", tid)
'     For i = 1 To targ.GENMANUALCODE.Count
'       Set mc = targ.GENMANUALCODE.Item(i)
'       o.OutNL "/*" & mc.Name & " (" & mc.the_Alias & ")*/"
'       o.OutNL mc.Code
'       o.OutNL "GO"
'     Next
'   End If
'
'   DebugOutput "FBGEN.Run:LoadOptions"
'   If OptInit Then LoadOptions
'  End If
 
  Run = log
  DebugOutput "FBGEN.Run:done"
  Exit Function

bye:
  log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
  'MsgBox Err.Description
  'Resume
  DebugOutput "FBGEN.Run:" & Err.Description
  Run = log
End Function

Private Sub CreateProcObject(obj As OBJECTTYPE)
  obj.PART.Sort = "sequence"
  Call CreateProcObjectISLOCK(obj)
  Call CreateProcObjectSAVE(obj)
  Call CreateProcObjectDELETEOBJ(obj)
  Call CreateProcObjectSTATUS(obj)
End Sub
  
Private Sub CreateProcObjectSTATUS(obj As OBJECTTYPE)
  DebugOutput "FBGEN.CreateProcObjectSTATUS:start - " & obj.Name
  log = log & vbCrLf & "-->CreateProcObjectSTATUS - " & obj.Name
  
  Dim s As Writer
  Set s = New Writer
  
  s.putBuf procDropSQL(obj.Name & "_STATUS")
  s.putBuf "create proc " & obj.Name & "_STATUS ("
  s.putBuf "  @CURSESSION uniqueidentifier,"
  s.putBuf "  @InstanceID uniqueidentifier,"
  s.putBuf "  @statusid uniqueidentifier"
  s.putBuf ") as begin"
  s.putBuf ""
  If OptLOCK_S Then
    s.putBuf "  declare @access integer"
  End If
  s.putBuf "  declare @StatusName varchar(255)"
  s.putBuf ""
  s.putBuf "  if exists(select 1 from " & obj.PART.Item(1).Name & " with(nolock) where instanceid = @instanceid)"
  s.putBuf "    begin"
  If OptLOCK_S Then
    s.putBuf "      exec " & obj.Name & "_ISLOCKED @cursession=@cursession,@ROWID=@instanceid,@IsLocked=@access out"
    s.putBuf "      if @access > 2"
    s.putBuf "        begin"
    s.putBuf "          raiserror('Документ заблокирован другим пользователем.',16,1)"
    s.putBuf "          if @@trancount > 0 rollback tran"
    s.putBuf "          Return"
    s.putBuf "        End"
  End If
  s.putBuf "      set @StatusName = NULL"
  s.putBuf "      if exists("
  s.putBuf "        select 1"
  s.putBuf "          from objstatus with(nolock)"
  s.putBuf "          join objecttype with(nolock) on objstatus.parentstructrowid = objecttype.objecttypeid"
  s.putBuf "          where objecttype.name = '" & obj.Name & "' and objstatusid = @statusid"
  s.putBuf "      )"
  s.putBuf "      begin"
  s.putBuf "        select @StatusName = objstatus.name"
  s.putBuf "          from objstatus with(nolock)"
  s.putBuf "          where objstatusid = @statusid"
  s.putBuf "        begin tran"
  s.putBuf "          insert into SysLog (SysLogID, InstanceID, TheSession, the_Resource, LogStructID, VERB, LogInstanceID)"
  s.putBuf "            values (newid(), '{9A360531-D935-4676-952A-5BF35A5CFE80}', @cursession, @InstanceID, '" & obj.Name & "', 'STATUS', @InstanceID)"
  s.putBuf "          update " & obj.PART.Item(1).Name & " set ObjectStatus = @statusid, ObjectStatusName = @StatusName where instanceid = @instanceid"
  s.putBuf "        commit tran"
  s.putBuf "      End"
  s.putBuf "    End"
  s.putBuf "End"

  o.Module = "--Procedures"
  o.Block = "--TableProc"
  o.OutNL s.getBuf
  o.OutNL "GO"
  
  Set s = Nothing
  DebugOutput "FBGEN.CreateProcObjectSTATUS:done - " & obj.Name
End Sub

Private Sub CreateProcObjectSAVE(obj As OBJECTTYPE)
  DebugOutput "FBGEN.CreateProcObjectSAVE:start - " & obj.Name
  log = log & vbCrLf & "-->CreateProcObjectSAVE - " & obj.Name
  
  Dim s As Writer
  Set s = New Writer
  
  s.putBuf procDropSQL(obj.Name & "_SAVE")
  s.putBuf "create proc " & obj.Name & "_SAVE ("
  s.putBuf "  @CURSESSION uniqueidentifier,"
  s.putBuf "  @InstanceID uniqueidentifier,"
  s.putBuf "  @Name varchar(255)"
  s.putBuf ") as begin"
  s.putBuf ""
  If OptLOCK_S Then
    s.putBuf "  declare @access integer"
  End If
  s.putBuf "  declare @StatusID uniqueidentifier"
  s.putBuf ""
  s.putBuf "  if exists( select 1 from instance with(nolock) where instanceid = @instanceid )"
  s.putBuf "    begin --Update"
  If OptLOCK_S Then
    s.putBuf "      exec " & obj.Name & "_ISLOCKED @cursession=@cursession,@ROWID=@instanceid,@IsLocked=@access out"
    s.putBuf "      if @access > 2"
    s.putBuf "        begin"
    s.putBuf "          raiserror('Документ заблокирован другим пльзователем.',16,1)"
    s.putBuf "          Return"
    s.putBuf "        End"
  End If
  s.putBuf "      declare @res int"
  s.putBuf "      exec LTR_controlBriefDocument '" & obj.Name & "', @instanceid, @res output"
  s.putBuf ""
  s.putBuf "      begin tran"
  s.putBuf "        insert into SysLog (SysLogID, InstanceID, TheSession, the_Resource, LogStructID, VERB, LogInstanceID)"
  s.putBuf "          values (newid(), '{9A360531-D935-4676-952A-5BF35A5CFE80}', @cursession, @InstanceID, '" & obj.Name & "', 'EDIT', @InstanceID)"
  s.putBuf "        update " & obj.PART.Item(1).Name & " set ObjectName = @name where instanceid = @instanceid"
  s.putBuf "        if @res = 1"
  s.putBuf "          insert HistoryDenormal (RowID, NamePart, EVENT) values (@InstanceID, '" & obj.PART.Item(1).Name & "', 'EDIT_OBJ')"
  s.putBuf "      commit tran"
  s.putBuf "    End"
  s.putBuf "  Else"
  s.putBuf "    begin --Insert"
  s.putBuf "      set @statusid = null"
  s.putBuf "      select @statusid=objstatusid from objstatus with(nolock)"
  s.putBuf "        join objecttype with(nolock) on"
  s.putBuf "        objecttype.objecttypeid = objstatus.parentstructrowid and objecttype.name = '" & obj.Name & "' and isStartup <> 0"
  s.putBuf "      begin tran"
  s.putBuf "        insert into SysLog (SysLogID, InstanceID, TheSession, the_Resource, LogStructID, VERB, LogInstanceID)"
  s.putBuf "          values (newid(), '{9A360531-D935-4676-952A-5BF35A5CFE80}', @cursession, @InstanceID, '" & obj.Name & "', 'CREATE', @InstanceID)"
  s.putBuf "        insert into InstanceCOL (InstanceID,typeObject) values (@InstanceID,'" & obj.Name & "')"
  s.putBuf "        if not @statusid is null"
  s.putBuf "          insert into " & obj.PART.Item(1).Name & "(instanceid,ObjectName,ObjectSTATUS) values(@instanceid,@name,@STATUSID)"
  s.putBuf "        Else"
  s.putBuf "          insert into " & obj.PART.Item(1).Name & "(instanceid,ObjectName) values(@instanceid,@name)"
  s.putBuf "      commit tran"
  s.putBuf "    End"
  s.putBuf "End"

  o.Module = "--Procedures"
  o.Block = "--TableProc"
  o.OutNL s.getBuf
  o.OutNL "GO"
  
  Set s = Nothing
  DebugOutput "FBGEN.CreateProcObjectSAVE:done - " & obj.Name
End Sub

Private Sub CreateProcObjectDELETEOBJ(obj As OBJECTTYPE)
  DebugOutput "FBGEN.CreateProcObjectDELETEOBJ:start - " & obj.Name
  log = log & vbCrLf & "-->CreateProcObjectDELETEOBJ - " & obj.Name
  
  Dim s As Writer
  Set s = New Writer
  
  s.putBuf procDropSQL(obj.Name & "_DELETEOBJ")
  s.putBuf "create proc " & obj.Name & "_DELETEOBJ ("
  s.putBuf "  @CURSESSION uniqueidentifier,"
  s.putBuf "  @InstanceID uniqueidentifier"
  s.putBuf ") as begin"
  s.putBuf ""
  s.putBuf "  begin tran"
  s.putBuf "    exec " & obj.Name & "_DELETE @cursession = @cursession, @instanceid = @instanceid"
  s.putBuf "    if @@trancount = 0 return"
  s.putBuf "    insert into SysLog (SysLogID, InstanceID, TheSession, the_Resource, LogStructID, VERB, LogInstanceID)"
  s.putBuf "      values (newid(), '{9A360531-D935-4676-952A-5BF35A5CFE80}', @cursession, @InstanceID, '" & obj.Name & "', 'DELETE', @InstanceID)"
  If obj.IsDenormalOBJ = Boolean_Da Then
    s.putBuf "    insert HistoryDenormal (RowID, NamePart, EVENT) values (@InstanceID, '" & obj.Name & "', 'DELETE_OBJ')"
  End If
  s.putBuf "  commit tran"
  s.putBuf "End"

  o.Module = "--Procedures"
  o.Block = "--TableProc"
  o.OutNL s.getBuf
  o.OutNL "GO"
  
  Set s = Nothing
  DebugOutput "FBGEN.CreateProcObjectDELETEOBJ:done - " & obj.Name
End Sub

Private Sub CreateProcObjectISLOCK(obj As OBJECTTYPE)
  DebugOutput "FBGEN.CreateProcObjectISLOCK:start - " & obj.Name
  log = log & vbCrLf & "-->CreateProcObjectISLOCK - " & obj.Name
  
  Dim s As Writer
  Set s = New Writer
  
  s.putBuf procDropSQL(obj.Name & "_ISLOCKED")
  s.putBuf "create proc " & obj.Name & "_ISLOCKED ("
  s.putBuf "  @CURSESSION uniqueidentifier,"
  s.putBuf "  @RowID uniqueidentifier,"
  s.putBuf "  @IsLocked integer output"
  s.putBuf ") as begin"
  s.putBuf "  set nocount on"
  s.putBuf "  declare @UserID uniqueidentifier"
  s.putBuf "  declare @LockUserID uniqueidentifier"
  s.putBuf "  declare @LockSessionID uniqueidentifier"
  s.putBuf "  set @isLocked = 0"
  s.putBuf ""
'  s.putBuf "  if not exists( select 1 from the_session with(nolock) where the_sessionid=@cursession and closed=0)"
'  s.putBuf "    begin"
'  s.putBuf "      raiserror('Сессия уже завершена',16,1)"
'  s.putBuf "      Return"
'  s.putBuf "    End"
'  s.putBuf ""
  s.putBuf "  select @userID = usersid  from the_session with(nolock) where the_sessionid=@cursession"
  s.putBuf "  select @LockUserID = ObjectLockUserID, @LockSessionID = ObjectLockSessionID from " & obj.PART.Item(1).Name & " with(nolock) where INSTANCEid=@RowID"
  s.putBuf ""
  s.putBuf "  if not @LockUserID is null"
  s.putBuf "    begin"
  s.putBuf "      if  @LockUserID <> @userID"
  s.putBuf "        begin"
  s.putBuf "          set @isLocked = 4 /* CheckOut by another user */"
  s.putBuf "          Return"
  s.putBuf "        End"
  s.putBuf "      Else"
  s.putBuf "        begin"
  s.putBuf "          set @isLocked = 2 /* CheckOut by caller */"
  s.putBuf "          Return"
  s.putBuf "        End"
  s.putBuf "    End"
  s.putBuf ""
  s.putBuf "  if not @LockSessionID is null"
  s.putBuf "    begin"
  s.putBuf "      if  @LockSessionID <> @CURSESSION"
  s.putBuf "        begin"
  s.putBuf "          set @isLocked = 3 /* Lockes by another user */"
  s.putBuf "          Return"
  s.putBuf "        End"
  s.putBuf "      Else"
  s.putBuf "        begin"
  s.putBuf "          set @isLocked = 1 /* Locked by caller */"
  s.putBuf "          Return"
  s.putBuf "        End"
  s.putBuf "    End"
  s.putBuf ""
  s.putBuf "  set @isLocked = 0"
  s.putBuf "End"

  o.Module = "--Procedures"
  o.Block = "--TableProc"
  o.OutNL s.getBuf
  o.OutNL "GO"
  
  Set s = Nothing
  DebugOutput "FBGEN.CreateProcObjectISLOCK:done - " & obj.Name
End Sub

Private Sub CreateStruct(os As PART, Optional IsInstanceCol As Boolean = False)
  DebugOutput "FBGEN.CreateStruct:start " & os.Caption
  If os.PartType = PartType_Rassirenie Then
    DebugOutput "FBGEN.CreateStruct:skipped " & os.Caption
    Exit Sub
  End If
  
  Dim st As PART
  Set st = os
  DoEvents
  Dim chos As PART, i As Integer
  Dim s As Writer
  Set s = New Writer
  Dim collist As String

  log = log & vbCrLf & "-->CreateStruct " & os.Name

  On Error GoTo bye
  s.putBuf "/*   " & os.Caption & "   */"
  s.putBuf "EXECUTE PROCEDURE MTZ_UPDATE_CREATETABLE('" & UCase(os.Name) & "', '" & TypeName(os.Parent.Parent) & "', " & IIf(os.PartType = PartType_Derevo, "-1", "0") & ");"
  
  Dim scr As String
  
  st.FIELD.Sort = "sequence"
  For i = 1 To st.FIELD.Count
    If (st.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
      scr = "EXECUTE PROCEDURE MTZ_UPDATE_CREATEFIELD('" & UCase(st.Name) & "', '" & UCase(st.FIELD.Item(i).Name) & "', ':TYPEDATA');"
      scr = Replace(scr, ":TYPEDATA", FieldForCreate(st.FIELD.Item(i)))
      s.putBuf scr & " /* " & st.FIELD.Item(i).Caption & " */"
      
      'support extention field if file type used
'      If UCase(st.FIELD.Item(i).FIELDTYPE.Name) = "FILE" Then
'         s.putBuf "if  not exists(select * from syscolumns where name='" & st.FIELD.Item(i).Name & "_EXT' and id=object_id(N'" & st.Name & "'))"
'         s.putBuf "alter table " & st.Name & " add "
'         s.putBuf " " & st.FIELD.Item(i).Name & "_EXT nvarchar(4) null"
'         collist = collist & ",'" & st.FIELD.Item(i).Name & "_EXT'"
'      End If
      
      If st.FIELD.Item(i).ReferenceType = ReferenceType_Na_stroku_razdela Or _
        st.FIELD.Item(i).ReferenceType = ReferenceType_Na_ob_ekt_ Then
          scr = "EXECUTE PROCEDURE MTZ_UPDATE_CREATEFIELD('" & UCase(st.Name) & "', '" & UCase(st.FIELD.Item(i).Name) & "_BRIEF', 'VARCHAR(200)');"
          s.putBuf scr & " /* " & st.FIELD.Item(i).Caption & " [BRIEF-PART] */"
          scr = "EXECUTE PROCEDURE MTZ_UPDATE_CREATEINDEX('" & UCase(st.Name) & "', '" & UCase(st.FIELD.Item(i).Name) & "')"
          s.putBuf scr & " /* " & st.FIELD.Item(i).Caption & " [BRIEF-PART INDEX] */"
      End If
        
'      If st.FIELD.Item(i).ReferenceType = ReferenceType_Na_stroku_razdela Then
'        If Not st.FIELD.Item(i).RefToPart Is Nothing Then
'          Dim p_ As PART
'          Set p_ = st.FIELD.Item(i).RefToPart
'          If p_.IsDenormal = Boolean_Da Then
'            scr = "EXECUTE PROCEDURE MTZ_UPDATE_CREATEFIELD('" & UCase(st.Name) & "', '" & UCase(st.FIELD.Item(i).Name) & "_BRIEF', 'VARCHAR(200)');"
'            s.putBuf scr & " /* " & st.FIELD.Item(i).Caption & " [BRIEF-PART] */"
'          End If
'          Set p_ = Nothing
'        End If
'      End If
'      If st.FIELD.Item(i).ReferenceType = ReferenceType_Na_ob_ekt_ Then
'        If Not st.FIELD.Item(i).RefToType Is Nothing Then
'          Dim o_ As OBJECTTYPE
'          Set o_ = st.FIELD.Item(i).RefToType
'          If o_.IsDenormalOBJ = Boolean_Da Then
'            scr = "EXECUTE PROCEDURE MTZ_UPDATE_CREATEFIELD('" & UCase(st.Name) & "', '" & UCase(st.FIELD.Item(i).Name) & "_BRIEF', 'VARCHAR(200)');"
'            s.putBuf scr & " /* " & st.FIELD.Item(i).Caption & " [BRIEF-OBJECT] */"
'          End If
'          Set o_ = Nothing
'        End If
'      End If

    End If
  Next

  o.Module = "--Tables"
  o.Block = "--body"
  o.OutNL s.getBuf

'  If OptCheckFK Then
'    Set s = Nothing
'    Set s = New Writer
'    s.putBuf "alter table " & os.Name & " NOCHECK CONSTRAINT " & "fk_" & MakeName(os.ID) & vbCrLf & "GO"
'    o.Module = "--Tables"
'    o.Block = "--ForeignKey"
'    o.OutNL s.getBuf
'    o.OutNL "GO"
'  End If

  DebugOutput "FBGEN.CreateStruct:children " & os.Caption

  If os.IsJormalChange = Boolean_Da Then Call CreateStructLog(os)
  
  For i = 1 To os.PART.Count
    Set chos = os.PART.Item(i)
    CreateStruct chos
  Next

  DebugOutput "FBGEN.CreateStruct:done " & os.Caption
  Set s = Nothing

  Exit Sub
bye:
  
  log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
  DebugOutput "FBGEN.CreateStruct: " & os.Caption & " " & Err.Description
  'Resume
  Set s = Nothing
End Sub

Private Sub CreateStructLog(os As PART)
  Dim logName As String
  logName = os.Name & "_LOG"

  DebugOutput "FBGEN.CreateStruct:start " & os.Caption
  If os.PartType = PartType_Rassirenie Then
    DebugOutput "FBGEN.CreateStruct:skipped " & os.Caption
    Exit Sub
  End If
  
  Dim st As PART
  Set st = os
  DoEvents
  Dim chos As PART, i As Integer
  Dim s As Writer
  Set s = New Writer
  Dim collist As String
  
  Dim scr As String
  
  log = log & vbCrLf & "-->CreateStruct " & logName
  
  On Error GoTo bye
  s.putBuf "/* " & os.Caption & " [LOG] */"
  s.putBuf "EXECUTE PROCEDURE MTZ_UPDATE_CREATETABLE('" & UCase(logName) & "', '" & TypeName(os.Parent.Parent) & "', " & IIf(os.PartType = PartType_Derevo, "-1", "0") & ");"
  
  st.FIELD.Sort = "sequence"
  For i = 1 To st.FIELD.Count
    If (st.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
      scr = "EXECUTE PROCEDURE MTZ_UPDATE_CREATEFIELD('" & UCase(logName) & "', '" & UCase(st.FIELD.Item(i).Name) & "', ':TYPEDATA');"
      scr = Replace(scr, ":TYPEDATA", FieldForCreate(st.FIELD.Item(i)))
      s.putBuf scr & " /* " & st.FIELD.Item(i).Caption & " */"
      
      'support extention field if file type used
'      If UCase(st.FIELD.Item(i).FIELDTYPE.Name) = "FILE" Then
'         s.putBuf "if  not exists(select * from syscolumns where name='" & st.FIELD.Item(i).Name & "_EXT' and id=object_id(N'" & st.Name & "'))"
'         s.putBuf "alter table " & st.Name & " add "
'         s.putBuf " " & st.FIELD.Item(i).Name & "_EXT nvarchar(4) null"
'         collist = collist & ",'" & st.FIELD.Item(i).Name & "_EXT'"
'      End If
      
      If st.FIELD.Item(i).ReferenceType = ReferenceType_Na_stroku_razdela Then
        If Not st.FIELD.Item(i).RefToPart Is Nothing Then
          Dim p_ As PART
          Set p_ = st.FIELD.Item(i).RefToPart
          If p_.IsDenormal = Boolean_Da Then
            scr = "EXECUTE PROCEDURE MTZ_UPDATE_CREATEFIELD('" & UCase(logName) & "', '" & UCase(st.FIELD.Item(i).Name) & "_BRIEF', 'VARCHAR(200)');"
            s.putBuf scr & " /* " & st.FIELD.Item(i).Caption & " [BRIEF-PART] */"
          End If
          Set p_ = Nothing
        End If
      End If
      If st.FIELD.Item(i).ReferenceType = ReferenceType_Na_ob_ekt_ Then
        If Not st.FIELD.Item(i).RefToType Is Nothing Then
          Dim o_ As OBJECTTYPE
          Set o_ = st.FIELD.Item(i).RefToType
          If o_.IsDenormalOBJ = Boolean_Da Then
            scr = "EXECUTE PROCEDURE MTZ_UPDATE_CREATEFIELD('" & UCase(logName) & "', '" & UCase(st.FIELD.Item(i).Name) & "_BRIEF', 'VARCHAR(200)');"
            s.putBuf scr & " /* " & st.FIELD.Item(i).Caption & " [BRIEF-OBJECT] */"
          End If
          Set o_ = Nothing
        End If
      End If
    End If
  Next
  
  o.Module = "--Tables"
  o.Block = "--body"
  o.OutNL s.getBuf

  DebugOutput "FBGEN.CreateStruct:done " & os.Caption
  Set s = Nothing
  
  Exit Sub
bye:
  log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
  DebugOutput "FBGEN.CreateStruct: " & os.Caption & " " & Err.Description
  Set s = Nothing
End Sub

Private Sub CreateDelProc(os As PART)
  DebugOutput "FBGEN.CreateDelProc:start " & os.Caption
  If os.PartType = PartType_Rassirenie Then
    DebugOutput "FBGEN.CreateDelProc:skipped " & os.Caption
    Exit Sub
  End If

  Dim st As PART
  Set st = os
  Dim chos As PART, i As Integer
  Dim s As Writer
  Set s = New Writer

  log = log & vbCrLf & "-->CreateDelProc " & os.Name

  On Error GoTo bye

  s.putBuf procDropSQL(os.Name & "_DELETE")
  s.putBuf "create proc " & os.Name & "_DELETE /*" & os.the_comment & "*/ ("
  s.putBuf "  @CURSESSION uniqueidentifier,"
  s.putBuf "  @" & os.Name & "id uniqueidentifier,"
  s.putBuf "  @instanceid uniqueidentifier =null"
  s.putBuf ") as begin"
  s.putBuf "  set nocount on"
  
  s.putBuf "  declare @ERR int"
  s.putBuf "  declare @access int"
'  s.putBuf "  declare @tmpID uniqueidentifier"
'  s.putBuf "  declare @SysInstID uniqueidentifier"
'  s.putBuf "  select @SysInstID = Instanceid from instance with(nolock) where objtype='MTZSYSTEM'"
  
  If OptSESSION_D Then
    s.putBuf "  -- checking session --"
    s.putBuf "  if not exists( select 1 from the_session with(nolock) where the_sessionid = @cursession and closed=0 )"
    s.putBuf "    begin"
    s.putBuf "      raiserror('Сессия уже завершена.',16,1)"
    s.putBufTRAN "      if @@trancount > 0 rollback tran"
    s.putBuf "      return"
    s.putBuf "    end"
  End If
  
  s.putBuf "  -- Delete body --"
  s.putBuf "  if exists(select 1 from " & os.Name & " with(nolock) where " & os.Name & "ID = @" & os.Name & "ID)"
  s.putBuf "    begin"
  
'  s.putBuf "      -- verify access --"
'  s.putBuf "      select @tmpID = SecurityStyleID from " & os.Name & " with(nolock) where " & os.Name & "id=@" & os.Name & "ID"
'  s.putBuf "      exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='DELETEROW',@access=@access out "
'  s.putBuf "      if @access = 0"
'  s.putBuf "        begin"
'  s.putBuf "          exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='DELETEROW:" & os.Name & "',@access=@access out "
'  s.putBuf "          if @access = 0"
'  s.putBuf "            begin"
'  s.putBuf "              raiserror('Нет прав на удаление. Раздел=" & os.Name & "',16,1)"
'  s.putBufTRAN "              if @@trancount > 0 rollback tran"
'  s.putBuf "              return"
'  s.putBuf "            end"
'  s.putBuf "        end"
  
  If OptLOCK_D Then
    s.putBuf "      -- verify lock --"
    s.putBuf "      exec " & os.Name & "_ISLOCKED @cursession=@cursession,@ROWID=@" & os.Name & "id,@IsLocked=@access out "
    Call CreateHandleError("      ", s)
    s.putBuf "      if @access > 2"
    s.putBuf "        begin"
    s.putBuf "          raiserror('Строка заблокирована другим пользователем. Раздел=" & os.Name & "',16,1)"
    s.putBufTRAN "          if @@trancount > 0 rollback tran"
    s.putBuf "          return"
    s.putBuf "        end"
  End If
  
  s.putBufTRAN "      begin tran"
  
  s.putBuf "        -- erase child items --"
  s.putBuf "        declare @childlistid uniqueidentifier"

  If os.PART.Count > 0 Then
    s.putBuf "        -- delete in-struct child"
  End If

  For i = 1 To os.PART.Count
    Set chos = os.PART.Item(i)
    If Not chos.PartType = PartType_Rassirenie Then
      s.putBuf "  declare childlist_" & chos.Name & " cursor local for select " & chos.Name & "." & chos.Name & "id from " & chos.Name & " with(nolock) where  " & chos.Name & ".ParentStructRowID = @" & os.Name & "id"
      s.putBuf "  open childlist_" & chos.Name & ""
      s.putBuf "  fetch next from childlist_" & chos.Name & " into @childlistid"
      s.putBuf "  while @@fetch_status >=0 "
      s.putBuf "    begin"
      s.putBuf "      exec " & chos.Name & "_DELETE @cursession,@childlistid,@instanceid"
      s.putBuf "      if @@error > 0"
      s.putBuf "        begin"
      s.putBuf "          close childlist_" & chos.Name & ""
      s.putBuf "          deallocate childlist_" & chos.Name & " "
      s.putBuf "          goto del_error"
      s.putBuf "        end"
      s.putBuf "      fetch next from childlist_" & chos.Name & " into @childlistid"
      s.putBuf "    end"
      s.putBuf "  close childlist_" & chos.Name & ""
      s.putBuf "  deallocate childlist_" & chos.Name & " "
    End If
  Next
  
  s.putBuf ""
  
  If Not os.NoLog Then
    s.putBuf "        insert into SysLog (SysLogID, InstanceID, TheSession, the_Resource, LogStructID, VERB, LogInstanceID)"
    s.putBuf "          values (newid(), '{9A360531-D935-4676-952A-5BF35A5CFE80}', @cursession, @" & os.Name & "id, '" & os.Name & "', 'DELETEROW', @instanceID)"
    Call CreateHandleError("        ", s)
  End If
  
  ' Удаляем зависимые документы!!!
  If OptCHILDDELETE Then
    s.putBuf "  declare child_inst_" & os.Name & " cursor local for select instanceid from instance with(nolock) where OwnerPartName ='" & os.Name & "' and OwnerRowID=@" & os.Name & "id"
    s.putBuf "  open child_inst_" & os.Name & ""
    s.putBuf "  fetch next from child_inst_" & os.Name & " into @childlistid"
    s.putBuf "  while @@fetch_status >=0 "
    s.putBuf "    begin"
    s.putBuf "      exec INSTANCE_OWNER @cursession,@childlistid,null,null"
    s.putBuf "      exec INSTANCE_DELETE @cursession,@childlistid"
    s.putBuf "      if @@error > 0 begin"
    s.putBuf "        begin"
    s.putBuf "          close child_inst_" & os.Name & ""
    s.putBuf "          deallocate child_inst_" & os.Name & " "
    s.putBuf "          goto del_error"
    s.putBuf "        end"
    s.putBuf "      fetch next from child_inst_" & os.Name & " into @childlistid"
    s.putBuf "    end"
    s.putBuf "  close child_inst_" & os.Name & ""
    s.putBuf "  deallocate child_inst_" & os.Name & " "
  End If
  
  s.putBuf "        -- delete row --"
  s.putBuf "        delete from " & os.Name & " where " & os.Name & "ID = @" & os.Name & "ID"
  Call CreateHandleError("        ", s)
  
  If os.IsDenormal = Boolean_Da Then
    s.putBuf "        -- add info in table HistoryDenormal --"
    s.putBuf "        insert HistoryDenormal (RowID, NamePart, EVENT) values (@" & os.Name & "id, '" & os.Name & "', 'DELETE')" & vbCrLf
    Call CreateHandleError("        ", s)
  End If
  
  s.putBuf "        -- удаляем номера из нумератора"
  s.putBuf "        delete from num_values where OwnerPartName = '" & os.Name & "' and OwnerRowID = @" & os.Name & "ID"
  Call CreateHandleError("        ", s)
    
  s.putBuf "      end"
  s.putBuf ""
  s.putBufTRAN "    -- close transaction --"
  s.putBuf "del_error:"
  s.putBufTRAN "    if @@error <> 0 if @@trancount > 0 rollback tran"
  s.putBufTRAN "    if @@trancount > 0 commit tran"
  s.putBuf "  end"
  
  s.putBuf "go"
  If OptRights Then
    s.putBuf "revoke all on [dbo].[" & os.Name & "_DELETE]  to [public]"
    s.putBuf "go"
    s.putBuf "grant execute on [dbo].[" & os.Name & "_DELETE]  to [public]"
    s.putBuf "go"
  End If

  o.Module = "--Procedures"
  o.Block = "--TableProc"
  o.OutNL s.getBuf
  o.OutNL "GO"
  
'  ' граф - еще одна процедура для удаления одного ребра
'  If os.PartType = 3 Then
'
'
'
'    s = vbCrLf
'    s.putbuf "create proc " & os.Name & "_EDGE_DELETE /*" & os.the_comment & "*/ ("
'    s.putbuf " @CURSESSION uniqueidentifier,"
'    s.putbuf " @" & os.Name & "_EDGE_id uniqueidentifier  "
'    s.putbuf ") as " & " begin  "
'    s.putbuf "set nocount on"
'
'    If Not os.NoLog Then s.putbuf " declare @SysLogID uniqueidentifier"
'
'    s.putbuf " declare @access int"
'
'    s.putbuf " declare @SysInstID uniqueidentifier"
'    s.putbuf " select @SysInstID =Instanceid from instance where objtype='MTZSYSTEM'"
'
'
'    s.putbuf " -- checking session  --"
'    s.putbuf "if not exists( select 1 from the_session where the_sessionid=@cursession and closed=0)"
'    s.putbuf "  begin"
'    s.putbuf "    raiserror('Сессия уже завершена.',16,1)"
'    s.putbuf "    if @@trancount>0 rollback tran"
'    s.putbuf "    return"
'    s.putbuf "  end"
'
'    s.putbuf " if exists(select 1 from " & os.Name & "_EDGE where " & os.Name & "_EDGE_ID=@" & os.Name & "_EDGE_ID)"
'    s.putbuf " begin"
'    s.putbuf " -- Delete body -- "
'
'    s.putbuf " --  verify access  --"
'    s.putbuf " select  @tmpID =SecurityStyleID from " & os.Name & " where " & os.Name & "id=@" & os.Name & "ID"
'    s.putbuf " exec CheckVerbRight @cursession=@cursession,@Resource=@" & os.Name & "_edge_id,@verb='DELETE',@access=@access out "
'    s.putbuf " if @access=0 "
'    s.putbuf "  begin"
'    s.putbuf "    raiserror('Нет прав на удаление. Раздел=" & os.Name & "_EDGE',16,1)"
'    s.putbuf "    if @@trancount>0 rollback tran"
'    s.putbuf "    return"
'    s.putbuf "  end"
'
'
'    s.putbuf " --  verify lock  --"
'    s.putbuf " exec " & os.Name & "_ISLOCKED @cursession=@cursession,@ROWID=@" & os.Name & "id,@IsLocked=@access out "
'    s.putbuf " if @access>2 "
'    s.putbuf "  begin"
'    s.putbuf "    raiserror('Строка заблокирована другим пользователем. Раздел=" & os.Name & "',16,1)"
'    s.putbuf "    if @@trancount>0 rollback tran"
'    s.putbuf "    return"
'    s.putbuf "  end"
'
'
'    s.putbuf "  begin tran"
'
'    If Not os.NoLog Then
'      s.putbuf "set @SysLogid=newid()"
'      s.putbuf "EXEC SysLog_SAVE @TheSession=@cursession,@CURSESSION=@cursession, @InstanceID=@sysinstid, @SysLogid=@SysLogid, @LogStructID = '" & os.Name & "_EDGE',"
'      s.putbuf " @VERB='DELETE',  @the_Resource=@" & os.Name & "_EDGE_id,@LogInstanceID=@instanceID"
'    End If
'
'
'
'    s.putbuf "  delete from " & os.Name & "_edge WHERE " & os.Name & "_edge_id = @" & os.Name & "_EDGE_ID"
'
'    s.putbuf "  if @@error >0"
'    s.putbuf "  begin"
'    s.putbuf "   if @@trancount>0"
'    s.putbuf "    rollback tran"
'    s.putbuf "  end"
'    s.putbuf "  else"
'    s.putbuf "   commit tran"
'
'    s.putbuf " end"
'
'
'    s.putbuf "end"
'
'    o.Module = "--Procedures"
'    o.Block = "--TableProc"
'    o.OutNL s
'    o.OutNL "GO"
'  End If
'
  Set s = Nothing
  DebugOutput "FBGEN.CreateDelProc:done " & os.Caption
  Exit Sub
bye:
  log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR (KEY:mnbsadgfty)"
'Resume
  Set s = Nothing
End Sub


Private Sub CreateProc_ControlInstanceBrief()
  DebugOutput "FBGEN.LTR_CreateProcControlInstanceBrief:start "

  log = log & vbCrLf & "-->LTR_CreateProcControlInstanceBrief "
  
  Dim s As Writer
  Set s = New Writer
  
  Dim q As String, rs As ADODB.Recordset
  q = ""
  q = q & vbCrLf & "select objecttype.name from objecttype "
  q = q & vbCrLf & "where IsDenormalOBJ = -1"
  
  Set rs = m.MTZSession.GetData(q)
  
  If rs Is Nothing Then Exit Sub
  s.putBuf procDropSQL("LTR_controlBriefDocument")
  s.putBuf "create proc LTR_controlBriefDocument ("
  s.putBuf "  @ObjType varchar(255),"
  s.putBuf "  @ID uniqueidentifier,"
  s.putBuf "  @res int output"
  s.putBuf ") as begin"
  s.putBuf "  set @res = 0"
  s.putBuf ""
  
  While Not rs.EOF
    s.putBuf "  if @objtype = '" & rs!Name & "'"
    s.putBuf "    set @res = 1"
    rs.MoveNext
  Wend
  
  s.putBuf ""
  s.putBuf "end"

  o.Module = "--Procedures"
  o.Block = "--TableProc"
  o.OutNL s.getBuf
  o.OutNL "GO"
  
  Set s = Nothing
  DebugOutput "FBGEN.LTR_CreateProcControlInstanceBrief:done "
End Sub

Private Sub CreateProc_ControlStructInstance()
  DebugOutput "FBGEN.LTR_CreateControlStructInstance:start "

  log = log & vbCrLf & "-->LTR_CreateControlStructInstance"
  
  Dim s As Writer
  Set s = New Writer
  
  Dim q As String, rs As ADODB.Recordset
  q = ""
  q = q & vbCrLf & "select objecttype.name from objecttype "
  q = q & vbCrLf & "where IsAddInstance = -1"
  
  Set rs = m.MTZSession.GetData(q)
  
  If rs Is Nothing Then Exit Sub
  s.putBuf procDropSQL("LTR_controlStructInstance")
  s.putBuf "create proc LTR_controlStructInstance ("
  s.putBuf "  @ObjType varchar(255),"
  s.putBuf "  @ID uniqueidentifier,"
  s.putBuf "  @res int output"
  s.putBuf ") as begin"
  s.putBuf "  set @res = 0"
  s.putBuf ""
  
  While Not rs.EOF
    s.putBuf "  if @objtype = '" & rs!Name & "'"
    s.putBuf "    set @res = 1"
    rs.MoveNext
  Wend
  
  s.putBuf ""
  s.putBuf "end"

  o.Module = "--Procedures"
  o.Block = "--TableProc"
  o.OutNL s.getBuf
  o.OutNL "GO"
  
  Set s = Nothing
  DebugOutput "FBGEN.LTR_CreateProcControlInstanceBrief:done "
End Sub

Private Sub CreateProc_ReturnNamePartInstance()
  DebugOutput "FBGEN.CreateProc_LTR_ReturnNamePartInstance:start "

  log = log & vbCrLf & "-->CreateProc_LTR_ReturnNamePartInstance"
  
  Dim s As Writer
  Set s = New Writer
  
  Dim q As String, rs As ADODB.Recordset
  q = ""
  q = q & vbCrLf & "select"
  q = q & vbCrLf & "  objecttype.name NameTypeObject, "
  q = q & vbCrLf & "  (select top 1 name from part where part.parentstructrowid = objecttypeid and parttype = 0 order by sequence) NamePart"
  q = q & vbCrLf & "from objecttype "
  q = q & vbCrLf & "where IsAddInstance = -1"
  
  Set rs = m.MTZSession.GetData(q)
  
  If rs Is Nothing Then Exit Sub
  s.putBuf procDropSQL("LTR_returnNamePartInstance")
  s.putBuf "create proc LTR_returnNamePartInstance ("
  s.putBuf "  @ObjType varchar(255),"
  s.putBuf "  @NamePart varchar(255) output"
  s.putBuf ") as begin"
  s.putBuf "  set @NamePart = ''"
  s.putBuf ""
  
  While Not rs.EOF
    s.putBuf "  if @ObjType = '" & rs!NameTypeObject & "'"
    s.putBuf "    set @NamePart = '" & rs!NamePart & "'"
    rs.MoveNext
  Wend
  
  s.putBuf ""
  s.putBuf "end"

  o.Module = "--Procedures"
  o.Block = "--TableProc"
  o.OutNL s.getBuf
  o.OutNL "GO"
  
  Set s = Nothing
  DebugOutput "FBGEN.LTR_CreateProcControlInstanceBrief:done "
End Sub


Private Sub CreateHandleError(t As String, ByRef s As Writer)
  s.putBuf t & "set @ERR = @@error"
  s.putBuf t & "if @ERR <> 0"
  s.putBuf t & "  begin"
  s.putBuf t & "    raiserror('Системная ошибка',16,1)"
  s.putBufTRAN t & "    if @@trancount > 0 rollback tran"
  s.putBuf t & "    return"
  s.putBuf t & "  end"
End Sub

Private Sub CreateProc(os As PART)
  DebugOutput "FBGEN.CreateProc:start " & os.Caption
  If os.PartType = PartType_Rassirenie Then
    DebugOutput "FBGEN.CreateProc:skipped " & os.Caption
    Exit Sub
  End If

  Dim reft_ As OBJECTTYPE
  Dim refp_ As PART
  
  Dim f As String, v As String
  
  Dim st As PART
  Set st = os
  Dim chos As PART, i As Integer
  Dim s As Writer
  Set s = New Writer

  log = log & vbCrLf & "-->CreateProc " & os.Name

  On Error GoTo bye

  s.putBuf "/*" & os.Caption & "*/"
  s.putBuf procDropSQL(os.Name & "_SAVE")
  s.putBuf "create proc " & os.Name & "_SAVE /*" & os.the_comment & "*/ ("
  s.putBuf "  @CURSESSION uniqueidentifier"
  s.putBuf "  , @InstanceID uniqueidentifier = null"
  If TypeName(os.Parent.Parent) <> "OBJECTTYPE" Then
    s.putBuf "  , @ParentStructRowID uniqueidentifier =null"
  End If

  s.putBuf "  , @" & os.Name & "id uniqueidentifier"
  
  If os.PartType = PartType_Derevo Then
    s.putBuf "  , @ParentRowid uniqueidentifier = null"
  End If

  st.FIELD.Sort = "sequence"
  For i = 1 To st.FIELD.Count
    If (st.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
      s.putBuf "  , " & FieldForParam(st.FIELD.Item(i))
    End If
  Next

  s.putBuf ") as " & " begin  "
  s.putBuf "  set nocount on"

  s.putBuf "  declare @ERR int"
  s.putBuf "  declare @UniqueRowCount integer"
  s.putBuf "  declare @access int"

'  s.putBuf "  declare @tmpStr varchar(255)"
'  s.putBuf "  declare @tmpID uniqueidentifier"
'  s.putBuf "  declare @SysInstID uniqueidentifier"

  If OptUNIQUE Then
    s.putBuf "  declare @SessUserID uniqueidentifier"
    s.putBuf "  select @SessUserID = UsersID from the_session $PROC$ where the_sessionid = @cursession"
    s.putBuf "  declare @SessUserLogin varchar(40)"
    s.putBuf "  select @SessUserLogin =login from users $PROC$ where usersid=@SessUserID"
  End If

'  s.putBuf "  select @SysInstID = Instanceid from instance with(nolock) where objtype = 'MTZSYSTEM'"
  
  If OptSESSION_S Then
    s.putBuf "  -- checking session  --"
    s.putBuf "  if not exists( select 1 from the_session $PROC$ where the_sessionid=@cursession and closed=0 )"
    s.putBuf "    begin"
    s.putBuf "      raiserror('Сессия уже завершена.',16,1)"
    s.putBufTRAN "      if @@trancount>0 rollback tran"
    s.putBuf "      return"
    s.putBuf "    end"
  End If

  's.putbuf " -- checking references  --" & vbCrLf
  'For i = 1 To st.FIELD.Count
  '  s = s & ReferenceCheck(os, st.FIELD.Item(i)) & vbCrLf
  'Next

  s.putBuf "  -- Insert / Update body -- "
  
  s.putBuf "  if exists(select 1 from " & os.Name & " $PROC$ where " & os.Name & "ID=@" & os.Name & "ID)"
  s.putBuf "    begin"
  s.putBuf "      --  UPDATE  --"

  's.putBuf " --  verify access  --"
  '
  's.putBuf " select  @tmpID =SecurityStyleID from " & os.Name & " with(nolock) where " & os.Name & "id=@" & os.Name & "ID"
  's.putBuf " exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='EDITROW',@access=@access out "
  's.putBuf " if @access=0 "
  's.putBuf "  begin"
  's.putBuf "    exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='EDITROW:" & os.Name & "',@access=@access out "
  's.putBuf "    if @access=0 "
  's.putBuf "    begin"
  's.putBuf "      raiserror('Нет прав на модификацию. Раздел=" & os.Name & "',16,1)"
  's.putBuf "      if @@trancount>0 rollback tran"
  's.putBuf "      return"
  's.putBuf "    end"
  's.putBuf "  end"

  If OptLOCK_S Then
    s.putBuf "      exec " & os.Name & "_ISLOCKED @cursession=@cursession,@ROWID=@" & os.Name & "id,@IsLocked=@access out "
    Call CreateHandleError("      ", s)
    s.putBuf "      if @access > 2 "
    s.putBuf "        begin"
    s.putBuf "          raiserror('Строка заблокирована другим пользователем. Раздел=" & os.Name & "',16,1)"
    s.putBufTRAN "          if @@trancount > 0 rollback tran"
    s.putBuf "          return"
    s.putBuf "        end"
  End If
  
  s.putBuf "      -- update row --"
  s.putBufTRAN "      begin tran"
  
  If Not os.NoLog Then
    s.putBuf "      insert into SysLog (SysLogID, InstanceID, TheSession, the_Resource, LogStructID, VERB, LogInstanceID)"
    s.putBuf "        values (newid(), '{9A360531-D935-4676-952A-5BF35A5CFE80}', @cursession, @" & os.Name & "id, '" & os.Name & "', 'EDITROW', @instanceID)"
    Call CreateHandleError("      ", s)
  End If

  If os.IsJormalChange = Boolean_Da Then
    s.putBuf " -- START LOG --"
    s.putBuf " insert into " & os.Name & "_LOG "
    
    s.putBuf " ( " & os.Name & "_logID "
    
    If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
      s.putBuf ",InstanceID"
    Else
      s.putBuf ",ParentStructRowID"
    End If
    
    If os.PartType = 2 Then
      s.putBuf ", ParentRowid"
    End If
    
    s.putBuf ", UserLog"

    st.FIELD.Sort = "sequence"
    For i = 1 To st.FIELD.Count
      If (st.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
        s.putBuf "," & st.FIELD.Item(i).Name
        
        If UCase(st.FIELD.Item(i).FIELDTYPE.Name) = "FILE" Then
          s.putBuf "," & st.FIELD.Item(i).Name & "_EXT"
        End If
        
        If st.FIELD.Item(i).ReferenceType = ReferenceType_Na_ob_ekt_ Then
          If Not st.FIELD.Item(i).RefToType Is Nothing Then
            Set reft_ = st.FIELD.Item(i).RefToType
            If reft_.IsDenormalOBJ = Boolean_Da Then
              s.putBuf "," & st.FIELD.Item(i).Name & "_BRIEF"
            End If
            Set reft_ = Nothing
          End If
        End If
      
        If st.FIELD.Item(i).ReferenceType = ReferenceType_Na_stroku_razdela Then
          If Not st.FIELD.Item(i).RefToPart Is Nothing Then
            Set refp_ = st.FIELD.Item(i).RefToPart
            If refp_.IsDenormal = Boolean_Da Then
              s.putBuf "," & st.FIELD.Item(i).Name & "_BRIEF"
            End If
            Set refp_ = Nothing
          End If
        End If
      
      End If
    Next

    s.putBuf " ) select "
    
    s.putBuf os.Name & "ID "
    
    If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
      s.putBuf ", InstanceID"
    Else
      s.putBuf ", ParentStructRowID"
    End If
    
    s.putBuf ", @cursession"
    
    If os.PartType = 2 Then
      s.putBuf ", ParentRowid"
    End If

    st.FIELD.Sort = "sequence"
    For i = 1 To st.FIELD.Count
      If (st.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
        s.putBuf "," & st.FIELD.Item(i).Name
      
        If UCase(st.FIELD.Item(i).FIELDTYPE.Name) = "FILE" Then
          s.putBuf "," & st.FIELD.Item(i).Name & "_EXT"
        End If
       
        If st.FIELD.Item(i).ReferenceType = ReferenceType_Na_ob_ekt_ Then
          If Not st.FIELD.Item(i).RefToType Is Nothing Then
            Set reft_ = st.FIELD.Item(i).RefToType
            If reft_.IsDenormalOBJ = Boolean_Da Then
              s.putBuf "," & st.FIELD.Item(i).Name & "_BRIEF"
            End If
            Set reft_ = Nothing
          End If
        End If
      
        If st.FIELD.Item(i).ReferenceType = ReferenceType_Na_stroku_razdela Then
          If Not st.FIELD.Item(i).RefToPart Is Nothing Then
            Set refp_ = st.FIELD.Item(i).RefToPart
            If refp_.IsDenormal = Boolean_Da Then
              s.putBuf "," & st.FIELD.Item(i).Name & "_BRIEF"
            End If
            Set refp_ = Nothing
          End If
        End If
    
      End If
    Next

    s.putBuf " from " & os.Name
    s.putBuf " with(nolock) where " & os.Name & "id = @" & os.Name & "ID "
    
    s.putBuf "-- end LOG --"
  End If

  s.putBuf "      update " & os.Name & " set ChangeStamp = GetDate()"
  
  If os.PartType = PartType_Derevo Then
    s.putBuf "        , ParentRowid = @ParentRowid"
  End If

  st.FIELD.Sort = "sequence"
  For i = 1 To st.FIELD.Count
    If (st.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
      s.putBuf "        , " & st.FIELD.Item(i).Name & " = @" & st.FIELD.Item(i).Name
      
      'support extention field if file type used
      If UCase(st.FIELD.Item(i).FIELDTYPE.Name) = "FILE" Then
        s.putBuf "         , " & st.FIELD.Item(i).Name & "_EXT = @" & st.FIELD.Item(i).Name & "_EXT"
      End If
    
      If st.FIELD.Item(i).ReferenceType = ReferenceType_Na_ob_ekt_ Then
        If Not st.FIELD.Item(i).RefToType Is Nothing Then
          Set reft_ = st.FIELD.Item(i).RefToType
          If reft_.IsDenormalOBJ = Boolean_Da Then
            s.putBuf "        , " & st.FIELD.Item(i).Name & "_BRIEF = dbo.Instance_BRIEF_F(@" & st.FIELD.Item(i).Name & ")"
          End If
          Set reft_ = Nothing
        End If
      End If
        
      If st.FIELD.Item(i).ReferenceType = ReferenceType_Na_stroku_razdela Then
        If Not st.FIELD.Item(i).RefToPart Is Nothing Then
          Set refp_ = st.FIELD.Item(i).RefToPart
          If refp_.IsDenormal = Boolean_Da Then
            s.putBuf "        , " & st.FIELD.Item(i).Name & "_BRIEF = dbo." & refp_.Name & "_BRIEF_F(@" & st.FIELD.Item(i).Name & ")"
          End If
          Set refp_ = Nothing
        End If
      End If
    End If
  Next

  s.putBuf "        where " & os.Name & "ID = @" & os.Name & "ID "
  Call CreateHandleError("      ", s)

  If os.IsDenormal = Boolean_Da Then
    s.putBuf "        -- add info in table HistoryDenormal --"
    s.putBuf "        insert HistoryDenormal (RowID, NamePart, EVENT) values (@" & os.Name & "id, '" & os.Name & "', 'UPDATE')"
    Call CreateHandleError("      ", s)
  End If

  If OptUNIQUE Then
    s.putBuf "          -- checking unique constraints  --"
    s.putBuf UniqueCheck(os) & vbCrLf
  End If

  s.putBuf "    end"
  s.putBuf "  else"
  s.putBuf "    begin"
  s.putBuf "      -- INSERT --"

's.putBuf " --  verify access  --"
'
'If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
'    s.putBuf " select @tmpid = SecurityStyleID from instance with(nolock) where instanceid=@instanceid"
'Else
'    s.putBuf " select  @tmpID =SecurityStyleID from " & os.Parent.Parent.Name & " with(nolock) where " & os.Parent.Parent.Name & "id=@ParentStructRowID"
'End If
'
's.putBuf " exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='CREATEROW',@access=@access out"
's.putBuf " if @access=0 "
's.putBuf "  begin"
's.putBuf "    exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='CREATEROW:" & os.Name & "',@access=@access out "
's.putBuf "    if @access=0 "
's.putBuf "    begin"
's.putBuf "      raiserror('Нет прав на создание строк. Раздел=" & os.Name & "',16,1)"
's.putBuf "      if @@trancount>0 rollback tran"
's.putBuf "      return"
's.putBuf "    end"
's.putBuf " end"

  If OptLOCK_S Then
    If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
      s.putBuf "      exec instance_ISLOCKED @cursession=@cursession,@ROWID=@InstanceID,@IsLocked=@access out "
    Else
      s.putBuf "      exec " & os.Parent.Parent.Name & "_ISLOCKED @cursession=@cursession,@ROWID=@ParentStructRowID,@IsLocked=@access out "
    End If
  
    Call CreateHandleError("      ", s)
    s.putBuf "      if @access > 2 "
    s.putBuf "        begin"
    s.putBuf "          raiserror('Строка заблокирована другим пльзователем. Раздел=" & os.Name & "',16,1)"
    s.putBufTRAN "          if @@trancount > 0 rollback tran"
    s.putBuf "          return"
    s.putBuf "        end"
  End If

  ' check for single row part
  If os.PartType = 0 Then
    s.putBuf "        if exists (select 1 from " & os.Name & " where "
    If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
      s.putBuf "InstanceID = @InstanceID)"
    Else
      s.putBuf "ParentStructRowID = @ParentStructRowID)"
    End If
    s.putBuf "        begin"
    s.putBuf "          raiserror('Невозможно создать вторую строку в однострочной сессии. Раздел: <" & os.Name & ">',16,1)"
    s.putBufTRAN "          if @@trancount > 0 rollback tran"
    s.putBuf "          return"
    s.putBuf "        End"
  End If

  s.putBufTRAN "      begin tran"

  If Not os.NoLog Then
    s.putBuf "      insert into SysLog (SysLogID, InstanceID, TheSession, the_Resource, LogStructID, VERB, LogInstanceID)"
    s.putBuf "        values (newid(), '{9A360531-D935-4676-952A-5BF35A5CFE80}', @cursession, @" & os.Name & "id, '" & os.Name & "', 'EDITROW', @instanceID)"
    Call CreateHandleError("      ", s)
  End If

  f = "": v = ""
  
  f = f & os.Name & "ID"
  v = v & "@" & os.Name & "ID"
  ' дерево  - поле
  If os.PartType = 2 Then
    f = f & ", ParentRowid"
    v = v & ", @ParentRowid"
  End If

  f = f & IIf(TypeName(os.Parent.Parent) = "OBJECTTYPE", ", InstanceID", ", ParentStructRowID")
  v = v & IIf(TypeName(os.Parent.Parent) = "OBJECTTYPE", ", @InstanceID", ", @ParentStructRowID")

  st.FIELD.Sort = "sequence"
  For i = 1 To st.FIELD.Count
    If (st.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
      f = f & ", " & st.FIELD.Item(i).Name
      v = v & ", @" & st.FIELD.Item(i).Name
    
      If UCase(st.FIELD.Item(i).FIELDTYPE.Name) = "FILE" Then
        f = f & ", " & st.FIELD.Item(i).Name & "_EXT"
        v = v & ", @" & st.FIELD.Item(i).Name & "_EXT"
      End If
     
      If st.FIELD.Item(i).ReferenceType = ReferenceType_Na_ob_ekt_ Then
        If Not st.FIELD.Item(i).RefToType Is Nothing Then
          Set reft_ = st.FIELD.Item(i).RefToType
          If reft_.IsDenormalOBJ = Boolean_Da Then
            f = f & ", " & st.FIELD.Item(i).Name & "_BRIEF"
            v = v & ", dbo.Instance_BRIEF_F(@" & st.FIELD.Item(i).Name & ")"
          End If
          Set reft_ = Nothing
        End If
      End If
        
      If st.FIELD.Item(i).ReferenceType = ReferenceType_Na_stroku_razdela Then
        If Not st.FIELD.Item(i).RefToPart Is Nothing Then
          Set refp_ = st.FIELD.Item(i).RefToPart
          If refp_.IsDenormal = Boolean_Da Then
            f = f & ", " & st.FIELD.Item(i).Name & "_BRIEF"
            v = v & ", dbo." & refp_.Name & "_BRIEF_F(@" & st.FIELD.Item(i).Name & ")"
          End If
          Set refp_ = Nothing
        End If
      End If
    End If
  Next
  
  s.putBuf "      insert into " & os.Name & " ("
  s.putBuf "        " & f
  s.putBuf "      ) values ("
  s.putBuf "        " & v
  s.putBuf "      )"
  Call CreateHandleError("      ", s)
  
's.putBuf " exec " & os.Name & "_SINIT @CURSESSION,@" & os.Name & "id,@tmpid"
  
  If OptUNIQUE Then
    s.putBuf "    -- checking unique constraints  --"
    s.putBuf UniqueCheck(os) & vbCrLf
  End If

  s.putBuf "    end"

  s.putBufTRAN "  -- close transaction --"
  s.putBufTRAN "  if @@error <> 0  if @@trancount > 0 rollback tran"
  s.putBufTRAN "  if @@trancount > 0 commit tran"

  s.putBuf "  end"
  
  s.putBuf "go"
  
  If OptRights Then
    s.putBuf "revoke all on [dbo].[" & os.Name & "_SAVE] to [public]"
    s.putBuf "go"
    s.putBuf "grant execute on [dbo].[" & os.Name & "_SAVE] to [public]"
    s.putBuf "go"
  End If

  o.Module = "--Procedures"
  o.Block = "--TableProc"
  o.OutNL s.getBuf
  o.OutNL "GO"

  CreateDelProc os

  DebugOutput "FBGEN.CreateProc:children " & os.Caption
  For i = 1 To os.PART.Count
    Set chos = os.PART.Item(i)
    CreateProc chos
  Next

  Set s = Nothing
  DebugOutput "FBGEN.CreateProc:done " & os.Caption
  Exit Sub
bye:
  log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
  Debug.Print "ERROR-->" & Err.Description & "<--ERROR (KEY:mnbxcjgsdyu)"
  Set s = Nothing
End Sub



' make
Private Function ReferenceCheck(os As PART, f As FIELD) As String
DebugOutput "FBGEN.ReferenceCheck:start " & os.Caption & " Filed:" & f.Caption
On Error GoTo bye
  Dim s As Writer
  Set s = New Writer
  log = log & vbCrLf & "-->ReferenceCheck " & f.Name

  'не ссылка
  'объект
  'строка
  
'RAISERROR   ('The current database ID is:%d, the database name is: %s.',    16, 1, @DBID, @DBNAME)


  If f.ReferenceType = ReferenceType_Skalyrnoe_pole_OPN_ne_ssilkaCLS Then
    s.putBuf ""
  End If

  If f.ReferenceType = ReferenceType_Na_ob_ekt_ Then
    s.putBuf "if(not exists( select  1 from instance with(nolock) where instanceid=@" & f.Name & " )) "
    s.putBuf "  begin"
    s.putBuf "    raiserror('Не обнаружен объект, на который установлена ссылка. Раздел=" & os.Name & " field=" & f.Name & "',16,1)"
    s.putBuf "    if @@trancount>0 rollback tran"
    s.putBuf "    return"
    s.putBuf "  end"
  End If
  
  
  If f.ReferenceType = ReferenceType_Na_stroku_razdela Then
    s.putBuf "if(not @" & f.Name & " is null ) "
    s.putBuf "if(not exists( select  1 from " & f.RefToPart.Name & " with(nolock) where " & f.RefToPart.Name & "id=@" & f.Name & " )) "
    s.putBuf "  begin"
    s.putBuf "    raiserror('Отсутствует строка в таблице (" & f.RefToPart.Name & "), на которую установлена ссылка.  Раздел=" & os.Name & " поле=" & f.Name & "',16,1)"
    s.putBuf "    if @@trancount>0 rollback tran"
    s.putBuf "    return"
    s.putBuf "  end"
  End If

  ReferenceCheck = s.getBuf
  DebugOutput "FBGEN.ReferenceCheck:done " & os.Caption & " Filed:" & f.Caption
  Set s = Nothing
  Exit Function
bye:
  log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
  Set s = Nothing
End Function




Private Sub CreateMethod(m As SHAREDMETHOD)
  DebugOutput "FBGEN.CreateMethod:start"
  On Error GoTo bye
  Dim p As Parameters
  Dim i As Long
  Dim s As String, s1 As String
  Dim ftm As FIELDTYPEMAP
  Dim Parameters As PARAMETERS_COL
  s1 = GetScript(m.SCRIPT)
  
  If s1 = "" Then Exit Sub
  
  log = log & vbCrLf & "-->CreateMethod " & m.Name
  Set Parameters = GetParameters(m.SCRIPT)
  s = "/* " & m.Name & "  " & m.the_comment & "*/"
  If m.ReturnType Is Nothing Then
    s = s & vbCrLf & procDropSQL(m.Name)
    s = s & vbCrLf & "create proc " & m.Name & vbCrLf
    If Parameters.Count > 0 Then
      s = s & vbCrLf & "("
    End If
  Else
    s = s & vbCrLf & funcDropSQL(m.Name)
    s = "create function " & m.Name & vbCrLf
  End If
    
  
  
  Parameters.Sort = "sequence"
  For i = 1 To Parameters.Count
    Set p = Parameters.Item(i)
    If i > 1 Then s = s & vbCrLf & ","
    s = s & MethodParam(p) & vbCrLf
  Next
 
  If Not m.ReturnType Is Nothing Then
    s = s & vbCrLf & ") "
    s = s & vbCrLf & " returns " & MapFTObj(m.ReturnType.ID).StoageType & vbCrLf
  Else
    If Parameters.Count > 0 Then
      s = s & vbCrLf & ")"
    End If
  End If
  
  
  s = s & vbCrLf & " as "
  
  s = s & vbCrLf & "begin"
  s = s & vbCrLf & "set nocount on"
  s = s & vbCrLf & "--------- script body ------------"
  
  
  o.Module = "--Procedures"
  o.Block = "--Methods"
  o.OutNL s
  s = ""
  
  s1 = GetScript(m.SCRIPT)
  
  If s1 = "" Then
    s1 = "print 'to do'"
'  Else
'    s1
'    's1 = ""
  End If
  
  s = s & s1 & vbCrLf
  
  s = s & vbCrLf & "--------- script body end---------"
  s = s & vbCrLf & "end"
  s = s & vbCrLf & "GO"
  If (OptRights) Then
  s = s & vbCrLf & "revoke all on [dbo].[" & m.Name & "] to [Public]"
  s = s & vbCrLf & "GO"
  s = s & vbCrLf & "grant execute on [dbo].[" & m.Name & "] to [Public]"
  s = s & vbCrLf & "GO"
  End If
  
  
  o.Module = "--Procedures"
  o.Block = "--Methods"
  o.OutNL s
  o.OutNL "GO"
  

  DebugOutput "FBGEN.CreateMethod:done"
  Exit Sub
bye:
  log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
  'Resume
End Sub



Private Function FieldForCreate(f As FIELD) As String
  DebugOutput "FBGEN.FieldForCreate:start"
  On Error Resume Next
  
  log = log & vbCrLf & "-->FieldForCreate " & f.Name
  
  Dim s As String, ftm As FIELDTYPEMAP
  s = ""
  Set ftm = MapFTObj(f.FIELDTYPE.ID)
  If ftm.FixedSize <> 0 Then
    s = s & " " & ftm.StoageType & "(" & ftm.FixedSize & ")"
  Else
    s = s & ftm.StoageType
    If f.FIELDTYPE.AllowSize Then
      If f.DataSize <> 0 Then
        s = s & "(" & f.DataSize & ")"
      Else
        s = s & "(200)"
      End If
    End If
  End If
  
  Dim e
  
  FieldForCreate = s
  DebugOutput "FBGEN.FieldForCreate:done"
  Exit Function
bye:
  log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
End Function


Private Function FieldForParam(f As FIELD) As String
  DebugOutput "FBGEN.FieldForParam:start"
  On Error GoTo bye
   
  log = log & vbCrLf & "-->FieldForParam " & f.Name
  Dim s As String, ftm As FIELDTYPEMAP
  s = "@" & f.Name
  Set ftm = MapFTObj(f.FIELDTYPE.ID)
  If ftm.FixedSize <> 0 Then
    s = s & " " & ftm.StoageType & "(" & ftm.FixedSize & ")"
  Else
    s = s & " " & ftm.StoageType
    If f.FIELDTYPE.AllowSize Then
      If f.DataSize <> 0 Then
       s = s & " (" & f.DataSize & ")"
      Else
       s = s & " (1)"
      End If
    End If
  End If
  
  'If f.AllowNull Then
    s = s & " = null "
  'End If
  
  s = s & "/* " & f.Caption & " */"
  
  'support extention field if file type used
  If UCase(f.FIELDTYPE.Name) = "FILE" Then
    s = s & vbCrLf & " , @" & f.Name & "_EXT nvarchar(4) = null"
  End If
  
  FieldForParam = s & "/* " & f.Caption & " */"
  DebugOutput "FBGEN.FieldForParam:done"
  Exit Function
bye:
  log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
 'Resume
End Function




Private Function MethodParam(f As Parameters) As String
DebugOutput "FBGEN.MethodParam:start"
On Error GoTo bye
  log = log & vbCrLf & "-->MethodParam " & f.Name
  Dim s As String, ftm As FIELDTYPEMAP
  s = "@" & f.Name
  Set ftm = MapFTObj(f.TypeOfParm.ID)
  If ftm.FixedSize <> 0 Then
   s = s & " " & ftm.StoageType & "(" & ftm.FixedSize & ")"
  Else
    s = s & " " & ftm.StoageType
    If f.TypeOfParm.AllowSize Then
      If f.DataSize <> 0 Then
        s = s & " (" & f.DataSize & ")"
      Else
        s = s & " (1)"
      End If
    End If
  End If
  
  If f.AllowNull Then
   s = s & " = null "
  End If
  If f.OutParam Then
    s = s & " output "
  End If
  
  
  MethodParam = s & "/* " & f.Caption & " */"
  DebugOutput "FBGEN.MethodParam:done"
  Exit Function
bye:
  log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
 'Resume
End Function


Private Function UniqueCheck(os As PART) As String
  If os.PartType = PartType_Rassirenie Then
    DebugOutput "FBGEN.UniqueCheck:skipped " & os.Caption
    Exit Function
  End If
  
  DoEvents
  
  DebugOutput "FBGEN.UniqueCheck:start " & os.Caption
  log = log & vbCrLf & "-->UniqueCheck for " & os.Name
  On Error GoTo bye
  
  Dim s As String
  Dim st As PART
  Dim uc As UNIQUECONSTRAINT
  Dim cf As CONSTRAINTFIELD
  Dim i As Long, j As Long
  Set st = os
  s = ""
  
  Dim z As String
  
  If st.UNIQUECONSTRAINT.Count > 0 Then
    s = s & "If @SessUserLogin <> 'replicator' "
    s = s & vbCrLf & "begin"
    For i = 1 To st.UNIQUECONSTRAINT.Count
      Set uc = st.UNIQUECONSTRAINT.Item(i)
      z = ""
      If uc.CONSTRAINTFIELD.Count > 0 Then
      
        For j = 1 To uc.CONSTRAINTFIELD.Count
          Set cf = uc.CONSTRAINTFIELD.Item(j)
          If Not cf.TheField Is Nothing Then
            z = z & vbCrLf & " and " & cf.TheField.Name & "=@" & cf.TheField.Name
          Else
            log = log & vbCrLf & "WARNING-->Field not defined in unique constraint Table=" & st.Name & " <--WARNING"
          End If
        Next
        
        If uc.PerParent Then
          If os.PartType = PartType_Derevo Then
            If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
              s = s & vbCrLf & " if @ParentRowID is null"
              s = s & vbCrLf & "   select @UniqueRowCount=Count(*) from " & os.Name & " with(nolock) where InstanceID=@InstanceID and ParentRowID is null " & z
              s = s & vbCrLf & " else "
              s = s & vbCrLf & "   select @UniqueRowCount=Count(*) from " & os.Name & " with(nolock) where InstanceID=@InstanceID and ParentRowID=@ParentRowID " & z
            Else
              s = s & vbCrLf & " if @ParentRowID is null"
              s = s & vbCrLf & "   select @UniqueRowCount=Count(*) from " & os.Name & " with(nolock) where ParentStructRowID=@ParentStructRowID and ParentRowID is null " & z
              s = s & vbCrLf & " else "
              s = s & vbCrLf & "   select @UniqueRowCount=Count(*) from " & os.Name & " with(nolock) where ParentStructRowID=@ParentStructRowID and ParentRowID =@ParentRowID " & z
            End If
          Else
            If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
              s = s & vbCrLf & " select @UniqueRowCount=Count(*) from " & os.Name & " with(nolock) where InstanceID=@InstanceID " & z
            Else
              s = s & vbCrLf & "select @UniqueRowCount=Count(*) from " & os.Name & " with(nolock) where ParentStructRowID=@ParentStructRowID " & z
            End If
          End If
        Else
          s = s & vbCrLf & "select @UniqueRowCount=Count(*) from " & os.Name & " with(nolock) where 1=1  " & z
        End If
      
        If uc.TheComment <> "" Then
          s = s & vbCrLf & "if @UniqueRowCount>=2"
          s = s & vbCrLf & "begin"
          s = s & vbCrLf & " raiserror('" & uc.TheComment & " Раздел=" & os.Caption & "',16,1)"
          s = s & vbCrLf & " if @@trancount>0 rollback tran"
          s = s & vbCrLf & " return"
          s = s & vbCrLf & "end"
        ElseIf uc.Name <> "" Then
          s = s & vbCrLf & "if @UniqueRowCount>=2"
          s = s & vbCrLf & "begin"
          s = s & vbCrLf & " raiserror('Нарущение уникальности сочетания полей.  Раздел=" & os.Caption & " Правило=" & uc.Name & "',16,1)"
          s = s & vbCrLf & " if @@trancount>0 rollback tran"
          s = s & vbCrLf & " return"
          s = s & vbCrLf & "end"
        Else
          s = s & vbCrLf & "if @UniqueRowCount>=2"
          s = s & vbCrLf & "begin"
          s = s & vbCrLf & " raiserror('Нарущение уникальности сочетания полей. Раздел=" & os.Caption & "',16,1)"
          s = s & vbCrLf & " if @@trancount>0 rollback tran"
          s = s & vbCrLf & " return"
          s = s & vbCrLf & "end"
        End If
      
      End If
    Next
    
    s = s & vbCrLf & "end"
  End If
  
  UniqueCheck = s
  DebugOutput "FBGEN.UniqueCheck:done " & os.Caption
  Exit Function
bye:
  log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
  'Resume
End Function




Private Function MapPartView(os As PART) As String
If os.PartType = PartType_Rassirenie Then
    DebugOutput "FBGEN.MapPartView:skipped " & os.Caption
    Exit Function
End If
  Dim s As String
  Dim i As Long
  For i = 1 To os.PARTVIEW.Count
    If os.PARTVIEW.Item(i).ForChoose = Boolean_Da Then
      s = s & vbCrLf & "set @id = '" & GetMap(os.Name & "_DEFVIEW") & "'"
      s = s & vbCrLf & "EXEC SysOptions_SAVE  @SysOptionsid=@id, @Name='" & os.Name & "', @Value='" & os.PARTVIEW.Item(i).the_Alias & "', @OptionType='DEFVIEW'"
      Exit For
    End If
  Next
  For i = 1 To os.PART.Count
    If Not os.PART.Item(i).PartType = PartType_Rassirenie Then
        s = s & vbCrLf & MapPartView(os.PART.Item(i))
    End If
  Next
  
  MapPartView = s
  DebugOutput "FBGEN.MapPartView:done " & os.Caption
End Function


Private Function MapAndParent(os As PART) As String
DebugOutput "FBGEN.MapAndParent:start " & os.Caption
If os.PartType = PartType_Rassirenie Then
    DebugOutput "FBGEN.MapAndParent:skipped " & os.Caption
    Exit Function
End If
Dim s As String
Dim tn As String
  tn = TypeForStruct(os).Name

  s = s & vbCrLf & "set @id = '" & GetMap(os.Name & "_structtype") & "'"
  s = s & vbCrLf & "EXEC SysOptions_SAVE  @SysOptionsid=@id, @Name='" & os.Name & "', @Value='" & tn & "', @OptionType='STRUCT_TYPE'"
  

  
  If TypeName(os.Parent.Parent) <> "OBJECTTYPE" Then
    s = s & vbCrLf & "set @id = '" & GetMap(os.Name & "_PARENT") & "'"
    s = s & vbCrLf & "EXEC SysOptions_SAVE  @SysOptionsid=@id, @Name='" & os.Name & "', @Value='" & os.Parent.Parent.Name & "', @OptionType='PARENT'"
  End If
  
  Dim chos As PART
  Dim i As Long
'  For i = 1 To os.PARTVIEW.Count
'    s = s & vbCrLf & MapViews(os.PARTVIEW.Item(i))
'  Next
  
  
  For i = 1 To os.PART.Count
    If Not os.PART.Item(i).PartType = PartType_Rassirenie Then
        s = s & vbCrLf & MapAndParent(os.PART.Item(i))
    End If
  Next
  
  MapAndParent = s
  DebugOutput "FBGEN.MapAndParent:done " & os.Caption
End Function


Private Function MapViews(pv As PARTVIEW) As String 'не используется
  Dim s As String
  s = ""
  s = s & vbCrLf & "set @id = '" & GetMap(pv.the_Alias & "_map") & "'"
  s = s & vbCrLf & "EXEC SysOptions_SAVE  @SysOptionsid=@id, @Name='" & pv.ID & "', @Value='V_" & pv.the_Alias & "', @OptionType='MAP'"
  MapViews = s
End Function


Private Function TypeForStruct(ByVal s As PART) As OBJECTTYPE
DebugOutput "FBGEN.TypeForStruct:start " & s.Caption
Dim i As Long
Dim obj As Object
Set obj = s.Parent.Parent

' ищем что за тип объекта
While TypeName(obj) <> "OBJECTTYPE"
  Set obj = obj.Parent.Parent
Wend

Set TypeForStruct = obj

DebugOutput "FBGEN.TypeForStruct:done " & s.Caption
End Function


Private Sub LoadOptions()
DebugOutput "FBGEN.LoadOptions:start "
Dim s As Writer
Set s = New Writer
DoEvents
Dim os As PART
Dim i As Long
Dim j As Long

s.putBuf "declare @id uniqueidentifier"
s.putBuf "declare @instid uniqueidentifier"
s.putBuf "declare @uid uniqueidentifier"
s.putBuf "declare @SESSION uniqueidentifier"
s.putBuf "declare @cid uniqueidentifier"
s.putBuf "declare @secid uniqueidentifier"
s.putBuf "declare @hid uniqueidentifier"
s.putBuf "declare @tmpstr varchar(255)"

s.putBuf "set @instid = '" & GetMap("MTSYSTEMID") & "'"
s.putBuf "set @uid = '" & GetMap("inituser") & "' "
s.putBuf "set @secid = '" & GetMap("secid") & "' --user security instance "
s.putBuf "set @hid = '" & GetMap("helper") & "' -- helper id"
s.putBuf "if not exists(select 1 from users where usersid=@uid)"
s.putBuf "insert into users(usersid,instanceid,login,password) values(@uid,null,'init','init')"
s.putBuf "if not exists(select 1 from instance with(nolock) where instanceid=@instid)"
s.putBuf "insert into instance(InstanceID,OBJTYPE,Name) values(@instid, 'MTZSYSTEM','Системная информация')"
For i = 1 To m.OBJECTTYPE.Count
  s.putBuf "if not exists(select 1 from typelist with(nolock) where name='" & m.OBJECTTYPE.Item(i).Name & "')"
  s.putBuf "insert into typelist( name,RegisterProc,DeleteProc, HCLProc, propagateProc) values('" & m.OBJECTTYPE.Item(i).Name & "', '" & m.OBJECTTYPE.Item(i).Name & "_REGISTER', '" & m.OBJECTTYPE.Item(i).Name & "_DELETE', '" & m.OBJECTTYPE.Item(i).Name & "_HCL', '" & m.OBJECTTYPE.Item(i).Name & "_propagate')"
Next
s.putBuf "exec MTZLogin @the_SESSION=@session OUTPUT , @PWD='init', @USR='init'"

s.putBuf "EXEC Instance_SAVE @CURSESSION=@session, @InstanceID=@secid, @ObjType='MTZUsers',@Name='Пользователи и группы'"

For i = 1 To m.OBJECTTYPE.Count
  
  If Not m.OBJECTTYPE.Item(i).ChooseView Is Nothing Then
    s.putBuf "set @id = '" & GetMap(m.OBJECTTYPE.Item(i).Name & "_TDEFVIEW") & "'"
    s.putBuf "EXEC SysOptions_SAVE  @SysOptionsid=@id, @Name='" & m.OBJECTTYPE.Item(i).Name & "', @Value='" & m.OBJECTTYPE.Item(i).ChooseView.the_Alias & "', @OptionType='TDEFVIEW'"
  End If

  For j = 1 To m.OBJECTTYPE.Item(i).PART.Count
      s.putBuf MapAndParent(m.OBJECTTYPE.Item(i).PART.Item(j))
      s.putBuf MapPartView(m.OBJECTTYPE.Item(i).PART.Item(j))
  Next
Next

For i = 1 To m.SHAREDMETHOD.Count
  s.putBuf "set @id = '" & GetMap(m.SHAREDMETHOD.Item(i).Name & "_METHOD") & "'"
  s.putBuf "EXEC SysOptions_SAVE  @SysOptionsid=@id, @Name='" & m.SHAREDMETHOD.Item(i).ID & "', @Value='" & m.SHAREDMETHOD.Item(i).Name & "', @OptionType='METHODNAME'"
Next

s.putBuf "DECLARE @Groupid uniqueidentifier"
s.putBuf "DECLARE @GroupUserid uniqueidentifier"

' create new user
s.putBuf "set @uid='" & GetMap("supervisor") & "'"
s.putBuf "EXEC Users_SAVE @CURSESSION=@session, @InstanceID=@secid, @Usersid=@uid, "
s.putBuf " @Password='bami',  @Login='supervisor', @name='Администратор'"

''--- GROUP Administrtors
's.putbuf "set @Groupid ='" & GetMap("AdminGroup") & "'"
's.putbuf "EXEC Groups_SAVE @CURSESSION=@SESSION, @InstanceID=@secid, @Groupsid=@Groupid, @Name='Administrators'"
'
's.putbuf "set @GroupUserid='" & GetMap("supervisor_in_group") & "'"
's.putbuf "EXEC GroupUser_SAVE @CURSESSION=@SESSION, @ParentStructRowID=@Groupid, @GroupUserid = @GroupUserid,  @TheUser=@uid"


s.putBuf "exec Logout  @cursession=@session"

s.putBuf "delete from users where login = 'init'"

'лучшее враг хорошего - репликатор не сможет работать, если удалить сессии
's.putBuf "delete from the_session"
s.putBuf "go"

o.Module = "--Options"
o.Block = "--Load"
o.OutNL s.getBuf
DebugOutput "FBGEN.LoadOptions:done "
Set s = Nothing
End Sub




''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' UTILS
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' return phisical type for FIELDTYPE
Private Function MapFT(ByVal typeID As String) As String
Dim i, s
Dim ft As FIELDTYPE

On Error Resume Next
  
  If ftmap Is Nothing Then Set ftmap = New Collection
  If ftmap.Item(typeID) Is Nothing Then
  Else
      s = ftmap.Item(typeID).StoageType
      If ftmap.Item(typeID).FixedSize <> 0 Then
        s = s & vbCrLf & " (" & ftmap.Item(typeID).FixedSize & ")"
      End If
      MapFT = s
    Exit Function
  End If

On Error GoTo bye

  MapFT = "INTEGER"
  Set ft = m.FIELDTYPE.Item(typeID)
  If ft Is Nothing Then Exit Function
  For i = 1 To ft.FIELDTYPEMAP.Count
    If (Not ft.FIELDTYPEMAP.Item(i).Target Is Nothing) Then
      If ft.FIELDTYPEMAP.Item(i).Target.ID = tid Then
        ftmap.Add ft.FIELDTYPEMAP.Item(i), typeID
        s = ft.FIELDTYPEMAP.Item(i).StoageType
        If ft.FIELDTYPEMAP.Item(i).FixedSize <> 0 Then
          s = s & vbCrLf & " (" & ft.FIELDTYPEMAP.Item(i).FixedSize & ")"
        End If
        Exit For
      End If
    End If
  Next
  MapFT = s
  Exit Function
bye:
log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"

End Function


Private Function MapFTObj(ByVal typeID As String) As FIELDTYPEMAP
On Error Resume Next
  
  If ftmap Is Nothing Then Set ftmap = New Collection
  Dim obj As Object
  Set obj = ftmap.Item(typeID)
  If obj Is Nothing Then
     Set obj = Nothing
  Else
    Set MapFTObj = ftmap.Item(typeID)
    Exit Function
  End If
  
On Error GoTo bye
  Dim i, s
  Dim ft As FIELDTYPE
  Set ft = m.FIELDTYPE.Item(typeID)
  If ft Is Nothing Then Exit Function
  For i = 1 To ft.FIELDTYPEMAP.Count
    If (Not ft.FIELDTYPEMAP.Item(i).Target Is Nothing) Then
    If ft.FIELDTYPEMAP.Item(i).Target.ID = tid Then
      ftmap.Add ft.FIELDTYPEMAP.Item(i), typeID
      Set MapFTObj = ft.FIELDTYPEMAP.Item(i)
      Exit For
    End If
    End If
  Next
  Exit Function
bye:
log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"

End Function




Private Function GetScript(scol As SCRIPT_COL) As String
  Dim i As Long
  
  On Error GoTo bye
  For i = 1 To scol.Count
    If scol.Item(i).Target.ID = tid Then
      GetScript = scol.Item(i).Code
      Exit Function
    End If
  Next
  Exit Function
bye:
log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"


End Function


Private Function GetParameters(scol As SCRIPT_COL) As PARAMETERS_COL
  Dim i As Long
  
  On Error GoTo bye
  For i = 1 To scol.Count
    If scol.Item(i).Target.ID = tid Then
      Set GetParameters = scol.Item(i).Parameters
      Exit Function
    End If
  Next
  Exit Function
bye:
log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"

End Function



Private Function MakeName(ByVal s As String) As String
  Dim tt As String
  tt = s
  tt = Replace(tt, "-", "")
  tt = Replace(tt, "{", "")
  tt = Replace(tt, "}", "")
  tt = Replace(tt, " ", "_")
  MakeName = tt
End Function

Private Sub CreateBriefProc(os As PART)
  DebugOutput "FBGEN.CreateBriefProc:start "
  If os.PartType = PartType_Rassirenie Then
    DebugOutput "FBGEN.CreateBriefProc:skipped " & os.Caption
    Exit Sub
  End If

  Dim st As PART
  Set st = os
  Dim chos As PART, i As Long, j As Long, f As FIELD
  Dim s As Writer
  Set s = New Writer
  
  CreateBriefFunc os
  
  log = log & vbCrLf & "-->CreateBriefProc " & os.Name
  On Error GoTo bye
  
  s.putBuf procDropSQL(os.Name & "_BRIEF")
  s.putBuf "create proc " & os.Name & "_BRIEF("
  s.putBuf "  @CURSESSION uniqueidentifier,"
  s.putBuf "  @" & os.Name & "id uniqueidentifier,"
  s.putBuf "  @BRIEF varchar(4000) output"
  s.putBuf ") as begin"
  s.putBuf "  set nocount on"

  s.putBuf "  if @" & os.Name & "id is null begin set @BRIEF = '' return end"
  
  s.putBuf "  if exists(select 1 from " & os.Name & " where " & os.Name & "ID=@" & os.Name & "ID)"
  s.putBuf "    begin"
  s.putBuf "      select @BRIEF = dbo." & os.Name & "_BRIEF_F(@" & os.Name & "id)"
  s.putBuf "    end"
  s.putBuf "  else"
  s.putBuf "    begin"
  s.putBuf "      set @BRIEF = 'нет данных'"
  s.putBuf "    end"
  s.putBuf "  set @BRIEF = left(@BRIEF, 4000)"
  s.putBuf "end"

  s.putBuf "go"
  
  If (OptRights) Then
    s.putBuf "revoke all on [dbo].[" & os.Name & "_BRIEF] to [public]"
    s.putBuf "go"
    s.putBuf "grant execute on [dbo].[" & os.Name & "_BRIEF] to [public]"
    s.putBuf "go"
  End If

  o.Module = "--Procedures"
  o.Block = "--TableProc"
  o.OutNL s.getBuf
  o.OutNL "GO"
  DebugOutput "FBGEN.CreateBriefProc:done "
  Set s = Nothing
  
  For i = 1 To os.PART.Count
    CreateBriefProc os.PART.Item(i)
  Next
  
  Exit Sub
bye:
  log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
  Debug.Print "ERROR-->" & Err.Description & "<--ERROR (KEY:yuteqweg)"
  Set s = Nothing
End Sub

Private Sub CreateBriefFunc(os As PART)
  If os.PartType = PartType_Rassirenie Then
    DebugOutput "FBGEN.CreateBriefFunc:skipped " & os.Caption
    Exit Sub
  End If

  If os.ruleBrief = "" Then
    Call CreateBriefFuncOld(os)
  Else
    Call CreateBriefFuncNew(os)
  End If
End Sub

Private Sub CreateBriefFuncOld(os As PART)
  DebugOutput "FBGEN.CreateBriefFunc:start " & os.Caption
  Dim st As PART
  Set st = os
  Dim chos As PART, i As Long, j As Long, f As FIELD
  Dim s As Writer
  Set s = New Writer

  ' делаем отдельно заголовки функций
  'CreateBriefFuncHdr os

  s.putBuf funcDropSQL(os.Name & "_BRIEF_F")
  s.putBuf "create function " & os.Name & "_BRIEF_F ("
  s.putBuf "  @" & os.Name & "id uniqueidentifier"
  s.putBuf ") returns varchar(255) as " & " begin  "
  s.putBuf "  declare @BRIEF varchar(255)"
  s.putBuf "  declare @tmpID uniqueidentifier"
  s.putBuf "  declare @tmpBrief varchar(255)"

  s.putBuf "if @" & os.Name & "id is null return('')"
  s.putBuf "if exists(select 1 from " & os.Name & " with(nolock) where " & os.Name & "ID=@" & os.Name & "ID)"
  s.putBuf " begin"
  s.putBuf "  set @BRIEF=''"
  
  st.FIELD.Sort = "sequence"
  For i = 1 To st.FIELD.Count
    If (st.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
      If st.FIELD.Item(i).IsBrief Then
        Set f = st.FIELD.Item(i)
        
        Dim arr() As String, sh As String
        On Error Resume Next
        sh = f.shablonBrief
        If sh = "" Then
          ReDim arr(1)
        Else
          sh = Replace(sh, "'", "")
          arr = Split(sh, "%%")
          ReDim Preserve arr(1)
        End If
        
        If st.FIELD.Item(i).FIELDTYPE.TypeStyle = TypeStyle_Perecislenie Then
          
          s.putBuf "  select @BRIEF= @BRIEF +"
          s.putBuf "  case " & f.Name & " "
          For j = 1 To st.FIELD.Item(i).FIELDTYPE.ENUMITEM.Count
            s.putBuf "when " & st.FIELD.Item(i).FIELDTYPE.ENUMITEM.Item(j).NameValue & " then "
            s.putBuf " '" & arr(0) & st.FIELD.Item(i).FIELDTYPE.ENUMITEM.Item(j).Name & arr(1) & "; '"
          Next
         s.putBuf "  end  from " & st.Name & " with(nolock) where " & os.Name & "ID=@" & os.Name & "ID"
        
        ElseIf st.FIELD.Item(i).FIELDTYPE.TypeStyle = TypeStyle_Ssilka Then
          s.putBuf "select @tmpID =  " & f.Name
          s.putBuf "  from " & os.Name & "  with(nolock) where  " & os.Name & "ID = @" & os.Name & "ID "
          If f.ReferenceType = ReferenceType_Na_ob_ekt_ Then
              s.putBuf " select @tmpBrief= dbo.Instance_BRIEF_F( @tmpID)"
          End If
          If f.ReferenceType = ReferenceType_Na_stroku_razdela Then
            s.putBuf " select @tmpBrief= dbo." & f.RefToPart.Name & "_BRIEF_F(@tmpID)"
          End If
          s.putBuf "  set @BRIEF= @BRIEF + '{" & arr(0) & "' + isnull(@tmpbrief,' ') + '" & arr(1) & "}; '"
    
        Else
          s.putBuf "  select @BRIEF= @BRIEF "
          s.putBuf "  + '" & arr(0) & "' + isnull(Convert(varchar(255), " & st.FIELD.Item(i).Name & "),' ') + '" & arr(1) & "; '"
          s.putBuf "  from " & os.Name & "  with(nolock) where  " & os.Name & "ID = @" & os.Name & "ID "
        End If
      End If
    End If
  Next
  s.putBuf "end else begin"
  s.putBuf "  set @BRIEF= '-'"
  s.putBuf "end"
  s.putBuf "set @BRIEF=left(@BRIEF,255)"
  s.putBuf "return(@BRIEF)"
  s.putBuf "end "
  
  o.Module = "--Functions"
  o.Block = "--TableProc"
  o.OutNL s.getBuf
  o.OutNL "GO"
  DebugOutput "FBGEN.CreateBriefFunc:done " & os.Caption
  Set s = Nothing
End Sub

Private Sub CreateBriefFuncNew(os As PART)
  DebugOutput "FBGEN.CreateBriefFuncNew:start " & os.Caption
  Dim st As PART
  Set st = os
  Dim chos As PART, i As Long, j As Long, f As FIELD
  Dim s As Writer
  Set s = New Writer
  
  Dim sh As String: sh = Replace(os.ruleBrief, vbCrLf, "")
  sh = "'" & Replace(sh, "'", "''") & "'"
  Dim CTRL As String: CTRL = ""

  s.putBuf funcDropSQL(os.Name & "_BRIEF_F")
  s.putBuf "CREATE function " & os.Name & "_BRIEF_F  ("
  s.putBuf "  @" & os.Name & "id uniqueidentifier"
  s.putBuf ") returns varchar(255) as"
  s.putBuf "begin"
  s.putBuf "  declare @BRIEF varchar(255)"
  s.putBuf ""

  s.putBuf "  if @" & os.Name & "id is null return('')"
  s.putBuf "  if not exists(select 1 from " & os.Name & " with(nolock) where " & os.Name & "ID = @" & os.Name & "ID) return('-')"
  s.putBuf ""
  
  Dim q As String: q = ""
  'If UCase(os.Name) = UCase("SSAG_SEGMENT") Then Stop
  For i = 1 To os.FIELD.Count
    If (os.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
      With os.FIELD.Item(i)
        If InStr(1, sh, "[" & .Name & "]", vbTextCompare) > 0 Then
          s.putBuf "  declare @BRIEF" & i & " varchar(50)"
          
          If q <> "" Then q = q & "," & vbCrLf & "    "
          q = q & "@BRIEF" & i & " = "
          
          Dim ft As FIELDTYPE
          Set ft = .FIELDTYPE
          
          If ft.TypeStyle = TypeStyle_Perecislenie Then
            q = q & "case " & f.Name
            For j = 1 To ft.ENUMITEM.Count
              q = q & vbCrLf & "      when " & ft.ENUMITEM.Item(j).NameValue & " then "
              q = q & "'" & ft.ENUMITEM.Item(j).Name & "'"
            Next
            q = q & vbCrLf & "   end"
          ElseIf ft.TypeStyle = TypeStyle_Ssilka Then
            If .ReferenceType = ReferenceType_Na_ob_ekt_ Then
              q = q & "dbo.Instance_BRIEF_F(" & .Name & ")"
            End If
            If .ReferenceType = ReferenceType_Na_stroku_razdela Then
              If Not .RefToPart Is Nothing Then
                q = q & "dbo." & .RefToPart.Name & "_BRIEF_F(" & .Name & ")"
              Else
                q = q & "'error BRIEF'"
              End If
            End If
            
            If CTRL <> "" Then CTRL = CTRL & vbCrLf
            CTRL = CTRL & "  if @BRIEF" & i & " <> '' set @BRIEF" & i & " = '{' + @BRIEF" & i & " + '}'"
          Else
            q = q & "isnull(Convert(varchar(200), " & .Name & "), '')"
          End If
          
          If .shablonBrief <> "" Then
            Dim arr() As String, sh_ As String
            sh_ = .shablonBrief
            
            If InStr(1, .shablonBrief, "%%") = 0 Then sh_ = sh_ & "%%"
            arr = Split(sh_, "%%")
            
            sh_ = Replace(sh_, "'", "''")
            ReDim Preserve arr(1)
            
            CTRL = CTRL & "  if @BRIEF" & i & " <> '' set @BRIEF" & i & " = '" & arr(0) & "' + @BRIEF" & i & " + '" & arr(1) & "'"
          End If
          
          sh = Replace(sh, "[" & .Name & "]", "' + @BRIEF" & i & " + '", , , vbTextCompare)
        End If
      End With
    End If
  Next
  s.putBuf "  select"
  s.putBuf "    " & q
  s.putBuf "    from " & os.Name & " with(nolock) where " & os.Name & "ID = @" & os.Name & "ID"
  s.putBuf ""
  
  s.putBuf CTRL
  s.putBuf ""
  
  s.putBuf "  set @brief = " & sh
  s.putBuf "  set @BRIEF = left(@BRIEF, 255)"
  s.putBuf "  return(@BRIEF)"
  s.putBuf "end"
  
  o.Module = "--Functions"
  o.Block = "--TableProc"
  o.OutNL s.getBuf
  o.OutNL "GO"
  DebugOutput "FBGEN.CreateBriefFunc:done " & os.Caption
  Set s = Nothing
End Sub



Private Sub CreateBriefFuncHdr(os As PART)
  DebugOutput "FBGEN.CreateBriefFuncHdr:start " & os.Caption
  If os.PartType = PartType_Rassirenie Then
    DebugOutput "FBGEN.CreateBriefFuncHdr:skipped " & os.Caption
    Exit Sub
  End If

  Dim st As PART
  Set st = os
  Dim chos As PART, i As Long, j As Long, f As FIELD
  Dim s As String

  log = log & vbCrLf & "-->CreateBriefFuncHdr " & os.Name

  On Error GoTo bye

  s = ""
  s = s & vbCrLf & funcDropSQL(os.Name & "_BRIEF_F")
  s = s & vbCrLf & "create function " & os.Name & "_BRIEF_F  ("
  s = s & vbCrLf & " @" & os.Name & "id uniqueidentifier"
  s = s & vbCrLf & ") returns varchar(255) as " & " begin  "
  s = s & vbCrLf & " declare @BRIEF varchar(255)"
  s = s & vbCrLf & "  set @BRIEF='to do'"

  s = s & vbCrLf & "return(@BRIEF)"
  s = s & vbCrLf & "end "
  Debug.Print os.Name

  o.Module = "--FunctionsHeader"
  o.Block = "--TableProc"
  o.OutNL s
  o.OutNL "GO"

  DebugOutput "FBGEN.CreateBriefFuncHdr:done " & os.Caption
  Exit Sub
bye:
  log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
End Sub


Private Sub CreateTypeProcs(obt As OBJECTTYPE)
  DebugOutput "FBGEN.CreateTypeProcs:start " & obt.the_comment
  Dim chos As PART
  Dim s As Writer
  Set s = New Writer
  DoEvents
  
  s.putBuf procDropSQL(obt.Name & "_DELETE")
  s.putBuf "create proc " & obt.Name & "_DELETE(@cursession uniqueidentifier, @InstanceID uniqueidentifier) as  "
  ' delete from root structure of object  - child of instance
  Dim tos   As Integer
  s.putBuf "declare @ObjType as varchar(255), @childlistid uniqueidentifier"
  s.putBuf "select  @ObjType =objtype from instance with(nolock) where instanceid=@instanceid"
  s.putBuf "if  @ObjType ='" & obt.Name & "'"
  s.putBuf "begin"
    If obt.PART.Count > 0 Then
      For tos = 1 To obt.PART.Count
          Set chos = obt.PART.Item(tos)
          If Not chos.PartType = PartType_Rassirenie Then
            s.putBuf "declare childlist_" & chos.Name & " cursor local for select " & chos.Name & "." & chos.Name & "id from " & chos.Name & " where  " & chos.Name & ".InstanceID = @instanceid"
            s.putBuf "open childlist_" & chos.Name & ""
            s.putBuf "fetch next from childlist_" & chos.Name & " into @childlistid"
            s.putBuf "while @@fetch_status >=0 "
            s.putBuf "begin"
            s.putBuf " exec " & chos.Name & "_DELETE @cursession,@childlistid,@InstanceID"
            s.putBuf " if @@error >0 begin"
            s.putBuf "   close childlist_" & chos.Name & ""
            s.putBuf "   deallocate childlist_" & chos.Name & " "
            s.putBuf "   goto del_error"
            s.putBuf " end"
            s.putBuf " fetch next from childlist_" & chos.Name & " into @childlistid"
            s.putBuf "end"
            s.putBuf "close childlist_" & chos.Name & ""
            s.putBuf "deallocate childlist_" & chos.Name & " "
        End If
      Next
    End If
  s.putBuf "return"
  s.putBuf "del_error:"
  s.putBuf "if @@trancount>0 rollback tran"
  s.putBuf "end"
  s.putBuf "go"
  If (OptRights) Then
  s.putBuf "revoke all on [dbo].[" & obt.Name & "_DELETE] to [public]"
  s.putBuf "go"
  s.putBuf "grant execute on [dbo].[" & obt.Name & "_DELETE] to [public]"
  s.putBuf "go"
  End If

  
  
  ' register root structure of object as child of instance
  s.putBuf procDropSQL(obt.Name & "_REGISTER")
  s.putBuf "create proc " & obt.Name & "_REGISTER(@cursession uniqueidentifier, @InstanceID uniqueidentifier) as  "
  s.putBuf "declare @ObjType as varchar(255)"
  s.putBuf "declare @tmpStr as varchar(255)"
  s.putBuf "select  @ObjType =objtype from instance with(nolock) where instanceid=@instanceid"
  s.putBuf "if @objtype = '" & obt.Name & "'"
  s.putBuf " begin"
  If obt.IsSingleInstance Then
    s.putBuf "if exists(select 1 from instance  with(nolock) where objtype=@objtype and instanceid<>@instanceid  )"
    s.putBuf " begin"
    s.putBuf "    raiserror('Невозможно создать второй экземпляр документа типа: <%s>',16,1,@ObjType)"
    s.putBuf "    if @@trancount>0 rollback tran"
    s.putBuf "    return"
    s.putBuf " End"
  End If
  'If obt.PART.Count = 0 Then
    s.putBuf " select 1 /* do nothing */"
  'Else
    'For tos = 1 To obt.PART.Count
        's.putbuf "  set @tmpStr = convert(varchar(255),@instanceid)+'" & obt.PART.Item(tos).Name & "'"
        's.putbuf "  exec RegisterResource @cursession=@cursession,@parent=@instanceid,@the_Resource=@tmpStr"
    'Next
  'End If
  s.putBuf "end"
  s.putBuf "go"
  If (OptRights) Then
  s.putBuf "revoke all on [dbo].[" & obt.Name & "_REGISTER] to [public]"
  s.putBuf "go"
  s.putBuf "grant execute on [dbo].[" & obt.Name & "_REGISTER] to [public]"
  s.putBuf "go"
  End If
  
  
  ' register root structure of object as child of instance
  s.putBuf procDropSQL(obt.Name & "_HCL")
  s.putBuf "create proc " & obt.Name & "_HCL(@cursession uniqueidentifier, @ROWID uniqueidentifier, @IsLocked integer out) as  "
  s.putBuf "declare @ObjType as varchar(255)"
  s.putBuf "declare @tmpStr as varchar(255)"
  
  s.putBuf " declare @UserID uniqueidentifier"
  s.putBuf " declare @LockUserID uniqueidentifier"
  s.putBuf " declare @LockSessionID uniqueidentifier"
  
  s.putBuf "select  @ObjType =objtype from instance with(nolock) where instanceid=@Rowid"
  s.putBuf "if @objtype = '" & obt.Name & "'"
  s.putBuf " begin"
  
  If obt.PART.Count = 0 Then
    s.putBuf " set @IsLocked =0"
  Else
     s.putBuf "if @@nestlevel < 25  begin"
   '---- проверяем, что нет заблокированных записей в  дочерних разделах
   s.putBuf "declare @childlistid uniqueidentifier"
   s.putBuf " select @userID = usersid from the_session with(nolock) where the_sessionid=@cursession"
    Dim i As Long
    For i = 1 To obt.PART.Count
      Set chos = obt.PART.Item(i)
      If Not chos.PartType = PartType_Rassirenie Then
        s.putBuf "declare lockchild_" & chos.Name & " cursor local for select " & chos.Name & "." & chos.Name & "id from " & chos.Name & " where  " & chos.Name & ".InstanceID = @rowid"
        s.putBuf "open lockchild_" & chos.Name & ""
        s.putBuf "fetch next from lockchild_" & chos.Name & " into @childlistid"
        s.putBuf "while @@fetch_status >=0 "
        s.putBuf "begin"
        
        ' если в дочернем разделе есть заблокированная строка
        s.putBuf " select @LockUserID = LockUserID,@LockSessionID = LockSessionID from " & chos.Name & " where " & chos.Name & "id=@childlistid"
        s.putBuf " /* verify this row */"
        s.putBuf " if not @LockUserID is null  "
        s.putBuf " begin   "
        s.putBuf "   if  @LockUserID <> @userID  "
        s.putBuf "   begin   "
        s.putBuf "     set @isLocked = 4 /* CheckOut by another user */"
        s.putBuf "     close lockchild_" & chos.Name & ""
        s.putBuf "     deallocate lockchild_" & chos.Name & " "
        s.putBuf "     return"
        s.putBuf "   end   "
        s.putBuf " end   "
        s.putBuf " if not @LockSessionID is null  "
        s.putBuf " begin   "
        s.putBuf "   if  @LockSessionID <> @CURSESSION  "
        s.putBuf "   begin   "
        s.putBuf "     set @isLocked = 3 /* Lockes by another user */"
        s.putBuf "     close lockchild_" & chos.Name & ""
        s.putBuf "     deallocate lockchild_" & chos.Name & " "
        s.putBuf "     return"
        s.putBuf "   end  "
        s.putBuf " end   "
        
        ' или еще глубже
        s.putBuf " exec " & chos.Name & "_HCL @cursession,@childlistid,@isLocked out"
        s.putBuf " if @isLocked >2 begin"
        s.putBuf "   close lockchild_" & chos.Name & ""
        s.putBuf "   deallocate lockchild_" & chos.Name & " "
        s.putBuf "   return"
        s.putBuf " end"
        
        s.putBuf " fetch next from lockchild_" & chos.Name & " into @childlistid"
        s.putBuf "end"
        s.putBuf "close lockchild_" & chos.Name & ""
        s.putBuf "deallocate lockchild_" & chos.Name & " "
      End If
    Next
    s.putBuf " end "
    s.putBuf "set @IsLocked =0"
  End If
  s.putBuf "end"
  s.putBuf "go"
  If (OptRights) Then
  s.putBuf "revoke all on [dbo].[" & obt.Name & "_HCL] to [public]"
  s.putBuf "go"
  s.putBuf "grant execute on [dbo].[" & obt.Name & "_HCL] to [public]"
  s.putBuf "go"
  End If
  
    
  ' register root structure of object as child of instance
  s.putBuf procDropSQL(obt.Name & "_propagate")
  s.putBuf "create proc " & obt.Name & "_propagate(@cursession uniqueidentifier, @ROWID uniqueidentifier) as  "
  s.putBuf "declare @ObjType as varchar(255)"
  s.putBuf "declare @tmpStr as varchar(255)"
  
  s.putBuf "select  @ObjType =objtype from instance with(nolock) where instanceid=@Rowid"
  s.putBuf "if @objtype = '" & obt.Name & "'"
  s.putBuf " begin"
  
  If obt.PART.Count = 0 Then
    s.putBuf "   select 1 '  do nothng"
    s.putBuf " end"
  Else
    s.putBuf "if @@nestlevel < 30  begin"
    s.putBuf "declare @childlistid uniqueidentifier"
    s.putBuf "declare @ssid uniqueidentifier"
    s.putBuf " select @SSID = securitystyleid from instance with(nolock) where instanceid=@RowID"
    For i = 1 To obt.PART.Count
      Set chos = obt.PART.Item(i)
      If Not chos.PartType = PartType_Rassirenie Then
        s.putBuf "declare propchild_" & chos.Name & " cursor local for select " & chos.Name & "." & chos.Name & "id from " & chos.Name & " where  " & chos.Name & ".InstanceID = @rowid"
        s.putBuf "open propchild_" & chos.Name & ""
        s.putBuf "fetch next from propchild_" & chos.Name & " into @childlistid"
        s.putBuf "while @@fetch_status >=0 "
        s.putBuf "begin"
        s.putBuf " exec " & chos.Name & "_SINIT @cursession,@childlistid,@ssid"
        s.putBuf " exec " & chos.Name & "_propagate @cursession,@childlistid"
        s.putBuf " fetch next from propchild_" & chos.Name & " into @childlistid"
        s.putBuf "end"
        s.putBuf "close propchild_" & chos.Name & ""
        s.putBuf "deallocate propchild_" & chos.Name & " "
      End If
    Next
    s.putBuf " end "
  End If
  
  s.putBuf "end"
  s.putBuf "go"
  If (OptRights) Then
  s.putBuf "revoke all on [dbo].[" & obt.Name & "_propagate] to [public]"
  s.putBuf "go"
  s.putBuf "grant execute on [dbo].[" & obt.Name & "_propagate] to [public]"
  s.putBuf "go"
  End If

    
  
  log = log & vbCrLf & "Create common procs for type " & obt.Name
  o.Module = "--Procs"
  o.Block = "--body"
  o.OutNL s.getBuf
  o.OutNL "GO"
  DebugOutput "FBGEN.CreateTypeProcs:done " & obt.the_comment
  Set s = Nothing
End Sub


Private Sub MakeAllViews(ppart As PART, Optional IsInstanceCol As Boolean = False)
  DebugOutput "FBGEN.MakeAllViews:start " & ppart.Caption
  If ppart.PartType = PartType_Rassirenie Then
    DebugOutput "FBGEN.MakeAllViews:skipped " & ppart.Caption
    Exit Sub
  End If
  
  Dim i As Long
  
  For i = 1 To ppart.PARTVIEW.Count
    MakeViews ppart.PARTVIEW.Item(i), IsInstanceCol
  Next
  DebugOutput "FBGEN.MakeAllViews:children " & ppart.Caption
  
  For i = 1 To ppart.PART.Count
    MakeAllViews ppart.PART.Item(i)
  Next
  DebugOutput "FBGEN.MakeAllViews:done " & ppart.Caption
End Sub


Private Sub MakeViews(pv As PARTVIEW, Optional IsInstanceCol As Boolean = False)
  DebugOutput "FBGEN.MakeViews:start " & pv.Name
  
  Dim s As Writer
  Dim ot As OBJECTTYPE
  Dim BP As PART
  Dim p As PART
  Dim refp As PART
  Dim f As FIELD
  Dim ft As FIELDTYPE
  Dim root As PART
  Dim vc As ViewColumn
  Dim i As Long, j As Long
  Dim from As String, group As String, fltr As String
  from = "": group = "": fltr = ""
  'point#
  Dim noagg As Long, isButton As Boolean
  isButton = False
  Dim structfld As String
  On Error GoTo bye
  
  Set BP = pv.Parent.Parent
  
  Set s = New Writer
  
  ' найти раздел первого уровня и построить цепочку прямых join
  Set root = BP
  from = " from " & BP.Name
  structfld = BP.Name & "ID"
  While TypeName(root.Parent.Parent) <> "OBJECTTYPE"
    from = from & vbCrLf & " join " & root.Parent.Parent.Name & " with(nolock) on " & root.Parent.Parent.Name & "." & root.Parent.Parent.Name & "ID=" & root.Name & ".ParentStructRowID "
    structfld = structfld & ", " & root.Parent.Parent.Name & "ID"
    Set root = root.Parent.Parent
  Wend
  
  If Not IsInstanceCol Then
    from = from & vbCrLf & " join INSTANCE with(nolock) on " & root.Name & ".INSTANCEID=INSTANCE.INSTANCEID"
  End If
  'from = from & vbCrLf & " left join objstatus XXXMYSTATUSXXX with(nolock) on instance.status=XXXMYSTATUSXXX.objstatusid"
  
  fltr = ""
  If pv.FilterField0 <> "" Then fltr = fltr & vbCrLf & " and " & pv.FilterField0
  If pv.FilterField1 <> "" Then fltr = fltr & vbCrLf & " and " & pv.FilterField1
  If pv.FilterField2 <> "" Then fltr = fltr & vbCrLf & " and " & pv.FilterField2
  If pv.FilterField3 <> "" Then fltr = fltr & vbCrLf & " and " & pv.FilterField3
  If fltr <> "" Then fltr = " where 1=1 " & fltr
  
  group = " group by " & root.Name & ".InstanceID, " & BP.Name & "." & BP.Name & "ID "
  
  ' стандартное начало
  s.putBuf viewDropSQL("V_" & pv.the_Alias)
  s.putBuf "create view V_" & pv.the_Alias & " as "
  s.putBuf "select " & structfld
  Dim fcnt As Long
  fcnt = 0
  For i = 1 To pv.ViewColumn.Count
    Set vc = pv.ViewColumn.Item(i)
    Set p = vc.FromPart
    Set f = vc.FIELD
    If f Is Nothing Then
      If vc.Expression <> "" Then s.putBuf ", " & vc.Expression & " as " & vc.the_Alias
      noagg = noagg + 1
    Else
      Set ft = f.FIELDTYPE
      If ft.TypeStyle = TypeStyle_Element_oformleniy Then isButton = True
      
      If Not (p Is Nothing) And Not (f Is Nothing) And ft.TypeStyle <> TypeStyle_Element_oformleniy Then
        fcnt = fcnt + 1
'      If fcnt > 1 Then
        s.putBuf ", "
'      End If
        If vc.Aggregation = AggregationType_none Then
          If ft.TypeStyle = TypeStyle_Perecislenie Then
            ' вписываем значение перечсления
            s.putBuf " " & p.Name & "." & f.Name & "  "
            s.putBuf vc.the_Alias & "_VAL, "
            
            ' и его расшифровку
            s.putBuf " case " & p.Name & "." & f.Name & " "
            For j = 1 To ft.ENUMITEM.Count
              s.putBuf "when " & ft.ENUMITEM.Item(j).NameValue & " then '" & ft.ENUMITEM.Item(j).Name & "'"
            Next
            s.putBuf " end "
          ElseIf ft.TypeStyle = TypeStyle_Ssilka Then
            If (ft.Name = "ReferenceSQL") Then
                s.putBuf " dbo.GetBriefFromXML(" & p.Name & "." & f.Name & ") "
            Else
               ' вписываем значение ссылки
              s.putBuf " " & p.Name & "." & f.Name & "  "
              s.putBuf vc.the_Alias & "_ID, "
              ' и расшифрованное значение
              If f.ReferenceType = ReferenceType_Na_ob_ekt_ Then
                Dim b_ As Boolean: b_ = False
                If Not f.RefToType Is Nothing Then
                  Dim reft As OBJECTTYPE
                  Set reft = f.RefToType
                  If reft.IsDenormalOBJ = Boolean_Da Then b_ = True
                  Set reft = Nothing
                End If
                If b_ Then
                  s.putBuf " " & p.Name & "." & f.Name & "_BRIEF "
                Else
                  s.putBuf " dbo.INSTANCE_BRIEF_F(" & p.Name & "." & f.Name & ") "
                End If
              ElseIf f.ReferenceType = ReferenceType_Na_stroku_razdela Then
                Set refp = f.RefToPart
                If refp.IsDenormal = Boolean_Da Then
                  s.putBuf " " & p.Name & "." & f.Name & "_BRIEF"
                Else
                  s.putBuf " dbo." & refp.Name & "_BRIEF_F(" & p.Name & "." & f.Name & ") "
                End If
              Else
                s.putBuf p.Name & "." & f.Name & " "
              End If
            End If
          Else
            s.putBuf p.Name & "." & f.Name & " "
          End If
          noagg = noagg + 1
          group = group & vbCrLf & "," & p.Name & "." & f.Name & " "
        ElseIf vc.Aggregation = AggregationType_MAX Then
           s.putBuf "MAX(" & p.Name & "." & f.Name & ") "
        ElseIf vc.Aggregation = AggregationType_MIN Then
          s.putBuf "MIN(" & p.Name & "." & f.Name & ") "
        ElseIf vc.Aggregation = AggregationType_AVG Then
          s.putBuf "AVG(" & p.Name & "." & f.Name & ") "
        ElseIf vc.Aggregation = AggregationType_SUM Then
          s.putBuf "SUM(" & p.Name & "." & f.Name & ") "
        ElseIf vc.Aggregation = AggregationType_COUNT Then
          s.putBuf "COUNT(" & p.Name & "." & f.Name & ") "
        End If
        s.putBuf vc.the_Alias & " "
      Dim isOK As Boolean
      
          If BP.ID = p.Parent.Parent.ID Then
            isOK = False
            
            ' проверяем поля, которые входят в раздел
            For j = 1 To i - 1
            
              If pv.ViewColumn.Item(j).FromPart.ID = p.ID Then
                isOK = True
                Exit For
              End If
            Next
            
            ' если в разделе есть поля, то включаем его в запрос
          If Not isOK Then
            from = from & vbCrLf & " left join " & p.Name & " with(nolock) on " & BP.Name & "." & BP.Name & "ID = " & p.Name & ".ParentStructRowID"
          End If
        End If
        
        
        ' проверяем верхние разделы, которые не  являются непосредственными родителями нашего базового раздела
        If TypeName(p.Parent.Parent) = "OBJECTTYPE" And (p.ID <> root.ID) Then
          isOK = False
          For j = 1 To i - 1
            If pv.ViewColumn.Item(j).FromPart.ID = p.ID Then
              isOK = True
              Exit For
            End If
          Next
          ' есть поля из верхнего раздела
          If Not isOK Then
            from = from & vbCrLf & " left join " & p.Name & " with(nolock) ON " & p.Name & ".InstanceID=" & root.Name & ".InstanceID"
          End If
        End If
      Else
        log = log & vbCrLf & "ERROR-->Ошибка определения запроса:" & pv.Name & "(" & pv.the_Alias & ")" & " колонка: " & vc.the_Alias & " - не задан раздел, или поле.<--ERROR"
      End If
    End If
  Next
  If fcnt > 0 Then
    s.putBuf ", " & root.Name & ".InstanceID InstanceID "
  Else
    s.putBuf " " & root.Name & ".InstanceID InstanceID "
  End If
  
  s.putBuf ", " & BP.Name & "." & BP.Name & "ID ID "
  s.putBuf ", '" & BP.Name & "' VIEWBASE "
  If Not IsInstanceCol Then
    s.putBuf ", INSTANCE.StatusName StatusName "
    s.putBuf ", INSTANCE.status INTSANCEStatusID"
  Else
    s.putBuf ", ObjectStatusName StatusName "
    s.putBuf ", ObjectStatus INTSANCEStatusID"
  End If
  's.putBuf ", XXXMYSTATUSXXX.Name StatusName "
  's.putBuf ", XXXMYSTATUSXXX.objstatusid INTSANCEStatusID"
  
  ' if no aggregations - no group by
  If noagg = pv.ViewColumn.Count Then group = ""
  If isButton Then group = ""
  
  o.Module = "--Views--"
  o.Block = "--Views--"
  o.OutNL s.getBuf & vbCrLf & from & vbCrLf & fltr & vbCrLf & group
  o.OutNL "GO"
  
  If (OptRights) Then
    o.OutNL "revoke all on [dbo].[V_" & pv.the_Alias & "] to [public]"
    o.OutNL "go"
    o.OutNL "grant select on [dbo].[V_" & pv.the_Alias & "] to [public]"
    o.OutNL "go"
  End If
  
  Set s = Nothing
  DebugOutput "FBGEN.MakeViews:done " & pv.Name
  Exit Sub
bye:
  log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
  Debug.Print "ERROR-->" & Err.Description & "<--ERROR (KEY:7kjdhfskufyer)"
  Set s = Nothing
End Sub


Private Function IsParent(p As PART, Parent As String) As Boolean
  Dim o  As Object
  Set o = p
  While TypeName(o) <> "OBJECTTYPE"
    Set o = o.Parent.Parent
    If o.ID = Parent Then
      IsParent = True
      Exit Function
    End If
  Wend
  IsParent = False

End Function

' создаем view для журналов
Private Sub MakeJournals()
'  DebugOutput "FBGEN.MakeJournals:start "
'  Dim jr As Jounal
'  Dim jc As JournalColumn
'  Dim js As JournalSrc
'  Dim jcs As JColumnSource
'  Dim s As String, out As String
'
'  Dim i As Long, j As Long, k As Long, l As Long, NoCol As Boolean
'  For i = 1 To m.Jounal.Count
'    Set jr = m.Jounal.Item(i)
'    s = "create view J_" & jr.Name & " as  " & vbCrLf
'    For j = 1 To jr.JournalSrc.Count
'      Set js = jr.JournalSrc.Item(j)
'      If j > 1 Then s = s & vbCrLf & " union all " & vbCrLf
'      s = s & vbCrLf & " select InstanceID, ID, VIEWBASE "
'      For k = 1 To jr.JournalColumn.Count
'        NoCol = True
'        Set jc = jr.JournalColumn.Item(k)
'        For l = 1 To jc.JColumnSource.Count
'          Set jcs = jc.JColumnSource.Item(l)
'          If jcs.SrcPartView.ID = js.ID Then
'            s = s & vbCrLf & ", " & jcs.ViewField & " /* " & jc.Name & " */ "
'            NoCol = False
'          End If
'        Next l
'        If NoCol Then
'            s = s & vbCrLf & ", null /* " & jc.Name & " */ "
'        End If
'      Next k
'      s = s & vbCrLf & " from V_" & js.PARTVIEW.the_Alias
'
'    Next j
'    o.Module = "--Journals--"
'    o.Block = "--Journals--"
'    o.OutNL s
'    o.OutNL "GO"
'  Next i
'  DebugOutput "FBGEN.MakeJournals:done "
End Sub



Private Sub CreateV2Proc(os As PART)
DebugOutput "FBGEN.CreateV2Proc:start " & os.Caption
If os.PartType = PartType_Rassirenie Then
    DebugOutput "FBGEN.CreateV2Proc:skipped " & os.Caption
    Exit Sub
End If

Dim st As PART
Set st = os
Dim chos As PART, i As Integer
Dim s As Writer
Set s = New Writer

DoEvents
log = log & vbCrLf & "-->CreateV2Proc " & os.Name

On Error GoTo bye


s.putBuf procDropSQL(os.Name & "_PARENT")
s.putBuf "create proc " & os.Name & "_PARENT /*" & os.the_comment & "*/ ("
s.putBuf " @CURSESSION uniqueidentifier,"
s.putBuf " @RowID uniqueidentifier ,"
s.putBuf " @ParentID uniqueidentifier output,"
s.putBuf " @ParentTable varchar(255) output"

s.putBuf ") as " & " begin  "

s.putBuf "set nocount on"


s.putBuf " -- checking session  --"
s.putBuf "if not exists( select 1 from the_session where the_sessionid=@cursession and closed=0 )"
s.putBuf "  begin"
s.putBuf "    raiserror('Сессия уже завершена.',16,1)"
s.putBuf "    return"
s.putBuf "  end"

'  If os.PartType = PartType_Derevo Then
'      ' дерево - родительская связь
'      s.putbuf "  select @ParentID = ParentRowid from " & os.Name & " where  " & os.Name & "id=@RowID"
'      s.putbuf "  IF @ParentID IS NULL"
'      s.putbuf "  BEGIN"
'
'      ' переходим границы раздела
'      If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
'        s.putbuf "  set @ParentTable = 'INSTANCE'"
'        s.putbuf "  select @ParentID = INSTANCEID from " & os.Name & " where  " & os.Name & "id=@RowID"
'      Else
'        s.putbuf "  select @ParentID = ParentStructRowID from " & os.Name & " where  " & os.Name & "id=@RowID"
'        s.putbuf "  set @ParentTable = '" & os.Parent.Parent.Name & "'"
'      End If
'
'      s.putbuf "  END"
'      s.putbuf "  else"
'      s.putbuf "  BEGIN"
'      s.putbuf "    set @ParentTable = '" & os.Name & "'"
'      s.putbuf "  END"
'  Else
    If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
      s.putBuf "  set @ParentTable = 'INSTANCE'"
      s.putBuf "  select @ParentID = INSTANCEID from " & os.Name & " where  " & os.Name & "id=@RowID"
    Else
  
      s.putBuf "  select @ParentID = ParentStructRowID from " & os.Name & " where  " & os.Name & "id=@RowID"
      s.putBuf "  set @ParentTable = '" & os.Parent.Parent.Name & "'"
    End If
 ' End If

s.putBuf " end "
s.putBuf "go"
If (OptRights) Then
s.putBuf "revoke all on [dbo].[" & os.Name & "_PARENT] to [public]"
s.putBuf "go"
s.putBuf "grant execute on [dbo].[" & os.Name & "_PARENT] to [public]"
s.putBuf "go"
End If




o.Module = "--Procedures"
o.Block = "--TableProc"
o.OutNL s.getBuf
o.OutNL "GO"



'------------------------------- IsLockED ----------------------------------------------
Set s = Nothing
Set s = New Writer
s.putBuf procDropSQL(os.Name & "_ISLOCKED")
s.putBuf "create proc " & os.Name & "_ISLOCKED /*" & os.the_comment & "*/ ("
s.putBuf " @CURSESSION uniqueidentifier,"
s.putBuf " @RowID uniqueidentifier ,"
s.putBuf " @IsLocked integer output"
s.putBuf ") as " & " begin  "
s.putBuf "set nocount on"
s.putBuf " declare @ParentID uniqueidentifier"
s.putBuf " declare @UserID uniqueidentifier"
s.putBuf " declare @LockUserID uniqueidentifier"
s.putBuf " declare @LockSessionID uniqueidentifier"
s.putBuf " declare @ParentTable varchar(255) "

s.putBuf " set @isLocked = 0"
s.putBuf " -- checking session  --"
s.putBuf "if not exists( select 1 from the_session where the_sessionid=@cursession and closed=0 )"
s.putBuf "  begin"
s.putBuf "    raiserror('Сессия уже завершена.',16,1)"
s.putBuf "    return"
s.putBuf "  end"

s.putBuf " select @userID = usersid  from the_session where the_sessionid=@cursession"
s.putBuf " select @LockUserID = LockUserID,@LockSessionID = LockSessionID from " & os.Name & " where " & os.Name & "id=@RowID"
s.putBuf " /* verify this row */"
s.putBuf " if not @LockUserID is null  "
s.putBuf " begin   "
s.putBuf "   if  @LockUserID <> @userID  "
s.putBuf "   begin   "
s.putBuf "     set @isLocked = 4 /* CheckOut by another user */"
s.putBuf "     return"
s.putBuf "   end   else "
s.putBuf "   begin   "
s.putBuf "     set @isLocked = 2 /* CheckOut by caller */"
s.putBuf "     return"
s.putBuf "   end   "
s.putBuf " end   "

s.putBuf " if not @LockSessionID is null  "
s.putBuf " begin   "
s.putBuf "   if  @LockSessionID <> @CURSESSION  "
s.putBuf "   begin   "
s.putBuf "     set @isLocked = 3 /* Lockes by another user */"
s.putBuf "     return"
s.putBuf "   end   else "
s.putBuf "   begin   "
s.putBuf "     set @isLocked = 1 /* Locked by caller */"
s.putBuf "     return"
s.putBuf "   end   "
s.putBuf " end   "

s.putBuf " set @isLocked = 0 "
s.putBuf "if @@nestlevel <25 begin"
s.putBuf "  declare @s nvarchar(4000)"
s.putBuf "  exec " & os.Name & "_parent @CURSESSION,@ROWID,@ParentID output ,@ParentTable output"
s.putBuf "  set @s = N' exec ' + @PARENTTABLE + N'_islocked @cursession,@rowid,@islocked OUTPUT'"
s.putBuf "  exec sp_executesql @s,N'@CURSESSION uniqueidentifier ,@RowID uniqueidentifier,@IsLocked int out',@CURSESSION,@ParentID ,@ISLocked output"
s.putBuf "end"
s.putBuf " end "
s.putBuf " go"
If (OptRights) Then
s.putBuf "revoke all on [dbo].[" & os.Name & "_ISLOCKED] to [public]"
s.putBuf "go"
s.putBuf "grant execute on [dbo].[" & os.Name & "_ISLOCKED] to [public]"
s.putBuf "go"
End If

o.Module = "--Procedures"
o.Block = "--TableProc"
o.OutNL s.getBuf
o.OutNL "GO"

'--------------------------- Блокируем запись
Set s = Nothing
Set s = New Writer
s.putBuf procDropSQL(os.Name & "_LOCK")
s.putBuf "create proc " & os.Name & "_LOCK /*" & os.the_comment & "*/ ("
s.putBuf " @CURSESSION uniqueidentifier,"
s.putBuf " @RowID uniqueidentifier ,"
s.putBuf " @LockMode integer "
s.putBuf ") as " & " begin  "
s.putBuf "set nocount on"
s.putBuf " declare @ParentID uniqueidentifier"
s.putBuf " declare @UserID uniqueidentifier"
s.putBuf " declare @tmpID uniqueidentifier"
s.putBuf " declare @access integer"
s.putBuf " declare @IsLocked integer"
s.putBuf " declare @ParentTable varchar(255) "

s.putBuf " -- checking session  --"
s.putBuf "if not exists( select 1 from the_session where the_sessionid=@cursession and closed=0 )"
s.putBuf "  begin"
s.putBuf "    raiserror('Сессия уже завершена.',16,1)"
s.putBuf "    return"
s.putBuf "  end"

s.putBuf " select @userID = usersid  from the_session where the_sessionid=@cursession"
s.putBuf " exec " & os.Name & "_ISLOCKED @CURSESSION,@ROWID,@ISLocked out"
s.putBuf " if @IsLocked >=3  "
s.putBuf "  begin"
s.putBuf "    raiserror('Строка заблокирована другим пользователем',16,1)"
s.putBuf "    return"
s.putBuf "  end"

s.putBuf " if @IsLocked =0  "
s.putBuf " begin"
s.putBuf "  exec " & os.Name & "_HCL @cursession,@RowID,@isLocked out"
s.putBuf "  if @IsLocked >=3  "
s.putBuf "   begin"
s.putBuf "     raiserror('У данной строки имеются дочерние строки, которые заблокированы другим пользователем',16,1)"
s.putBuf "     return"
s.putBuf "   end"
s.putBuf " end"


s.putBuf " select  @tmpID =SecurityStyleID from " & os.Name & " where " & os.Name & "id=@ROWID"
s.putBuf " exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='LOCKROW',@access=@access out "
s.putBuf " if @access=0 "
s.putBuf "  begin"
s.putBuf "    raiserror('Нет прав на блокировку строк. Раздел=" & os.Name & "',16,1)"
s.putBuf "    if @@trancount>0 rollback tran"
s.putBuf "    return"
s.putBuf "  end"



s.putBuf "   if  @LockMode =2  "
s.putBuf "   begin   "
s.putBuf "    update " & os.Name & " set LockUserID =@userID ,LockSessionID =null where " & os.Name & "id=@RowID"
s.putBuf "     return"
s.putBuf "   end "

s.putBuf "   if  @LockMode =1  "
s.putBuf "   begin   "
s.putBuf "    update " & os.Name & " set LockUserID =null,LockSessionID =@CURSESSION  where " & os.Name & "id=@RowID"
s.putBuf "     return"
s.putBuf "   end "

s.putBuf " end "
s.putBuf " go "
If (OptRights) Then
s.putBuf "revoke all on [dbo].[" & os.Name & "_LOCK] to [public]"
s.putBuf "go"
s.putBuf "grant execute on [dbo].[" & os.Name & "_LOCK] to [public]"
s.putBuf "go"
End If


o.Module = "--Procedures"
o.Block = "--TableProc"
o.OutNL s.getBuf
o.OutNL "GO"


'--------------------------- HCL - Has Children Locked

Set s = Nothing
Set s = New Writer
s.putBuf procDropSQL(os.Name & "_HCL")
s.putBuf "create proc " & os.Name & "_HCL /*" & os.the_comment & "*/ ("
s.putBuf " @CURSESSION uniqueidentifier,"
s.putBuf " @RowID uniqueidentifier ,"
s.putBuf " @IsLocked integer out"
s.putBuf ") as " & " begin  "
s.putBuf "set nocount on"

'---- проверяем, что нет заблокированных записей в  дочерних разделах
  s.putBuf "declare @childlistid uniqueidentifier"
  s.putBuf " declare @UserID uniqueidentifier"
  s.putBuf " declare @LockUserID uniqueidentifier"
  s.putBuf " declare @LockSessionID uniqueidentifier"
  s.putBuf " select @userID = usersid  from the_session where the_sessionid=@cursession"
  
  If os.PART.Count > 0 Then
    s.putBuf "-- verify child locks"
  End If

  For i = 1 To os.PART.Count
    Set chos = os.PART.Item(i)
    If Not chos.PartType = PartType_Rassirenie Then
        s.putBuf "declare lockchild_" & chos.Name & " cursor local for select " & chos.Name & "." & chos.Name & "id from " & chos.Name & " where  " & chos.Name & ".ParentStructRowID = @Rowid"
        s.putBuf "open lockchild_" & chos.Name & ""
        s.putBuf "fetch next from lockchild_" & chos.Name & " into @childlistid"
        s.putBuf "while @@fetch_status >=0 "
        s.putBuf "begin"
        
        ' если в дочернем разделе есть заблокированная строка
        s.putBuf " select @LockUserID = LockUserID,@LockSessionID = LockSessionID from " & chos.Name & " where " & chos.Name & "id=@childlistid"
        s.putBuf " /* verify this row */"
        s.putBuf " if not @LockUserID is null  "
        s.putBuf " begin   "
        s.putBuf "   if  @LockUserID <> @userID  "
        s.putBuf "   begin   "
        s.putBuf "     set @isLocked = 4 /* CheckOut by another user */"
        s.putBuf "     close lockchild_" & chos.Name & ""
        s.putBuf "     deallocate lockchild_" & chos.Name & " "
        s.putBuf "     return"
        s.putBuf "   end   "
        s.putBuf " end   "
        s.putBuf " if not @LockSessionID is null  "
        s.putBuf " begin   "
        s.putBuf "   if  @LockSessionID <> @CURSESSION  "
        s.putBuf "   begin   "
        s.putBuf "     set @isLocked = 3 /* Lockes by another user */"
        s.putBuf "     close lockchild_" & chos.Name & ""
        s.putBuf "     deallocate lockchild_" & chos.Name & " "
        s.putBuf "     return"
        s.putBuf "   end  "
        s.putBuf " end   "
        
        ' или еще глубже
        s.putBuf "if @@nestlevel <25 begin"
        s.putBuf " exec " & chos.Name & "_HCL @cursession,@childlistid,@isLocked out"
        s.putBuf " if @isLocked >2 begin"
        s.putBuf "   close lockchild_" & chos.Name & ""
        s.putBuf "   deallocate lockchild_" & chos.Name & " "
        s.putBuf "   return"
        s.putBuf " end"
        s.putBuf "end"
        
        s.putBuf " fetch next from lockchild_" & chos.Name & " into @childlistid"
        s.putBuf "end"
        s.putBuf "close lockchild_" & chos.Name & ""
        s.putBuf "deallocate lockchild_" & chos.Name & " "
    End If
  Next
  s.putBuf "set @IsLocked =0"
  s.putBuf "end"
  s.putBuf "go"
  If (OptRights) Then
  s.putBuf "revoke all on [dbo].[" & os.Name & "_HCL] to [public]"
  s.putBuf "go"
  s.putBuf "grant execute on [dbo].[" & os.Name & "_HCL] to [public]"
  s.putBuf "go"
  End If

  
o.Module = "--Procedures"
o.Block = "--TableProc"
o.OutNL s.getBuf
o.OutNL "GO"


'--------------------------- Разблокируем запись
Set s = Nothing
Set s = New Writer
s.putBuf procDropSQL(os.Name & "_UNLOCK")
s.putBuf "create proc " & os.Name & "_UNLOCK /*" & os.the_comment & "*/ ("
s.putBuf " @CURSESSION uniqueidentifier,"
s.putBuf " @RowID uniqueidentifier "
s.putBuf ") as " & " begin  "
s.putBuf "set nocount on"
s.putBuf " declare @ParentID uniqueidentifier"
s.putBuf " declare @UserID uniqueidentifier"
s.putBuf " declare @IsLocked integer"
s.putBuf " declare @ParentTable varchar(255) "

s.putBuf " -- checking session  --"
s.putBuf "if not exists( select 1 from the_session where the_sessionid=@cursession and closed=0 )"
s.putBuf "  begin"
s.putBuf "    raiserror('Сессия уже завершена.',16,1)"
s.putBuf "    return"
s.putBuf "  end"

s.putBuf " select @userID = usersid  from the_session where the_sessionid=@cursession"
s.putBuf " exec " & os.Name & "_ISLOCKED @CURSESSION,@ROWID,@ISLocked out"
s.putBuf " if @IsLocked >=3  "
s.putBuf "  begin"
s.putBuf "    raiserror('Строка заблоирована другим пользователем',16,1)"
s.putBuf "    return"
s.putBuf "  end"

s.putBuf "   if  @IsLocked =2  "
s.putBuf "   begin   "
s.putBuf "    update " & os.Name & " set LockUserID =null  where " & os.Name & "id=@RowID"
s.putBuf "     return"
s.putBuf "   end "

s.putBuf "   if  @IsLocked =1  "
s.putBuf "   begin   "
s.putBuf "    update " & os.Name & " set LockSessionID =null  where " & os.Name & "id=@RowID"
s.putBuf "     return"
s.putBuf "   end "

s.putBuf " end "
s.putBuf "go"
If (OptRights) Then
s.putBuf "revoke all on [dbo].[" & os.Name & "_UNLOCK] to [public]"
s.putBuf "go"
s.putBuf "grant execute on [dbo].[" & os.Name & "_UNLOCK] to [public]"
s.putBuf "go"
End If


o.Module = "--Procedures"
o.Block = "--TableProc"
o.OutNL s.getBuf
o.OutNL "GO"



'--------------------------- Наследуем установки Security
Set s = Nothing
Set s = New Writer
s.putBuf procDropSQL(os.Name & "_SINIT")
s.putBuf "create proc " & os.Name & "_SINIT /*" & os.the_comment & "*/ ("
s.putBuf " @CURSESSION uniqueidentifier,"
s.putBuf " @RowID uniqueidentifier ,"
s.putBuf " @SecurityStyleID uniqueidentifier=null"
s.putBuf ") as " & " begin  "
s.putBuf "set nocount on"
s.putBuf " declare @ParentID uniqueidentifier"
s.putBuf " declare @ParentTable varchar(255) "
s.putBuf " declare @StyleID uniqueidentifier"


s.putBuf " declare @tmpID uniqueidentifier"
s.putBuf " declare @access integer"
s.putBuf " select  @tmpID =SecurityStyleID from " & os.Name & " where " & os.Name & "id=@ROWID"
s.putBuf " exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='SECURE',@access=@access out "
s.putBuf " if @access=0 "
s.putBuf "  begin"
s.putBuf "    raiserror('Нет прав на управление защитой. Раздел =" & os.Name & "',16,1)"
s.putBuf "    if @@trancount>0 rollback tran"
s.putBuf "    return"
s.putBuf "  end"

s.putBuf "if @SecurityStyleID is null begin "



s.putBuf "/* extract style from parent */"
s.putBuf "declare @s nvarchar(4000)"
s.putBuf " exec " & os.Name & "_parent @CURSESSION,@ROWID,@ParentID output ,@ParentTable output"
s.putBuf " set @s = N'select @StyleID =SecurityStyleID from ' +@ParentTable +N' where ' +@ParentTable + N'id=@Parentid'"
s.putBuf "  exec sp_executesql @s,N'@StyleID uniqueidentifier out,@ParentTable varchar(255),@Parentid uniqueidentifier',@StyleID  out,@ParentTable ,@Parentid"
s.putBuf " update " & os.Name & " set securitystyleid =@StyleID where " & os.Name & "id = @RowID"
s.putBuf "end else begin "
s.putBuf " update " & os.Name & " set securitystyleid =@SecurityStyleID where " & os.Name & "id = @RowID"
s.putBuf "end  "
s.putBuf "end  "

s.putBuf "go"
If (OptRights) Then
s.putBuf "revoke all on [dbo].[" & os.Name & "_SINIT] to [public]"
s.putBuf "go"
s.putBuf "grant execute on [dbo].[" & os.Name & "_SINIT] to [public]"
s.putBuf "go"
End If


o.Module = "--Procedures"
o.Block = "--TableProc"
o.OutNL s.getBuf
o.OutNL "GO"


'--------------------------- распространение прав на дочерние объекты
Set s = Nothing
Set s = New Writer
s.putBuf procDropSQL(os.Name & "_propagate")
s.putBuf "create proc " & os.Name & "_propagate /*" & os.the_comment & "*/ ("
s.putBuf " @CURSESSION uniqueidentifier,"
s.putBuf " @RowID uniqueidentifier"
s.putBuf ") as " & " begin  "
s.putBuf "set nocount on"
  s.putBuf "declare @childlistid uniqueidentifier"
  s.putBuf "declare @SSID uniqueidentifier"
  s.putBuf "select @SSID = securityStyleid from " & os.Name & " where " & os.Name & "id=@Rowid"

  For i = 1 To os.PART.Count
    Set chos = os.PART.Item(i)
    If Not chos.PartType = PartType_Rassirenie Then
        s.putBuf "declare propchild_" & chos.Name & " cursor local for select " & chos.Name & "." & chos.Name & "id from " & chos.Name & " where  " & chos.Name & ".ParentStructRowID = @Rowid"
        s.putBuf "open propchild_" & chos.Name & ""
        s.putBuf "fetch next from propchild_" & chos.Name & " into @childlistid"
        s.putBuf "while @@fetch_status >=0 "
        s.putBuf "begin"
        s.putBuf " exec " & chos.Name & "_SINIT @cursession,@childlistid,@ssid"
        s.putBuf " if @@nestlevel <30 "
        s.putBuf "   exec " & chos.Name & "_propagate @cursession,@childlistid"
        s.putBuf " fetch next from propchild_" & chos.Name & " into @childlistid"
        s.putBuf "end"
        s.putBuf "close propchild_" & chos.Name & ""
        s.putBuf "deallocate propchild_" & chos.Name & " "
    End If
  Next
  s.putBuf "end"
  s.putBuf "go"
  If (OptRights) Then
  s.putBuf "revoke all on [dbo].[" & os.Name & "_propagate]  to [public]"
  s.putBuf "go"
  s.putBuf "grant execute on [dbo].[" & os.Name & "_propagate]  to [public]"
  s.putBuf "go"
  End If

  
o.Module = "--Procedures"
o.Block = "--TableProc"
o.OutNL s.getBuf
o.OutNL "GO"




DebugOutput "FBGEN.CreateV2Proc:children " & os.Caption
Debug.Print "### - " & os.Caption
For i = 1 To os.PART.Count
  Set chos = os.PART.Item(i)
  CreateV2Proc chos
Next
DebugOutput "FBGEN.CreateV2Proc:done " & os.Caption
Set s = Nothing

Exit Sub
bye:
log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
'Resume
Set s = Nothing
End Sub




Private Sub LoadMap()
  Dim ff As Integer
  Dim ID1S As String, IDMTZ As String
  Dim idm As IDMAP
  ff = FreeFile
  Set map = New Collection
  On Error GoTo bye
  Open App.Path & "\IDMAP.txt" For Input As #ff
  While Not EOF(ff)
    Input #ff, ID1S, IDMTZ
    Set idm = New IDMAP
    If ID1S <> "" Then
      idm.ID1S = ID1S
      idm.IDMTZ = IDMTZ
      On Error Resume Next
      map.Add idm, ID1S
      On Error GoTo bye
    End If
  Wend
  Close #ff
bye:

End Sub

Private Sub SaveMap()
  Dim ff As Integer
  Dim idm As IDMAP
  ff = FreeFile
  
  Open App.Path & "\IDMAP.txt" For Output As #ff
  For Each idm In map
    Write #ff, idm.ID1S, idm.IDMTZ
  Next
  Close #ff
End Sub

Private Function GetMap(ID1S As String) As String
  Dim idm As IDMAP
  On Error Resume Next
  Set idm = Nothing
  Set idm = map.Item(ID1S)
  If idm Is Nothing Then
    Set idm = New IDMAP
    idm.ID1S = ID1S
    idm.IDMTZ = CreateGUID2
    map.Add idm, ID1S
  End If
 GetMap = idm.IDMTZ
End Function

Private Sub Class_Initialize()
  LoadMap
End Sub

Private Sub Class_Terminate()
  SaveMap
End Sub


Private Function ColumnDropSQL(t As String, collist As String) As String
  Dim s As String
  s = "go"
  s = s & vbCrLf & "-- drop extra columns from generated table: " & t
  s = s & vbCrLf & "declare @n nvarchar(255)"
  s = s & vbCrLf & "declare @e_str nvarchar(4000)"
  s = s & vbCrLf & ""
  s = s & vbCrLf & "declare nnn cursor local for"
  s = s & vbCrLf & "  select name from syscolumns where id = object_id('" & t & "')"
  s = s & vbCrLf & "    and name not in(" & collist & ")"
  s = s & vbCrLf & ""
  s = s & vbCrLf & "open nnn fetch next from nnn into @n"
  s = s & vbCrLf & ""
  s = s & vbCrLf & "while @@fetch_status >=0"
  s = s & vbCrLf & "  begin"
  s = s & vbCrLf & "    Exec LTR_DropConstraint '" & t & "', @n"
  s = s & vbCrLf & "    set @e_str = N'alter table " & t & " drop column ' + @n"
  s = s & vbCrLf & "    exec sp_sqlexec @e_str"
  s = s & vbCrLf & "    fetch next from nnn into @n"
  s = s & vbCrLf & "  End"
  s = s & vbCrLf & ""
  s = s & vbCrLf & "Close nnn"
  s = s & vbCrLf & "deallocate nnn"
  s = s & vbCrLf & "go"
  ColumnDropSQL = s
End Function
