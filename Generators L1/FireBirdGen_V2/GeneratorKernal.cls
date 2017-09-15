VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "GeneratorKernal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Private Function GetView_v_INSTANCE() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
'  q = q & vbCrLf & "create view v_INSTANCE as"
'  q = q & vbCrLf & "  select instance.*, objstatus.name statusname, objstatus.IsArchive"
'  q = q & vbCrLf & "    from instance $VIEW$"
'  q = q & vbCrLf & "    left join objstatus $VIEW$ on instance.status = objstatus.objstatusid"
'  q = q & vbCrLf & "GO"
  
  q = q & vbCrLf & "create view v_INSTANCE as"
  q = q & vbCrLf & "  select *"
  q = q & vbCrLf & "    from instance $VIEW$"
  q = q & vbCrLf & "GO"
  
  GetView_v_INSTANCE = q
End Function

Private Function GetFunc_GetBriefFromXML() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
  q = q & vbCrLf & "create function GetBriefFromXML (@xmlSource varchar(4000))"
  q = q & vbCrLf & "  RETURNS VarChar(4000)"
  q = q & vbCrLf & "as begin"
  q = q & vbCrLf & "  declare @outstr as varchar(4000)"
  q = q & vbCrLf & "  declare @from as int"
  q = q & vbCrLf & "  declare @to as int"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "  select @from = CHARINDEX('<Brief>', @xmlSource)"
  q = q & vbCrLf & "  select @to = CHARINDEX('</Brief>', @xmlSource)"
  q = q & vbCrLf & "  if (@from > 0 AND @to > 0) begin"
  q = q & vbCrLf & "    select @outstr = substring(@xmlSource, @from + 7, @to - @from - 7)"
  q = q & vbCrLf & "  end else begin"
  q = q & vbCrLf & "    select @outstr = ''"
  q = q & vbCrLf & "  End"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "  return @outstr"
  q = q & vbCrLf & "End"
  q = q & vbCrLf & "go"
  
  GetFunc_GetBriefFromXML = q
End Function

Private Function GetFunc_GetIDFromXML() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
  q = q & vbCrLf & "create function GetIDFromXML (@xmlSource varchar(4000))"
  q = q & vbCrLf & "  RETURNS VarChar(4000)"
  q = q & vbCrLf & "as begin"
  q = q & vbCrLf & "  declare @outstr as varchar(4000)"
  q = q & vbCrLf & "  declare @from as int"
  q = q & vbCrLf & "  declare @to as int"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "  select @from = CHARINDEX('<ID>', @xmlSource)"
  q = q & vbCrLf & "  select @to = CHARINDEX('</ID>', @xmlSource)"
  q = q & vbCrLf & "  if (@from > 0 AND @to > 0) begin"
  q = q & vbCrLf & "    select @outstr = substring(@xmlSource, @from + 4, @to - @from - 4)"
  q = q & vbCrLf & "  end else begin"
  q = q & vbCrLf & "    select @outstr = ''"
  q = q & vbCrLf & "  End"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "  return @outstr"
  q = q & vbCrLf & "End"
  q = q & vbCrLf & "GO"
  
  GetFunc_GetIDFromXML = q
End Function

Private Function GetProc_GetData() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
  q = q & vbCrLf & "create proc GetData (@CURSESSION uniqueidentifier,@CurrentUser uniqueidentifier, @Query nvarchar(4000))"
  q = q & vbCrLf & "as begin"
  q = q & vbCrLf & "  set nocount on"
  q = q & vbCrLf & "  exec sp_executesql @Query"
  q = q & vbCrLf & "End"
  q = q & vbCrLf & "GO"
  
  GetProc_GetData = q
End Function

Private Function GetFunc_Instance_BRIEF_F() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
'  q = q & vbCrLf & "create function Instance_BRIEF_F ("
'  q = q & vbCrLf & "  @InstanceID uniqueidentifier"
'  q = q & vbCrLf & ") returns varchar(4000) as begin"
'  q = q & vbCrLf & "  declare @BRIEF varchar(4000)"
'  q = q & vbCrLf & "  if @InstanceID is null begin set @BRIEF='' return (@BRIEF) end"
'  q = q & vbCrLf & "  -- Brief body --"
'  q = q & vbCrLf & "  if exists(select 1 from instance where InstanceID=@InstanceID)"
'  q = q & vbCrLf & "    begin"
'  q = q & vbCrLf & "      set @BRIEF=''"
'  q = q & vbCrLf & "      select @BRIEF = @BRIEF + isnull(Name,' ')+'; '"
'  q = q & vbCrLf & "        from instance  where  InstanceID = @InstanceID"
'  q = q & vbCrLf & "    end"
'  q = q & vbCrLf & "  else"
'  q = q & vbCrLf & "    begin"
'  q = q & vbCrLf & "      set @BRIEF= 'неверный идентификатор'"
'  q = q & vbCrLf & "    End"
'  q = q & vbCrLf & "  set @BRIEF = left(@BRIEF,4000)"
'  q = q & vbCrLf & "  return (@BRIEF)"
'  q = q & vbCrLf & "End"
'  q = q & vbCrLf & ""
'  q = q & vbCrLf & "GO"
  
  q = q & vbCrLf & "create function instance_BRIEF_F  ("
  q = q & vbCrLf & "  @instanceid uniqueidentifier"
  q = q & vbCrLf & ") returns varchar(4000) as  begin"
  q = q & vbCrLf & "  declare @BRIEF varchar(4000)"
  q = q & vbCrLf & "  if @instanceid is null return('')"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "  if exists(select 1 from instance $PROC$ where instanceID = @instanceID)"
  q = q & vbCrLf & "    begin"
  q = q & vbCrLf & "      set @BRIEF = ''"
  q = q & vbCrLf & "      select @BRIEF = isnull(Name,'')"
  q = q & vbCrLf & "        from instance $PROC$ where instanceID = @instanceID"
  q = q & vbCrLf & "    End"
  q = q & vbCrLf & "  Else"
  q = q & vbCrLf & "    begin"
  q = q & vbCrLf & "      return('нет данных')"
  q = q & vbCrLf & "    End"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "  return (@BRIEF)"
  q = q & vbCrLf & "End"
  q = q & vbCrLf & "go"
  
  GetFunc_Instance_BRIEF_F = q
End Function

Private Function GetProc_Instance_OWNER() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
  q = q & vbCrLf & "create proc Instance_OWNER (@cursession uniqueidentifier, @InstanceID uniqueidentifier, @OwnerPartName varchar(255), @OwnerRowID uniqueidentifier)"
  q = q & vbCrLf & "as begin"
  q = q & vbCrLf & "  if exists(select 1 from instance where InstanceID = @InstanceID)"
  q = q & vbCrLf & "    if @OwnerPartName is null or @ownerRowID is null"
  q = q & vbCrLf & "      begin"
  q = q & vbCrLf & "        update instance set OwnerPartName=null, OwnerRowid = null where InstanceID=@InstanceID"
  q = q & vbCrLf & "      end"
  q = q & vbCrLf & "    Else"
  q = q & vbCrLf & "      begin"
  q = q & vbCrLf & "        update instance set OwnerPartName=@OwnerPartName, OwnerRowid = @OwnerRowID where InstanceID=@InstanceID"
  q = q & vbCrLf & "      End"
  q = q & vbCrLf & "End"
  q = q & vbCrLf & "go"
  
  GetProc_Instance_OWNER = q
End Function

Private Function GetProc_SysOptions_Save() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
  q = q & vbCrLf & "create proc SysOptions_Save ( @SysOptionsid uniqueidentifier, @Name varchar(255),@Value varchar (255), @OptionType varchar(255))"
  q = q & vbCrLf & "as begin"
  q = q & vbCrLf & "  if exists(select 1 from sysoptions where sysoptionsid = @sysoptionsid)"
  q = q & vbCrLf & "    update sysoptions set Name=@Name, Value=@Value, OptionType=@OptionType where sysoptionsid=@sysoptionsid"
  q = q & vbCrLf & "  Else"
  q = q & vbCrLf & "    insert into sysoptions (sysoptionsid, Name, Value, OptionType) values (@sysoptionsid,@Name,@Value,@OptionType)"
  q = q & vbCrLf & "  End"
  q = q & vbCrLf & "go"
  
  GetProc_SysOptions_Save = q
End Function

Private Function GetProc_Instance_Save() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
'  q = q & vbCrLf & "create proc Instance_Save ("
'  q = q & vbCrLf & "  @CURSESSION uniqueidentifier,"
'  q = q & vbCrLf & "  @InstanceID uniqueidentifier,"
'  q = q & vbCrLf & "  @ObjType varchar(255),"
'  q = q & vbCrLf & "  @Name varchar(255)"
'  q = q & vbCrLf & ") as begin"
'  q = q & vbCrLf & "  declare @tmpStr varchar(255)"
'  q = q & vbCrLf & "  declare @SSID uniqueidentifier"
'  q = q & vbCrLf & "  declare @tmpID uniqueidentifier"
'  q = q & vbCrLf & "  declare @SysLogID uniqueidentifier"
'  q = q & vbCrLf & "  declare @access integer"
'  q = q & vbCrLf & "  declare @SysInstID uniqueidentifier"
'  q = q & vbCrLf & "  declare @StatusID uniqueidentifier"
'  q = q & vbCrLf & "  select @SysInstID = InstanceID from instance where objtype='MTZSYSTEM'"
'  q = q & vbCrLf & "  if exists(select 1 from instance with(nolock) where InstanceID = @InstanceID)"
'  q = q & vbCrLf & "    begin"
'  q = q & vbCrLf & "      select  @tmpID =SecurityStyleID from INSTANCE with(nolock) where InstanceID=@InstanceID"
'  q = q & vbCrLf & "      exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='EDIT',@access=@access out "
'  q = q & vbCrLf & "      if @access = 0"
'  q = q & vbCrLf & "        begin"
'  q = q & vbCrLf & "          raiserror('Нет прав на изменение названия объекта.',16,1)"
'  q = q & vbCrLf & "          if @@trancount>0 rollback tran"
'  q = q & vbCrLf & "          return"
'  q = q & vbCrLf & "        end"
'  q = q & vbCrLf & "      exec Instance_ISLOCKED @cursession=@cursession,@ROWID=@InstanceID,@IsLocked=@access out "
'  q = q & vbCrLf & "      if @access > 2"
'  q = q & vbCrLf & "        begin"
'  q = q & vbCrLf & "          raiserror('Документ заблокирован другим пльзователем.',16,1)"
'  q = q & vbCrLf & "          if @@trancount>0 rollback tran"
'  q = q & vbCrLf & "          return"
'  q = q & vbCrLf & "        end"
'  q = q & vbCrLf & "      select @ObjType=objtype from instance with(nolock) where  InstanceID=@InstanceID"
'  q = q & vbCrLf & "      update instance set name = @name where  InstanceID=@InstanceID"
'  q = q & vbCrLf & "      set @SysLogid = newid()"
'  q = q & vbCrLf & "      EXEC SysLog_SAVE @CURSESSION=@cursession ,@TheSession=@cursession, @InstanceID=@SysInstID, @SysLogid=@SysLogid, @LogStructID = @OBJTYPE ,"
'  q = q & vbCrLf & "        @VERB='EDIT',  @the_Resource=@InstanceID,@LogInstanceID=@InstanceID"
'  q = q & vbCrLf & "    End"
'  q = q & vbCrLf & "  Else"
'  q = q & vbCrLf & "    begin"
'  q = q & vbCrLf & "      if exists( select 1 from typelist with(nolock) where name = @objtype)"
'  q = q & vbCrLf & "        begin"
'  q = q & vbCrLf & "          begin tran"
'  q = q & vbCrLf & "          select @SSID=SecurityStyleid,@tmpstr =RegisterProc from typelist with(nolock) where name = @objtype"
'  q = q & vbCrLf & "          exec CheckVerbRight @cursession=@cursession,@Resource=@SSID,@verb='CREATE',@access=@access out "
'  q = q & vbCrLf & "          if @access=0 "
'  q = q & vbCrLf & "            begin"
'  q = q & vbCrLf & "              raiserror('Нет прав на создание.',16,1)"
'  q = q & vbCrLf & "              if @@trancount>0 rollback tran"
'  q = q & vbCrLf & "              return"
'  q = q & vbCrLf & "            end"
'  q = q & vbCrLf & "          set @statusid=null"
'  q = q & vbCrLf & "          select @statusid = objstatusid"
'  q = q & vbCrLf & "            from objstatus with(nolock)"
'  q = q & vbCrLf & "            join objecttype with(nolock) on objecttype.objecttypeid = objstatus.parentstructrowid and objecttype.name = @objtype and isStartup <> 0"
'  q = q & vbCrLf & "          if not @statusid is null"
'  q = q & vbCrLf & "            insert into instance(InstanceID,name,objtype,SecurityStyleID,STATUS) values(@InstanceID,@name,@objtype,@SSID,@STATUSID)"
'  q = q & vbCrLf & "          else"
'  q = q & vbCrLf & "            insert into instance(InstanceID,name,objtype,SecurityStyleID) values(@InstanceID,@name,@objtype,@SSID)"
'  q = q & vbCrLf & "          if not @tmpstr is null"
'  q = q & vbCrLf & "            exec @tmpstr @cursession = @cursession, @InstanceID =@InstanceID"
'  q = q & vbCrLf & "          set @SysLogid=newid()"
'  q = q & vbCrLf & "          EXEC SysLog_SAVE @CURSESSION=@cursession ,@TheSession=@cursession, @InstanceID=@SysInstID, @SysLogid=@SysLogid, @LogStructID = @OBJTYPE ,"
'  q = q & vbCrLf & "            @VERB='CREATE',  @the_Resource=@InstanceID,@LogInstanceID=@InstanceID"
'  q = q & vbCrLf & "          if @@trancount >0 commit tran"
'  q = q & vbCrLf & "        End"
'  q = q & vbCrLf & "    End"
'  q = q & vbCrLf & "End"
'  q = q & vbCrLf & "go"
  
  q = q & vbCrLf & "create proc Instance_Save ("
  q = q & vbCrLf & "  @CURSESSION uniqueidentifier,"
  q = q & vbCrLf & "  @InstanceID uniqueidentifier,"
  q = q & vbCrLf & "  @ObjType varchar(255),"
  q = q & vbCrLf & "  @Name varchar(255)"
  q = q & vbCrLf & ") as begin"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "  declare @access integer"
  q = q & vbCrLf & "  declare @StatusID uniqueidentifier"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "  if exists( select 1 from instance with(nolock) where instanceid = @instanceid )"
  q = q & vbCrLf & "    begin --Update"
  q = q & vbCrLf & "      exec instance_ISLOCKED @cursession=@cursession,@ROWID=@instanceid,@IsLocked=@access out"
  q = q & vbCrLf & "      if @access>2"
  q = q & vbCrLf & "        begin"
  q = q & vbCrLf & "          raiserror('Документ заблокирован другим пльзователем.',16,1)"
  q = q & vbCrLf & "          Return"
  q = q & vbCrLf & "        End"
  q = q & vbCrLf & "--      select @ObjType = objtype from instance with(nolock) where instanceid = @instanceid"
  q = q & vbCrLf & "      declare @res int"
  q = q & vbCrLf & "      exec controlBriefDocument @objtype, @instanceid, @res output"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "      begin tran"
  q = q & vbCrLf & "        insert into SysLog (SysLogID, InstanceID, TheSession, the_Resource, LogStructID, VERB, LogInstanceID)"
  q = q & vbCrLf & "          values (newid(), '{9A360531-D935-4676-952A-5BF35A5CFE80}', @cursession, @InstanceID, @OBJTYPE, 'EDIT', @InstanceID)"
  q = q & vbCrLf & "        update instance set name = @name where instanceid = @instanceid"
  q = q & vbCrLf & "        if @res = 1"
  q = q & vbCrLf & "          insert HistoryDenormal (RowID, NamePart, EVENT) values (@InstanceID, @objtype, 'EDIT_OBJ')"
  q = q & vbCrLf & "      commit tran"
  q = q & vbCrLf & "    End"
  q = q & vbCrLf & "  Else"
  q = q & vbCrLf & "    begin --Insert"
  q = q & vbCrLf & "      set @statusid = null"
  q = q & vbCrLf & "      select @statusid=objstatusid from objstatus with(nolock)"
  q = q & vbCrLf & "        join objecttype with(nolock) on"
  q = q & vbCrLf & "        objecttype.objecttypeid = objstatus.parentstructrowid and objecttype.name = @objtype and isStartup <> 0"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "      begin tran"
  q = q & vbCrLf & "        insert into SysLog (SysLogID, InstanceID, TheSession, the_Resource, LogStructID, VERB, LogInstanceID)"
  q = q & vbCrLf & "          values (newid(), '{9A360531-D935-4676-952A-5BF35A5CFE80}', @cursession, @InstanceID, @OBJTYPE, 'CREATE', @InstanceID)"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "        if not @statusid is null"
  q = q & vbCrLf & "          insert into instance(instanceid,name,objtype,STATUS) values(@instanceid,@name,@objtype,@STATUSID)"
  q = q & vbCrLf & "        Else"
  q = q & vbCrLf & "          insert into instance(instanceid,name,objtype) values(@instanceid,@name,@objtype)"
  q = q & vbCrLf & "      commit tran"
  q = q & vbCrLf & "    End"
  q = q & vbCrLf & "End"
  q = q & vbCrLf & "go"
  
  GetProc_Instance_Save = q
End Function

Private Function GetProc_Instance_DELETE() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
'  q = q & vbCrLf & "create proc Instance_DELETE("
'  q = q & vbCrLf & "  @CURSESSION uniqueidentifier,"
'  q = q & vbCrLf & "  @InstanceID uniqueidentifier"
'  q = q & vbCrLf & ") as begin"
'  q = q & vbCrLf & "  declare @tmpStr varchar(255)"
'  q = q & vbCrLf & "  declare @Str Nvarchar(4000)"
'  q = q & vbCrLf & "  declare @ObjType varchar(255)"
'  q = q & vbCrLf & "  declare @SysInstID uniqueidentifier"
'  q = q & vbCrLf & "  select @SysInstID = InstanceID from instance with(nolock) where objtype = 'MTZSYSTEM'"
'  q = q & vbCrLf & "  if exists( select 1 from instance with(nolock) where InstanceID=@InstanceID )"
'  q = q & vbCrLf & "    begin"
'  q = q & vbCrLf & "      declare @tmpID uniqueidentifier"
'  q = q & vbCrLf & "      declare @access integer"
'  q = q & vbCrLf & "      declare @OwnerPartName varchar(255)"
'  q = q & vbCrLf & "      declare @OwnerRowID uniqueidentifier"
'  q = q & vbCrLf & "      declare @SysLogid uniqueidentifier"
'  q = q & vbCrLf & "      select  @tmpID =SecurityStyleID,@OwnerPartName = OwnerPartName,@OwnerRowID =OWnerRowID from INSTANCE with(nolock) where InstanceID=@InstanceID"
'  q = q & vbCrLf & "      exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='DELETE',@access=@access out"
'  q = q & vbCrLf & "      if @access=0"
'  q = q & vbCrLf & "        begin"
'  q = q & vbCrLf & "          raiserror('Нет прав на удаление.',16,1)"
'  q = q & vbCrLf & "          if @@trancount>0 rollback tran"
'  q = q & vbCrLf & "          Return"
'  q = q & vbCrLf & "        End"
'  q = q & vbCrLf & "      if @Ownerpartname is null or @OwnerRowID is null"
'  q = q & vbCrLf & "        begin"
'  q = q & vbCrLf & "          select @objtype = objtype from instance with(nolock) where InstanceID=@InstanceID"
'  q = q & vbCrLf & "          select @tmpstr =DeleteProc from typelist with(nolock) where name = @objtype"
'  q = q & vbCrLf & "          begin tran"
'  q = q & vbCrLf & "        if not @tmpstr is null"
'  q = q & vbCrLf & "          exec @tmpstr @cursession = @cursession, @InstanceID =@InstanceID"
'  q = q & vbCrLf & "        if @@trancount =0 return"
'  q = q & vbCrLf & "        delete from instance where InstanceID=@InstanceID"
'  q = q & vbCrLf & "        set @SysLogid=newid()"
'  q = q & vbCrLf & "        EXEC SysLog_SAVE @CURSESSION=@cursession ,@TheSession=@cursession, @InstanceID=@SysInstID, @SysLogid=@SysLogid, @LogStructID = @objtype ,"
'  q = q & vbCrLf & "        @VERB='DELETE',  @the_Resource=@InstanceID,@LogInstanceID=@InstanceID"
'  q = q & vbCrLf & "        if @@trancount >0 commit tran"
'  q = q & vbCrLf & ""
'  q = q & vbCrLf & "        end else begin"
'  q = q & vbCrLf & "        -- Owner exists"
'  q = q & vbCrLf & ""
'  q = q & vbCrLf & "         set @str =N'select @tmpid='+@ownerpartname +'id from ' + @ownerpartname + ' with(nolock) where ' + @ownerpartname +'id=@ownerrowid'"
'  q = q & vbCrLf & "         exec sp_executesql @str,N'@tmpid uniqueidentifier out, @ownerRowID uniqueidentifier',@tmpid=@tmpid out,@ownerrowid=@ownerrowid"
'  q = q & vbCrLf & "         if @tmpid=@ownerrowid begin"
'  q = q & vbCrLf & "        raiserror('Этот документ принадлежит другому документу и не может быть удален отдельно.',16,1)"
'  q = q & vbCrLf & "        if @@trancount>0 rollback tran"
'  q = q & vbCrLf & "        Return"
'  q = q & vbCrLf & "         End"
'  q = q & vbCrLf & "         select @objtype = objtype from instance with(nolock) where InstanceID=@InstanceID"
'  q = q & vbCrLf & "         select @tmpstr =DeleteProc from typelist with(nolock) where name = @objtype"
'  q = q & vbCrLf & "         begin tran"
'  q = q & vbCrLf & "         if not @tmpstr is null"
'  q = q & vbCrLf & "           exec @tmpstr @cursession = @cursession, @InstanceID =@InstanceID"
'  q = q & vbCrLf & "         if @@trancount =0 return"
'  q = q & vbCrLf & "         delete from instance where InstanceID=@InstanceID"
'  q = q & vbCrLf & "         set @SysLogid=newid()"
'  q = q & vbCrLf & "         EXEC SysLog_SAVE @CURSESSION=@cursession ,@TheSession=@cursession, @InstanceID=@SysInstID, @SysLogid=@SysLogid, @LogStructID = @objtype ,"
'  q = q & vbCrLf & "         @VERB='DELETE',  @the_Resource=@InstanceID,@LogInstanceID=@InstanceID"
'  q = q & vbCrLf & "         if @@trancount >0 commit tran"
'  q = q & vbCrLf & "        End"
'  q = q & vbCrLf & "     End"
'  q = q & vbCrLf & "End"
'  q = q & vbCrLf & "go"
  
  q = q & vbCrLf & "create proc Instance_DELETE ("
  q = q & vbCrLf & "  @CURSESSION uniqueidentifier,"
  q = q & vbCrLf & "  @InstanceID uniqueidentifier"
  q = q & vbCrLf & ") as begin"
  q = q & vbCrLf & "  declare @tmpStr varchar(255)"
  q = q & vbCrLf & "  declare @ObjType varchar(255)"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "  declare @res int"
  q = q & vbCrLf & "  exec controlBriefDocument @objtype, @instanceid, @res output"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "  select @objtype = objtype from instance where instanceid = @instanceid"
  q = q & vbCrLf & "  select @tmpstr = DeleteProc from typelist where name = @objtype"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "  begin tran"
  q = q & vbCrLf & "    if not @tmpstr is null"
  q = q & vbCrLf & "      exec @tmpstr @cursession = @cursession, @instanceid = @instanceid"
  q = q & vbCrLf & "    if @@trancount = 0 return"
  q = q & vbCrLf & "    insert into SysLog (SysLogID, InstanceID, TheSession, the_Resource, LogStructID, VERB, LogInstanceID)"
  q = q & vbCrLf & "      values (newid(), '{9A360531-D935-4676-952A-5BF35A5CFE80}', @cursession, @InstanceID, @OBJTYPE, 'DELETE', @InstanceID)"
  q = q & vbCrLf & "    delete from instance where instanceid = @instanceid"
  q = q & vbCrLf & "    if @res = 1"
  q = q & vbCrLf & "      insert HistoryDenormal (RowID, NamePart, EVENT) values (@InstanceID, @objtype, 'DELETE_OBJ')"
  q = q & vbCrLf & "  if @@trancount > 0 commit tran"
  q = q & vbCrLf & "End"
  q = q & vbCrLf & "go"
  
  GetProc_Instance_DELETE = q
End Function

Private Function GetProc_Instance_HCL() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
  q = q & vbCrLf & "create proc Instance_HCL("
  q = q & vbCrLf & "  @CURSESSION uniqueidentifier,"
  q = q & vbCrLf & "  @RowID uniqueidentifier,"
  q = q & vbCrLf & "  @IsLocked int out"
  q = q & vbCrLf & ") as begin"
  q = q & vbCrLf & "  declare @tmpStr varchar(255)"
  q = q & vbCrLf & "  declare @ObjType varchar(255)"
  q = q & vbCrLf & "  if exists( select 1 from instance with(nolock) where InstanceID=@rowid )"
  q = q & vbCrLf & "    begin"
  q = q & vbCrLf & "      select @objtype = objtype from instance with(nolock) where InstanceID = @rowid"
  q = q & vbCrLf & "      select @tmpstr = HCLProc from typelist with(nolock) where name = @objtype"
  q = q & vbCrLf & "      if not @tmpstr is null"
  q = q & vbCrLf & "        exec @tmpstr @cursession = @cursession, @ROWid =@rowid,@IsLocked=@IsLocked out"
  q = q & vbCrLf & "    End"
  q = q & vbCrLf & "End"
  q = q & vbCrLf & "go"
  
  GetProc_Instance_HCL = q
End Function

Private Function GetProc_Instance_propagate() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
  q = q & vbCrLf & "create proc Instance_propagate ("
  q = q & vbCrLf & "  @CURSESSION uniqueidentifier,"
  q = q & vbCrLf & "  @RowID uniqueidentifier"
  q = q & vbCrLf & ") as begin"
  q = q & vbCrLf & "  declare @tmpStr varchar(255)"
  q = q & vbCrLf & "  declare @ObjType varchar(255)"
  q = q & vbCrLf & "  if exists( select 1 from instance with(nolock) where InstanceID=@rowid )"
  q = q & vbCrLf & "    begin"
  q = q & vbCrLf & "      select @objtype = objtype from instance with(nolock) where InstanceID = @rowid"
  q = q & vbCrLf & "      select @tmpstr =propagateProc from typelist with(nolock) where name = @objtype"
  q = q & vbCrLf & "      if not @tmpstr is null"
  q = q & vbCrLf & "        exec @tmpstr @cursession = @cursession, @ROWid = @rowid"
  q = q & vbCrLf & "    End"
  q = q & vbCrLf & "End"
  q = q & vbCrLf & "go"
  
  GetProc_Instance_propagate = q
End Function

Private Function GetProc_Instance_ISLOCKED() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
  q = q & vbCrLf & "create proc Instance_ISLOCKED ("
  q = q & vbCrLf & "  @CURSESSION uniqueidentifier,"
  q = q & vbCrLf & "  @RowID uniqueidentifier ,"
  q = q & vbCrLf & "  @IsLocked integer output"
  q = q & vbCrLf & ") as begin"
  q = q & vbCrLf & "  set nocount on"
  q = q & vbCrLf & "  declare @UserID uniqueidentifier"
  q = q & vbCrLf & "  declare @LockUserID uniqueidentifier"
  q = q & vbCrLf & "  declare @LockSessionID uniqueidentifier"
  q = q & vbCrLf & "  set @isLocked = 0"
  q = q & vbCrLf & "  -- checking session  --"
  q = q & vbCrLf & "  if not exists( select 1 from the_session with(nolock) where the_sessionid=@cursession and closed=0 )"
  q = q & vbCrLf & "    begin"
  q = q & vbCrLf & "      raiserror('Сессия уже завершена',16,1)"
  q = q & vbCrLf & "      Return"
  q = q & vbCrLf & "    End"
  q = q & vbCrLf & "  select @userID = usersid  from the_session with(nolock) where the_sessionid=@cursession"
  q = q & vbCrLf & "  select @LockUserID = LockUserID, @LockSessionID = LockSessionID from INSTANCE with(nolock) where InstanceID=@RowID"
  q = q & vbCrLf & "  /* verify this row */"
  q = q & vbCrLf & "  if not @LockUserID is null"
  q = q & vbCrLf & "    begin"
  q = q & vbCrLf & "      if @LockUserID <> @userID"
  q = q & vbCrLf & "        begin"
  q = q & vbCrLf & "          set @isLocked = 4 /* CheckOut by another user */"
  q = q & vbCrLf & "          Return"
  q = q & vbCrLf & "        end"
  q = q & vbCrLf & "      else"
  q = q & vbCrLf & "        begin"
  q = q & vbCrLf & "          set @isLocked = 2 /* CheckOut by caller */"
  q = q & vbCrLf & "          Return"
  q = q & vbCrLf & "        End"
  q = q & vbCrLf & "    End"
  q = q & vbCrLf & " if not @LockSessionID is null"
  q = q & vbCrLf & " begin"
  q = q & vbCrLf & "   if  @LockSessionID <> @CURSESSION"
  q = q & vbCrLf & "   begin"
  q = q & vbCrLf & "     set @isLocked = 3 /* Lockes by another user */"
  q = q & vbCrLf & "     Return"
  q = q & vbCrLf & "   end   else"
  q = q & vbCrLf & "   begin"
  q = q & vbCrLf & "     set @isLocked = 1 /* Locked by caller */"
  q = q & vbCrLf & "     Return"
  q = q & vbCrLf & "   End"
  q = q & vbCrLf & " End"
  q = q & vbCrLf & " set @isLocked = 0"
  q = q & vbCrLf & " End"
  q = q & vbCrLf & "GO"
  
  GetProc_Instance_ISLOCKED = q
End Function

Private Function GetProc_Instance_SINIT() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
'  q = q & vbCrLf & "create proc Instance_SINIT ("
'  q = q & vbCrLf & "  @CURSESSION uniqueidentifier,"
'  q = q & vbCrLf & "  @RowID uniqueidentifier ,"
'  q = q & vbCrLf & "  @SecurityStyleID uniqueidentifier=null"
'  q = q & vbCrLf & ") as begin"
'  q = q & vbCrLf & "  set nocount on"
'  q = q & vbCrLf & "  declare @ParentTable varchar(255)"
'  q = q & vbCrLf & "  declare @StyleID uniqueidentifier"
'  q = q & vbCrLf & "  declare @tmpID uniqueidentifier"
'  q = q & vbCrLf & "  declare @access integer"
'  q = q & vbCrLf & "  select @tmpID =SecurityStyleID from INSTANCE with(nolock) where InstanceID=@ROWID"
'  q = q & vbCrLf & "  exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='SECURE',@access=@access out "
'  q = q & vbCrLf & "  if @access=0 "
'  q = q & vbCrLf & "    begin"
'  q = q & vbCrLf & "      raiserror('Нет прав на управление защитой.',16,1)"
'  q = q & vbCrLf & "      if @@trancount>0 rollback tran"
'  q = q & vbCrLf & "      return"
'  q = q & vbCrLf & "    end"
'  q = q & vbCrLf & "  if @SecurityStyleID is null"
'  q = q & vbCrLf & "    begin"
'  q = q & vbCrLf & "      select @ParentTable = objtype from instance with(nolock) where InstanceID=@RowID"
'  q = q & vbCrLf & "      select @StyleID =SecurityStyleID from typelist with(nolock) where name =@ParentTable"
'  q = q & vbCrLf & "      update Instance set securitystyleid =@StyleID where InstanceID = @RowID"
'  q = q & vbCrLf & "    end else begin"
'  q = q & vbCrLf & "  else"
'  q = q & vbCrLf & "    begin"
'  q = q & vbCrLf & "      update Instance set securitystyleid =@SecurityStyleID where InstanceID = @RowID"
'  q = q & vbCrLf & "    End"
'  q = q & vbCrLf & "End"
'  q = q & vbCrLf & "GO"
  
  q = q & vbCrLf & "create proc Instance_SINIT ("
  q = q & vbCrLf & "  @CURSESSION uniqueidentifier,"
  q = q & vbCrLf & "  @RowID uniqueidentifier,"
  q = q & vbCrLf & "  @SecurityStyleID uniqueidentifier = null"
  q = q & vbCrLf & ") as begin"
  q = q & vbCrLf & "  set nocount on"
  q = q & vbCrLf & "End"
  
  GetProc_Instance_SINIT = q
End Function

Private Function GetProc_Instance_LOCK() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
  q = q & vbCrLf & "create  proc Instance_LOCK  ("
  q = q & vbCrLf & " @CURSESSION uniqueidentifier,"
  q = q & vbCrLf & " @RowID uniqueidentifier ,"
  q = q & vbCrLf & " @LockMode integer"
  q = q & vbCrLf & ") as  begin"
  q = q & vbCrLf & "set nocount on"
  q = q & vbCrLf & " declare @UserID uniqueidentifier"
  q = q & vbCrLf & " declare @tmpID uniqueidentifier"
  q = q & vbCrLf & " declare @access integer"
  q = q & vbCrLf & " declare @IsLocked integer"
  q = q & vbCrLf & " -- checking session  --"
  q = q & vbCrLf & "if not exists( select 1 from the_session with(nolock) where the_sessionid=@cursession and closed=0 )"
  q = q & vbCrLf & "  begin"
  q = q & vbCrLf & "    raiserror('Сессия уже завершена.',16,1)"
  q = q & vbCrLf & "    Return"
  q = q & vbCrLf & "  End"
  q = q & vbCrLf & " select @userID = usersid  from the_session with(nolock) where the_sessionid=@cursession"
  q = q & vbCrLf & " exec Instance_ISLOCKED @CURSESSION,@ROWID,@ISLocked out"
  q = q & vbCrLf & " if @IsLocked >=3"
  q = q & vbCrLf & "  begin"
  q = q & vbCrLf & "    raiserror('Объект заблокирован другим пользователем',16,1)"
  q = q & vbCrLf & "    Return"
  q = q & vbCrLf & "  End"
  q = q & vbCrLf & " if @IsLocked =0"
  q = q & vbCrLf & " begin"
  q = q & vbCrLf & "  exec Instance_HCL @cursession,@RowID,@isLocked out"
  q = q & vbCrLf & "  if @IsLocked >=3"
  q = q & vbCrLf & "   begin"
  q = q & vbCrLf & "     raiserror('У данного объекта имеются дочерние строки, которые заблокированы другим пользователем',16,1)"
  q = q & vbCrLf & "     Return"
  q = q & vbCrLf & "   End"
  q = q & vbCrLf & " End"
  q = q & vbCrLf & " select  @tmpID =SecurityStyleID from INSTANCE with(nolock) where InstanceID=@ROWID"
  q = q & vbCrLf & " exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='LOCKINSTANCE',@access=@access out "
  q = q & vbCrLf & " if @access=0 "
  q = q & vbCrLf & "  begin"
  q = q & vbCrLf & "    raiserror('Нет прав на блокировку объекта.',16,1)"
  q = q & vbCrLf & "    if @@trancount>0 rollback tran"
  q = q & vbCrLf & "    return"
  q = q & vbCrLf & "  end"
  q = q & vbCrLf & "   if  @LockMode =2"
  q = q & vbCrLf & "   begin"
  q = q & vbCrLf & "    update INSTANCE  set LockUserID =@userID ,LockSessionID =null where InstanceID=@RowID"
  q = q & vbCrLf & "     Return"
  q = q & vbCrLf & "   End"
  q = q & vbCrLf & "   if  @LockMode =1"
  q = q & vbCrLf & "   begin"
  q = q & vbCrLf & "    update INSTANCE  set LockUserID =null,LockSessionID =@CURSESSION  where InstanceID=@RowID"
  q = q & vbCrLf & "     Return"
  q = q & vbCrLf & "   End"
  q = q & vbCrLf & " End"
  q = q & vbCrLf & "GO"
  
  GetProc_Instance_LOCK = q
End Function

Private Function GetProc_Instance_UNLOCK() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
  q = q & vbCrLf & "create  proc Instance_UNLOCK /*Пользователи системы*/ ("
  q = q & vbCrLf & " @CURSESSION uniqueidentifier,"
  q = q & vbCrLf & " @RowID uniqueidentifier"
  q = q & vbCrLf & ") as  begin"
  q = q & vbCrLf & "set nocount on"
  q = q & vbCrLf & " declare @ParentID uniqueidentifier"
  q = q & vbCrLf & " declare @UserID uniqueidentifier"
  q = q & vbCrLf & " declare @IsLocked integer"
  q = q & vbCrLf & " declare @ParentTable varchar(255)"
  q = q & vbCrLf & " -- checking session  --"
  q = q & vbCrLf & "if not exists( select 1 from the_session with(nolock) where the_sessionid=@cursession and closed=0 )"
  q = q & vbCrLf & "  begin"
  q = q & vbCrLf & "    raiserror('Сессия уже завершена.',16,1)"
  q = q & vbCrLf & "    Return"
  q = q & vbCrLf & "  End"
  q = q & vbCrLf & " exec Instance_ISLOCKED @CURSESSION,@ROWID,@ISLocked out"
  q = q & vbCrLf & " if @IsLocked >=3"
  q = q & vbCrLf & "  begin"
  q = q & vbCrLf & "    raiserror('Объект заблокирован другим пользователем',16,1)"
  q = q & vbCrLf & "    Return"
  q = q & vbCrLf & "  End"
  q = q & vbCrLf & "   if  @IsLocked =2"
  q = q & vbCrLf & "   begin"
  q = q & vbCrLf & "    update INSTANCE set LockUserID =null  where InstanceID=@RowID"
  q = q & vbCrLf & "     Return"
  q = q & vbCrLf & "   End"
  q = q & vbCrLf & "   if  @IsLocked =1"
  q = q & vbCrLf & "   begin"
  q = q & vbCrLf & "    update INSTANCE set LockSessionID =null  where InstanceID=@RowID"
  q = q & vbCrLf & "     Return"
  q = q & vbCrLf & "   End"
  q = q & vbCrLf & " End"
  q = q & vbCrLf & "GO"
  
  GetProc_Instance_UNLOCK = q
End Function

Private Function GetProc_Instance_BRIEF() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
'  q = q & vbCrLf & "  create proc Instance_BRIEF  ("
'  q = q & vbCrLf & " @CURSESSION uniqueidentifier,"
'  q = q & vbCrLf & " @InstanceID uniqueidentifier,"
'  q = q & vbCrLf & " @BRIEF varchar(4000) output"
'  q = q & vbCrLf & ") as  begin"
'  q = q & vbCrLf & "set nocount on"
'  q = q & vbCrLf & " declare @tmpStr varchar(255)"
'  q = q & vbCrLf & " declare @access int"
'  q = q & vbCrLf & " declare @tmpBrief varchar(4000)"
'  q = q & vbCrLf & " declare @tmpID uniqueidentifier"
'  q = q & vbCrLf & " -- checking session  --"
'  q = q & vbCrLf & "if not exists( select 1 from the_session with(nolock) where the_sessionid=@cursession and closed=0 )"
'  q = q & vbCrLf & "  begin"
'  q = q & vbCrLf & "    raiserror('Сессия уже завершена.',16,1)"
'  q = q & vbCrLf & "    Return"
'  q = q & vbCrLf & "  End"
'  q = q & vbCrLf & "if @InstanceID is null begin set @BRIEF='' return end"
'  q = q & vbCrLf & " -- Brief body --"
'  q = q & vbCrLf & "if exists(select 1 from instance with(nolock) where InstanceID=@InstanceID)"
'  q = q & vbCrLf & " begin"
'  q = q & vbCrLf & " --  verify access  --"
'  q = q & vbCrLf & " select  @tmpID =SecurityStyleID from instance with(nolock) where InstanceID=@InstanceID"
'  q = q & vbCrLf & " exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='BRIEF',@access=@access out"
'  q = q & vbCrLf & " if @access=0"
'  q = q & vbCrLf & "  begin"
'  q = q & vbCrLf & "    raiserror('Нет прав на получение краткого наименования. Раздел=instance',16,1)"
'  q = q & vbCrLf & "    Return"
'  q = q & vbCrLf & "  End "
'  q = q & vbCrLf & "  set @BRIEF=''"
'  q = q & vbCrLf & "  select @BRIEF= @BRIEF "
'  q = q & vbCrLf & "  +  isnull(Name,' ')+'; '"
'  q = q & vbCrLf & "  from instance  with(nolock) where  InstanceID = @InstanceID"
'  q = q & vbCrLf & "  select @BRIEF= @BRIEF "
'  q = q & vbCrLf & "  +  isnull(objtype,' ')+'; '"
'  q = q & vbCrLf & "  from instance  with(nolock) where  InstanceID = @InstanceID"
'  q = q & vbCrLf & "end else begin"
'  q = q & vbCrLf & "  set @BRIEF= 'неверный идентификатор'"
'  q = q & vbCrLf & "End"
'  q = q & vbCrLf & "set @BRIEF=left(@BRIEF,4000)"
'  q = q & vbCrLf & "End"
'  q = q & vbCrLf & ""
'  q = q & vbCrLf & "GO"
  
  q = q & vbCrLf & "create proc instance_BRIEF ("
  q = q & vbCrLf & "  @CURSESSION uniqueidentifier,"
  q = q & vbCrLf & "  @instanceid uniqueidentifier,"
  q = q & vbCrLf & "  @BRIEF varchar(4000) output"
  q = q & vbCrLf & ") as begin"
  q = q & vbCrLf & "  set @BRIEF = ''"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "  if @instanceid is null return"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "  if not exists(select 1 from instance with(nolock) where instanceID = @instanceID)"
  q = q & vbCrLf & "    begin"
  q = q & vbCrLf & "      set @BRIEF= 'нет данных'"
  q = q & vbCrLf & "      Return"
  q = q & vbCrLf & "    End"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "  select"
  q = q & vbCrLf & "    @BRIEF = isnull(Name,'')"
  q = q & vbCrLf & "    from instance with(nolock) where instanceID = @instanceID"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "  set @BRIEF = left(@BRIEF, 4000)"
  q = q & vbCrLf & "End"
  q = q & vbCrLf & "GO"
  
  GetProc_Instance_BRIEF = q
End Function

Private Function GetProc_QR_and_QR() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
  q = q & vbCrLf & "create proc QR_and_QR( @id1 uniqueidentifier, @id2 uniqueidentifier,@idout uniqueidentifier,@cnt integer out)"
  q = q & vbCrLf & "as"
  q = q & vbCrLf & "delete from QueryResult where QueryResultid=@idout"
  q = q & vbCrLf & "insert into QueryResult(QueryResultid,result)"
  q = q & vbCrLf & "select distinct @idout, a.result"
  q = q & vbCrLf & "from QueryResult a "
  q = q & vbCrLf & "join QueryResult b on b.QueryResultid=@id2 and a.result=b.result"
  q = q & vbCrLf & "where a.QueryResultid=@id1"
  q = q & vbCrLf & "select @cnt=count(*) from QueryResult where QueryResultid=@idout"
  q = q & vbCrLf & "go"
  q = q & vbCrLf & ""
  
  GetProc_QR_and_QR = q
End Function

Private Function GetProc_QR_or_QR() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
  q = q & vbCrLf & "create proc QR_or_QR( @id1 uniqueidentifier, @id2 uniqueidentifier,@idout uniqueidentifier,@cnt integer out)"
  q = q & vbCrLf & "as"
  q = q & vbCrLf & "delete from QueryResult where QueryResultid=@idout"
  q = q & vbCrLf & "insert into QueryResult(QueryResultid,result)"
  q = q & vbCrLf & "select distinct @idout, result from QueryResult where QueryResultid in (@id1,@id2)"
  q = q & vbCrLf & "select @cnt=count(*) from QueryResult where QueryResultid=@idout"
  q = q & vbCrLf & "GO"
  
  GetProc_QR_or_QR = q
End Function

Private Function GetProc_RowParents() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
  q = q & vbCrLf & "create proc RowParents"
  q = q & vbCrLf & "(@QueryID uniqueidentifier"
  q = q & vbCrLf & ",@RowID uniqueidentifier/* Row */"
  q = q & vbCrLf & ",@Table VARCHAR (255)/* Part Table Name */"
  q = q & vbCrLf & ",@CURSESSION uniqueidentifier/* Session */"
  q = q & vbCrLf & ")"
  q = q & vbCrLf & " as"
  q = q & vbCrLf & "begin"
  q = q & vbCrLf & "set nocount on"
  q = q & vbCrLf & "declare @plevel integer"
  q = q & vbCrLf & "declare @parent varchar(255)"
  q = q & vbCrLf & "declare @prev varchar(255)"
  q = q & vbCrLf & "declare @tmpID  uniqueidentifier"
  q = q & vbCrLf & "declare @tmpRowID  uniqueidentifier"
  q = q & vbCrLf & "declare @s nvarchar(4000)"
  q = q & vbCrLf & " -- checking session  --"
  q = q & vbCrLf & "if not exists( select 1 from the_session with(nolock) where the_sessionid=@cursession and closed=0 )"
  q = q & vbCrLf & "  begin"
  q = q & vbCrLf & "    raiserror('Session expired',16,1)"
  q = q & vbCrLf & "    if @@trancount>0 rollback tran"
  q = q & vbCrLf & "    Return"
  q = q & vbCrLf & "  End"
  q = q & vbCrLf & "set @parent =@table"
  q = q & vbCrLf & "set @tmpID = @ROWID"
  q = q & vbCrLf & "set @plevel =0"
  q = q & vbCrLf & "delete from RPRESULT where RPRESULTID"
  q = q & vbCrLf & "  =@QUERYID"
  q = q & vbCrLf & "insert into RPRESULT(RPRESULTID,PARENTLEVEL,PARTNAME,ROWID)"
  q = q & vbCrLf & "   values(@QUERYID,@PLEVEL,@table,@RowID)"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "again:"
  q = q & vbCrLf & "set @plevel =@plevel + 1"
  q = q & vbCrLf & "set @prev = @parent"
  q = q & vbCrLf & "set @parent = null"
  q = q & vbCrLf & "select @parent =value from sysoptions with(nolock) where optiontype ='parent' and  name=@prev"
  q = q & vbCrLf & ""
  q = q & vbCrLf & " if @parent is null"
  q = q & vbCrLf & " begin"
  q = q & vbCrLf & "    set @s = N'select @root=InstanceID from ' + @prev + N' where ' +@prev + N'id=@id'"
  q = q & vbCrLf & "    exec sp_executesql @s,N'@root uniqueidentifier out,@id uniqueidentifier',@tmpRowID out,@tmpid"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "   insert into RPRESULT(RPRESULTID,PARENTLEVEL,PARTNAME,ROWID)"
  q = q & vbCrLf & "   values(@QUERYID,@PLEVEL,'INSTANCE',@tmpRowID)"
  q = q & vbCrLf & " End"
  q = q & vbCrLf & " Else"
  q = q & vbCrLf & " begin"
  q = q & vbCrLf & "    set @s = N'select @parent=ParentStructRowID from ' + @prev+ ' where ' +@prev + 'id=@id'"
  q = q & vbCrLf & "    exec sp_executesql @s,N'@parent uniqueidentifier out,@id uniqueidentifier',@tmpRowID out,@tmpid"
  q = q & vbCrLf & "    set @tmpID = @tmpROWID"
  q = q & vbCrLf & "   insert into RPRESULT(RPRESULTID,PARENTLEVEL,PARTNAME,ROWID)"
  q = q & vbCrLf & "   values(@QUERYID,@PLEVEL,@parent,@tmpRowID)"
  q = q & vbCrLf & "    GoTo again"
  q = q & vbCrLf & " End"
  q = q & vbCrLf & "End"
  q = q & vbCrLf & "GO"
  
  GetProc_RowParents = q
End Function

Private Function GetProc_Instance_Status() As String
  Dim q As String: q = ""
  q = q & vbCrLf & ""
  
'  q = q & vbCrLf & "  create proc Instance_Status("
'  q = q & vbCrLf & "  @cursession uniqueidentifier,"
'  q = q & vbCrLf & "  @InstanceID uniqueidentifier,"
'  q = q & vbCrLf & "  @statusid uniqueidentifier)"
'  q = q & vbCrLf & "as"
'  q = q & vbCrLf & "begin"
'  q = q & vbCrLf & "   declare @SSID uniqueidentifier"
'  q = q & vbCrLf & "   declare @tmpID uniqueidentifier"
'  q = q & vbCrLf & "   declare @SysLogID uniqueidentifier"
'  q = q & vbCrLf & "   declare @access integer"
'  q = q & vbCrLf & "   declare @SysInstID uniqueidentifier"
'  q = q & vbCrLf & "   declare @ObjType varchar(255)"
'  q = q & vbCrLf & "   select @SysInstID =InstanceID from instance with(nolock) where objtype='MTZSYSTEM'"
'  q = q & vbCrLf & ""
'  q = q & vbCrLf & " if exists( select 1 from instance with(nolock) where InstanceID=@InstanceID )"
'  q = q & vbCrLf & "  begin"
'  q = q & vbCrLf & "   select  @tmpID =SecurityStyleID from INSTANCE with(nolock) where InstanceID=@InstanceID"
'  q = q & vbCrLf & "   exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='STATUS',@access=@access out"
'  q = q & vbCrLf & "   if @access=0"
'  q = q & vbCrLf & "   begin"
'  q = q & vbCrLf & "    raiserror('Нет прав на изменение состояния объекта.',16,1)"
'  q = q & vbCrLf & "    if @@trancount>0 rollback tran"
'  q = q & vbCrLf & "    Return"
'  q = q & vbCrLf & "   End"
'  q = q & vbCrLf & "   exec Instance_ISLOCKED @cursession=@cursession,@ROWID=@InstanceID,@IsLocked=@access out"
'  q = q & vbCrLf & "   if @access>2"
'  q = q & vbCrLf & "   begin"
'  q = q & vbCrLf & "     raiserror('Документ заблокирован другим пльзователем.',16,1)"
'  q = q & vbCrLf & "     if @@trancount>0 rollback tran"
'  q = q & vbCrLf & "     Return"
'  q = q & vbCrLf & "   End"
'  q = q & vbCrLf & "   select @ObjType=objtype from instance  with(nolock) where  InstanceID=@InstanceID"
'  q = q & vbCrLf & "   if exists("
'  q = q & vbCrLf & "  select 1 from objstatus with(nolock) "
'  q = q & vbCrLf & "  join objecttype with(nolock) on objstatus.parentstructrowid=objecttype.objecttypeid"
'  q = q & vbCrLf & "  where objecttype.name=@objtype and objstatusid=@statusid"
'  q = q & vbCrLf & "   )begin"
'  q = q & vbCrLf & "     begin tran"
'  q = q & vbCrLf & "     update instance set status = @statusid where  InstanceID=@InstanceID"
'  q = q & vbCrLf & "     set @SysLogid=newid()"
'  q = q & vbCrLf & "     EXEC SysLog_SAVE @CURSESSION=@cursession ,@TheSession=@cursession, @InstanceID=@SysInstID, @SysLogid=@SysLogid, @LogStructID = @STATUSID ,"
'  q = q & vbCrLf & "     @VERB='STATUS',  @the_Resource=@InstanceID,@LogInstanceID=@InstanceID"
'  q = q & vbCrLf & "     commit tran"
'  q = q & vbCrLf & "   End"
'  q = q & vbCrLf & " End"
'  q = q & vbCrLf & "End"
'  q = q & vbCrLf & "GO"
  
  q = q & vbCrLf & "create proc Instance_Status("
  q = q & vbCrLf & "  @cursession uniqueidentifier,"
  q = q & vbCrLf & "  @instanceid uniqueidentifier,"
  q = q & vbCrLf & "  @statusid uniqueidentifier)"
  q = q & vbCrLf & "as begin"
  q = q & vbCrLf & "  declare @access integer"
  q = q & vbCrLf & "  declare @ObjType varchar(255)"
  q = q & vbCrLf & "  declare @StatusName varchar(255)"
  q = q & vbCrLf & ""
  q = q & vbCrLf & "  if exists(select 1 from instance $PROC$ where instanceid = @instanceid)"
  q = q & vbCrLf & "    begin"
  q = q & vbCrLf & "      exec instance_ISLOCKED @cursession=@cursession,@ROWID=@instanceid,@IsLocked=@access out"
  q = q & vbCrLf & "      if @access > 2"
  q = q & vbCrLf & "        begin"
  q = q & vbCrLf & "          raiserror('Документ заблокирован другим пользователем.',16,1)"
  q = q & vbCrLf & "          if @@trancount>0 rollback tran"
  q = q & vbCrLf & "          Return"
  q = q & vbCrLf & "        End"
  q = q & vbCrLf & "      select @ObjType = objtype from instance $PROC$ where instanceid = @instanceid"
  q = q & vbCrLf & "      set @StatusName = NULL"
  q = q & vbCrLf & "      if exists("
  q = q & vbCrLf & "        select 1"
  q = q & vbCrLf & "          from objstatus $PROC$"
  q = q & vbCrLf & "          join objecttype $PROC$ on objstatus.parentstructrowid = objecttype.objecttypeid"
  q = q & vbCrLf & "          where objecttype.name = @objtype and objstatusid = @statusid"
  q = q & vbCrLf & "      )"
  q = q & vbCrLf & "      begin"
  q = q & vbCrLf & "        select @StatusName = objstatus.name"
  q = q & vbCrLf & "          from objstatus $PROC$"
  q = q & vbCrLf & "          where objstatusid = @statusid"
  q = q & vbCrLf & "        begin tran"
  q = q & vbCrLf & "          insert into SysLog (SysLogID, InstanceID, TheSession, the_Resource, LogStructID, VERB, LogInstanceID)"
  q = q & vbCrLf & "            values (newid(), '{9A360531-D935-4676-952A-5BF35A5CFE80}', @cursession, @InstanceID, @OBJTYPE, 'STATUS', @InstanceID)"
  q = q & vbCrLf & "          update instance set status = @statusid, statusname = @StatusName where instanceid = @instanceid"
  q = q & vbCrLf & "        commit tran"
  q = q & vbCrLf & "      End"
  q = q & vbCrLf & "    End"
  q = q & vbCrLf & "End"
  q = q & vbCrLf & "GO"
  
  GetProc_Instance_Status = q
End Function

Public Sub GenKernal(ByRef o As MTZGenerator.Response, ByRef log As String)
  Dim sql As Writer
  Set sql = New Writer
  
  DoEvents
  On Error GoTo bye
  DebugOutput "SQLGEN.KERNEL:start"
  
  sql.putBuf "-- Kernel Tables --"
  
  sql.putBuf IfCreateTable("HistoryDenormal")
  sql.putBuf "BEGIN"
  sql.putBuf "  CREATE TABLE [HistoryDenormal] ("
  sql.putBuf "    [DT] datetime default(getdate()),"
  sql.putBuf "    [RowID] uniqueidentifier,"
  sql.putBuf "    [NamePart] [varchar] (255) COLLATE Cyrillic_General_CI_AS NULL,"
  sql.putBuf "    [EVENT] [varchar] (255) COLLATE Cyrillic_General_CI_AS NULL"
  sql.putBuf "  )"
  sql.putBuf "END "
  sql.putBuf "go"
  sql.putBuf GenerateRightsStruct("sysoptions")
  
  sql.putBuf IfCreateTable("sysoptions")
  sql.putBuf "BEGIN"
  sql.putBuf "create table sysoptions("
  sql.putBuf "sysoptionsID uniqueidentifier primary key rowguidcol default (newid()),"
  sql.putBuf "Name varchar(255) null,"
  sql.putBuf "Value varchar(255) null,"
  sql.putBuf "OptionType VarChar(255) null"
  sql.putBuf ")"
  sql.putBuf "END "
  sql.putBuf "go"
  sql.putBuf GenerateRightsStruct("sysoptions")
  
  sql.putBuf IfCreateTable("typelist")
  sql.putBuf "BEGIN"
  sql.putBuf "create table typelist("
  sql.putBuf "typelistID uniqueidentifier primary key rowguidcol default (newid()),"
  sql.putBuf "Name varchar(255) not null,"
  sql.putBuf "SecurityStyleID uniqueidentifier null, /* default security style for type */"
  sql.putBuf "RegisterProc varchar(255) null,"
  sql.putBuf "DeleteProc VarChar(255) null,"
  sql.putBuf "HCLProc varchar(255) null /* has children locked */,"
  sql.putBuf "PropagateProc varchar(255) null /* propagate secrity styleto children */"
  sql.putBuf ")"
  sql.putBuf "END "
  sql.putBuf "go"
  sql.putBuf GenerateRightsStruct("typelist")

  sql.putBuf IfCreateTable("instance")
  sql.putBuf "BEGIN"
  sql.putBuf "create table Instance("
  sql.putBuf "InstanceID uniqueidentifier rowguidcol default (newid()) not null,"
  sql.putBuf "LockUserID uniqueidentifier null, "
  sql.putBuf "LockSessionID uniqueidentifier null, "
  sql.putBuf "SecurityStyleID uniqueidentifier null, /* default security style for document */"
  sql.putBuf "Name varchar(255) null,"
  sql.putBuf "ObjType VarChar(255) null,"
  sql.putBuf ")"
  sql.putBuf "ALTER TABLE Instance ADD constraint PK_INSTANCE  PRIMARY KEY  CLUSTERED (InstanceID)"
  sql.putBuf "END"
  sql.putBuf "go"
  sql.putBuf GenerateRightsStruct("Instance")
   
  sql.putBuf columnIfSQL("OwnerPartName", "INSTANCE")
  sql.putBuf "  alter table instance add OwnerPartName varchar(255) null"
  sql.putBuf "go"
  
  sql.putBuf columnIfSQL("OwnerRowID", "INSTANCE")
  sql.putBuf "  alter table instance add OwnerRowID uniqueidentifier null"
  sql.putBuf "go"
  
  sql.putBuf columnIfSQL("status", "INSTANCE")
  sql.putBuf "  alter table instance add status uniqueidentifier null"
  sql.putBuf "go"
  
  sql.putBuf columnIfSQL("archived", "INSTANCE")
  sql.putBuf "  alter table instance add archived int null default (0)"
  sql.putBuf "go"
  
  sql.putBuf columnIfSQL("StatusName", "INSTANCE")
  sql.putBuf "  alter table instance add StatusName varchar(50) null"
  sql.putBuf "go"
  
  sql.putBuf IfCreateTable("QueryResult")
  sql.putBuf "BEGIN"
  sql.putBuf "CREATE TABLE QueryResult ("
  sql.putBuf "  QueryResultid uniqueidentifier NOT NULL ,"
  sql.putBuf "  result uniqueidentifier NULL ,"
  sql.putBuf ")"
  sql.putBuf "END "
  sql.putBuf "GO"
  sql.putBuf GenerateRightsStruct("QueryResult")
   
  sql.putBuf IfCreateTable("RPRESULT")
  sql.putBuf "BEGIN"
  sql.putBuf "CREATE TABLE RPRESULT ("
  sql.putBuf "  RPRESULTID uniqueidentifier NOT NULL ,"
  sql.putBuf "  PARENTLEVEL int NOT NULL ,"
  sql.putBuf "  PARTNAME varchar (255) NULL ,"
  sql.putBuf "  ROWID uniqueidentifier NULL ,"
  sql.putBuf "  CONSTRAINT pk_PRRESULT PRIMARY KEY  CLUSTERED"
  sql.putBuf "  ("
  sql.putBuf "    RPRESULTID,"
  sql.putBuf "    PARENTLEVEL"
  sql.putBuf "  )"
  sql.putBuf ")"
  sql.putBuf "End"
  sql.putBuf "GO"
  sql.putBuf GenerateRightsStruct("RPRESULT")

  '===========================================
  sql.putBuf viewDropSQL("v_INSTANCE")
  sql.putBuf GetView_v_INSTANCE()
  sql.putBuf GenerateRightsStruct("v_INSTANCE")
  '===========================================
  
  o.Module = "--Kernel tables"
  o.Block = "--body"
  o.OutNL sql.getBuf
    
  If OptFullText Then
    Set sql = Nothing
    Set sql = New Writer
    
    sql.putBuf "exec sp_fulltext_table 'INSTANCE','Create', 'fulltext_catalog','pk_INSTANCE'"
    sql.putBuf "go"
    sql.putBuf "exec sp_fulltext_column 'INSTANCE','NAME','add',1049"
    sql.putBuf "go"
    o.Module = "--FullText"
    o.Block = "--create"
    o.OutNL sql.getBuf
  End If
   
  Set sql = Nothing
  Set sql = New Writer
  '===========================================
  sql.putBuf funcDropSQL("GetBriefFromXML")
  sql.putBuf GetFunc_GetBriefFromXML()
  sql.putBuf GenerateRightsProc("GetBriefFromXML")
  '===========================================
  sql.putBuf funcDropSQL("GetIDFromXML")
  sql.putBuf GetFunc_GetIDFromXML()
  sql.putBuf GenerateRightsProc("GetIDFromXML")
  '===========================================
  sql.putBuf procDropSQL("GetData")
  sql.putBuf GetProc_GetData()
  sql.putBuf GenerateRightsProc("GetData")
  '===========================================
  sql.putBuf funcDropSQL("Instance_BRIEF_F")
  sql.putBuf GetFunc_Instance_BRIEF_F()
  sql.putBuf GenerateRightsProc("Instance_BRIEF_F")
  '===========================================
  sql.putBuf procDropSQL("Instance_OWNER")
  sql.putBuf GetProc_Instance_OWNER()
  sql.putBuf GenerateRightsProc("Instance_OWNER")
  '===========================================
  sql.putBuf procDropSQL("SysOptions_Save")
  sql.putBuf GetProc_SysOptions_Save()
  sql.putBuf GenerateRightsProc("SysOptions_Save")
  '===========================================
  sql.putBuf procDropSQL("Instance_Save")
  sql.putBuf GetProc_Instance_Save()
  sql.putBuf GenerateRightsProc("Instance_Save")
  '===========================================
  sql.putBuf procDropSQL("Instance_DELETE")
  sql.putBuf GetProc_Instance_DELETE()
  sql.putBuf GenerateRightsProc("Instance_DELETE")
  '===========================================
  sql.putBuf procDropSQL("Instance_HCL")
  sql.putBuf GetProc_Instance_HCL()
  sql.putBuf GenerateRightsProc("Instance_HCL")
  '===========================================
  sql.putBuf procDropSQL("Instance_propagate")
  sql.putBuf GetProc_Instance_propagate()
  sql.putBuf GenerateRightsProc("Instance_propagate")
  '===========================================
  sql.putBuf procDropSQL("Instance_ISLOCKED")
  sql.putBuf GetProc_Instance_ISLOCKED()
  sql.putBuf GenerateRightsProc("Instance_ISLOCKED")
  '===========================================
  sql.putBuf procDropSQL("Instance_SINIT")
  sql.putBuf GetProc_Instance_SINIT()
  sql.putBuf GenerateRightsProc("Instance_SINIT")
  '===========================================
  sql.putBuf procDropSQL("Instance_LOCK")
  sql.putBuf GetProc_Instance_LOCK()
  sql.putBuf GenerateRightsProc("Instance_LOCK")
  '===========================================
  sql.putBuf procDropSQL("Instance_UNLOCK")
  sql.putBuf GetProc_Instance_UNLOCK()
  sql.putBuf GenerateRightsProc("Instance_UNLOCK")
  '===========================================
  sql.putBuf procDropSQL("Instance_BRIEF")
  sql.putBuf GetProc_Instance_BRIEF()
  sql.putBuf GenerateRightsProc("Instance_BRIEF")
  '===========================================
  sql.putBuf procDropSQL("QR_and_QR")
  sql.putBuf GetProc_QR_and_QR()
  sql.putBuf GenerateRightsProc("QR_and_QR")
  '===========================================
  sql.putBuf procDropSQL("QR_or_QR")
  sql.putBuf GetProc_QR_or_QR()
  sql.putBuf GenerateRightsProc("QR_or_QR")
  '===========================================
  sql.putBuf procDropSQL("RowParents")
  sql.putBuf GetProc_RowParents()
  sql.putBuf GenerateRightsProc("RowParents")
  '===========================================
  sql.putBuf procDropSQL("Instance_Status")
  sql.putBuf GetProc_Instance_Status()
  sql.putBuf GenerateRightsProc("Instance_Status")
  '===========================================

  o.Module = "--Kernel procs"
  o.Block = "--body"
  o.OutNL sql.getBuf
  
  Set sql = Nothing
  
  DebugOutput "SQLGEN.KERNEL:done"
  Exit Sub

bye:
  log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
  DebugOutput "SQLGEN.KERNEL:" & Err.Description
  'Resume
  'Stop
  Set sql = Nothing
End Sub
