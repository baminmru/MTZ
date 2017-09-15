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
        
        Private mTables As Boolean
        Private mKernel As Boolean
        Private mViews As Boolean
        Private mFullText As Boolean
        Private mInit As Boolean
        Private mProcs As Boolean
        Private mMethod As Boolean
        Private mManual As Boolean
        Private mRights As Boolean
        Private mMaintein As Boolean
        
        
        Public Map As Collection
        
        Public Sub Setup()
          Dim f As frmOptions
          Set f = New frmOptions
          frmOptions.Show vbModal
        End Sub
        
        
        Public Property Get OptTables() As Boolean
          OptTables = mTables
        End Property
        
        Public Property Let OptTables(v As Boolean)
          mTables = v
        End Property
        
        Public Property Get OptMaintein() As Boolean
          OptMaintein = mMaintein
        End Property
        
        Public Property Let OptMaintein(v As Boolean)
          mMaintein = v
        End Property
        
        Public Property Get OptManual() As Boolean
          OptManual = mManual
        End Property
        
        Public Property Let OptManual(v As Boolean)
          mManual = v
        End Property
        
        
      Public Property Get OptRights() As Boolean
       OptRights = mRights
      End Property
      
      Public Property Let OptRights(v As Boolean)
        mRights = v
      End Property
      
        Public Property Get OptMethod() As Boolean
          OptMethod = mMethod
        End Property
        
        Public Property Let OptMethod(v As Boolean)
          mMethod = v
        End Property
        
        Public Property Get OptProcs() As Boolean
          OptProcs = mProcs
        End Property
        
        Public Property Let OptProcs(v As Boolean)
          mProcs = v
        End Property
        
        
        Public Property Get OptInit() As Boolean
          OptInit = mInit
        End Property
        
        Public Property Let OptInit(v As Boolean)
          mInit = v
        End Property
        Public Property Get OptFullText() As Boolean
          OptFullText = mFullText
        End Property
        
        Public Property Let OptFullText(v As Boolean)
          mFullText = v
        End Property
        
        Public Property Get OptViews() As Boolean
          OptViews = mViews
        End Property
        
        Public Property Let OptViews(v As Boolean)
          mViews = v
        End Property
        
        Public Property Get OptKernel() As Boolean
          OptKernel = mKernel
        End Property
        
        Public Property Let OptKernel(v As Boolean)
          mKernel = v
        End Property
        
        
        
        Private Sub Kernel()
          Dim sql As Writer
          Set sql = New Writer
          
          DoEvents
          On Error GoTo bye
          DebugOutput "SQLGEN.KERNEL:start"
          
          
          sql.putBuf "-- Kernel Tables --"
          
          sql.putBuf "if not exists (select * from sysobjects where id = object_id(N'sysoptions') and OBJECTPROPERTY(id, N'IsUserTable') = 1)"
          sql.putBuf "BEGIN"
          sql.putBuf "create table sysoptions("
          sql.putBuf "sysoptionsID uniqueidentifier primary key rowguidcol default (newid()),"
          sql.putBuf "Name varchar(255) null,"
          sql.putBuf "Value varchar(255) null,"
          sql.putBuf "OptionType VarChar(255) null"
          sql.putBuf ")"
          sql.putBuf "END "
          sql.putBuf "go"
          
 !>       If (OptRights) Then
 !>         sql.putBuf "revoke all on [dbo].[sysoptions] to [public]"
 !>         sql.putBuf "go"
 !>         sql.putBuf "grant select on [dbo].[sysoptions] to [public]"
 !>         sql.putBuf "go"
 !>       End If
 !>     sql.putBuf "if not exists (select * from sysobjects where id = object_id(N'pager') and OBJECTPROPERTY(id, N'IsUserTable') = 1)"
 !>     sql.putBuf "BEGIN"
 !>     sql.putBuf "  CREATE TABLE [Pager] ("
 !>     sql.putBuf "    [PagerID] [uniqueidentifier] NOT NULL ,"
 !>     sql.putBuf "    [ViewID] [uniqueidentifier] NOT NULL ,"
 !>     sql.putBuf "    [Sequence] [numeric](18, 0) IDENTITY (1, 1) NOT NULL ,"
 !>     sql.putBuf "    [SessionID] [uniqueidentifier] NULL ,"
 !>     sql.putBuf "    CONSTRAINT [PK_Pager] PRIMARY KEY  CLUSTERED"
 !>     sql.putBuf "    ("
 !>     sql.putBuf "        [PagerID],"
 !>     sql.putBuf "        [ViewID]"
 !>     sql.putBuf "    )"
 !>     sql.putBuf ") "
 !>     sql.putBuf "END "
 !>     sql.putBuf "GO"
 !>  
 !>     If (OptRights) Then
 !>       sql.putBuf "grant ALL on [dbo].[PAGER] to [public]"
 !>       sql.putBuf "go"
 !>     End If
 !>  
 !>       sql.putBuf "drop function GetBriefFromXML "
 !>       sql.putBuf "go"
 !>       sql.putBuf "create function GetBriefFromXML (@xmlSource varchar(4000))"
 !>       sql.putBuf "RETURNS VarChar(4000)"
 !>       sql.putBuf "as"
 !>       sql.putBuf "BEGIN"
 !>       sql.putBuf "declare @outstr as varchar(4000)"
 !>       sql.putBuf "declare @from as int"
 !>       sql.putBuf "declare @to as int"
 !>       sql.putBuf ""
 !>       sql.putBuf "select @from = CHARINDEX('<Brief>', @xmlSource)"
 !>       sql.putBuf "select @to = CHARINDEX('</Brief>', @xmlSource)"
 !>       sql.putBuf "if (@from > 0 AND @to > 0) begin"
 !>       sql.putBuf "  select @outstr = substring(@xmlSource, @from + 7, @to - @from - 7)"
 !>       sql.putBuf "end else begin"
 !>       sql.putBuf "  select @outstr = ''"
 !>       sql.putBuf "End"
 !>       sql.putBuf ""
 !>       sql.putBuf "return @outstr"
 !>       sql.putBuf ""
 !>       sql.putBuf "End"
 !>       sql.putBuf "go"
 !>       If (OptRights) Then
 !>       sql.putBuf "revoke all on [dbo].[GetBriefFromXML]  to [public]"
 !>       sql.putBuf "go"
 !>       sql.putBuf "grant execute on [dbo].[GetBriefFromXML]  to [public]"
 !>       sql.putBuf "go"
 !>       End If
 !>       
 !>       sql.putBuf "drop function GetIDFromXML "
 !>       sql.putBuf "go"
 !>       sql.putBuf "create function GetIDFromXML (@xmlSource varchar(4000))"
 !>       sql.putBuf "RETURNS VarChar(4000)"
 !>       sql.putBuf "as"
 !>       sql.putBuf "BEGIN"
 !>       sql.putBuf "declare @outstr as varchar(4000)"
 !>       sql.putBuf "declare @from as int"
 !>       sql.putBuf "declare @to as int"
 !>       sql.putBuf ""
 !>       sql.putBuf "select @from = CHARINDEX('<ID>', @xmlSource)"
 !>       sql.putBuf "select @to = CHARINDEX('</ID>', @xmlSource)"
 !>       sql.putBuf "if (@from > 0 AND @to > 0) begin"
 !>       sql.putBuf "  select @outstr = substring(@xmlSource, @from + 4, @to - @from - 4)"
 !>       sql.putBuf "end else begin"
 !>       sql.putBuf "  select @outstr = ''"
 !>       sql.putBuf "End"
 !>       sql.putBuf ""
 !>       sql.putBuf "return @outstr"
 !>       sql.putBuf ""
 !>       sql.putBuf "End"
 !>       sql.putBuf "GO"
 !>       If (OptRights) Then
 !>       sql.putBuf "revoke all on [dbo].[GetIDFromXML] to [public]"
 !>       sql.putBuf "go"
 !>       sql.putBuf "grant execute on [dbo].[GetIDFromXML] to [public]"
 !>       sql.putBuf "go"
 !>       End If
 !>     
 !>       
 !>       sql.putBuf "drop procedure GetData  "
 !>       sql.putBuf "GO"
 !>       sql.putBuf "create proc GetData (@CURSESSION uniqueidentifier,@CurrentUser uniqueidentifier, @Query nvarchar(4000))  as"
 !>       sql.putBuf "begin"
 !>       sql.putBuf "set nocount on"
 !>       sql.putBuf " exec sp_executesql  @Query"
 !>       sql.putBuf "End"
 !>       sql.putBuf "GO"
 !>       If (OptRights) Then
 !>       sql.putBuf "revoke all on [dbo].[GetData] to [public]"
 !>       sql.putBuf "go"
 !>       sql.putBuf "grant execute on [dbo].[GetData] to [public]"
 !>       sql.putBuf "go"
 !>       End If
 !>     
          
          sql.putBuf "if not exists (select * from sysobjects where id = object_id(N'typelist') and OBJECTPROPERTY(id, N'IsUserTable') = 1)"
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
 !>      If (OptRights) Then
 !>       sql.putBuf "revoke all on [dbo].[typelist] to [public]"
 !>       sql.putBuf "go"
 !>       sql.putBuf "grant select on [dbo].[typelist] to [public]"
 !>       sql.putBuf "go"
 !>       End If
        
           sql.putBuf "if not exists (select * from sysobjects where id = object_id(N'instance') and OBJECTPROPERTY(id, N'IsUserTable') = 1)"
           sql.putBuf "BEGIN"
           sql.putBuf "create table Instance("
           sql.putBuf "InstanceID uniqueidentifier rowguidcol default (newid()) not null,"
           sql.putBuf "LockUserID uniqueidentifier null, "
           sql.putBuf "LockSessionID uniqueidentifier null, "
           sql.putBuf "SecurityStyleID uniqueidentifier null, /* default security style for document */"
           sql.putBuf "Name varchar(255) null,"
           sql.putBuf "ObjType VarChar(255) null,"
           sql.putBuf ")"
           sql.putBuf "ALTER TABLE Instance ADD constraint PK_INSTANCE  PRIMARY KEY  CLUSTERED  (    InstanceID  )"
           sql.putBuf "END "
           sql.putBuf "go"
 !>        If (OptRights) Then
 !>       sql.putBuf "revoke all on [dbo].[Instance] to [public]"
 !>       sql.putBuf "go"
 !>       sql.putBuf "grant select on [dbo].[Instance] to [public]"
 !>       sql.putBuf "go"
 !>       End If
           
           sql.putBuf "if  not exists(select * from syscolumns where name='OwnerPartName' and id=object_id(N'INSTANCE'))"
           sql.putBuf "alter table instance add OwnerPartName varchar(255) null"
           sql.putBuf "go"
           
           sql.putBuf "if  not exists(select * from syscolumns where name='OwnerROwID' and id=object_id(N'INSTANCE'))"
           sql.putBuf "alter table instance add OwnerRowID uniqueidentifier null"
           sql.putBuf "go"
           
           sql.putBuf "if  not exists(select * from syscolumns where name='status' and id=object_id(N'INSTANCE'))"
           sql.putBuf "alter table instance add status uniqueidentifier null"
           sql.putBuf "go"
        
           sql.putBuf "if  not exists(select * from syscolumns where name='arcihved' and id=object_id(N'INSTANCE'))"
           sql.putBuf "alter table instance add archived int null default (0)"
           sql.putBuf "go"
        
           sql.putBuf "if not exists (select * from sysobjects where id = object_id(N'QueryResult') and OBJECTPROPERTY(id, N'IsUserTable') = 1)"
           sql.putBuf "BEGIN"
           sql.putBuf "CREATE TABLE QueryResult ("
           sql.putBuf "  QueryResultid uniqueidentifier NOT NULL ,"
           sql.putBuf "  result uniqueidentifier NULL ,"
           sql.putBuf ")"
           sql.putBuf "END "
           sql.putBuf "GO"
 !>       If (OptRights) Then
 !>       sql.putBuf "revoke all on [dbo].[QueryResult] to [public]"
 !>       sql.putBuf "go"
 !>       sql.putBuf "grant select on [dbo].[QueryResult] to [public]"
 !>       sql.putBuf "go"
 !>       End If
           
           sql.putBuf "if not exists (select * from sysobjects where id = object_id(N'RPRESULT') and OBJECTPROPERTY(id, N'IsUserTable') = 1)"
           sql.putBuf " BEGIN"
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
           
 !>        If (OptRights) Then
 !>        sql.putBuf "revoke all on [dbo].[RPRESULT] to [public]"
 !>        sql.putBuf "go"
 !>        sql.putBuf "grant select on [dbo].[RPRESULT]  to [public]"
 !>        sql.putBuf "grant delete on [dbo].[RPRESULT]  to [public]"
 !>        sql.putBuf "go"
 !>        End If
 !>     
           
           o.Module = "--Kernel tables"
           o.Block = "--body"
           o.OutNL sql.getBuf
          
          ' создаем первую табличку в индексе
          Set sql = Nothing
          Set sql = New Writer
          
          sql.putBuf "exec sp_fulltext_table 'INSTANCE','Create', 'fulltext_catalog','pk_INSTANCE'"
          sql.putBuf "go"
          sql.putBuf "exec sp_fulltext_column 'INSTANCE','NAME','add',1049"
          sql.putBuf "go"
          o.Module = "--FullText"
          o.Block = "--create"
          o.OutNL sql.getBuf
          
           
          Set sql = Nothing
          Set sql = New Writer
          sql.putBuf funcDropSQL("instance_BRIEF_F")
          sql.putBuf "  create function instance_BRIEF_F  ("
          sql.putBuf " @instanceid uniqueidentifier"
          sql.putBuf ")returns varchar(4000) as  begin"
          sql.putBuf " declare @BRIEF varchar(4000)"
          sql.putBuf "  set @BRIEF=' to do'"
          sql.putBuf "  return (@BRIEF)"
          sql.putBuf "End"
          sql.putBuf "GO"
 !>       If (OptRights) Then
 !>       sql.putBuf "revoke all on [dbo].[instance_BRIEF_F]  to [public]"
 !>       sql.putBuf "GO"
 !>       sql.putBuf "grant execute on [dbo].[instance_BRIEF_F]  to [public]"
 !>       sql.putBuf "GO"
 !>       End If
        
          o.Module = "--FunctionsHeader"
          o.Block = "--TableProc"
          o.OutNL sql.getBuf
           
          
          Set sql = Nothing
          Set sql = New Writer
          sql.putBuf "  alter function instance_BRIEF_F  ("
          sql.putBuf " @instanceid uniqueidentifier"
          sql.putBuf ")returns varchar(4000) as  begin"
          sql.putBuf " declare @BRIEF varchar(4000)"
          sql.putBuf "if @instanceid is null begin set @BRIEF='' return (@BRIEF) end"
          sql.putBuf " -- Brief body --"
          sql.putBuf "if exists(select 1 from instance where instanceID=@instanceID)"
          sql.putBuf " begin"
          sql.putBuf "  set @BRIEF=''"
          sql.putBuf "  select @BRIEF= @BRIEF"
          sql.putBuf "  +  isnull(Name,' ')+'; '"
          sql.putBuf "  from instance  where  instanceID = @instanceID"
          sql.putBuf "end else begin"
          sql.putBuf "  set @BRIEF= 'неверный идентификатор'"
          sql.putBuf "End"
          sql.putBuf "set @BRIEF=left(@BRIEF,4000)"
          sql.putBuf "  return (@BRIEF)"
          sql.putBuf "End"
          sql.putBuf ""
          sql.putBuf "GO"
        
          
          sql.putBuf procDropSQL("INSTANCE_OWNER")
          sql.putBuf "create proc INSTANCE_OWNER (  @cursession uniqueidentifier ,@instanceid uniqueidentifier, @OwnerPartName varchar(255), @OwnerRowID uniqueidentifier) as"
          sql.putBuf "begin"
          sql.putBuf "if exists( select 1 from instance where instanceid=@instanceid)"
          sql.putBuf "  if @OwnerPartName is null or @ownerRowID is null"
          sql.putBuf "  begin"
          sql.putBuf "     update instance set OwnerPartName=null, OwnerRowid = null where instanceid=@instanceid"
          sql.putBuf "  end Else begin"
          sql.putBuf "     update instance set OwnerPartName=@OwnerPartName, OwnerRowid = @OwnerRowID where instanceid=@instanceid"
          sql.putBuf "  End"
          sql.putBuf "End"
          sql.putBuf "go"
          sql.putBuf ""
 !>       If (OptRights) Then
 !>       sql.putBuf "revoke all on [dbo].[INSTANCE_OWNER] to [public]"
 !>       sql.putBuf "go"
 !>       sql.putBuf "grant execute on [dbo].[INSTANCE_OWNER] to [public]"
 !>       sql.putBuf "go"
 !>       End If
 !>     
          
          
          sql.putBuf procDropSQL("SysOptions_Save")
          sql.putBuf "create proc SysOptions_Save ( @SysOptionsid uniqueidentifier, @Name varchar(255),@Value varchar (255), @OptionType varchar(255)) as"
          sql.putBuf "begin"
          sql.putBuf "if exists( select 1 from sysoptions where sysoptionsid=@sysoptionsid)"
          sql.putBuf "update sysoptions set Name=@Name, Value=@Value, OptionType=@OptionType where sysoptionsid=@sysoptionsid"
          sql.putBuf "Else"
          sql.putBuf "insert into sysoptions (sysoptionsid, Name, Value, OptionType)values(@sysoptionsid,@Name,@Value,@OptionType)"
          sql.putBuf "End"
          sql.putBuf "go"
          sql.putBuf ""
 !>       If (OptRights) Then
 !>       sql.putBuf "revoke all on [dbo].[SysOptions_Save] to [public]"
 !>       sql.putBuf "go"
 !>       sql.putBuf "grant execute on [dbo].[SysOptions_Save] to [public]"
 !>       sql.putBuf "go"
 !>       End If
        
          
          sql.putBuf procDropSQL("Instance_Save")
          sql.putBuf "create proc Instance_Save ("
          sql.putBuf "@CURSESSION uniqueidentifier,"
          sql.putBuf "@InstanceID uniqueidentifier,"
          sql.putBuf "@ObjType varchar(255),"
          sql.putBuf "@Name varchar(255)"
          sql.putBuf ") as"
          sql.putBuf "begin"
          sql.putBuf " declare @tmpStr varchar(255)"
          sql.putBuf " declare @SSID uniqueidentifier"
          sql.putBuf " declare @tmpID uniqueidentifier"
          sql.putBuf " declare @SysLogID uniqueidentifier"
          sql.putBuf " declare @access integer"
          sql.putBuf " declare @SysInstID uniqueidentifier"
          sql.putBuf " declare @StatusID uniqueidentifier"
          sql.putBuf " select @SysInstID =Instanceid from instance where objtype='MTZSYSTEM'"
          
          
          sql.putBuf "if exists( select 1 from instance where instanceid=@instanceid )"
          sql.putBuf "  begin"
          sql.putBuf "   select  @tmpID =SecurityStyleID from INSTANCE where INSTANCEid=@INSTANCEid"
          sql.putBuf "   exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='EDIT',@access=@access out "
          sql.putBuf "   if @access=0 "
          sql.putBuf "   begin"
          sql.putBuf "    raiserror('Нет прав на изменение названия объекта.',16,1)"
          sql.putBuf "    if @@trancount>0 rollback tran"
          sql.putBuf "    return"
          sql.putBuf "   end"
          
          sql.putBuf "   exec instance_ISLOCKED @cursession=@cursession,@ROWID=@instanceid,@IsLocked=@access out "
          sql.putBuf "   if @access>2 "
          sql.putBuf "   begin"
          sql.putBuf "     raiserror('Документ заблокирован другим пльзователем.',16,1)"
          sql.putBuf "     if @@trancount>0 rollback tran"
          sql.putBuf "     return"
          sql.putBuf "   end"
        
          sql.putBuf "   select @ObjType=objtype from instance  where  instanceid=@instanceid"
          sql.putBuf "   update instance set name = @name where  instanceid=@instanceid"
          sql.putBuf "   set @SysLogid=newid()"
          sql.putBuf "   EXEC SysLog_SAVE @CURSESSION=@cursession ,@TheSession=@cursession, @InstanceID=@SysInstID, @SysLogid=@SysLogid, @LogStructID = @OBJTYPE ,"
          sql.putBuf "   @VERB='EDIT',  @the_Resource=@InstanceID,@LogInstanceID=@InstanceID"
          
          
          
          sql.putBuf "  End"
          sql.putBuf "Else"
          sql.putBuf "  begin"
          sql.putBuf "    if exists( select 1 from typelist where name = @objtype)"
          sql.putBuf "    begin"
          sql.putBuf "      begin tran"
          sql.putBuf "      select @SSID=SecurityStyleid,@tmpstr =RegisterProc from typelist where name = @objtype"
          sql.putBuf "      exec CheckVerbRight @cursession=@cursession,@Resource=@SSID,@verb='CREATE',@access=@access out "
          sql.putBuf "      if @access=0 "
          sql.putBuf "      begin"
          sql.putBuf "       raiserror('Нет прав на создание.',16,1)"
          sql.putBuf "       if @@trancount>0 rollback tran"
          sql.putBuf "       return"
          sql.putBuf "      end"
          sql.putBuf "      set @statusid=null"
          sql.putBuf "      select @statusid=objstatusid from objstatus join objecttype on"
          sql.putBuf "      objecttype.objecttypeid=objstatus.parentstructrowid and objecttype.name=@objtype and isStartup<>0"
          sql.putBuf "      if not @statusid is null"
          sql.putBuf "        insert into instance(instanceid,name,objtype,SecurityStyleID,STATUS) values(@instanceid,@name,@objtype,@SSID,@STATUSID)"
          sql.putBuf "      else "
          sql.putBuf "        insert into instance(instanceid,name,objtype,SecurityStyleID) values(@instanceid,@name,@objtype,@SSID)"
          sql.putBuf "      if not @tmpstr is null"
          sql.putBuf "        exec @tmpstr @cursession = @cursession, @instanceid =@instanceid"
          sql.putBuf "         set @SysLogid=newid()"
          sql.putBuf "         EXEC SysLog_SAVE @CURSESSION=@cursession ,@TheSession=@cursession, @InstanceID=@SysInstID, @SysLogid=@SysLogid, @LogStructID = @OBJTYPE ,"
          sql.putBuf "         @VERB='CREATE',  @the_Resource=@InstanceID,@LogInstanceID=@InstanceID"
          sql.putBuf "      if @@trancount >0 commit tran"
          sql.putBuf "    End"
          sql.putBuf "  End"
          sql.putBuf "End"
          sql.putBuf "go"
 !>       If (OptRights) Then
 !>       sql.putBuf "revoke all on [dbo].[Instance_Save]  to [public]"
 !>       sql.putBuf "go"
 !>       sql.putBuf "grant execute on [dbo].[Instance_Save]  to [public]"
 !>       sql.putBuf "go"
 !>       End If
 !>     
          
          sql.putBuf procDropSQL("Instance_DELETE")
          sql.putBuf "create proc Instance_DELETE ("
          sql.putBuf "@CURSESSION uniqueidentifier,"
          sql.putBuf "@InstanceID uniqueidentifier"
          sql.putBuf ") as"
          sql.putBuf "begin"
          
          sql.putBuf "  declare @tmpStr varchar(255)"
          sql.putBuf "  declare @Str Nvarchar(4000)"
          sql.putBuf "  declare @ObjType varchar(255)"
          sql.putBuf " declare @SysInstID uniqueidentifier"
          sql.putBuf " select @SysInstID =Instanceid from instance where objtype='MTZSYSTEM'"
          sql.putBuf "  if exists( select 1 from instance where instanceid=@instanceid )"
          sql.putBuf "      begin"
          sql.putBuf "   declare @tmpID uniqueidentifier"
          sql.putBuf "   declare @access integer"
          sql.putBuf "   declare @OwnerPartName varchar(255)"
          sql.putBuf "   declare @OwnerRowID uniqueidentifier"
          sql.putBuf "   declare @SysLogid uniqueidentifier"
          sql.putBuf "   select  @tmpID =SecurityStyleID,@OwnerPartName = OwnerPartName,@OwnerRowID =OWnerRowID from INSTANCE where INSTANCEid=@INSTANCEid"
          sql.putBuf "   exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='DELETE',@access=@access out"
          sql.putBuf "   if @access=0"
          sql.putBuf "    begin"
          sql.putBuf "      raiserror('Нет прав на удаление.',16,1)"
          sql.putBuf "      if @@trancount>0 rollback tran"
          sql.putBuf "      Return"
          sql.putBuf "    End"
          sql.putBuf "       if @Ownerpartname is null or @OwnerRowID is null begin"
          sql.putBuf "        select @objtype = objtype from instance where instanceid=@instanceid"
          sql.putBuf "        select @tmpstr =DeleteProc from typelist where name = @objtype"
          sql.putBuf "        begin tran"
          
          sql.putBuf "        if not @tmpstr is null"
          sql.putBuf "          exec @tmpstr @cursession = @cursession, @instanceid =@instanceid"
          sql.putBuf "        if @@trancount =0 return"
          sql.putBuf "        delete from instance where instanceid=@instanceid"
          sql.putBuf "        set @SysLogid=newid()"
          sql.putBuf "        EXEC SysLog_SAVE @CURSESSION=@cursession ,@TheSession=@cursession, @InstanceID=@SysInstID, @SysLogid=@SysLogid, @LogStructID = @objtype ,"
          sql.putBuf "        @VERB='DELETE',  @the_Resource=@InstanceID,@LogInstanceID=@InstanceID"
          sql.putBuf "        if @@trancount >0 commit tran"
          sql.putBuf ""
          sql.putBuf "        end else begin"
          sql.putBuf "        -- Owner exists"
          sql.putBuf ""
          sql.putBuf "         set @str =N'select @tmpid='+@ownerpartname +'id from ' + @ownerpartname + ' where ' + @ownerpartname +'id=@ownerrowid'"
          sql.putBuf "         exec sp_executesql @str,N'@tmpid uniqueidentifier out, @ownerRowID uniqueidentifier',@tmpid=@tmpid out,@ownerrowid=@ownerrowid"
          sql.putBuf "         if @tmpid=@ownerrowid begin"
          sql.putBuf "        raiserror('Этот документ принадлежит другому документу и не может быть удален отдельно.',16,1)"
          sql.putBuf "        if @@trancount>0 rollback tran"
          sql.putBuf "        Return"
          sql.putBuf "         End"
          sql.putBuf "         select @objtype = objtype from instance where instanceid=@instanceid"
          sql.putBuf "         select @tmpstr =DeleteProc from typelist where name = @objtype"
          sql.putBuf "         begin tran"
          sql.putBuf "         if not @tmpstr is null"
          sql.putBuf "           exec @tmpstr @cursession = @cursession, @instanceid =@instanceid"
          sql.putBuf "         if @@trancount =0 return"
          sql.putBuf "         delete from instance where instanceid=@instanceid"
          
          
          sql.putBuf "         set @SysLogid=newid()"
          sql.putBuf "         EXEC SysLog_SAVE @CURSESSION=@cursession ,@TheSession=@cursession, @InstanceID=@SysInstID, @SysLogid=@SysLogid, @LogStructID = @objtype ,"
          sql.putBuf "         @VERB='DELETE',  @the_Resource=@InstanceID,@LogInstanceID=@InstanceID"
          
          
          sql.putBuf "         if @@trancount >0 commit tran"
          sql.putBuf "        End"
          sql.putBuf "     End"
          
        '  sql.putbuf "declare @tmpStr varchar(255)"
        '  sql.putbuf "declare @ObjType varchar(255)"
        '  sql.putbuf "if exists( select 1 from instance where instanceid=@instanceid )"
        '  sql.putbuf "    begin"
        '  sql.putbuf " declare @tmpID uniqueidentifier"
        '  sql.putbuf " declare @access integer"
        '  sql.putbuf " select  @tmpID =SecurityStyleID from INSTANCE where INSTANCEid=@INSTANCEid"
        '  sql.putbuf " exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='DELETE',@access=@access out "
        '  sql.putbuf " if @access=0 "
        '  sql.putbuf "  begin"
        '  sql.putbuf "    raiserror('Нет прав на удаление.',16,1)"
        '  sql.putbuf "    if @@trancount>0 rollback tran"
        '  sql.putbuf "    return"
        '  sql.putbuf "  end"
        '  sql.putbuf "      select @objtype = objtype from instance where instanceid=@instanceid"
        '  sql.putbuf "      select @tmpstr =DeleteProc from typelist where name = @objtype"
        '  sql.putbuf "      begin tran"
        '  sql.putbuf "      if not @tmpstr is null"
        '  sql.putbuf "        exec @tmpstr @cursession = @cursession, @instanceid =@instanceid"
        '  sql.putbuf "      if @@trancount =0 return"
        '  sql.putbuf "      delete from instance where instanceid=@instanceid"
        '  sql.putbuf "      if @@trancount >0 commit tran"
        '  sql.putbuf "    End"
        
          sql.putBuf "End"
          sql.putBuf "go"
 !>       If (OptRights) Then
 !>       sql.putBuf "revoke all on [dbo].[Instance_DELETE] to [public]"
 !>       sql.putBuf "go"
 !>       sql.putBuf "grant execute on [dbo].[Instance_DELETE] to [public]"
 !>       sql.putBuf "go"
 !>       End If
          
          sql.putBuf procDropSQL("Instance_HCL")
          sql.putBuf "create proc Instance_HCL ("
          sql.putBuf "@CURSESSION uniqueidentifier,"
          sql.putBuf "@RowID uniqueidentifier,"
          sql.putBuf "@IsLocked int out"
          sql.putBuf ") as"
          sql.putBuf "begin"
          sql.putBuf "declare @tmpStr varchar(255)"
          sql.putBuf "declare @ObjType varchar(255)"
          sql.putBuf "if exists( select 1 from instance where instanceid=@rowid )"
          sql.putBuf "    begin"
          sql.putBuf "      select @objtype = objtype from instance where instanceid=@rowid"
          sql.putBuf "      select @tmpstr =HCLProc from typelist where name = @objtype"
          sql.putBuf "      if not @tmpstr is null"
          sql.putBuf "        exec @tmpstr @cursession = @cursession, @ROWid =@rowid,@IsLocked=@IsLocked out"
          sql.putBuf "    End"
          sql.putBuf "End"
          sql.putBuf "go"
 !>       If (OptRights) Then
 !>       sql.putBuf "revoke all on [dbo].[Instance_HCL] to [public]"
 !>       sql.putBuf "go"
 !>       sql.putBuf "grant execute on [dbo].[Instance_HCL] to [public]"
 !>       sql.putBuf "go"
 !>       End If
          
          
          sql.putBuf procDropSQL("Instance_propagate")
          sql.putBuf "create proc Instance_propagate ("
          sql.putBuf "@CURSESSION uniqueidentifier,"
          sql.putBuf "@RowID uniqueidentifier"
          sql.putBuf ") as"
          sql.putBuf "begin"
          sql.putBuf "declare @tmpStr varchar(255)"
          sql.putBuf "declare @ObjType varchar(255)"
          sql.putBuf "if exists( select 1 from instance where instanceid=@rowid )"
          sql.putBuf "    begin"
          sql.putBuf "      select @objtype = objtype from instance where instanceid=@rowid"
          sql.putBuf "      select @tmpstr =propagateProc from typelist where name = @objtype"
          sql.putBuf "      if not @tmpstr is null"
          sql.putBuf "        exec @tmpstr @cursession = @cursession, @ROWid =@rowid"
          sql.putBuf "    End"
          sql.putBuf "End"
          sql.putBuf "go"
 !>       If (OptRights) Then
 !>       sql.putBuf "revoke all on [dbo].[Instance_propagate] to [public]"
 !>       sql.putBuf "go"
 !>       sql.putBuf "grant execute on [dbo].[Instance_propagate] to [public]"
 !>       sql.putBuf "go"
 !>       End If
          
          
          sql.putBuf procDropSQL("INSTANCE_ISLOCKED")
          sql.putBuf " create  proc INSTANCE_ISLOCKED ("
          sql.putBuf " @CURSESSION uniqueidentifier,"
          sql.putBuf " @RowID uniqueidentifier ,"
          sql.putBuf " @IsLocked integer output"
          sql.putBuf ") as  begin"
          sql.putBuf "set nocount on"
          sql.putBuf " declare @UserID uniqueidentifier"
          sql.putBuf " declare @LockUserID uniqueidentifier"
          sql.putBuf " declare @LockSessionID uniqueidentifier"
          sql.putBuf " set @isLocked = 0"
          sql.putBuf " -- checking session  --"
          sql.putBuf "if not exists( select 1 from the_session where the_sessionid=@cursession and closed=0 )"
          sql.putBuf "  begin"
          sql.putBuf "    raiserror('Сессия уже завершена',16,1)"
          sql.putBuf "    Return"
          sql.putBuf "  End"
          sql.putBuf " select @userID = usersid  from the_session where the_sessionid=@cursession"
          sql.putBuf " select @LockUserID = LockUserID,@LockSessionID = LockSessionID from INSTANCE where INSTANCEid=@RowID"
          sql.putBuf " /* verify this row */"
          sql.putBuf " if not @LockUserID is null"
          sql.putBuf " begin"
          sql.putBuf "   if  @LockUserID <> @userID"
          sql.putBuf "   begin"
          sql.putBuf "     set @isLocked = 4 /* CheckOut by another user */"
          sql.putBuf "     Return"
          sql.putBuf "   end   else"
          sql.putBuf "   begin"
          sql.putBuf "     set @isLocked = 2 /* CheckOut by caller */"
          sql.putBuf "     Return"
          sql.putBuf "   End"
          sql.putBuf " End"
          sql.putBuf " if not @LockSessionID is null"
          sql.putBuf " begin"
          sql.putBuf "   if  @LockSessionID <> @CURSESSION"
          sql.putBuf "   begin"
          sql.putBuf "     set @isLocked = 3 /* Lockes by another user */"
          sql.putBuf "     Return"
          sql.putBuf "   end   else"
          sql.putBuf "   begin"
          sql.putBuf "     set @isLocked = 1 /* Locked by caller */"
          sql.putBuf "     Return"
          sql.putBuf "   End"
          sql.putBuf " End"
          sql.putBuf " set @isLocked = 0"
          sql.putBuf " End"
          sql.putBuf "GO"
 !>       If (OptRights) Then
 !>       sql.putBuf "revoke all on [dbo].[INSTANCE_ISLOCKED] to [Public]"
 !>       sql.putBuf "GO"
 !>       sql.putBuf "Grant execute on [dbo].[INSTANCE_ISLOCKED] to [Public]"
 !>       sql.putBuf "GO"
 !>       End If
          
        
          sql.putBuf procDropSQL("INSTANCE_SINIT")
          sql.putBuf "create  proc Instance_SINIT  ("
          sql.putBuf "@CURSESSION uniqueidentifier,"
          sql.putBuf "@RowID uniqueidentifier ,"
          sql.putBuf " @SecurityStyleID uniqueidentifier=null"
          sql.putBuf ")as  begin"
          sql.putBuf " set nocount on"
          sql.putBuf " declare @ParentTable varchar(255)"
          sql.putBuf " declare @StyleID uniqueidentifier"
          
          sql.putBuf " declare @tmpID uniqueidentifier"
          sql.putBuf " declare @access integer"
          sql.putBuf " select  @tmpID =SecurityStyleID from INSTANCE where INSTANCEid=@ROWID"
          sql.putBuf " exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='SECURE',@access=@access out "
          sql.putBuf " if @access=0 "
          sql.putBuf "  begin"
          sql.putBuf "    raiserror('Нет прав на управление защитой.',16,1)"
          sql.putBuf "    if @@trancount>0 rollback tran"
          sql.putBuf "    return"
          sql.putBuf "  end"
          
          sql.putBuf "  if @SecurityStyleID is null begin"
          sql.putBuf "    select @ParentTable = objtype from instance where instanceid=@RowID"
          sql.putBuf "    select @StyleID =SecurityStyleID from typelist where name =@ParentTable"
          sql.putBuf "    update Instance set securitystyleid =@StyleID where Instanceid = @RowID"
          sql.putBuf "  end else begin"
          sql.putBuf "    update Instance set securitystyleid =@SecurityStyleID where Instanceid = @RowID"
          sql.putBuf "  End"
          sql.putBuf "End"
          sql.putBuf "GO"
          
          ''''''''''''''''''''''''''''''''''''''''''''''''''''''
          
          sql.putBuf procDropSQL("Instance_LOCK")
          sql.putBuf "create  proc Instance_LOCK  ("
          sql.putBuf " @CURSESSION uniqueidentifier,"
          sql.putBuf " @RowID uniqueidentifier ,"
          sql.putBuf " @LockMode integer"
          sql.putBuf ") as  begin"
          sql.putBuf "set nocount on"
          sql.putBuf " declare @UserID uniqueidentifier"
          sql.putBuf " declare @tmpID uniqueidentifier"
          sql.putBuf " declare @access integer"
          sql.putBuf " declare @IsLocked integer"
          sql.putBuf " -- checking session  --"
          sql.putBuf "if not exists( select 1 from the_session where the_sessionid=@cursession and closed=0 )"
          sql.putBuf "  begin"
          sql.putBuf "    raiserror('Сессия уже завершена.',16,1)"
          sql.putBuf "    Return"
          sql.putBuf "  End"
          sql.putBuf " select @userID = usersid  from the_session where the_sessionid=@cursession"
          sql.putBuf " exec Instance_ISLOCKED @CURSESSION,@ROWID,@ISLocked out"
          sql.putBuf " if @IsLocked >=3"
          sql.putBuf "  begin"
          sql.putBuf "    raiserror('Объект заблокирован другим пользователем',16,1)"
          sql.putBuf "    Return"
          sql.putBuf "  End"
          sql.putBuf " if @IsLocked =0"
          sql.putBuf " begin"
          sql.putBuf "  exec Instance_HCL @cursession,@RowID,@isLocked out"
          sql.putBuf "  if @IsLocked >=3"
          sql.putBuf "   begin"
          sql.putBuf "     raiserror('У данного объекта имеются дочерние строки, которые заблокированы другим пользователем',16,1)"
          sql.putBuf "     Return"
          sql.putBuf "   End"
          sql.putBuf " End"
          
          sql.putBuf " select  @tmpID =SecurityStyleID from INSTANCE where INSTANCEid=@ROWID"
          sql.putBuf " exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='LOCKINSTANCE',@access=@access out "
          sql.putBuf " if @access=0 "
          sql.putBuf "  begin"
          sql.putBuf "    raiserror('Нет прав на блокировку объекта.',16,1)"
          sql.putBuf "    if @@trancount>0 rollback tran"
          sql.putBuf "    return"
          sql.putBuf "  end"
          
          sql.putBuf "   if  @LockMode =2"
          sql.putBuf "   begin"
          sql.putBuf "    update INSTANCE  set LockUserID =@userID ,LockSessionID =null where Instanceid=@RowID"
          sql.putBuf "     Return"
          sql.putBuf "   End"
          sql.putBuf "   if  @LockMode =1"
          sql.putBuf "   begin"
          sql.putBuf "    update INSTANCE  set LockUserID =null,LockSessionID =@CURSESSION  where Instanceid=@RowID"
          sql.putBuf "     Return"
          sql.putBuf "   End"
          sql.putBuf " End"
          sql.putBuf ""
          sql.putBuf "GO"
          
          
          sql.putBuf procDropSQL("Instance_UNLOCK")
          sql.putBuf "create  proc Instance_UNLOCK /*Пользователи системы*/ ("
          sql.putBuf " @CURSESSION uniqueidentifier,"
          sql.putBuf " @RowID uniqueidentifier"
          sql.putBuf ") as  begin"
          sql.putBuf "set nocount on"
          sql.putBuf " declare @ParentID uniqueidentifier"
          sql.putBuf " declare @UserID uniqueidentifier"
          sql.putBuf " declare @IsLocked integer"
          sql.putBuf " declare @ParentTable varchar(255)"
          sql.putBuf " -- checking session  --"
          sql.putBuf "if not exists( select 1 from the_session where the_sessionid=@cursession and closed=0 )"
          sql.putBuf "  begin"
          sql.putBuf "    raiserror('Сессия уже завершена.',16,1)"
          sql.putBuf "    Return"
          sql.putBuf "  End"
          sql.putBuf " exec Instance_ISLOCKED @CURSESSION,@ROWID,@ISLocked out"
          sql.putBuf " if @IsLocked >=3"
          sql.putBuf "  begin"
          sql.putBuf "    raiserror('Объект заблокирован другим пользователем',16,1)"
          sql.putBuf "    Return"
          sql.putBuf "  End"
          sql.putBuf "   if  @IsLocked =2"
          sql.putBuf "   begin"
          sql.putBuf "    update INSTANCE set LockUserID =null  where Instanceid=@RowID"
          sql.putBuf "     Return"
          sql.putBuf "   End"
          sql.putBuf "   if  @IsLocked =1"
          sql.putBuf "   begin"
          sql.putBuf "    update INSTANCE set LockSessionID =null  where Instanceid=@RowID"
          sql.putBuf "     Return"
          sql.putBuf "   End"
          sql.putBuf " End"
          sql.putBuf ""
          sql.putBuf "GO"
                  
            sql.putBuf procDropSQL("instance_BRIEF")
            sql.putBuf "  create proc instance_BRIEF  ("
            sql.putBuf " @CURSESSION uniqueidentifier,"
            sql.putBuf " @instanceid uniqueidentifier,"
            sql.putBuf " @BRIEF varchar(4000) output"
            sql.putBuf ") as  begin"
            sql.putBuf "set nocount on"
            sql.putBuf " declare @tmpStr varchar(255)"
            sql.putBuf " declare @access int"
            sql.putBuf " declare @tmpBrief varchar(4000)"
            sql.putBuf " declare @tmpID uniqueidentifier"
            sql.putBuf " -- checking session  --"
            sql.putBuf "if not exists( select 1 from the_session where the_sessionid=@cursession and closed=0 )"
            sql.putBuf "  begin"
            sql.putBuf "    raiserror('Сессия уже завершена.',16,1)"
            sql.putBuf "    Return"
            sql.putBuf "  End"
            sql.putBuf "if @instanceid is null begin set @BRIEF='' return end"
            sql.putBuf " -- Brief body --"
            sql.putBuf "if exists(select 1 from instance where instanceID=@instanceID)"
            sql.putBuf " begin"
            sql.putBuf " --  verify access  --"
            
            sql.putBuf " select  @tmpID =SecurityStyleID from instance where instanceid=@instanceID"
            sql.putBuf " exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='BRIEF',@access=@access out"
            sql.putBuf " if @access=0"
            sql.putBuf "  begin"
            sql.putBuf "    raiserror('Нет прав на получение краткого наименования. Раздел=instance',16,1)"
            sql.putBuf "    Return"
            sql.putBuf "  End "
            sql.putBuf "  set @BRIEF=''"
            sql.putBuf "  select @BRIEF= @BRIEF "
            sql.putBuf "  +  isnull(Name,' ')+'; '"
            sql.putBuf "  from instance  where  instanceID = @instanceID"
          '  sql.putBuf "  set @BRIEF= @BRIEF + 'Тип='"
            sql.putBuf "  select @BRIEF= @BRIEF "
            sql.putBuf "  +  isnull(objtype,' ')+'; '"
            sql.putBuf "  from instance  where  instanceID = @instanceID"
            sql.putBuf "end else begin"
            sql.putBuf "  set @BRIEF= 'неверный идентификатор'"
            sql.putBuf "End"
            sql.putBuf "set @BRIEF=left(@BRIEF,4000)"
            sql.putBuf "End"
            sql.putBuf ""
            sql.putBuf "GO"
            
 !>         If (OptRights) Then
 !>         sql.putBuf "revoke all on [dbo].[instance_BRIEF] to [public]"
 !>         sql.putBuf "go"
 !>         sql.putBuf "grant execute on [dbo].[instance_BRIEF] to [public]"
 !>         sql.putBuf "go"
 !>         End If
 !>     
 !>     
            sql.putBuf procDropSQL("QR_and_QR")
            sql.putBuf "create proc QR_and_QR( @id1 uniqueidentifier, @id2 uniqueidentifier,@idout uniqueidentifier,@cnt integer out)"
            sql.putBuf "as"
            sql.putBuf "delete from QueryResult where QueryResultid=@idout"
            sql.putBuf "insert into QueryResult(QueryResultid,result)"
            sql.putBuf "select distinct @idout, a.result"
            sql.putBuf "from QueryResult a"
            sql.putBuf "join QueryResult b on b.QueryResultid=@id2 and a.result=b.result"
            sql.putBuf "where a.QueryResultid=@id1"
            sql.putBuf "select @cnt=count(*) from QueryResult where QueryResultid=@idout"
            sql.putBuf "go"
            sql.putBuf ""
 !>         If (OptRights) Then
 !>         sql.putBuf "revoke all on [dbo].[QR_and_QR] to [public]"
 !>         sql.putBuf "go"
 !>         sql.putBuf "grant execute on [dbo].[QR_and_QR] to [public]"
 !>         sql.putBuf "go"
 !>         End If
            
            
            sql.putBuf procDropSQL("QR_or_QR")
            sql.putBuf "create proc QR_or_QR( @id1 uniqueidentifier, @id2 uniqueidentifier,@idout uniqueidentifier,@cnt integer out)"
            sql.putBuf "as"
            sql.putBuf "delete from QueryResult where QueryResultid=@idout"
            sql.putBuf "insert into QueryResult(QueryResultid,result)"
            sql.putBuf "select distinct @idout, result from QueryResult where QueryResultid in (@id1,@id2)"
            sql.putBuf "select @cnt=count(*) from QueryResult where QueryResultid=@idout"
            sql.putBuf "GO"
 !>         If (OptRights) Then
 !>         sql.putBuf "revoke all on [dbo].[QR_or_QR] to [public]"
 !>         sql.putBuf "go"
 !>         sql.putBuf "grant execute on [dbo].[QR_or_QR] to [public]"
 !>         sql.putBuf "go"
 !>         End If
        
            sql.putBuf procDropSQL("RowParents")
            sql.putBuf "create  proc RowParents"
            sql.putBuf "(@QueryID uniqueidentifier"
            sql.putBuf ",@RowID uniqueidentifier/* Row */"
            sql.putBuf ",@Table VARCHAR (255)/* Part Table Name */"
            sql.putBuf ",@CURSESSION uniqueidentifier/* Session */"
            sql.putBuf ")"
            sql.putBuf " as"
            sql.putBuf "begin"
            sql.putBuf "set nocount on"
            sql.putBuf "declare @plevel integer"
            sql.putBuf "declare @parent varchar(255)"
            sql.putBuf "declare @prev varchar(255)"
            sql.putBuf "declare @tmpID  uniqueidentifier"
            sql.putBuf "declare @tmpRowID  uniqueidentifier"
            sql.putBuf "declare @s nvarchar(4000)"
            sql.putBuf " -- checking session  --"
            sql.putBuf "if not exists( select 1 from the_session where the_sessionid=@cursession and closed=0 )"
            sql.putBuf "  begin"
            sql.putBuf "    raiserror('Session expired',16,1)"
            sql.putBuf "    if @@trancount>0 rollback tran"
            sql.putBuf "    Return"
            sql.putBuf "  End"
            sql.putBuf "set @parent =@table"
            sql.putBuf "set @tmpID = @ROWID"
            sql.putBuf "set @plevel =0"
            sql.putBuf "delete from RPRESULT where RPRESULTID"
            sql.putBuf "  =@QUERYID"
            sql.putBuf "insert into RPRESULT(RPRESULTID,PARENTLEVEL,PARTNAME,ROWID)"
            sql.putBuf "   values(@QUERYID,@PLEVEL,@table,@RowID)"
            sql.putBuf ""
            sql.putBuf "again:"
            sql.putBuf "set @plevel =@plevel + 1"
            sql.putBuf "set @prev = @parent"
            sql.putBuf "set @parent = null"
            sql.putBuf "select @parent =value from sysoptions where optiontype ='parent' and  name=@prev"
            sql.putBuf ""
            sql.putBuf " if @parent is null"
            sql.putBuf " begin"
            sql.putBuf "    set @s = N'select @root=InstanceID from ' + @prev + N' where ' +@prev + N'id=@id'"
            sql.putBuf "    exec sp_executesql @s,N'@root uniqueidentifier out,@id uniqueidentifier',@tmpRowID out,@tmpid"
            sql.putBuf ""
            sql.putBuf "   insert into RPRESULT(RPRESULTID,PARENTLEVEL,PARTNAME,ROWID)"
            sql.putBuf "   values(@QUERYID,@PLEVEL,'INSTANCE',@tmpRowID)"
            sql.putBuf " End"
            sql.putBuf " Else"
            sql.putBuf " begin"
            sql.putBuf "    set @s = N'select @parent=ParentStructRowID from ' + @prev+ ' where ' +@prev + 'id=@id'"
            sql.putBuf "    exec sp_executesql @s,N'@parent uniqueidentifier out,@id uniqueidentifier',@tmpRowID out,@tmpid"
            sql.putBuf "    set @tmpID = @tmpROWID"
            sql.putBuf "   insert into RPRESULT(RPRESULTID,PARENTLEVEL,PARTNAME,ROWID)"
            sql.putBuf "   values(@QUERYID,@PLEVEL,@parent,@tmpRowID)"
            sql.putBuf "    GoTo again"
            sql.putBuf " End"
            sql.putBuf "End"
            sql.putBuf "GO"
 !>         If (OptRights) Then
 !>         sql.putBuf "revoke all on [dbo].[RowParents] to [public]"
 !>         sql.putBuf "go"
 !>         sql.putBuf "grant execute on [dbo].[RowParents] to [public]"
 !>         sql.putBuf "go"
 !>         End If
            
            sql.putBuf procDropSQL("Instance_Status")
            sql.putBuf "  create proc Instance_Status("
            sql.putBuf "  @cursession uniqueidentifier,"
            sql.putBuf "  @instanceid uniqueidentifier,"
            sql.putBuf "  @statusid uniqueidentifier)"
            sql.putBuf "as"
            sql.putBuf "begin"
            sql.putBuf "   declare @SSID uniqueidentifier"
            sql.putBuf "   declare @tmpID uniqueidentifier"
            sql.putBuf "   declare @SysLogID uniqueidentifier"
            sql.putBuf "   declare @access integer"
            sql.putBuf "   declare @SysInstID uniqueidentifier"
            sql.putBuf "   declare @ObjType varchar(255)"
            sql.putBuf "   select @SysInstID =Instanceid from instance where objtype='MTZSYSTEM'"
            sql.putBuf ""
            sql.putBuf " if exists( select 1 from instance where instanceid=@instanceid )"
            sql.putBuf "  begin"
            sql.putBuf "   select  @tmpID =SecurityStyleID from INSTANCE where INSTANCEid=@INSTANCEid"
            sql.putBuf "   exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='STATUS',@access=@access out"
            sql.putBuf "   if @access=0"
            sql.putBuf "   begin"
            sql.putBuf "    raiserror('Нет прав на изменение состояния объекта.',16,1)"
            sql.putBuf "    if @@trancount>0 rollback tran"
            sql.putBuf "    Return"
            sql.putBuf "   End"
            sql.putBuf "   exec instance_ISLOCKED @cursession=@cursession,@ROWID=@instanceid,@IsLocked=@access out"
            sql.putBuf "   if @access>2"
            sql.putBuf "   begin"
            sql.putBuf "     raiserror('Документ заблокирован другим пльзователем.',16,1)"
            sql.putBuf "     if @@trancount>0 rollback tran"
            sql.putBuf "     Return"
            sql.putBuf "   End"
            sql.putBuf "   select @ObjType=objtype from instance  where  instanceid=@instanceid"
            sql.putBuf "   if exists("
            sql.putBuf "  select 1 from objstatus"
            sql.putBuf "  join objecttype on objstatus.parentstructrowid=objecttype.objecttypeid"
            sql.putBuf "  where objecttype.name=@objtype and objstatusid=@statusid"
            sql.putBuf "   )begin"
            sql.putBuf "     begin tran"
            sql.putBuf "     update instance set status = @statusid where  instanceid=@instanceid"
            sql.putBuf "     set @SysLogid=newid()"
            sql.putBuf "     EXEC SysLog_SAVE @CURSESSION=@cursession ,@TheSession=@cursession, @InstanceID=@SysInstID, @SysLogid=@SysLogid, @LogStructID = @STATUSID ,"
            sql.putBuf "     @VERB='STATUS',  @the_Resource=@InstanceID,@LogInstanceID=@InstanceID"
            sql.putBuf "     commit tran"
            sql.putBuf "   End"
            sql.putBuf " End"
            sql.putBuf "End"
            sql.putBuf "GO"
 !>         If (OptRights) Then
 !>         sql.putBuf "revoke all on [dbo].[Instance_Status] to [public]"
 !>         sql.putBuf "go"
 !>         sql.putBuf "grant execute on [dbo].[Instance_Status] to [public]"
 !>         sql.putBuf "go"
 !>         End If
            
            sql.putBuf viewDropSQL("v_INSTANCE")
            sql.putBuf "create view v_INSTANCE as"
            sql.putBuf "select instance.*,objstatus.name statusname,objstatus.IsArchive"
            sql.putBuf "from instance left join objstatus on instance.status=objstatus.objstatusid"
            sql.putBuf "GO"
 !>         If (OptRights) Then
 !>         sql.putBuf "revoke all on [dbo].[v_INSTANCE] to [public]"
 !>         sql.putBuf "go"
 !>         sql.putBuf "grant select on [dbo].[v_INSTANCE] to [public]"
 !>         sql.putBuf "go"
 !>         End If
            
            
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
        
        
        Public Function Run(Model As Object, Output As Object, targetid As String) As String
         Set m = Model
         Set o = Output
         tid = targetid
         log = ""
         DebugOutput "SQLGEN.Run:start"
         
        'read settings
        OptFullText = GetSetting(App.Title, "SQLGEN", "FULLTEXT", vbChecked) = 1
        OptInit = GetSetting(App.Title, "SQLGEN", "INIT", vbChecked) = 1
        OptKernel = GetSetting(App.Title, "SQLGEN", "KERNEL", vbChecked) = 1
        OptMethod = GetSetting(App.Title, "SQLGEN", "METHODS", vbChecked) = 1
        OptProcs = GetSetting(App.Title, "SQLGEN", "PROCS", vbChecked) = 1
        OptTables = GetSetting(App.Title, "SQLGEN", "TABLES", vbChecked) = 1
        OptViews = GetSetting(App.Title, "SQLGEN", "VIEW", vbChecked) = 1
        OptMaintein = GetSetting(App.Title, "SQLGEN", "MAINTEIN", vbChecked) = 1
        OptManual = GetSetting(App.Title, "SQLGEN", "MANUAL", vbChecked) = 1
 !>     OptRights = GetSetting(App.Title, "SQLGEN", "RIGHTS", vbChecked) = 1
         
         
         o.Module = "--FullTextClean"
         o.Block = "--clean"
         o.OutNL " "
         
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
         
         o.Module = "--Procedures"
         o.Block = "--TableProc"
         o.OutNL " "
         
         o.Module = "--FullText"
         o.Block = "--create"
         o.OutNL " "
         
         o.Module = "--FullTextSearch"
         o.Block = "--body"
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
         
         o.Module = "--FullTextStart"
         o.Block = "--create"
         o.OutNL " "
         
         o.Module = "--Maintains"
         o.Block = "--create"
         o.OutNL " "
          
         
         o.Module = "--Options"
         o.Block = "--Load"
         o.OutNL " "
         
         ' clean full text catalog first
         o.Module = "--FullTextClean"
         o.Block = "--clean"
         If OptFullText Then o.OutNL FullTextClean
          
         DebugOutput "SQLGEN.Run:Kernel"
         
         If OptKernel Then Kernel
         
         
         Dim i As Long, j As Long, k As Long
         Dim os As PART
         
         On Error GoTo bye
         DebugOutput "SQLGEN.Run:Types"
          For i = 1 To m.OBJECTTYPE.Count
            DebugOutput "SQLGEN.Run:Type " & m.OBJECTTYPE.Item(i).the_comment
            log = log & vbCrLf & "Create code for type " & m.OBJECTTYPE.Item(i).Name
            o.Module = "--Tables"
            o.Block = "--body"
            o.OutNL "/* TYPE=" & m.OBJECTTYPE.Item(i).Name & " (" & m.OBJECTTYPE.Item(i).the_comment & ") */"
            o.OutNL "GO"
            
            For j = 1 To m.OBJECTTYPE.Item(i).PART.Count
              Set os = m.OBJECTTYPE.Item(i).PART.Item(j)
              DebugOutput "SQLGEN.Run:Type " & m.OBJECTTYPE.Item(i).the_comment & " Part:" & os.Caption
              
            If OptTables Then CreateStruct os
 !>           If OptTables Then
 !>            CreateStruct os
 !>             If os.IsJormalChange = Boolean_Da Then CreateStructLog os
 !>           End If
    
              If OptFullText Then FullTextTable os
                #If TRIAL = 1 Then
 <!       If Date < DateSerial(2007, 2, 1) Then
 !>         If Date < DateSerial(2007, 4, 1) Then
 !>  
                  If OptProcs Then CreateProc os
                  If OptProcs Then CreateV2Proc os
                  If OptViews Then MakeAllViews os
                End If
              #Else
                If OptProcs Then CreateProc os
                If OptProcs Then CreateV2Proc os
                If OptViews Then MakeAllViews os
              #End If
            Next
           
            #If TRIAL = 1 Then
 <!     If Date < DateSerial(2007, 2, 1) Then
 !>       If Date < DateSerial(2007, 4, 1) Then
 !>  
                If OptProcs Then CreateTypeProcs m.OBJECTTYPE.Item(i)
              End If
            #Else
              If OptProcs Then CreateTypeProcs m.OBJECTTYPE.Item(i)
            #End If
            
            If OptFullText Then FullTextSearch m.OBJECTTYPE.Item(i)
            o.Status m.OBJECTTYPE.Item(i).the_comment & " done", i
          Next
          
          DebugOutput "SQLGEN.Run:Methods"
          For i = 1 To m.SHAREDMETHOD.Count
            If OptMethod Then CreateMethod m.SHAREDMETHOD.Item(i)
          Next
         
         If OptManual Then
         
          DebugOutput "SQLGEN.Run:ManualCode"
          
          'ManualCode
          o.Module = "--ManualCode"
          o.Block = "--body"
          
          Dim targ As MTZMetaModel.GENERATOR_TARGET
          Dim mc As MTZMetaModel.GENMANUALCODE
          Set targ = m.FindRowObject("GENERATOR_TARGET", tid)
          For i = 1 To targ.GENMANUALCODE.Count
           Set mc = targ.GENMANUALCODE.Item(i)
           o.OutNL "/*" & mc.Name & " (" & mc.the_Alias & ")*/"
           o.OutNL mc.Code
           o.OutNL "GO"
          Next
         
         End If
         
         If OptMaintein Then
          DebugOutput "SQLGEN.Run:Maintains"
          o.Module = "--Maintains"
          o.Block = "--create"
          o.OutNL AutoCloseJob
         End If
         
         
         DebugOutput "SQLGEN.Run:LoadOptions"
         If OptInit Then LoadOptions
         
         o.Module = "--FullTextStart"
         o.Block = "--create"
         If OptFullText And OptMaintein Then o.OutNL FullTextStart
         
         
         Run = log
         DebugOutput "SQLGEN.Run:done"
         Exit Function
    bye:
         log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
         'MsgBox Err.Description
         'Resume
         DebugOutput "SQLGEN.Run:" & Err.Description
         Run = log
        
        End Function
        
        Private Sub FullTextTable(os As PART)
        DebugOutput "SQLGEN.FullTextTable:start " & os.Caption
 <! If os.PartType = 3 Then
 !>     If os.PartType = PartType_Rassirenie Then
            DebugOutput "SQLGEN.FullTextTable:skipped " & os.Caption
            Exit Sub
        End If
        Dim st As PART
        Set st = os
        Dim chos As PART, i As Integer
        Dim s As String
        Dim collist As String
        
        log = log & vbCrLf & "-->full text table " & os.Name
        
        On Error GoTo bye
          Dim hasFields As Boolean
          
          hasFields = False
          s = ""
          If st.ManualRegister = Boolean_Net Then
            s = s & vbCrLf & "exec sp_fulltext_table '" & os.Name & "','Create', 'fulltext_catalog','pk_" & os.Name & "'"
            s = s & vbCrLf & "go"
            Dim ft As FIELDTYPE
            st.FIELD.Sort = "sequence"
            For i = 1 To st.FIELD.Count
 !>           If (st.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
                Set ft = st.FIELD.Item(i).FIELDTYPE
                'support extention field if file type used
                If UCase(st.FIELD.Item(i).FIELDTYPE.Name) = "FILE" Then
                   s = s & vbCrLf & "exec sp_fulltext_column '" & os.Name & "','" & st.FIELD.Item(i).Name & "','add',1049, '" & st.FIELD.Item(i).Name & "_EXT'"
                   s = s & vbCrLf & "go"
                   hasFields = True
                Else
                  If ft.AllowLikeSearch Then
                    s = s & vbCrLf & "exec sp_fulltext_column '" & os.Name & "','" & st.FIELD.Item(i).Name & "','add',1049"
                    s = s & vbCrLf & "go"
                    hasFields = True
                  End If
                End If
 !>           End If
            Next
          End If
          
          If hasFields Then
            o.Module = "--FullText"
            o.Block = "--create"
            o.OutNL s
          End If
          
          For i = 1 To os.PART.Count
            Set chos = os.PART.Item(i)
 <!     If Not chos.PartType = 3 Then
 !>         If Not chos.PartType = PartType_Rassirenie Then
                FullTextTable chos
            End If
          Next
          DebugOutput "SQLGEN.FullTextTable:done " & os.Caption
        Exit Sub
    bye:
        log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
        DebugOutput "SQLGEN.FullTextTable " & Err.Description
        'Resume
        End Sub
        
        
        Private Sub CreateStruct(os As PART)
        DebugOutput "SQLGEN.CreateStruct:start " & os.Caption
 <! If os.PartType = 3 Then
 !>     If os.PartType = PartType_Rassirenie Then
            DebugOutput "SQLGEN.CreateStruct:skipped " & os.Caption
            Exit Sub
        End If
        Dim st As PART
        Set st = os
        DoEvents
        Dim chos As PART, i As Integer
        Dim s As Writer
        Set s = New Writer
        Dim collist As String
        
        'Строка
        'Колекция
        'Дерево
        'Граф
 <! CheckPartMLF st, log
 <! 
        log = log & vbCrLf & "-->CreateStruct " & os.Name
        
        
        On Error GoTo bye
        s.putBuf "/*" & os.Caption & "*/"
        
        s.putBuf "if not exists (select * from sysobjects where id = object_id(N'" & os.Name & "') and OBJECTPROPERTY(id, N'IsUserTable') = 1)"
        s.putBuf "BEGIN"
        s.putBuf "create table " & os.Name & "/*" & os.the_comment & "*/ ("
        collist = ""
        If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
          s.putBuf "InstanceID uniqueidentifier ,"
          collist = collist & "'InstanceID'"
        Else
          s.putBuf "ParentStructRowID uniqueidentifier not null,"
          collist = collist & "'ParentStructRowID'"
        End If
        
        s.putBuf os.Name & "id uniqueidentifier not null rowguidcol default ( newid())  "
        collist = collist & ",'" & os.Name & "ID'"
        
        s.putBuf ",ChangeStamp datetime not null default ( getdate()) /* Время последнего изменения */"
        collist = collist & ",'ChangeStamp'"
        
        s.putBuf ",TimeStamp timestamp not null  /* для организации инкрементального индексирования полнотекстовой информации */"
        collist = collist & ",'TimeStamp'"
        
        
        s.putBuf ",LockSessionID uniqueidentifier null  /* temporary lock */"
        collist = collist & ",'LockSessionID'"
        s.putBuf ",LockUserID uniqueidentifier null /* checkout lock */"
        collist = collist & ",'LockUserID'"
        s.putBuf ",SecurityStyleID uniqueidentifier null /* security formula */"
        collist = collist & ",'SecurityStyleID'"
        
        
        
        ' дерево
        If os.PartType = 2 Then
          s.putBuf ",ParentRowid uniqueidentifier "
          collist = collist & ",'ParentRowid'"
        End If
        
        s.putBuf ")"
        s.putBuf "END"
        s.putBuf "go"
        
 !>     If (OptRights) Then
 !>     s.putBuf "revoke all on [dbo].[" & os.Name & "] to [public]"
 ->     s.putBuf "go"
 !>     s.putBuf "grant select on [dbo].[" & os.Name & "] to [public]"
 !>     s.putBuf "go"
 !>     End If
        
        st.FIELD.Sort = "sequence"
        For i = 1 To st.FIELD.Count
          
          
 !>       If (st.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
            'If i > 1 Then
            
            's.putbuf ","
            s.putBuf "if  not exists(select * from syscolumns where name='" & st.FIELD.Item(i).Name & "' and id=object_id(N'" & st.Name & "'))"
            s.putBuf "alter table " & st.Name & " add "
            s.putBuf FieldForCreate(st.FIELD.Item(i))
            
            'support extention field if file type used
            If UCase(st.FIELD.Item(i).FIELDTYPE.Name) = "FILE" Then
               s.putBuf "if  not exists(select * from syscolumns where name='" & st.FIELD.Item(i).Name & "_EXT' and id=object_id(N'" & st.Name & "'))"
               s.putBuf "alter table " & st.Name & " add "
               s.putBuf " " & st.FIELD.Item(i).Name & "_EXT nvarchar(4) null"
               collist = collist & ",'" & st.FIELD.Item(i).Name & "_EXT'"
            End If
            
            collist = collist & ",'" & st.FIELD.Item(i).Name & "'"
            s.putBuf "go"
 !>       End If
        Next
        
        s.putBuf ColumnDropSQL(st.Name, collist)
        
        o.Module = "--Tables"
        o.Block = "--body"
        o.OutNL s.getBuf
        
        Set s = Nothing
        Set s = New Writer
        s.putBuf PkeyDropSQL(os.Name, "pk_" & os.Name)
        s.putBuf "alter table " & os.Name & " add constraint pk_" & os.Name & " primary key (" & os.Name & "ID)"
        o.Module = "--Tables"
        o.Block = "--body"
        o.OutNL s.getBuf
        o.OutNL "GO"
        
        
        
        
        If TypeName(os.Parent.Parent) <> "OBJECTTYPE" Then
          Set s = Nothing
          Set s = New Writer
          s.putBuf keyDropSQL(os.Name, "fk_" & MakeName(os.ID))
          s.putBuf "alter table " & os.Name & " add constraint fk_" & MakeName(os.ID) & " foreign key(ParentStructRowID) references " & os.Parent.Parent.Name & " (" & os.Parent.Parent.Name & "ID)"
          o.Module = "--Tables"
          o.Block = "--ForeignKey"
          o.OutNL s.getBuf
          o.OutNL "GO"
          
          Set s = Nothing
          Set s = New Writer
          s.putBuf indexDropSQL(os.Name, "parent_" & os.Name)
          s.putBuf "create index parent_" & os.Name & " on " & os.Name & "(ParentStructRowID)"
          o.Module = "--Tables"
          o.Block = "--Index"
          o.OutNL s.getBuf
          o.OutNL "GO"
        Else
          Set s = Nothing
          Set s = New Writer
          s.putBuf keyDropSQL(os.Name, "fk_" & MakeName(os.ID))
          s.putBuf "alter table " & os.Name & " add constraint fk_" & MakeName(os.ID) & " foreign key(INSTANCEID) references INSTANCE (INSTANCEID)"
          o.Module = "--Tables"
          o.Block = "--ForeignKey"
          o.OutNL s.getBuf
          o.OutNL "GO"
          
          Set s = Nothing
          Set s = New Writer
          s.putBuf indexDropSQL(os.Name, "parent_" & os.Name)
          s.putBuf "create index parent_" & os.Name & " on " & os.Name & "(INSTANCEID)"
          o.Module = "--Tables"
          o.Block = "--Index"
          o.OutNL s.getBuf
          o.OutNL "GO"
        End If
        
        
        DebugOutput "SQLGEN.CreateStruct:children " & os.Caption
        
        
        For i = 1 To os.PART.Count
          Set chos = os.PART.Item(i)
          CreateStruct chos
        Next
        
        DebugOutput "SQLGEN.CreateStruct:done " & os.Caption
        Set s = Nothing
        
        Exit Sub
    bye:
        log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
        DebugOutput "SQLGEN.CreateStruct: " & os.Caption & " " & Err.Description
        'Resume
        Set s = Nothing
        
        End Sub
        
 !>   Private Sub CreateStructLog(os As PART)
 !> 
 !>  
 !>     Dim logName As String
 !>     logName = os.Name & "_LOG"
 !>  
 !>     DebugOutput "SQLGEN.CreateStruct:start " & os.Caption
 !>     If os.PartType = PartType_Rassirenie Then
 !>       DebugOutput "SQLGEN.CreateStruct:skipped " & os.Caption
 ->       Exit Sub
 !>     End If
 !>  
 !>     Dim st As PART
 !>     Set st = os
 !>     DoEvents
 !>     Dim chos As PART, i As Integer
 ->     Dim s As Writer
 ->     Set s = New Writer
 ->     Dim collist As String
 ->  
 !>     'Строка
 !>     'Колекция
 !>     'Дерево
 !>     'Граф
 !>     log = log & vbCrLf & "-CreateStruct " & logName
 !>  
 ->     On Error GoTo bye
 !>     s.putBuf "/*" & os.Caption & "*/"
 !>  
 !>     s.putBuf "if not exists (select * from sysobjects where id = object_id(N'" & logName & "') and OBJECTPROPERTY(id, N'IsUserTable') = 1)"
 ->     s.putBuf "BEGIN"
 !>     s.putBuf "create table " & logName & "/*" & os.the_comment & "*/ ("
 ->     collist = ""
 ->     If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
 ->       s.putBuf "InstanceID uniqueidentifier ,"
 ->       collist = collist & "'InstanceID'"
 ->     Else
 ->       s.putBuf "ParentStructRowID uniqueidentifier not null,"
 ->       collist = collist & "'ParentStructRowID'"
 ->     End If
 ->  
 !>     s.putBuf logName & "id uniqueidentifier not null rowguidcol default ( newid())  "
 !>     collist = collist & ",'" & logName & "ID'"
 ->  
 ->     s.putBuf ",ChangeStamp datetime not null default ( getdate()) /* Время последнего изменения */"
 ->     collist = collist & ",'ChangeStamp'"
 ->  
 ->     s.putBuf ",TimeStamp timestamp not null  /* для организации инкрементального индексирования полнотекстовой информации */"
 ->     collist = collist & ",'TimeStamp'"
 ->  
 ->  
 !>     s.putBuf ",LockSessionID uniqueidentifier null  /* temporary lock */"
 !>     collist = collist & ",'LockSessionID'"
 !>     s.putBuf ",LockUserID uniqueidentifier null /* checkout lock */"
 !>     collist = collist & ",'LockUserID'"
 !>     s.putBuf ",SecurityStyleID uniqueidentifier null /* security formula */"
 !>     collist = collist & ",'SecurityStyleID'"
 !>  
 !>     s.putBuf ",DateTimeLog datetime not null default ( getdate()) /* security formula */"
 !>     collist = collist & ",'DateTimeLog'"
 !>     s.putBuf ",UserLog uniqueidentifier null /* security formula */"
 !>     collist = collist & ",'UserLog'"
 ->  
 ->     ' дерево
 ->     If os.PartType = 2 Then
 ->       s.putBuf ",ParentRowid uniqueidentifier "
 ->       collist = collist & ",'ParentRowid'"
 ->     End If
 ->  
 ->     s.putBuf ")"
 ->     s.putBuf "END"
 ->     s.putBuf "go"
 ->  
 !>     If (OptRights) Then
 !>     s.putBuf "revoke all on [dbo].[" & logName & "] to [public]"
 !>     s.putBuf "go"
 !>     s.putBuf "grant select on [dbo].[" & logName & "] to [public]"
 !>     s.putBuf "go"
 !>     End If
 !>  
 !>     st.FIELD.Sort = "sequence"
 !>     For i = 1 To st.FIELD.Count
 !>  
 !>  
 !>       If (st.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
 !>         'If i > 1 Then
 !>  
 !>         's.putbuf ","
 !>         s.putBuf "if  not exists(select * from syscolumns where name='" & logName & "' and id=object_id(N'" & logName & "'))"
 !>         s.putBuf "alter table " & logName & " add "
 !>         s.putBuf FieldForCreate(st.FIELD.Item(i))
 ->  
 ->         'support extention field if file type used
 !>         If UCase(st.FIELD.Item(i).FIELDTYPE.Name) = "FILE" Then
 !>            s.putBuf "if  not exists(select * from syscolumns where name='" & st.FIELD.Item(i).Name & "_EXT' and id=object_id(N'" & logName & "'))"
 !>            s.putBuf "alter table " & logName & " add "
 !>            s.putBuf " " & st.FIELD.Item(i).Name & "_EXT nvarchar(4) null"
 !>            collist = collist & ",'" & st.FIELD.Item(i).Name & "_EXT'"
 !>         End If
 !>  
 !>         collist = collist & ",'" & st.FIELD.Item(i).Name & "'"
 !>         s.putBuf "go"
 !>       End If
 !>     Next
 !>  
 !>     s.putBuf ColumnDropSQL(st.Name, collist)
 !>  
 ->     o.Module = "--Tables"
 ->     o.Block = "--body"
 ->     o.OutNL s.getBuf
 ->  
 !>   '  Set s = Nothing
 !>   '  Set s = New Writer
 !>   '  s.putBuf PkeyDropSQL(logName, "pk_" & logName)
 !>   '  s.putBuf "alter table " & logName & " add constraint pk_" & logName & " primary key (" & logName & "ID)"
 !>   '  o.Module = "--Tables"
 !>   '  o.Block = "--body"
 !>   '  o.OutNL s.getBuf
 !>   '  o.OutNL "GO"
 !>  
 !>   '  If TypeName(os.Parent.Parent) <> "OBJECTTYPE" Then
 !>   '    Set s = Nothing
 !>   '    Set s = New Writer
 !>   '    s.putBuf keyDropSQL(logName, "fk_" & MakeName(os.ID))
 !>   '    s.putBuf "alter table " & logName & " add constraint fk_" & MakeName(os.ID) & " foreign key(ParentStructRowID) references " & os.Parent.Parent.Name & " (" & os.Parent.Parent.Name & "ID)"
 !>   '    o.Module = "--Tables"
 !>   '    o.Block = "--ForeignKey"
 !>   '    o.OutNL s.getBuf
 !>   '    o.OutNL "GO"
 !>   '
 !>   '    Set s = Nothing
 !>   '    Set s = New Writer
 !>   '    s.putBuf indexDropSQL(logName, "parent_" & logName)
 !>   '    s.putBuf "create index parent_" & logName & " on " & logName & "(ParentStructRowID)"
 !>   '    o.Module = "--Tables"
 !>   '    o.Block = "--Index"
 !>   '    o.OutNL s.getBuf
 !>   '    o.OutNL "GO"
 !>   '  Else
 !>   '    Set s = Nothing
 !>   '    Set s = New Writer
 !>   '    s.putBuf keyDropSQL(logName, "fk_" & MakeName(os.ID))
 !>   '    s.putBuf "alter table " & logName & " add constraint fk_" & MakeName(os.ID) & " foreign key(INSTANCEID) references INSTANCE (INSTANCEID)"
 !>   '    o.Module = "--Tables"
 !>   '    o.Block = "--ForeignKey"
 !>   '    o.OutNL s.getBuf
 !>   '    o.OutNL "GO"
 !>   '
 !>   '    Set s = Nothing
 !>   '    Set s = New Writer
 !>   '    s.putBuf indexDropSQL(logName, "parent_" & logName)
 !>   '    s.putBuf "create index parent_" & logName & " on " & logName & "(INSTANCEID)"
 !>   '    o.Module = "--Tables"
 !>   '    o.Block = "--Index"
 !>   '    o.OutNL s.getBuf
 !>   '    o.OutNL "GO"
 !>   '  End If
 !>  
 !>     DebugOutput "SQLGEN.CreateStruct:children " & os.Caption
 !>  
 !>     For i = 1 To os.PART.Count
 !>       Set chos = os.PART.Item(i)
 !>       CreateStruct chos
 !>     Next
 !>  
 !>     DebugOutput "SQLGEN.CreateStruct:done " & os.Caption
 ->     Set s = Nothing
 ->  
 !>     Exit Sub
 -> bye:
 !>     log = log & vbCrLf & "ERROR-" & Err.Description & "<--ERROR"
 !>     DebugOutput "SQLGEN.CreateStruct: " & os.Caption & " " & Err.Description
 ->     'Resume
 ->     Set s = Nothing
 ->  
 !>   End Sub
        
        Private Sub CreateDelProc(os As PART)
          DebugOutput "SQLGEN.CreateDelProc:start " & os.Caption
 <!   If os.PartType = 3 Then
 !>       If os.PartType = PartType_Rassirenie Then
            DebugOutput "SQLGEN.CreateDelProc:skipped " & os.Caption
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
          s.putBuf " @CURSESSION uniqueidentifier,"
          s.putBuf " @" & os.Name & "id uniqueidentifier,"
          s.putBuf " @instanceid uniqueidentifier =null"
          s.putBuf ") as " & " begin  "
          s.putBuf "set nocount on"
          
 <!   'pmod'
 <!   s.putBuf " declare @Lang2 varchar(25)"
 <!   'epmod'
          If Not os.NoLog Then s.putBuf " declare @SysLogID uniqueidentifier"
          s.putBuf " declare @access int"
          s.putBuf " declare @SysInstID uniqueidentifier"
          s.putBuf " declare @tmpID uniqueidentifier"
          s.putBuf " select @SysInstID =Instanceid from instance where objtype='MTZSYSTEM'"
          
          
          s.putBuf " -- checking session  --"
          s.putBuf "if not exists( select 1 from the_session where the_sessionid=@cursession and closed=0 )"
          s.putBuf "  begin"
          s.putBuf "    raiserror('Сессия уже завершена.',16,1)"
          s.putBuf "    if @@trancount>0 rollback tran"
          s.putBuf "    return"
          s.putBuf "  end"
          
 <!   s.putBuf "select @Lang2=Lang from the_session where the_sessionid=@cursession"
          s.putBuf " -- Delete body -- "
          s.putBuf "if exists(select 1 from " & os.Name & " where " & os.Name & "ID=@" & os.Name & "ID)"
          s.putBuf " begin"
          
          s.putBuf " --  verify access  --"
          s.putBuf " select  @tmpID =SecurityStyleID from " & os.Name & " where " & os.Name & "id=@" & os.Name & "ID"
          s.putBuf " exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='DELETEROW',@access=@access out "
          s.putBuf " if @access=0 "
          s.putBuf "  begin"
         
          s.putBuf "    exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='DELETEROW:" & os.Name & "',@access=@access out "
          s.putBuf "    if @access=0 "
          s.putBuf "    begin"
          s.putBuf "      raiserror('Нет прав на удаление. Раздел=" & os.Name & "',16,1)"
          s.putBuf "      if @@trancount>0 rollback tran"
          s.putBuf "      return"
          s.putBuf "    end"
          s.putBuf "  end"
          
          s.putBuf " --  verify lock  --"
          s.putBuf " exec " & os.Name & "_ISLOCKED @cursession=@cursession,@ROWID=@" & os.Name & "id,@IsLocked=@access out "
          s.putBuf " if @access>2 "
          s.putBuf "  begin"
          s.putBuf "    raiserror('Строка заблокирована другим пользователем. Раздел=" & os.Name & "',16,1)"
          s.putBuf "    if @@trancount>0 rollback tran"
          s.putBuf "    return"
          s.putBuf "  end"
          
          
          s.putBuf "  begin tran  "
          
          s.putBuf " -- erase child items --"
          s.putBuf "declare @childlistid uniqueidentifier"
        
        
          
          If os.PART.Count > 0 Then
            s.putBuf "-- delete in-struct child"
          End If
        
          For i = 1 To os.PART.Count
            Set chos = os.PART.Item(i)
 <!     If Not chos.PartType = 3 Then
 !>         If Not chos.PartType = PartType_Rassirenie Then
                s.putBuf "declare childlist_" & chos.Name & " cursor local for select " & chos.Name & "." & chos.Name & "id from " & chos.Name & " where  " & chos.Name & ".ParentStructRowID = @" & os.Name & "id"
                s.putBuf "open childlist_" & chos.Name & ""
                s.putBuf "fetch next from childlist_" & chos.Name & " into @childlistid"
                s.putBuf "while @@fetch_status >=0 "
                s.putBuf "begin"
                s.putBuf " exec " & chos.Name & "_DELETE @cursession,@childlistid,@instanceid"
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
          
          s.putBuf ""
          
          If Not os.NoLog Then
            s.putBuf "set @SysLogid=newid()"
            s.putBuf "EXEC SysLog_SAVE @CURSESSION=@cursession ,@TheSession=@cursession, @InstanceID=@SysInstID, @SysLogid=@SysLogid, @LogStructID = '" & os.Name & "',"
            s.putBuf " @VERB='DELETEROW',  @the_Resource=@" & os.Name & "id, @LogInstanceID=@InstanceID"
          End If
          
          ' Удаляем зависимые документы!!!
          s.putBuf "declare child_inst_" & os.Name & " cursor local for select  instanceid from instance where OwnerPartName ='" & os.Name & "' and OwnerRowID=@" & os.Name & "id"
          s.putBuf "open child_inst_" & os.Name & ""
          s.putBuf "fetch next from child_inst_" & os.Name & " into @childlistid"
          s.putBuf "while @@fetch_status >=0 "
          s.putBuf "begin"
          s.putBuf " exec INSTANCE_OWNER @cursession,@childlistid,null,null"
          s.putBuf " exec INSTANCE_DELETE @cursession,@childlistid"
          s.putBuf " if @@error >0 begin"
          s.putBuf "   close child_inst_" & os.Name & ""
          s.putBuf "   deallocate child_inst_" & os.Name & " "
          s.putBuf "   goto del_error"
          s.putBuf " end"
          s.putBuf " fetch next from child_inst_" & os.Name & " into @childlistid"
          s.putBuf "end"
          s.putBuf "close child_inst_" & os.Name & ""
          s.putBuf "deallocate child_inst_" & os.Name & " "
          
          
          
          s.putBuf "  delete from  " & os.Name & " "
          s.putBuf "  where  " & os.Name & "ID = @" & os.Name & "ID "
          
 <!     'Проверяем на MLF поля
 <!     Dim j As Long
 <!     Dim bDetected As Boolean
 <!     bDetected = False
 <!     For j = 1 To os.FIELD.Count
 <!         If UCase(os.FIELD.Item(j).FIELDTYPE.Name) = UCase("MultiLanguage String") Or _
 <!             UCase(os.FIELD.Item(j).FIELDTYPE.Name) = UCase("MultiLanguage Memo") Then
 <!             bDetected = True
 <!             Exit For
 <!         End If
 <!     Next
 <!     If bDetected Then
 <!         s.putBuf "--MLF support"
 <!         s.putBuf "declare @s nvarchar(4000)"
 <!         s.putBuf "declare " & os.Name & "_LNG cursor local for select LangShort from LocalizeInfo"
 <!         s.putBuf "open " & os.Name & "_LNG"
 <!         s.putBuf "fetch next from " & os.Name & "_LNG into @Lang2"
 <!         s.putBuf " while @@fetch_status >=0"
 <!         s.putBuf "  begin"
 <!         s.putBuf "    set @s='delete from " & os.Name & "_' + @Lang2 + '"
 <!         s.putBuf "            where M" & os.Name & "ID = @" & os.Name & "ID'"
 <!         s.putBuf "    exec sp_executesql @s,N'@" & os.Name & "ID uniqueidentifier', @" & os.Name & "ID"
 <!         s.putBuf ""
 <!         s.putBuf "    fetch next from " & os.Name & "_LNG into @Lang2"
 <!         s.putBuf "  End"
 <!         s.putBuf "Close " & os.Name & "_LNG"
 <!         s.putBuf "deallocate " & os.Name & "_LNG"
 <!     End If
 <!   
          s.putBuf "  -- удаляем номера из нумератора"
          s.putBuf "  delete from num_values where OwnerPartName='" & os.Name & "' and OwnerRowID=@" & os.Name & "ID"
            
            
          s.putBuf " end"
          s.putBuf " -- close transaction --"
          s.putBuf " del_error:"
          s.putBuf " if @@error <>0  if @@trancount>0 rollback tran  "
          s.putBuf " if @@trancount>0 commit tran  "
          
          s.putBuf " end "
          
 !>       s.putBuf "go"
 !>       If (OptRights) Then
 !>       s.putBuf "revoke all on [dbo].[" & os.Name & "_DELETE]  to [public]"
 !>       s.putBuf "go"
 !>       s.putBuf "grant execute on [dbo].[" & os.Name & "_DELETE]  to [public]"
 !>       s.putBuf "go"
 !>       End If
 !>     
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
          DebugOutput "SQLGEN.CreateDelProc:done " & os.Caption
          Exit Sub
    bye:
          log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
        'Resume
          Set s = Nothing
        End Sub
        
        
        
        Private Sub CreateProc(os As PART)
          DebugOutput "SQLGEN.CreateProc:start " & os.Caption
 <! If os.PartType = 3 Then
 !>       If os.PartType = PartType_Rassirenie Then
            DebugOutput "SQLGEN.CreateProc:skipped " & os.Caption
            Exit Sub
          End If
        
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
          s.putBuf " @CURSESSION uniqueidentifier,"
          s.putBuf "@InstanceID uniqueidentifier =null,"
          If TypeName(os.Parent.Parent) <> "OBJECTTYPE" Then
            s.putBuf " @ParentStructRowID uniqueidentifier =null,"
          End If
        
          s.putBuf " @" & os.Name & "id uniqueidentifier"
        
          ' дерево - родительская связь
          If os.PartType = PartType_Derevo Then
            s.putBuf ",@ParentRowid uniqueidentifier = null "
          End If
        
          st.FIELD.Sort = "sequence"
          For i = 1 To st.FIELD.Count
 !>         If (st.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
              s.putBuf "," & FieldForParam(st.FIELD.Item(i))
 !>         End If
          Next
        
          s.putBuf ") as " & " begin  "
          s.putBuf "set nocount on"
        
          If Not os.NoLog Then s.putBuf "DECLARE @SysLogid uniqueidentifier"
          s.putBuf " declare @UniqueRowCount integer"
          s.putBuf " declare @tmpStr varchar(255)"
          s.putBuf " declare @tmpID uniqueidentifier"
          s.putBuf " declare @access int"
          s.putBuf " declare @SysInstID uniqueidentifier"
          s.putBuf " declare @SessUserID uniqueidentifier"
          s.putBuf " declare @SessUserLogin varchar(40)"
          s.putBuf " select @SessUserID=UsersID from the_session where the_sessionid=@cursession"
          s.putBuf " select @SessUserLogin =login from users where usersid=@SessUserID"
        
          s.putBuf " select @SysInstID =Instanceid from instance where objtype='MTZSYSTEM'"
          
          s.putBuf " -- checking session  --"
          s.putBuf "if not exists( select 1 from the_session where the_sessionid=@cursession and closed=0 )"
          s.putBuf "  begin"
          s.putBuf "    raiserror('Сессия уже завершена.',16,1)"
          s.putBuf "    if @@trancount>0 rollback tran"
          s.putBuf "    return"
          s.putBuf "  end"
        
 <! 'PMOD
 <! s.putBuf " declare @Lang2 varchar(25)"
 <! s.putBuf " select @Lang2=Lang from the_session where the_sessionid=@cursession"
        's.putbuf " -- checking references  --" & vbCrLf
        'For i = 1 To st.FIELD.Count
        '  s = s & ReferenceCheck(os, st.FIELD.Item(i)) & vbCrLf
        'Next
        
        s.putBuf " -- Insert / Update body -- "
        
        s.putBuf "if exists(select 1 from " & os.Name & " where " & os.Name & "ID=@" & os.Name & "ID)"
        s.putBuf " begin"
        
        s.putBuf " --  UPDATE  --"
        
        s.putBuf " --  verify access  --"
        
        s.putBuf " select  @tmpID =SecurityStyleID from " & os.Name & " where " & os.Name & "id=@" & os.Name & "ID"
        s.putBuf " exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='EDITROW',@access=@access out "
        s.putBuf " if @access=0 "
        s.putBuf "  begin"
        s.putBuf "    exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='EDITROW:" & os.Name & "',@access=@access out "
        s.putBuf "    if @access=0 "
        s.putBuf "    begin"
        s.putBuf "      raiserror('Нет прав на модификацию. Раздел=" & os.Name & "',16,1)"
        s.putBuf "      if @@trancount>0 rollback tran"
        s.putBuf "      return"
        s.putBuf "    end"
        s.putBuf "  end"
        
        s.putBuf " --  verify lock  --"
        
        s.putBuf " exec " & os.Name & "_ISLOCKED @cursession=@cursession,@ROWID=@" & os.Name & "id,@IsLocked=@access out "
        s.putBuf " if @access>2 "
        s.putBuf "  begin"
        s.putBuf "    raiserror('Строка заблокирована другим пльзователем. Раздел=" & os.Name & "',16,1)"
        s.putBuf "    if @@trancount>0 rollback tran"
        s.putBuf "    return"
        s.putBuf "  end"
        
        
        s.putBuf " begin tran  "
        
        s.putBuf " -- update row  --"
        
        
          If Not os.NoLog Then
            s.putBuf "set @SysLogid=newid()"
            s.putBuf "EXEC SysLog_SAVE @TheSession=@cursession,@CURSESSION=@cursession, @InstanceID=@sysinstid, @SysLogid=@SysLogid, @LogStructID = '" & os.Name & "',"
            s.putBuf " @VERB='EDITROW',  @the_Resource=@" & os.Name & "id, @LogInstanceID=@instanceID"
          End If
        
 !>     If os.IsJormalChange = Boolean_Da Then
 !>       s.putBuf " -- START LOG --"
 !>       s.putBuf " insert into " & os.Name & "_LOG "
 !>  
 !>       s.putBuf " ( " & os.Name & "_logID "
 !>  
 !>       If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
 !>         s.putBuf ",InstanceID"
 !>       Else
 !>         s.putBuf ",ParentStructRowID"
 !>       End If
 !>  
 !>       If os.PartType = 2 Then
 !>         s.putBuf ",ParentRowid"
 !>       End If
 !>  
 !>       s.putBuf ", UserLog"
 !>  
 !>       st.FIELD.Sort = "sequence"
 !>       For i = 1 To st.FIELD.Count
 !>         If (st.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
 !>            s.putBuf "," & st.FIELD.Item(i).Name & vbCrLf
 !>  
 !>            If UCase(st.FIELD.Item(i).FIELDTYPE.Name) = "FILE" Then
 !>              s.putBuf "," & st.FIELD.Item(i).Name & "_EXT"
 !>            End If
 !>          End If
 !>       Next
 !>  
 !>       s.putBuf " ) select "
 !>  
 !>       s.putBuf os.Name & "ID "
 !>  
 !>       If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
 !>         s.putBuf ",InstanceID"
 !>       Else
 !>         s.putBuf ",ParentStructRowID"
 !>       End If
 !>  
 !>       s.putBuf ", @cursession"
 !>  
 !>       If os.PartType = 2 Then
 !>         s.putBuf ",ParentRowid"
 !>       End If
 !>  
 !>       st.FIELD.Sort = "sequence"
 !>       For i = 1 To st.FIELD.Count
 !>         If (st.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
 !>            s.putBuf "," & st.FIELD.Item(i).Name & vbCrLf
 !>  
 !>            If UCase(st.FIELD.Item(i).FIELDTYPE.Name) = "FILE" Then
 !>              s.putBuf "," & st.FIELD.Item(i).Name & "_EXT"
 !>            End If
 !>          End If
 !>       Next
 !>  
 !>       s.putBuf " from " & os.Name
 !>       s.putBuf " where " & os.Name & "id = @" & os.Name & "ID "
 !>  
 !>       s.putBuf "-- end LOG --"
 !>     End If
 !>  
        s.putBuf " update  " & os.Name & " set ChangeStamp=GetDate()"
        
        ' дерево модификация связи
        If os.PartType = 2 Then
          s.putBuf ",ParentRowid= @ParentRowid"
        End If
        
        st.FIELD.Sort = "sequence"
        For i = 1 To st.FIELD.Count
 !>       If (st.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
            s.putBuf ","
            s.putBuf "  " & st.FIELD.Item(i).Name & "=@" & st.FIELD.Item(i).Name
            
           'support extention field if file type used
           If UCase(st.FIELD.Item(i).FIELDTYPE.Name) = "FILE" Then
             s.putBuf "," & st.FIELD.Item(i).Name & "_EXT="
             s.putBuf "@" & st.FIELD.Item(i).Name & "_EXT "
           End If
 !>       End If
        Next
        
        s.putBuf "  where  " & os.Name & "ID = @" & os.Name & "ID "
        
 <! 'PMOD
 <!     Dim j As Long
 <!     Dim bDetected As Boolean
 <!     Dim sDeclare As String
 <!     Dim sParam As String
 <!     Dim sParam2 As String
 <!     Dim sInsert As String
 <!     
 <!     bDetected = False
 <!     For j = 1 To os.FIELD.Count
 <!         If UCase(os.FIELD.Item(j).FIELDTYPE.Name) = UCase("MultiLanguage String") Or _
 <!             UCase(os.FIELD.Item(j).FIELDTYPE.Name) = UCase("MultiLanguage Memo") Then
 <!             bDetected = True
 <!             Exit For
 <!         End If
 <!     Next
 <!     If bDetected Then
 <!         bDetected = False
 <!         sDeclare = " exec sp_executesql @s,N'@" & os.Name & "ID uniqueidentifier"
 <!         sParam = ", @" & os.Name & "ID"
 <!         s.putBuf "  declare @s nvarchar(4000)"
 <!         
 <!             s.putBuf "  declare @ls int"
 <!             s.putBuf "  set @ls=0"
 <!             s.putBuf "  set @s='select @LS=1 from MLF_Part_' + @Lang2 + ' where MLF_PartID=@MLF_PartID'"
 <!             s.putBuf "  exec sp_executesql @s,N'@MLF_PartID uniqueidentifier,@ls int output',@MLF_PartID, @ls output"
 <!             s.putBuf "if @ls=1"
 <!             s.putBuf " begin"
 <! 
 <!         
 <!         s.putBuf "  set @s='update " & os.Name & "_' + @Lang2 + ' set"
 <!         For j = 1 To os.FIELD.Count
 <!             If UCase(os.FIELD.Item(j).FIELDTYPE.Name) = UCase("MultiLanguage String") Or _
 <!                 UCase(os.FIELD.Item(j).FIELDTYPE.Name) = UCase("MultiLanguage Memo") Then
 <!                 If bDetected Then
 <!                     s.putBuf "   ," & os.FIELD.Item(j).Name & "=@" & os.FIELD.Item(j).Name & ""
 <!                 Else
 <!                     s.putBuf "   " & os.FIELD.Item(j).Name & "=@" & os.FIELD.Item(j).Name & ""
 <!                     
 <!                 End If
 <!                 sDeclare = sDeclare + ", " & FieldForParam2(os.FIELD.Item(j)) & ""
 <!                 sParam = sParam + ", @" & os.FIELD.Item(j).Name & ""
 <!                 bDetected = True
 <!             End If
 <!         Next
 <!         sDeclare = sDeclare + "'"
 <!         s.putBuf "  where  " & os.Name & "ID = @" & os.Name & "ID'"
 <!         sDeclare = sDeclare + sParam
 <!         s.putBuf sDeclare
 <!     
 <!         s.putBuf " end"
 <!         s.putBuf "else"
 <!         s.putBuf " begin"
 <!         
 <!         'Next style
 <!         bDetected = False
 <!         sDeclare = " exec sp_executesql @s,N'@" & os.Name & "ID uniqueidentifier"
 <!         sParam = " values(@" & os.Name & "ID"
 <!         sParam2 = ",@" & os.Name & "ID"
 <!         's.putBuf "declare @s nvarchar(4000)"
 <!         s.putBuf "set @s=N'insert into " & os.Name & "_' + @Lang2 + '"
 <!         s.putBuf "(" & os.Name & "ID"
 <! 
 <!         For j = 1 To os.FIELD.Count
 <!             If UCase(os.FIELD.Item(j).FIELDTYPE.Name) = UCase("MultiLanguage String") Or _
 <!                 UCase(os.FIELD.Item(j).FIELDTYPE.Name) = UCase("MultiLanguage Memo") Then
 <!                 
 <!                     s.putBuf "   ," & os.FIELD.Item(j).Name & ""
 <!                 
 <!                 sDeclare = sDeclare + ", " & FieldForParam2(os.FIELD.Item(j)) & ""
 <!                 sParam = sParam + ", @" & os.FIELD.Item(j).Name & ""
 <!                 sParam2 = sParam2 + ", @" & os.FIELD.Item(j).Name & ""
 <!                 bDetected = True
 <!             End If
 <!         Next
 <!         sDeclare = sDeclare + "'"
 <-         s.putBuf ")"
 <!         sParam = sParam + ")'"
 <!         s.putBuf sParam
 <!         
 <!         sDeclare = sDeclare + sParam2
 <!         s.putBuf sDeclare
 <!         s.putBuf " End"
 <!     End If
 <! 'EPMOD
        s.putBuf " -- checking unique constraints  --"
        
        s.putBuf UniqueCheck(os) & vbCrLf
        
        
        s.putBuf "  end"
        
        s.putBuf " else"
        
        s.putBuf " --  INSERT  --"
        s.putBuf "  begin"
        
        s.putBuf " --  verify access  --"
        
        
        
        
        If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
            s.putBuf " select @tmpid = SecurityStyleID from instance where instanceid=@instanceid"
        Else
            s.putBuf " select  @tmpID =SecurityStyleID from " & os.Parent.Parent.Name & " where " & os.Parent.Parent.Name & "id=@ParentStructRowID"
        End If
        
        s.putBuf " exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='CREATEROW',@access=@access out"
        s.putBuf " if @access=0 "
        s.putBuf "  begin"
        s.putBuf "    exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='CREATEROW:" & os.Name & "',@access=@access out "
        s.putBuf "    if @access=0 "
        s.putBuf "    begin"
        s.putBuf "      raiserror('Нет прав на создание строк. Раздел=" & os.Name & "',16,1)"
        s.putBuf "      if @@trancount>0 rollback tran"
        s.putBuf "      return"
        s.putBuf "    end"
        s.putBuf " end"
        
        If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
          s.putBuf " exec instance_ISLOCKED @cursession=@cursession,@ROWID=@InstanceID,@IsLocked=@access out "
        Else
          s.putBuf " exec " & os.Parent.Parent.Name & "_ISLOCKED @cursession=@cursession,@ROWID=@ParentStructRowID,@IsLocked=@access out "
        End If
        
        
        s.putBuf " if @access>2 "
        s.putBuf "  begin"
        s.putBuf "    raiserror('Строка заблокирована другим пльзователем. Раздел=" & os.Name & "',16,1)"
        s.putBuf "    if @@trancount>0 rollback tran"
        s.putBuf "    return"
        s.putBuf "  end"
        
        
        
        ' check for single row part
        If os.PartType = 0 Then
            s.putBuf "if exists (select 1 from " & os.Name & " where "
            If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
              s.putBuf "InstanceID=@InstanceID)"
            Else
              s.putBuf "ParentStructRowID=@ParentStructRowID)"
            End If
            s.putBuf " begin"
            s.putBuf "    raiserror('Невозможно создать вторую строку в однострочной сессии. Раздел: <" & os.Name & ">',16,1)"
            s.putBuf "    if @@trancount>0 rollback tran"
            s.putBuf "    return"
            s.putBuf " End"
        End If
        
        s.putBuf " begin tran  "
        
        If Not os.NoLog Then
          s.putBuf "set @SysLogid=newid()"
          s.putBuf "EXEC SysLog_SAVE @TheSession=@cursession,@CURSESSION=@cursession, @InstanceID=@sysinstid, @SysLogid=@SysLogid, @LogStructID = '" & os.Name & "',"
          s.putBuf " @VERB='CREATEROW',  @the_Resource=@" & os.Name & "id, @LogInstanceID=@instanceID"
        End If
        
        s.putBuf " insert into   " & os.Name & vbCrLf & " (  " & os.Name & "ID "
        
        
        ' дерево  - поле
        If os.PartType = 2 Then
          s.putBuf ",ParentRowid"
        End If
        
        If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
          s.putBuf ",InstanceID"
        Else
          s.putBuf ",ParentStructRowID"
        End If
        
        
        st.FIELD.Sort = "sequence"
        For i = 1 To st.FIELD.Count
 !>       If (st.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
             s.putBuf "," & st.FIELD.Item(i).Name & vbCrLf
          
            'support extention field if file type used
             If UCase(st.FIELD.Item(i).FIELDTYPE.Name) = "FILE" Then
               s.putBuf "," & st.FIELD.Item(i).Name & "_EXT"
 !>          End If
           End If
        Next
        
        s.putBuf " ) values " & "( @" & os.Name & "ID "
        
        
        ' дерево  - значение поля
        If os.PartType = 2 Then
          s.putBuf ",@ParentRowid"
        End If
        
        
        If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
          s.putBuf ",@InstanceID"
        Else
          s.putBuf ",@ParentStructRowID"
        End If
        
        st.FIELD.Sort = "sequence"
        For i = 1 To st.FIELD.Count
 !>       If (st.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
            s.putBuf ",@" & st.FIELD.Item(i).Name & vbCrLf
             'support extention field if file type used
            If UCase(st.FIELD.Item(i).FIELDTYPE.Name) = "FILE" Then
              s.putBuf ",@" & st.FIELD.Item(i).Name & "_EXT"
            End If
 <! Next
 <! 
 <! s.putBuf " ) "
 <! 
 <! s.putBuf "--MLF Support"
 <!     bDetected = False
 <!     
 <!     For j = 1 To os.FIELD.Count
 <!         If UCase(os.FIELD.Item(j).FIELDTYPE.Name) = UCase("MultiLanguage String") Or _
 <!             UCase(os.FIELD.Item(j).FIELDTYPE.Name) = UCase("MultiLanguage Memo") Then
 <!             bDetected = True
 <!             Exit For
 <!         End If
 <!     Next
 <!     If bDetected Then
 <!         bDetected = False
 <!         sDeclare = " exec sp_executesql @s,N'@" & os.Name & "ID uniqueidentifier"
 <!         sParam = " values(@" & os.Name & "ID"
 <!         sParam2 = ",@" & os.Name & "ID"
 <!         's.putBuf "declare @s nvarchar(4000)"
 <!         s.putBuf "set @s=N'insert into " & os.Name & "_' + @Lang2 + '"
 <!         s.putBuf "(" & os.Name & "ID"
 <! 
 <!         For j = 1 To os.FIELD.Count
 <!             If UCase(os.FIELD.Item(j).FIELDTYPE.Name) = UCase("MultiLanguage String") Or _
 <!                 UCase(os.FIELD.Item(j).FIELDTYPE.Name) = UCase("MultiLanguage Memo") Then
 <!                 
 <!                     s.putBuf "   ," & os.FIELD.Item(j).Name & ""
 <!                 
 <!                 sDeclare = sDeclare + ", " & FieldForParam2(os.FIELD.Item(j)) & ""
 <!                 sParam = sParam + ", @" & os.FIELD.Item(j).Name & ""
 <!                 sParam2 = sParam2 + ", @" & os.FIELD.Item(j).Name & ""
 <!                 bDetected = True
 <!             End If
 <!         Next
 <!         sDeclare = sDeclare + "'"
 <!         s.putBuf ")"
 <!         sParam = sParam + ")'"
 <!         s.putBuf sParam
 <!         
 <!         sDeclare = sDeclare + sParam2
 <!         s.putBuf sDeclare
 <!         
 <!     End If
 !>       End If
 !>     Next
 !>     
 ->     s.putBuf " ) "
 ->     
        
        s.putBuf " exec " & os.Name & "_SINIT @CURSESSION,@" & os.Name & "id,@tmpid"
        
        s.putBuf " -- checking unique constraints  --"
        s.putBuf UniqueCheck(os) & vbCrLf
        
        s.putBuf " end"
        
        
        s.putBuf " -- close transaction --"
        
        s.putBuf " if @@error <>0  if @@trancount>0 rollback tran  "
        s.putBuf " if @@trancount>0 commit tran  "
        
        s.putBuf " end "
 !>     s.putBuf "go"
 !>     If (OptRights) Then
 !>     s.putBuf "revoke all on [dbo].[" & os.Name & "_SAVE] to [public]"
 !>     s.putBuf "go"
 !>     s.putBuf "grant execute on [dbo].[" & os.Name & "_SAVE] to [public]"
 !>     s.putBuf "go"
 !>     End If
 !>     
 !>     
        o.Module = "--Procedures"
        o.Block = "--TableProc"
        o.OutNL s.getBuf
        o.OutNL "GO"
        
        
        
        CreateBriefProc os
        CreateDelProc os
        
        'If os.PartType = 3 Then EdgeProc os
        
        DebugOutput "SQLGEN.CreateProc:children " & os.Caption
        For i = 1 To os.PART.Count
          Set chos = os.PART.Item(i)
          CreateProc chos
        Next
        Set s = Nothing
        DebugOutput "SQLGEN.CreateProc:done " & os.Caption
        Exit Sub
    bye:
        log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
        'Resume
        Set s = Nothing
        End Sub
        
        
        
        
        
        
        ' make
        Private Function ReferenceCheck(os As PART, f As FIELD) As String
        DebugOutput "SQLGEN.ReferenceCheck:start " & os.Caption & " Filed:" & f.Caption
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
            s.putBuf "if(not exists( select  1 from instance where instanceid=@" & f.Name & " )) "
            s.putBuf "  begin"
            s.putBuf "    raiserror('Не обнаружен объект, на который установлена ссылка. Раздел=" & os.Name & " field=" & f.Name & "',16,1)"
            s.putBuf "    if @@trancount>0 rollback tran"
            s.putBuf "    return"
            s.putBuf "  end"
          End If
          
          
          If f.ReferenceType = ReferenceType_Na_stroku_razdela Then
            s.putBuf "if(not @" & f.Name & " is null ) "
            s.putBuf "if(not exists( select  1 from " & f.RefToPart.Name & " where " & f.RefToPart.Name & "id=@" & f.Name & " )) "
            s.putBuf "  begin"
            s.putBuf "    raiserror('Отсутствует строка в таблице (" & f.RefToPart.Name & "), на которую установлена ссылка.  Раздел=" & os.Name & " поле=" & f.Name & "',16,1)"
            s.putBuf "    if @@trancount>0 rollback tran"
            s.putBuf "    return"
            s.putBuf "  end"
          End If
        
          ReferenceCheck = s.getBuf
          DebugOutput "SQLGEN.ReferenceCheck:done " & os.Caption & " Filed:" & f.Caption
          Set s = Nothing
          Exit Function
    bye:
          log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
          Set s = Nothing
        End Function
        
        
        
        
        Private Sub CreateMethod(m As SHAREDMETHOD)
          DebugOutput "SQLGEN.CreateMethod:start"
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
 !>       If (OptRights) Then
 !>       s = s & vbCrLf & "revoke all on [dbo].[" & m.Name & "] to [Public]"
 !>       s = s & vbCrLf & "GO"
 !>       s = s & vbCrLf & "grant execute on [dbo].[" & m.Name & "] to [Public]"
 !>       s = s & vbCrLf & "GO"
 !>       End If
 !>       
          
          o.Module = "--Procedures"
          o.Block = "--Methods"
          o.OutNL s
          o.OutNL "GO"
          
        
          DebugOutput "SQLGEN.CreateMethod:done"
          Exit Sub
    bye:
          log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
          'Resume
        End Sub
        
        
        
        Private Function FieldForCreate(f As FIELD) As String
         DebugOutput "SQLGEN.FieldForCreate:start"
         On Error Resume Next
         
         log = log & vbCrLf & "-->FieldForCreate " & f.Name
         
          Dim s As String, ftm As FIELDTYPEMAP
          s = f.Name
          Set ftm = MapFTObj(f.FIELDTYPE.ID)
          If ftm.FixedSize <> 0 Then
           s = s & " " & ftm.StoageType & "(" & ftm.FixedSize & ")"
          Else
          
           s = s & vbCrLf & " " & ftm.StoageType
            If f.FIELDTYPE.AllowSize Then
              If f.DataSize <> 0 Then
                s = s & " (" & f.DataSize & ")"
              Else
                s = s & " (1)"
              End If
            End If
          End If
          ' If F.AllowNull Then
            s = s & " null "
          ' Else
          '  s = s & " not null "
          ' End If
          
           
           If f.FIELDTYPE.TypeStyle = TypeStyle_Interval Then
            s = s & vbCrLf & " check (" & f.Name & " >= " & f.FIELDTYPE.Minimum & " and " & f.Name & " <= " & f.FIELDTYPE.Maximum & ")"
           End If
           
           If f.FIELDTYPE.TypeStyle = TypeStyle_Perecislenie Then
            If f.FIELDTYPE.ENUMITEM.Count > 0 Then
              s = s & vbCrLf & " check (" & f.Name & " in ( "
              Dim e
              For e = 1 To f.FIELDTYPE.ENUMITEM.Count
               If e > 1 Then s = s & vbCrLf & ", "
               s = s & f.FIELDTYPE.ENUMITEM.Item(e).NameValue & "/* " & f.FIELDTYPE.ENUMITEM.Item(e).Name & " */"
              Next
              s = s & " )) "
            End If
           End If
           
           s = s & "/* " & f.Caption & " */"
           
        '   'support extention field if file type used
        '   If UCase(F.FIELDTYPE.Name) = "FILE" Then
        '     s = s & vbCrLf & "," & F.Name & "_EXT nvarchar(4) null"
        '   End If
           
           FieldForCreate = s
           DebugOutput "SQLGEN.FieldForCreate:done"
           Exit Function
    bye:
           log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
        
        End Function
        
 <! Private Function FieldForParam2(f As FIELD) As String
 <!   DebugOutput "SQLGEN.FieldForParam:start"
 <- On Error GoTo bye
 <-    
 <-    
 <!   log = log & vbCrLf & "-->FieldForParam " & f.Name
 <!   Dim s As String, ftm As FIELDTYPEMAP
 <!   s = "@" & f.Name
 <!   Set ftm = MapFTObj(f.FIELDTYPE.ID)
 <!   If ftm.FixedSize <> 0 Then
 <!    s = s & " " & ftm.StoageType & "(" & ftm.FixedSize & ")"
 <!   Else
 <!    s = s & vbCrLf & " " & ftm.StoageType
 <!    If f.FIELDTYPE.AllowSize Then
 <!      If f.DataSize <> 0 Then
 <!       s = s & " (" & f.DataSize & ")"
 <!      Else
 <!       s = s & " (1)"
 <!      End If
 <!    End If
 <!   End If
 <!   
 <!   If f.AllowNull Then
 <!    s = s & " = null "
 <!   End If
 <!   
 <!   's = s & "/* " & f.Caption & " */"
 <-   
 <-   'support extention field if file type used
 <!    If UCase(f.FIELDTYPE.Name) = "FILE" Then
 <!      s = s & vbCrLf & ",@" & f.Name & "_EXT nvarchar(4) = null"
 <!    End If
 <!   
 <!   FieldForParam2 = s '& "/* " & f.Caption & " */"
 <!   DebugOutput "SQLGEN.FieldForParam:done"
 <!   Exit Function
 <- bye:
 <!   log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
 <-  'Resume
 <! End Function
        
        Private Function FieldForParam(f As FIELD) As String
          DebugOutput "SQLGEN.FieldForParam:start"
        On Error GoTo bye
           
           
          log = log & vbCrLf & "-->FieldForParam " & f.Name
          Dim s As String, ftm As FIELDTYPEMAP
          s = "@" & f.Name
          Set ftm = MapFTObj(f.FIELDTYPE.ID)
          If ftm.FixedSize <> 0 Then
           s = s & " " & ftm.StoageType & "(" & ftm.FixedSize & ")"
          Else
           s = s & vbCrLf & " " & ftm.StoageType
           If f.FIELDTYPE.AllowSize Then
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
          
          s = s & "/* " & f.Caption & " */"
          
          'support extention field if file type used
           If UCase(f.FIELDTYPE.Name) = "FILE" Then
             s = s & vbCrLf & ",@" & f.Name & "_EXT nvarchar(4) = null"
           End If
          
          FieldForParam = s & "/* " & f.Caption & " */"
          DebugOutput "SQLGEN.FieldForParam:done"
          Exit Function
    bye:
          log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
         'Resume
        End Function
        
        
        
        
        Private Function MethodParam(f As Parameters) As String
        DebugOutput "SQLGEN.MethodParam:start"
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
          DebugOutput "SQLGEN.MethodParam:done"
          Exit Function
    bye:
          log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
         'Resume
        End Function
        
        
        Private Function UniqueCheck(os As PART) As String
 <! If os.PartType = 3 Then
 !>     If os.PartType = PartType_Rassirenie Then
            DebugOutput "SQLGEN.UniqueCheck:skipped " & os.Caption
            Exit Function
        End If
         DoEvents
          DebugOutput "SQLGEN.UniqueCheck:start " & os.Caption
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
            s = s & "If @SessUserLogin<>'replicator' "
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
                      s = s & vbCrLf & "   select @UniqueRowCount=Count(*) from " & os.Name & " where InstanceID=@InstanceID and ParentRowID is null " & z
                      s = s & vbCrLf & " else "
                      s = s & vbCrLf & "   select @UniqueRowCount=Count(*) from " & os.Name & " where InstanceID=@InstanceID and ParentRowID=@ParentRowID " & z
                    Else
                      s = s & vbCrLf & " if @ParentRowID is null"
                      s = s & vbCrLf & "   select @UniqueRowCount=Count(*) from " & os.Name & " where ParentStructRowID=@ParentStructRowID and ParentRowID is null " & z
                      s = s & vbCrLf & " else "
                      s = s & vbCrLf & "   select @UniqueRowCount=Count(*) from " & os.Name & " where ParentStructRowID=@ParentStructRowID and ParentRowID =@ParentRowID " & z
                    End If
                  Else
                    If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
                      s = s & vbCrLf & " select @UniqueRowCount=Count(*) from " & os.Name & " where InstanceID=@InstanceID " & z
                    Else
                      s = s & vbCrLf & "select @UniqueRowCount=Count(*) from " & os.Name & " where ParentStructRowID=@ParentStructRowID " & z
                    End If
                  End If
                Else
                  s = s & vbCrLf & "select @UniqueRowCount=Count(*) from " & os.Name & " where 1=1  " & z
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
          DebugOutput "SQLGEN.UniqueCheck:done " & os.Caption
          Exit Function
    bye:
          log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
          'Resume
        End Function
        
        
        
        
        Private Function MapPartView(os As PART) As String
 <! If os.PartType = 3 Then
 !>     If os.PartType = PartType_Rassirenie Then
            DebugOutput "SQLGEN.MapPartView:skipped " & os.Caption
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
 <!     If Not os.PART.Item(i).PartType = 3 Then
 !>         If Not os.PART.Item(i).PartType = PartType_Rassirenie Then
                s = s & vbCrLf & MapPartView(os.PART.Item(i))
            End If
          Next
          
          MapPartView = s
          DebugOutput "SQLGEN.MapPartView:done " & os.Caption
        End Function
        
        
        Private Function MapAndParent(os As PART) As String
        DebugOutput "SQLGEN.MapAndParent:start " & os.Caption
 <! If os.PartType = 3 Then
 !>     If os.PartType = PartType_Rassirenie Then
            DebugOutput "SQLGEN.MapAndParent:skipped " & os.Caption
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
 <!     If Not os.PART.Item(i).PartType = 3 Then
 !>         If Not os.PART.Item(i).PartType = PartType_Rassirenie Then
                s = s & vbCrLf & MapAndParent(os.PART.Item(i))
            End If
          Next
          
          MapAndParent = s
          DebugOutput "SQLGEN.MapAndParent:done " & os.Caption
        End Function
        
        
        Private Function MapViews(pv As PARTVIEW) As String
          Dim s As String
          s = ""
          s = s & vbCrLf & "set @id = '" & GetMap(pv.the_Alias & "_map") & "'"
          s = s & vbCrLf & "EXEC SysOptions_SAVE  @SysOptionsid=@id, @Name='" & pv.ID & "', @Value='V_" & pv.the_Alias & "', @OptionType='MAP'"
          MapViews = s
        End Function
        
        
        Private Function TypeForStruct(ByVal s As PART) As OBJECTTYPE
        DebugOutput "SQLGEN.TypeForStruct:start " & s.Caption
        Dim i As Long
        Dim obj As Object
        Set obj = s.Parent.Parent
        
        ' ищем что за тип объекта
        While TypeName(obj) <> "OBJECTTYPE"
          Set obj = obj.Parent.Parent
        Wend
        
        Set TypeForStruct = obj
        
        DebugOutput "SQLGEN.TypeForStruct:done " & s.Caption
        End Function
        
        
        Private Sub LoadOptions()
        DebugOutput "SQLGEN.LoadOptions:start "
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
        s.putBuf "if not exists(select 1 from instance where instanceid=@instid)"
        s.putBuf "insert into instance(InstanceID,OBJTYPE,Name) values(@instid, 'MTZSYSTEM','Системная информация')"
        For i = 1 To m.OBJECTTYPE.Count
          s.putBuf "if not exists(select 1 from typelist where name='" & m.OBJECTTYPE.Item(i).Name & "')"
          s.putBuf "insert into typelist( name,RegisterProc,DeleteProc, HCLProc, propagateProc) values('" & m.OBJECTTYPE.Item(i).Name & "', '" & m.OBJECTTYPE.Item(i).Name & "_REGISTER', '" & m.OBJECTTYPE.Item(i).Name & "_DELETE', '" & m.OBJECTTYPE.Item(i).Name & "_HCL', '" & m.OBJECTTYPE.Item(i).Name & "_propagate')"
        Next
 <! s.putBuf "exec Login @the_SESSION=@session OUTPUT , @PWD='init', @USR='init'"
 !>     s.putBuf "exec MTZLogin @the_SESSION=@session OUTPUT , @PWD='init', @USR='init'"
        
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
        DebugOutput "SQLGEN.LoadOptions:done "
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
 !>         If (Not ft.FIELDTYPEMAP.Item(i).Target Is Nothing) Then
              If ft.FIELDTYPEMAP.Item(i).Target.ID = tid Then
                ftmap.Add ft.FIELDTYPEMAP.Item(i), typeID
                s = ft.FIELDTYPEMAP.Item(i).StoageType
                If ft.FIELDTYPEMAP.Item(i).FixedSize <> 0 Then
                  s = s & vbCrLf & " (" & ft.FIELDTYPEMAP.Item(i).FixedSize & ")"
                End If
                Exit For
              End If
 !>         End If
          Next
          MapFT = s
          Exit Function
    bye:
        log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
        
        End Function
        
        
        Private Function MapFTObj(ByVal typeID As String) As FIELDTYPEMAP
        On Error Resume Next
          
          If ftmap Is Nothing Then Set ftmap = New Collection
 <!   If ftmap.Item(typeID) Is Nothing Then
 !>       Dim obj As Object
 !>       Set obj = ftmap.Item(typeID)
 !>       If obj Is Nothing Then
 !>          Set obj = Nothing
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
 !>         If (Not ft.FIELDTYPEMAP.Item(i).Target Is Nothing) Then
            If ft.FIELDTYPEMAP.Item(i).Target.ID = tid Then
              ftmap.Add ft.FIELDTYPEMAP.Item(i), typeID
              Set MapFTObj = ft.FIELDTYPEMAP.Item(i)
              Exit For
            End If
 !>         End If
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
        DebugOutput "SQLGEN.CreateBriefProc:start "
 <! If os.PartType = 3 Then
 !>     If os.PartType = PartType_Rassirenie Then
            DebugOutput "SQLGEN.CreateBriefProc:skipped " & os.Caption
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
        s.putBuf ""
        s.putBuf procDropSQL(os.Name & "_BRIEF")
        s.putBuf "create proc " & os.Name & "_BRIEF  ("
        s.putBuf " @CURSESSION uniqueidentifier,"
        s.putBuf " @" & os.Name & "id uniqueidentifier,"
        s.putBuf " @BRIEF varchar(4000) output"
        s.putBuf ") as " & " begin  "
        s.putBuf "set nocount on"
        s.putBuf " declare @access int"
        s.putBuf " declare @tmpStr varchar(255)"
        s.putBuf " declare @tmpID uniqueidentifier"
        s.putBuf " -- checking session  --"
        s.putBuf "if not exists( select 1 from the_session where the_sessionid=@cursession and closed=0 )"
        s.putBuf "  begin"
        s.putBuf "    raiserror('Сессия уже завершена.',16,1)"
        s.putBuf "    return"
        s.putBuf "  end"
 <! s.putBuf " declare @Lang2 varchar(25)"
 <! s.putBuf " select @Lang2=Lang from the_session where the_sessionid=@cursession"
        
        s.putBuf "if @" & os.Name & "id is null begin set @BRIEF='' return end"
        
        s.putBuf " -- Brief body -- "
        
        s.putBuf "if exists(select 1 from " & os.Name & " where " & os.Name & "ID=@" & os.Name & "ID)"
        s.putBuf " begin"
        s.putBuf " --  verify access  --"
        s.putBuf " select  @tmpID =SecurityStyleID from " & os.Name & " where " & os.Name & "id=@" & os.Name & "ID"
        s.putBuf " exec CheckVerbRight @cursession=@cursession,@Resource=@tmpID,@verb='BRIEF',@access=@access out "
        s.putBuf " if @access=0 "
        s.putBuf "  begin"
        s.putBuf "    raiserror('No access for BRIEF Structure=" & os.Name & "',16,1)"
        s.putBuf "    return"
        s.putBuf "  end"
 <! 'MLF
 <! 's.putBuf "  select @BRIEF=dbo." & os.Name & "_BRIEF_F(@" & os.Name & "id)"
 <! s.putBuf "  select @BRIEF=dbo." & os.Name & "_BRIEF_F(@" & os.Name & "id, @Lang2)"
 !>     s.putBuf "  select @BRIEF=dbo." & os.Name & "_BRIEF_F(@" & os.Name & "id)"
        s.putBuf "end else begin"
        s.putBuf "  set @BRIEF= 'неверный идентификатор'"
        s.putBuf "end"
        s.putBuf "set @BRIEF=left(@BRIEF,4000)"
        s.putBuf "end "
        
 !>     s.putBuf "go"
 !>     If (OptRights) Then
 !>     s.putBuf "revoke all on [dbo].[" & os.Name & "_BRIEF] to [public]"
 !>     s.putBuf "go"
 !>     s.putBuf "grant execute on [dbo].[" & os.Name & "_BRIEF] to [public]"
 !>     s.putBuf "go"
 !>     End If
 !>     
        
        o.Module = "--Procedures"
        o.Block = "--TableProc"
        o.OutNL s.getBuf
        o.OutNL "GO"
        DebugOutput "SQLGEN.CreateBriefProc:done "
        Set s = Nothing
        Exit Sub
    bye:
        log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
        'Resume
        Set s = Nothing
        End Sub
        
        
        
        Private Sub CreateBriefFunc(os As PART)
 <! If os.PartType = 3 Then
 !>     If os.PartType = PartType_Rassirenie Then
            DebugOutput "SQLGEN.CreateBriefFunc:skipped " & os.Caption
            Exit Sub
        End If
        
        DebugOutput "SQLGEN.CreateBriefFunc:start " & os.Caption
        Dim st As PART
        Set st = os
        Dim chos As PART, i As Long, j As Long, f As FIELD
        Dim s As Writer
        Set s = New Writer
        
        ' делаем отдельно заголовки функций
        CreateBriefFuncHdr os
        
        
        log = log & vbCrLf & "-->CreateBriefFunc " & os.Name
        
        On Error GoTo bye
        
        s.putBuf ""
        s.putBuf "alter function " & os.Name & "_BRIEF_F  ("
        s.putBuf " @" & os.Name & "id uniqueidentifier"
 <! 'MLF
 <! s.putBuf " ,@Lang varchar(25)=NULL"
 <! 'EMLF
        s.putBuf ") returns varchar(255) as " & " begin  "
        s.putBuf " declare @BRIEF varchar(255)"
        s.putBuf " declare @tmpStr varchar(255)"
        s.putBuf " declare @tmpBrief varchar(2000)"
        s.putBuf " declare @tmpID uniqueidentifier"
 <! s.putBuf " declare @MLFTemp varchar(2000)"
        
        s.putBuf "if @" & os.Name & "id is null begin set @BRIEF=' ' return (@BRIEF) end"
        s.putBuf " -- Brief body -- "
        s.putBuf "if exists(select 1 from " & os.Name & " where " & os.Name & "ID=@" & os.Name & "ID)"
        s.putBuf " begin"
        s.putBuf " --  verify access  --"
        s.putBuf "  set @BRIEF=''"
        
        st.FIELD.Sort = "sequence"
        For i = 1 To st.FIELD.Count
 !>       If (st.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
            If st.FIELD.Item(i).IsBrief Then
              Set f = st.FIELD.Item(i)
              
 <!     's.putbuf "  set @BRIEF= @BRIEF + '" & F.Caption & "='"
 !>           Dim arr() As String, sh As String
 !>           On Error Resume Next
 !>           sh = f.shablonBrief
 !>           If sh = "" Then
 !>             ReDim arr(1)
 !>           Else
 !>             sh = Replace(sh, "'", "")
 !>             arr = Split(sh, "%%")
 !>             ReDim Preserve arr(1)
 !>           End If
              
 <!     'enum
              If st.FIELD.Item(i).FIELDTYPE.TypeStyle = TypeStyle_Perecislenie Then
                
                s.putBuf "  select @BRIEF= @BRIEF +"
                s.putBuf "  case " & f.Name & " "
                For j = 1 To st.FIELD.Item(i).FIELDTYPE.ENUMITEM.Count
                  s.putBuf "when " & st.FIELD.Item(i).FIELDTYPE.ENUMITEM.Item(j).NameValue & " then "
 <!         s.putBuf " '" & st.FIELD.Item(i).FIELDTYPE.ENUMITEM.Item(j).Name & "; '"
 !>               s.putBuf " '" & arr(0) & st.FIELD.Item(i).FIELDTYPE.ENUMITEM.Item(j).Name & arr(1) & "; '"
                Next
               s.putBuf "  end  from " & st.Name & " where " & os.Name & "ID=@" & os.Name & "ID"
              
              ElseIf st.FIELD.Item(i).FIELDTYPE.TypeStyle = TypeStyle_Ssilka Then
     
                s.putBuf "select @tmpID =  " & f.Name
                s.putBuf "  from " & os.Name & "  where  " & os.Name & "ID = @" & os.Name & "ID "
                If f.ReferenceType = ReferenceType_Na_ob_ekt_ Then
 <!           'MLF
 <!           s.putBuf " select @tmpBrief= dbo.Instance_BRIEF_F( @tmpID, @Lang2)"
 !>                 s.putBuf " select @tmpBrief= dbo.Instance_BRIEF_F( @tmpID)"
                End If
                If f.ReferenceType = ReferenceType_Na_stroku_razdela Then
 <!         'MLF
 <!         s.putBuf " select @tmpBrief= dbo." & f.RefToPart.Name & "_BRIEF_F(@tmpID, @Lang2)"
 <!       End If
 <!       s.putBuf "  set @BRIEF= @BRIEF + '{' + isnull(@tmpbrief,' ') + '}; '"
 <!     'MLF
 <!     ElseIf IsMLFField(f) Then
 <!         s.putBuf "set @MLFBrief=null"
 <!         s.putBuf "if not @Lang is null"
 <!         s.putBuf "begin"
 <!         s.putBuf ""
 <!         s.putBuf "  set @MLFTemp='select @MLFTemp2=" & st.FIELD.Item(i).Name & " from " & os.Name & "_'+@Lang+' where " & os.Name & "ID=@" & os.Name & "ID'"
 <!         s.putBuf "  exec sp_executesql @MLFTemp,N'@" & os.Name & "ID uniqueidentifier,@MLFBrief varchar(2000) output',@" & os.Name & "ID, @MLFBrief output"
 <!         s.putBuf "End"
 <!         
 <!         s.putBuf "  select @BRIEF= @BRIEF "
 <!         s.putBuf "  +  isnull(@MLFBrief,isnull(Convert(varchar(255), " & st.FIELD.Item(i).Name & "),' '))+'; '"
 !>               s.putBuf "select @tmpID =  " & f.Name
                  s.putBuf "  from " & os.Name & "  where  " & os.Name & "ID = @" & os.Name & "ID "
 <!     'EMLF
 !>               s.putBuf " select @tmpBrief= dbo." & f.RefToPart.Name & "_BRIEF_F(@tmpID)"
 !>             End If
 !>            If f.ReferenceType = ReferenceType_Na_istocnik_dannih Then
 !>                s.putBuf "select @tmpBrief=substring(" & f.Name & ",PATINDEX('%<Brief>%'," & f.Name & ")+7, PATINDEX('%</Brief>%'," & f.Name & ") -PATINDEX('%<Brief>%'," & f.Name & ")-7) from " & st.Name & " where  " & os.Name & "ID=@" & os.Name & "ID"
 !>            End If
 !>   
 !>             s.putBuf "  set @BRIEF= @BRIEF + '{" & arr(0) & "' + isnull(@tmpbrief,' ') + '" & arr(1) & "}; '"
 !>       
              Else
                s.putBuf "  select @BRIEF= @BRIEF "
 <!       s.putBuf "  +  isnull(Convert(varchar(255), " & st.FIELD.Item(i).Name & "),' ')+'; '"
 !>             s.putBuf "  + '" & arr(0) & "' + isnull(Convert(varchar(255), " & st.FIELD.Item(i).Name & "),' ') + '" & arr(1) & "; '"
                s.putBuf "  from " & os.Name & "  where  " & os.Name & "ID = @" & os.Name & "ID "
 !>           End If
            End If
          End If
        Next
        s.putBuf "end else begin"
        s.putBuf "  set @BRIEF= '-'"
        s.putBuf "end"
        s.putBuf "set @BRIEF=left(@BRIEF,255)"
        s.putBuf "return(@BRIEF)"
        s.putBuf "end "
        Debug.Print os.Name
        
        o.Module = "--Functions"
        o.Block = "--TableProc"
        o.OutNL s.getBuf
        o.OutNL "GO"
        DebugOutput "SQLGEN.CreateBriefFunc:done " & os.Caption
        Set s = Nothing
        Exit Sub
    bye:
        log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
        'Resume
        Set s = Nothing
        End Sub
        
        
        
        Private Sub CreateBriefFuncHdr(os As PART)
        DebugOutput "SQLGEN.CreateBriefFuncHdr:start " & os.Caption
 <! If os.PartType = 3 Then
 !>     If os.PartType = PartType_Rassirenie Then
            DebugOutput "SQLGEN.CreateBriefFuncHdr:skipped " & os.Caption
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
        
        DebugOutput "SQLGEN.CreateBriefFuncHdr:done " & os.Caption
        Exit Sub
    bye:
        log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
        'Resume
        
        End Sub
        
        
        Private Sub FullTextSearch(obt As OBJECTTYPE)
          DebugOutput "SQLGEN.FullTextSearch:start " & obt.the_comment
          Dim chos As PART
          Dim s As String, i As Long
          
          
          
          s = procDropSQL(obt.Name & "_SEARCH")
          s = s & vbCrLf & "create proc " & obt.Name & "_SEARCH(@cursession uniqueidentifier, @QueryResultID uniqueidentifier,@Filter nvarchar(2000)) as  "
          s = s & vbCrLf & "begin"
          s = s & vbCrLf & "declare @tmpID uniqueidentifier"
          s = s & vbCrLf & "declare @tmp2ID uniqueidentifier"
          s = s & vbCrLf & "declare @tmpFilter uniqueidentifier"
          s = s & vbCrLf & "set @tmpID= newid()"
          s = s & vbCrLf & "set @tmp2ID= newid()"
          
          s = s & vbCrLf & "delete from queryResult where queryResultid=@QueryResultID"
          
          If obt.AllowSearch = Boolean_Da Then
            s = s & vbCrLf & "Insert Into queryResult(queryResultid,result) select @tmp2ID,instanceid from instance where contains(*,@filter) and objtype='" & obt.Name & "'"
            For i = 1 To obt.PART.Count
 <!         If Not obt.PART.Item(i).PartType = 3 Then
 !>             If Not obt.PART.Item(i).PartType = PartType_Rassirenie Then
                    s = s & vbCrLf & FullTextPartSearch(obt.PART.Item(i))
                End If
            Next
            s = s & vbCrLf & "Insert Into queryResult(queryResultid,result) select distinct @queryResultid,result from queryResult where queryResultid=@tmp2ID"
            s = s & vbCrLf & "delete from queryResult where queryResultid=@tmp2ID"
          End If
          s = s & vbCrLf & "end"
          s = s & vbCrLf & "go"
 !>       If (OptRights) Then
 !>       s = s & vbCrLf & "revoke all on [dbo].[" & obt.Name & "_SEARCH] to [public]"
 !>       s = s & vbCrLf & "go"
 !>       s = s & vbCrLf & "grant execute on [dbo].[" & obt.Name & "_SEARCH] to [public]"
 !>       s = s & vbCrLf & "go"
 !>       End If
          
          o.Module = "--FullTextSearch"
          o.Block = "--body"
          o.OutNL s
          DebugOutput "SQLGEN.FullTextSearch:done " & obt.the_comment
        End Sub
        
        
     
        Private Sub CreateTypeProcs(obt As OBJECTTYPE)
          DebugOutput "SQLGEN.CreateTypeProcs:start " & obt.the_comment
          Dim chos As PART
          Dim s As Writer
          Set s = New Writer
          DoEvents
          
          s.putBuf procDropSQL(obt.Name & "_DELETE")
          s.putBuf "create proc " & obt.Name & "_DELETE(@cursession uniqueidentifier, @InstanceID uniqueidentifier) as  "
          ' delete from root structure of object  - child of instance
          Dim tos   As Integer
          s.putBuf "declare @ObjType as varchar(255), @childlistid uniqueidentifier"
          s.putBuf "select  @ObjType =objtype from instance where instanceid=@instanceid"
          s.putBuf "if  @ObjType ='" & obt.Name & "'"
          s.putBuf "begin"
            If obt.PART.Count > 0 Then
              For tos = 1 To obt.PART.Count
                  Set chos = obt.PART.Item(tos)
 <!           If Not chos.PartType = 3 Then
 !>               If Not chos.PartType = PartType_Rassirenie Then
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
 !>       If (OptRights) Then
 !>       s.putBuf "revoke all on [dbo].[" & obt.Name & "_DELETE] to [public]"
 !>       s.putBuf "go"
 !>       s.putBuf "grant execute on [dbo].[" & obt.Name & "_DELETE] to [public]"
 !>       s.putBuf "go"
 !>       End If
 !>     
          
          
          ' register root structure of object as child of instance
          s.putBuf procDropSQL(obt.Name & "_REGISTER")
          s.putBuf "create proc " & obt.Name & "_REGISTER(@cursession uniqueidentifier, @InstanceID uniqueidentifier) as  "
          s.putBuf "declare @ObjType as varchar(255)"
          s.putBuf "declare @tmpStr as varchar(255)"
          s.putBuf "select  @ObjType =objtype from instance where instanceid=@instanceid"
          s.putBuf "if @objtype = '" & obt.Name & "'"
          s.putBuf " begin"
          If obt.IsSingleInstance Then
            s.putBuf "if exists(select 1 from instance  where objtype=@objtype and instanceid<>@instanceid  )"
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
 !>       If (OptRights) Then
 !>       s.putBuf "revoke all on [dbo].[" & obt.Name & "_REGISTER] to [public]"
 !>       s.putBuf "go"
 !>       s.putBuf "grant execute on [dbo].[" & obt.Name & "_REGISTER] to [public]"
 !>       s.putBuf "go"
 !>       End If
          
          
          ' register root structure of object as child of instance
          s.putBuf procDropSQL(obt.Name & "_HCL")
          s.putBuf "create proc " & obt.Name & "_HCL(@cursession uniqueidentifier, @ROWID uniqueidentifier, @IsLocked integer out) as  "
          s.putBuf "declare @ObjType as varchar(255)"
          s.putBuf "declare @tmpStr as varchar(255)"
          
          s.putBuf " declare @UserID uniqueidentifier"
          s.putBuf " declare @LockUserID uniqueidentifier"
          s.putBuf " declare @LockSessionID uniqueidentifier"
          
          s.putBuf "select  @ObjType =objtype from instance where instanceid=@Rowid"
          s.putBuf "if @objtype = '" & obt.Name & "'"
          s.putBuf " begin"
          
          If obt.PART.Count = 0 Then
            s.putBuf " set @IsLocked =0"
          Else
             s.putBuf "if @@nestlevel < 25  begin"
           '---- проверяем, что нет заблокированных записей в  дочерних разделах
           s.putBuf "declare @childlistid uniqueidentifier"
           s.putBuf " select @userID = usersid from the_session where the_sessionid=@cursession"
            Dim i As Long
            For i = 1 To obt.PART.Count
              Set chos = obt.PART.Item(i)
 <!       If Not chos.PartType = 3 Then
 !>           If Not chos.PartType = PartType_Rassirenie Then
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
 !>       If (OptRights) Then
 !>       s.putBuf "revoke all on [dbo].[" & obt.Name & "_HCL] to [public]"
 !>       s.putBuf "go"
 !>       s.putBuf "grant execute on [dbo].[" & obt.Name & "_HCL] to [public]"
 !>       s.putBuf "go"
 !>       End If
          
            
          ' register root structure of object as child of instance
          s.putBuf procDropSQL(obt.Name & "_propagate")
          s.putBuf "create proc " & obt.Name & "_propagate(@cursession uniqueidentifier, @ROWID uniqueidentifier) as  "
          s.putBuf "declare @ObjType as varchar(255)"
          s.putBuf "declare @tmpStr as varchar(255)"
          
          s.putBuf "select  @ObjType =objtype from instance where instanceid=@Rowid"
          s.putBuf "if @objtype = '" & obt.Name & "'"
          s.putBuf " begin"
          
          If obt.PART.Count = 0 Then
            s.putBuf "   select 1 '  do nothng"
            s.putBuf " end"
          Else
            s.putBuf "if @@nestlevel < 30  begin"
            s.putBuf "declare @childlistid uniqueidentifier"
            s.putBuf "declare @ssid uniqueidentifier"
            s.putBuf " select @SSID = securitystyleid from instance where instanceid=@RowID"
            For i = 1 To obt.PART.Count
              Set chos = obt.PART.Item(i)
 <!       If Not chos.PartType = 3 Then
 !>           If Not chos.PartType = PartType_Rassirenie Then
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
 !>       If (OptRights) Then
 !>       s.putBuf "revoke all on [dbo].[" & obt.Name & "_propagate] to [public]"
 !>       s.putBuf "go"
 !>       s.putBuf "grant execute on [dbo].[" & obt.Name & "_propagate] to [public]"
 !>       s.putBuf "go"
 !>       End If
 !>     
            
          
          log = log & vbCrLf & "Create common procs for type " & obt.Name
          o.Module = "--Procs"
          o.Block = "--body"
          o.OutNL s.getBuf
          o.OutNL "GO"
          DebugOutput "SQLGEN.CreateTypeProcs:done " & obt.the_comment
          Set s = Nothing
        End Sub
        
        
        Private Sub MakeAllViews(ppart As PART)
        DebugOutput "SQLGEN.MakeAllViews:start " & ppart.Caption
 <! If ppart.PartType = 3 Then
 !>     If ppart.PartType = PartType_Rassirenie Then
            DebugOutput "SQLGEN.MakeAllViews:skipped " & ppart.Caption
            Exit Sub
        End If
        Dim i As Long
 <! Dim j As Long
          For i = 1 To ppart.PARTVIEW.Count
 <!         'MLF
 <! '        If IsMLFPart(ppart) Then
 <! '            Debug.Assert False
 <! '
 <! '        End If
 <!         MakeViews ppart.PARTVIEW.Item(i), ""
 <!         For j = 1 To ppart.Application.LocalizeInfo.Count
 <!             MakeViews ppart.PARTVIEW.Item(i), ppart.Application.LocalizeInfo.Item(j).LangShort
 <!         Next
 <!         'EMLF
 <!     
 !>         MakeViews ppart.PARTVIEW.Item(i)
          Next
          DebugOutput "SQLGEN.MakeAllViews:children " & ppart.Caption
          For i = 1 To ppart.PART.Count
            MakeAllViews ppart.PART.Item(i)
          Next
          DebugOutput "SQLGEN.MakeAllViews:done " & ppart.Caption
        End Sub
        
        
 <! Private Sub MakeViews_PutColumns(ByRef pv As PARTVIEW, ByRef fcnt As Long, ByRef s As Writer, ByRef from As String, ByRef log As String, ByRef noagg As Long, ByRef group As String, ByRef BP As PART, ByRef root As PART, Optional NoFirstTable As Boolean = False, Optional Lang As String = "")
 <! Dim i, j As Long
 <! Dim vc As ViewColumn
 <! Dim refp As PART
 <!   Dim p As PART
 <! Dim ft As FIELDTYPE
 <!   Dim f As FIELD
 !>     Private Sub MakeViews(pv As PARTVIEW)
 ->      DebugOutput "SQLGEN.MakeViews:start " & pv.Name
 ->       Dim s As Writer
 ->       Dim ot As OBJECTTYPE
 ->       Dim BP As PART
 ->       Dim p As PART
 ->       Dim refp As PART
 ->       Dim f As FIELD
 ->       Dim ft As FIELDTYPE
 ->       Dim root As PART
 ->       Dim vc As ViewColumn
 ->       Dim i As Long, j As Long
 ->       Dim from As String, group As String
 -> 
 !>      'point#
 !>      Dim noagg As Long, isButton As Boolean
 !>      isButton = False
 ->       Dim structfld As String
 ->       On Error GoTo bye
 ->       
 ->       Set BP = pv.Parent.Parent
 ->       
 ->       Set s = New Writer
 ->       
 ->       ' найти раздел первого уровня и построить цепочку прямых join
 ->       Set root = BP
 ->       from = " from " & BP.Name
 ->       structfld = BP.Name & "ID"
 ->       While TypeName(root.Parent.Parent) <> "OBJECTTYPE"
 ->         from = from & vbCrLf & " join " & root.Parent.Parent.Name & " on " & root.Parent.Parent.Name & "." & root.Parent.Parent.Name & "ID=" & root.Name & ".ParentStructRowID "
 ->         structfld = structfld & ", " & root.Parent.Parent.Name & "ID"
 ->         Set root = root.Parent.Parent
 ->       Wend
 ->       
 ->       from = from & vbCrLf & " join INSTANCE on " & root.Name & ".INSTANCEID=INSTANCE.INSTANCEID"
 ->       from = from & vbCrLf & " left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid"
 ->       
 ->       group = " group by " & root.Name & ".InstanceID, " & BP.Name & "." & BP.Name & "ID "
 ->       
 ->       ' стандартное начало
 ->       s.putBuf viewDropSQL("V_" & pv.the_Alias)
 ->       s.putBuf "create view V_" & pv.the_Alias & " as "
 !>       s.putBuf "select   " & structfld
 ->       Dim fcnt As Long
 ->       fcnt = 0
          
          For i = 1 To pv.ViewColumn.Count
            Set vc = pv.ViewColumn.Item(i)
            Set p = vc.FromPart
            Set f = vc.FIELD
 <!     If Not (p Is Nothing) And Not (f Is Nothing) Then
 !>         Set ft = f.FIELDTYPE
 !>         If ft.TypeStyle = TypeStyle_Element_oformleniy Then isButton = True
 !>         If Not (p Is Nothing) And Not (f Is Nothing) And ft.TypeStyle <> TypeStyle_Element_oformleniy Then
              fcnt = fcnt + 1
        '      If fcnt > 1 Then
                s.putBuf ", "
        '      End If
              If vc.Aggregation = AggregationType_none Then
                Set ft = f.FIELDTYPE
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
 !>               If (ft.Name = "ReferenceSQL") Then
 !>                   s.putBuf " dbo.GetBriefFromXML(" & p.Name & "." & f.Name & ") "
 !>               Else
                     ' вписываем значение ссылки
                    s.putBuf " " & p.Name & "." & f.Name & "  "
                    s.putBuf vc.the_Alias & "_ID, "
                    ' и расшифрованное значение
                    If f.ReferenceType = ReferenceType_Na_ob_ekt_ Then
 <!             'MLF
 <!             If Lang = "" Then
 <!                 s.putBuf " dbo.INSTANCE_BRIEF_F(" & p.Name & "." & f.Name & ", NULL) "
 <!             Else
 <!                 s.putBuf " dbo.INSTANCE_BRIEF_F(" & p.Name & "." & f.Name & ", '" + Lang + "') "
 <!             End If
 !>                   s.putBuf " dbo.INSTANCE_BRIEF_F(" & p.Name & "." & f.Name & ") "
                    ElseIf f.ReferenceType = ReferenceType_Na_stroku_razdela Then
                      Set refp = f.RefToPart
 <!             'MLF
 <!             If Lang = "" Then
 <!                 s.putBuf " dbo." & refp.Name & "_BRIEF_F(" & p.Name & "." & f.Name & ", NULL) "
 <!             Else
 <!                 s.putBuf " dbo." & refp.Name & "_BRIEF_F(" & p.Name & "." & f.Name & ", '" + Lang + "') "
 <!             End If
 !>                   s.putBuf " dbo." & refp.Name & "_BRIEF_F(" & p.Name & "." & f.Name & ") "
                    Else
                      s.putBuf p.Name & "." & f.Name & " "
                    End If
 !>               End If
                Else
 <!           'MLF s.putBuf p.Name & "." & f.Name & " "
 !>               s.putBuf p.Name & "." & f.Name & " "
 <!           s.putBuf GetFullFieldName(f, p, Lang) & " "
                End If
                
                
                noagg = noagg + 1
                group = group & vbCrLf & "," & p.Name & "." & f.Name & " "
              ElseIf vc.Aggregation = AggregationType_MAX Then
 <!          'MLF s.putBuf "MAX(" & p.Name & "." & f.Name & ") "
 !>              s.putBuf "MAX(" & p.Name & "." & f.Name & ") "
 <!          s.putBuf "MAX(" & GetFullFieldName(f, p, Lang) & ") "
 <!          
              ElseIf vc.Aggregation = AggregationType_MIN Then
 <!         'MLF s.putBuf "MIN(" & p.Name & "." & f.Name & ") "
 !>             s.putBuf "MIN(" & p.Name & "." & f.Name & ") "
 <!         s.putBuf "MIN(" & GetFullFieldName(f, p, Lang) & ") "
              ElseIf vc.Aggregation = AggregationType_AVG Then
 <!         'MLF s.putBuf "AVG(" & p.Name & "." & f.Name & ") "
 !>             s.putBuf "AVG(" & p.Name & "." & f.Name & ") "
 <!         s.putBuf "AVG(" & GetFullFieldName(f, p, Lang) & ") "
              ElseIf vc.Aggregation = AggregationType_SUM Then
 <!         'MLF s.putBuf "SUM(" & p.Name & "." & f.Name & ") "
 !>             s.putBuf "SUM(" & p.Name & "." & f.Name & ") "
 <!         s.putBuf "SUM(" & GetFullFieldName(f, p, Lang) & ") "
              ElseIf vc.Aggregation = AggregationType_COUNT Then
 <!         'MLF s.putBuf "COUNT(" & p.Name & "." & f.Name & ") "
 !>             s.putBuf "COUNT(" & p.Name & "." & f.Name & ") "
 <!         s.putBuf "COUNT(" & GetFullFieldName(f, p, Lang) & ") "
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
                  from = from & vbCrLf & " left join " & p.Name & " on " & BP.Name & "." & BP.Name & "ID = " & p.Name & ".ParentStructRowID"
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
                  from = from & vbCrLf & " left join " & p.Name & " ON " & p.Name & ".InstanceID=" & root.Name & ".InstanceID"
                End If
              End If
            Else
            log = log & vbCrLf & "ERROR-->Ошибка определения запроса:" & pv.Name & "(" & pv.the_Alias & ")" & " колонка: " & vc.the_Alias & " - не задан раздел, или поле.<--ERROR"
            End If
          Next
 <!   'MLF
 <!   If Lang <> "" And IsMLFPart(p) Then
 <!     from = from & vbCrLf & " left join " & p.Name & "_" & Lang & " ON " & p.Name & "." & p.Name & "ID=" & p.Name & "_" & Lang & "." & p.Name & "ID"
 <!   End If
 <!   
 <! End Sub
 <! 
 <! 'MLF
 <! Private Function GetFullFieldName(f As FIELD, p As PART, Lang As String) As String
 <! '" & p.Name & "." & f.Name & "
 <!     If IsMLFField(f) And Lang <> "" Then
 <!         GetFullFieldName = p.Name & "_" & Lang & "." & f.Name
 <!     Else
 <!         GetFullFieldName = p.Name & "." & f.Name
 <!     End If
 <! End Function
 <! 
 <! Private Sub MakeViews(pv As PARTVIEW, Lang As String)
 <-  DebugOutput "SQLGEN.MakeViews:start " & pv.Name
 <-   Dim s As Writer
 <-   Dim ot As OBJECTTYPE
 <-   Dim BP As PART
 <-   Dim p As PART
 <-   Dim refp As PART
 <-   Dim f As FIELD
 <-   Dim ft As FIELDTYPE
 <-   Dim root As PART
 <-   Dim vc As ViewColumn
 <-   Dim i As Long, j As Long
 <-   Dim from As String, group As String
 <!   Dim noagg As Long
 <-   Dim structfld As String
 <-   On Error GoTo bye
 <-   
 <-   Set BP = pv.Parent.Parent
 <-   
 <-   Set s = New Writer
 <-   
 <-   ' найти раздел первого уровня и построить цепочку прямых join
 <-   Set root = BP
 <-   from = " from " & BP.Name
 <-   structfld = BP.Name & "ID"
 <-   While TypeName(root.Parent.Parent) <> "OBJECTTYPE"
 <-     from = from & vbCrLf & " join " & root.Parent.Parent.Name & " on " & root.Parent.Parent.Name & "." & root.Parent.Parent.Name & "ID=" & root.Name & ".ParentStructRowID "
 <-     structfld = structfld & ", " & root.Parent.Parent.Name & "ID"
 <-     Set root = root.Parent.Parent
 <-   Wend
 <-   
 <-   from = from & vbCrLf & " join INSTANCE on " & root.Name & ".INSTANCEID=INSTANCE.INSTANCEID"
 <-   from = from & vbCrLf & " left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid"
 <-   
 <-   group = " group by " & root.Name & ".InstanceID, " & BP.Name & "." & BP.Name & "ID "
 <-   
 <-   ' стандартное начало
 <!   If Lang <> "" Then
 <!     s.putBuf viewDropSQL("V_" & pv.the_Alias & "_" & Lang)
 <!     s.putBuf "create view V_" & pv.the_Alias & "_" & Lang & " as "
 <!   Else
 <-     s.putBuf viewDropSQL("V_" & pv.the_Alias)
 <-     s.putBuf "create view V_" & pv.the_Alias & " as "
 <!   End If
 <!   'MLF
 <! '  If Lang <> "" Then
 <! '    s.putBuf "select   " & BP.Name & "_" & Lang & "." & structfld
 <! '  Else
 <!     s.putBuf "select   " & BP.Name & "." & structfld
 <! '  End If
 <-   Dim fcnt As Long
 <-   fcnt = 0
 <!   MakeViews_PutColumns pv, fcnt, s, from, log, noagg, group, BP, root, , Lang
 <! '  For i = 1 To pv.ViewColumn.Count
 <! '    Set vc = pv.ViewColumn.Item(i)
 <! '    Set p = vc.FromPart
 <! '    Set f = vc.FIELD
 <! '    If Not (p Is Nothing) And Not (f Is Nothing) Then
 <! '      fcnt = fcnt + 1
 <! ''      If fcnt > 1 Then
 <! '        s.putBuf ", "
 <! ''      End If
 <! '      If vc.Aggregation = AggregationType_none Then
 <! '        Set ft = f.FIELDTYPE
 <! '        If ft.TypeStyle = TypeStyle_Perecislenie Then
 <! '          ' вписываем значение перечсления
 <! '          s.putBuf " " & p.Name & "." & f.Name & "  "
 <! '          s.putBuf vc.the_Alias & "_VAL, "
 <! '
 <! '          ' и его расшифровку
 <! '          s.putBuf " case " & p.Name & "." & f.Name & " "
 <! '          For j = 1 To ft.ENUMITEM.Count
 <! '            s.putBuf "when " & ft.ENUMITEM.Item(j).NameValue & " then '" & ft.ENUMITEM.Item(j).Name & "'"
 <! '          Next
 <! '          s.putBuf " end "
 <! '
 <! '        ElseIf ft.TypeStyle = TypeStyle_Ssilka Then
 <! '          ' вписываем значение ссылки
 <! '          s.putBuf " " & p.Name & "." & f.Name & "  "
 <! '          s.putBuf vc.the_Alias & "_ID, "
 <! '
 <! '          ' и расшифрованное значение
 <! '          If f.ReferenceType = ReferenceType_Na_ob_ekt_ Then
 <! '            s.putBuf " dbo.INSTANCE_BRIEF_F(" & p.Name & "." & f.Name & ") "
 <! '          ElseIf f.ReferenceType = ReferenceType_Na_stroku_razdela Then
 <! '            Set refp = f.RefToPart
 <! '            s.putBuf " dbo." & refp.Name & "_BRIEF_F(" & p.Name & "." & f.Name & ") "
 <! '          Else
 <! '            s.putBuf p.Name & "." & f.Name & " "
 <! '          End If
 <! '        Else
 <! '
 <! '          s.putBuf p.Name & "." & f.Name & " "
 <! '        End If
 <! '
 <! '
 <! '        noagg = noagg + 1
 <! '        group = group & vbCrLf & "," & p.Name & "." & f.Name & " "
 <! '      ElseIf vc.Aggregation = AggregationType_MAX Then
 <! '         s.putBuf "MAX(" & p.Name & "." & f.Name & ") "
 <! '      ElseIf vc.Aggregation = AggregationType_MIN Then
 <! '        s.putBuf "MIN(" & p.Name & "." & f.Name & ") "
 <! '      ElseIf vc.Aggregation = AggregationType_AVG Then
 <! '        s.putBuf "AVG(" & p.Name & "." & f.Name & ") "
 <! '      ElseIf vc.Aggregation = AggregationType_SUM Then
 <! '        s.putBuf "SUM(" & p.Name & "." & f.Name & ") "
 <! '      ElseIf vc.Aggregation = AggregationType_COUNT Then
 <! '        s.putBuf "COUNT(" & p.Name & "." & f.Name & ") "
 <! '      End If
 <! '      s.putBuf vc.the_Alias & " "
 <! '      Dim isOK As Boolean
 <! '
 <! '      If BP.ID = p.Parent.Parent.ID Then
 <! '        isOK = False
 <! '
 <! '        ' проверяем поля, которые входят в раздел
 <! '        For j = 1 To i - 1
 <! '
 <! '          If pv.ViewColumn.Item(j).FromPart.ID = p.ID Then
 <! '            isOK = True
 <! '            Exit For
 <! '          End If
 <! '        Next
 <! '
 <! '        ' если в разделе есть поля, то включаем его в запрос
 <! '        If Not isOK Then
 <! '          from = from & vbCrLf & " left join " & p.Name & " on " & BP.Name & "." & BP.Name & "ID = " & p.Name & ".ParentStructRowID"
 <! '        End If
 <! '      End If
 <! '
 <! '
 <! '      ' проверяем верхние разделы, которые не  являются непосредственными родителями нашего базового раздела
 <! '      If TypeName(p.Parent.Parent) = "OBJECTTYPE" And (p.ID <> root.ID) Then
 <! '        isOK = False
 <! '        For j = 1 To i - 1
 <! '          If pv.ViewColumn.Item(j).FromPart.ID = p.ID Then
 <! '            isOK = True
 <! '            Exit For
 <! '          End If
 <! '        Next
 <! '        ' есть поля из верхнего раздела
 <! '        If Not isOK Then
 <! '          from = from & vbCrLf & " left join " & p.Name & " ON " & p.Name & ".InstanceID=" & root.Name & ".InstanceID"
 <! '        End If
 <! '      End If
 <! '    Else
 <! '    log = log & vbCrLf & "ERROR-->Ошибка определения запроса:" & pv.Name & "(" & pv.the_Alias & ")" & " колонка: " & vc.the_Alias & " - не задан раздел, или поле.<--ERROR"
 <! '    End If
 <! '  Next
 <!   'Все поля забиты... Ищем еще поля...
 <!   
 <!     MakeLinkedView pv, s, from, log, group, Lang
 <!   
          If fcnt > 0 Then
            s.putBuf ", " & root.Name & ".InstanceID InstanceID "
          Else
            s.putBuf " " & root.Name & ".InstanceID InstanceID "
          End If
          
          s.putBuf ", " & BP.Name & "." & BP.Name & "ID ID "
          s.putBuf ", '" & BP.Name & "' VIEWBASE "
          s.putBuf ", XXXMYSTATUSXXX.Name StatusName "
          s.putBuf ", XXXMYSTATUSXXX.objstatusid INTSANCEStatusID"
          
          ' if no aggregations - no group by
          If noagg = pv.ViewColumn.Count Then group = ""
 !>       If isButton Then group = ""
          
          o.Module = "--Views--"
          o.Block = "--Views--"
          o.OutNL s.getBuf & vbCrLf & from & vbCrLf & group
          o.OutNL "GO"
 !>       If (OptRights) Then
 !>       o.OutNL "revoke all on [dbo].[V_" & pv.the_Alias & "] to [public]"
 !>       o.OutNL "go"
 !>       o.OutNL "grant select on [dbo].[V_" & pv.the_Alias & "] to [public]"
 !>       o.OutNL "go"
 !>       End If
          Set s = Nothing
          DebugOutput "SQLGEN.MakeViews:done " & pv.Name
          Exit Sub
    bye:
        log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
         ' Stop
         Set s = Nothing
 <-  Exit Sub
 <!   Resume
 <! End Sub
 <! 
 <! Private Sub MakeLinkedView(ByRef pv As PARTVIEW, ByRef s As Writer, ByRef from As String, ByRef log As String, ByRef group As String, Optional Lang As String)
 <! Dim i As Long
 <! 
 <!   pv.PARTVIEW_LNK.Sort = "SEQ"
 <!   
 <!   For i = 1 To pv.PARTVIEW_LNK.Count
 <!     Dim PVD As PARTVIEW
 <!     Dim fcnt2 As Long
 <!     Dim noagg2 As Long
 <!     Dim BP2 As PART
 <!     Dim root2 As PART
 <!     Set PVD = pv.PARTVIEW_LNK.Item(i).TheView
 <!     Set BP2 = PVD.Parent.Parent
 <!     ' найти раздел первого уровня и построить цепочку прямых join
 <!     Set root2 = BP2
 <!     Dim fromAddings As String
 <!     Dim structfld2 As String
 <!     
 <!     structfld2 = BP2.Name & "ID"
 <!     While TypeName(root2.Parent.Parent) <> "OBJECTTYPE"
 <!       fromAddings = fromAddings & vbCrLf & " join " & root2.Parent.Parent.Name & " on " & root2.Parent.Parent.Name & "." & root2.Parent.Parent.Name & "ID=" & root2.Name & ".ParentStructRowID "
 <!       structfld2 = structfld2 & ", " & root2.Parent.Parent.Name & "ID"
 <!       Set root2 = root2.Parent.Parent
 <!     Wend
 <!     
 <!     'MLF
 <! 
 <!     If pv.PARTVIEW_LNK.Item(i).RefType = JournalLinkType_Ssilka_na_ob_ekt Then
 <!         from = from + vbCrLf + " left join " + PVD.Parent.Parent.Name + " on " + root2.Name + ".InstanceID=" + pv.Parent.Parent.Name + "." + pv.PARTVIEW_LNK.Item(i).TheJoinSource.FIELD.Name + " "
 <!     ElseIf pv.PARTVIEW_LNK.Item(i).RefType = JournalLinkType_Ssilka_na_stroku Then
 <!         from = from + vbCrLf + " left join " + PVD.Parent.Parent.Name + " on " + root2.Name + ".InstanceID=" + pv.Parent.Parent.Name + "." + pv.PARTVIEW_LNK.Item(i).TheJoinSource.FIELD.Name + " "
 <!     ElseIf pv.PARTVIEW_LNK.Item(i).RefType = JournalLinkType_Svyzka_InstanceID_OPNv_peredlah_ob_ektaCLS Then
 <!         from = from + vbCrLf + " left join " + PVD.Parent.Parent.Name + " on " + pv.Parent.Parent.Name + ".InstanceID=" + PVD.Parent.Parent.Name + "." + "InstanceID "
 <!     ElseIf pv.PARTVIEW_LNK.Item(i).RefType = JournalLinkType_Svyzka_ParentStructRowID__OPNv_peredlah_ob_ektaCLS Then
 <!         from = from + vbCrLf + " left join " + PVD.Parent.Parent.Name + " on " + pv.Parent.Parent.Name + "." + pv.Parent.Parent.Name + "." + "=" + PVD.Parent.Parent.Name + "." + "ParentStructRowID "
 <!     Else
 <!         Exit For
 <!     End If
 <!     
 <!     from = from + vbCrLf + fromAddings
 <!     
 <!     MakeViews_PutColumns PVD, fcnt2, s, from, log, noagg2, group, BP2, root2, , Lang
 <!     MakeLinkedView PVD, s, from, log, group, Lang
 <!   Next
 !>     '  Resume
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
        '  DebugOutput "SQLGEN.MakeJournals:start "
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
        '  DebugOutput "SQLGEN.MakeJournals:done "
        End Sub
        
        
        
        Private Sub CreateV2Proc(os As PART)
        DebugOutput "SQLGEN.CreateV2Proc:start " & os.Caption
 <! If os.PartType = 3 Then
 !>     If os.PartType = PartType_Rassirenie Then
            DebugOutput "SQLGEN.CreateV2Proc:skipped " & os.Caption
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
 !>     s.putBuf "go"
 !>     If (OptRights) Then
 !>     s.putBuf "revoke all on [dbo].[" & os.Name & "_PARENT] to [public]"
 !>     s.putBuf "go"
 !>     s.putBuf "grant execute on [dbo].[" & os.Name & "_PARENT] to [public]"
 !>     s.putBuf "go"
 !>     End If
        
        
        
        
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
 !>     s.putBuf " go"
 !>     If (OptRights) Then
 !>     s.putBuf "revoke all on [dbo].[" & os.Name & "_ISLOCKED] to [public]"
 !>     s.putBuf "go"
 !>     s.putBuf "grant execute on [dbo].[" & os.Name & "_ISLOCKED] to [public]"
 !>     s.putBuf "go"
 !>     End If
        
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
 !>     s.putBuf " go "
 !>     If (OptRights) Then
 !>     s.putBuf "revoke all on [dbo].[" & os.Name & "_LOCK] to [public]"
 !>     s.putBuf "go"
 !>     s.putBuf "grant execute on [dbo].[" & os.Name & "_LOCK] to [public]"
 !>     s.putBuf "go"
 !>     End If
        
        
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
 <!     If Not chos.PartType = 3 Then
 !>         If Not chos.PartType = PartType_Rassirenie Then
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
 !>       s.putBuf "go"
 !>       If (OptRights) Then
 !>       s.putBuf "revoke all on [dbo].[" & os.Name & "_HCL] to [public]"
 !>       s.putBuf "go"
 !>       s.putBuf "grant execute on [dbo].[" & os.Name & "_HCL] to [public]"
 !>       s.putBuf "go"
 !>       End If
 !>     
          
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
 <! s.putBuf "    raiserror('Строка заблоирована другим пользователем',16,1)"
 !>     s.putBuf "    raiserror('Строка заблокирована другим пользователем',16,1)"
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
 !>     s.putBuf "go"
 !>     If (OptRights) Then
 !>     s.putBuf "revoke all on [dbo].[" & os.Name & "_UNLOCK] to [public]"
 !>     s.putBuf "go"
 !>     s.putBuf "grant execute on [dbo].[" & os.Name & "_UNLOCK] to [public]"
 !>     s.putBuf "go"
 !>     End If
 !>     
        
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
        
 !>     s.putBuf "go"
 !>     If (OptRights) Then
 !>     s.putBuf "revoke all on [dbo].[" & os.Name & "_SINIT] to [public]"
 !>     s.putBuf "go"
 !>     s.putBuf "grant execute on [dbo].[" & os.Name & "_SINIT] to [public]"
 !>     s.putBuf "go"
 !>     End If
 !>     
 !>     
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
 <!     If Not chos.PartType = 3 Then
 !>         If Not chos.PartType = PartType_Rassirenie Then
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
 !>       s.putBuf "go"
 !>       If (OptRights) Then
 !>       s.putBuf "revoke all on [dbo].[" & os.Name & "_propagate]  to [public]"
 !>       s.putBuf "go"
 !>       s.putBuf "grant execute on [dbo].[" & os.Name & "_propagate]  to [public]"
 !>       s.putBuf "go"
 !>       End If
 !>     
          
        o.Module = "--Procedures"
        o.Block = "--TableProc"
        o.OutNL s.getBuf
        o.OutNL "GO"
        
        
        
        
        DebugOutput "SQLGEN.CreateV2Proc:children " & os.Caption
        For i = 1 To os.PART.Count
          Set chos = os.PART.Item(i)
          CreateV2Proc chos
        Next
        DebugOutput "SQLGEN.CreateV2Proc:done " & os.Caption
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
          Set Map = New Collection
          On Error GoTo bye
          Open App.Path & "\IDMAP.txt" For Input As #ff
          While Not EOF(ff)
            Input #ff, ID1S, IDMTZ
            Set idm = New IDMAP
            If ID1S <> "" Then
              idm.ID1S = ID1S
              idm.IDMTZ = IDMTZ
              On Error Resume Next
              Map.Add idm, ID1S
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
          
        '  Dim mTempPath As String
        '  mTempPath = GetSetting("MTZ", "CONFIG", "TEMPPATH", "")
        '  If mTempPath = "" Then
        '    ChDir App.Path
        '    On Error Resume Next
        '    MkDir "TMP"
        '    fname = App.Path & "\TMP\" & CreateGUID2 & ".txt"
        '  Else
        '    fname = mTempPath & CreateGUID2 & ".txt"
        '  End If
        '
          Open App.Path & "\IDMAP.txt" For Output As #ff
          For Each idm In Map
            Write #ff, idm.ID1S, idm.IDMTZ
          Next
          Close #ff
        End Sub
        
        Private Function GetMap(ID1S As String) As String
          Dim idm As IDMAP
          On Error Resume Next
          Set idm = Nothing
          Set idm = Map.Item(ID1S)
          If idm Is Nothing Then
            Set idm = New IDMAP
            idm.ID1S = ID1S
            idm.IDMTZ = CreateGUID2
            Map.Add idm, ID1S
          End If
         GetMap = idm.IDMTZ
        End Function
        
        Private Sub Class_Initialize()
          LoadMap
        End Sub
        
        Private Sub Class_Terminate()
          SaveMap
        End Sub
        
        
        Private Function procDropSQL(p As String) As String
            Dim s As String
            s = "if exists (select * from sysobjects where id = object_id(N'" & p & "') and OBJECTPROPERTY(id, N'IsProcedure') = 1)"
            s = s & vbCrLf & "drop procedure " & p & ""
            s = s & vbCrLf & "GO"
            procDropSQL = s
        End Function
        
        Private Function funcDropSQL(p As String) As String
            Dim s As String
            s = "if exists (select * from sysobjects where id = object_id(N'" & p & "') and xtype in (N'FN', N'IF', N'TF'))"
            s = s & vbCrLf & "drop function " & p & ""
            s = s & vbCrLf & "GO"
            funcDropSQL = s
        End Function
        
        Private Function indexDropSQL(tbl As String, idx As String) As String
            Dim s As String
            s = "if exists (select * from sysindexes where name = N'" & idx & "' and id = object_id(N'" & tbl & "'))"
            s = s & vbCrLf & "drop index " & tbl & "." & idx
            s = s & vbCrLf & "GO"
            indexDropSQL = s
        End Function
        
        Private Function keyDropSQL(tbl As String, key As String) As String
            Dim s As String
            s = "if exists(select * from sysobjects where id=object_id(N'" & key & "') and type='F')"
            s = s & vbCrLf & "ALTER TABLE " & tbl & " DROP CONSTRAINT " & key
            s = s & vbCrLf & "GO"
            keyDropSQL = s
        End Function
        
        Private Function PkeyDropSQL(tbl As String, key As String) As String
            Dim s As String
            s = "if exists(select * from sysobjects where id=object_id(N'" & key & "') and xtype='PK' and type='K')"
            s = s & vbCrLf & "ALTER TABLE " & tbl & " DROP CONSTRAINT " & key
            s = s & vbCrLf & "GO"
            PkeyDropSQL = s
        End Function
        
        
        Private Function viewDropSQL(p As String) As String
            Dim s As String
            s = "if exists (select * from sysobjects where id = object_id(N'" & p & "') and OBJECTPROPERTY(id, N'IsView') = 1)"
            s = s & vbCrLf & "drop view " & p & ""
            s = s & vbCrLf & "GO"
            viewDropSQL = s
        End Function
        
        Private Function ColumnDropSQL(t As String, collist As String) As String
            Dim s As String
            s = "go"
            s = s & vbCrLf & "-- drop extra columns from generated table: " & t
            s = s & vbCrLf & "declare @n nvarchar(255)"
            s = s & vbCrLf & "declare @e_str nvarchar(4000)"
            s = s & vbCrLf & ""
            s = s & vbCrLf & "declare nnn cursor local for"
            s = s & vbCrLf & "select name from syscolumns where id = object_id('" & t & "')"
            s = s & vbCrLf & "and name not in(" & collist & ")"
            s = s & vbCrLf & "open nnn"
            s = s & vbCrLf & "fetch next from nnn into @n"
            s = s & vbCrLf & "while @@fetch_status >=0"
            s = s & vbCrLf & "begin"
            s = s & vbCrLf & "  set @e_str=N'alter table " + t + " drop column '+@n"
            s = s & vbCrLf & "  exec  sp_sqlexec @e_str"
            s = s & vbCrLf & "  fetch next from nnn into @n"
            s = s & vbCrLf & "End"
            s = s & vbCrLf & "Close nnn"
            s = s & vbCrLf & "deallocate nnn"
            s = s & vbCrLf & "go"
            ColumnDropSQL = s
        End Function
        
        
        Private Function FullTextClean() As String
          Dim s As String
          s = ""
          s = s & vbCrLf & "IF DATABASEPROPERTYEX(DB_NAME() , 'IsFulltextEnabled') <> 1"
          s = s & vbCrLf & "EXECUTE sp_fulltext_database 'enable'"
          s = s & vbCrLf & "go"
          
          ' есть ли каталог ?
          s = s & vbCrLf & "if not exists  (select name from sysfulltextcatalogs where name ='fulltext_catalog')"
          s = s & vbCrLf & "Exec sp_fulltext_catalog 'fulltext_catalog','Create'"
          s = s & vbCrLf & "go"
          
          ' грохаем все таблицы из каталога
          s = s & vbCrLf & "DECLARE @TableOwner sysname"
          s = s & vbCrLf & "DECLARE @TableName sysname"
          s = s & vbCrLf & "DECLARE @FullTextTableCursor CURSOR"
          s = s & vbCrLf & "DECLARE @FullTextKeyIndexName sysname"
          s = s & vbCrLf & "DECLARE @FullTextKeyColID  int"
          s = s & vbCrLf & "DECLARE @FullTextIndexActive int"
          s = s & vbCrLf & "DECLARE @FullTextCatalogName sysname"
          s = s & vbCrLf & "EXECUTE sp_help_fulltext_tables_cursor @FullTextTableCursor OUTPUT, @fulltext_catalog_name ='fulltext_catalog'"
          s = s & vbCrLf & "FETCH NEXT FROM @FullTextTableCursor INTO @TableOwner, @TableName, @FullTextKeyIndexName, @FullTextKeyColID, @FullTextIndexActive, @FullTextCatalogName"
          s = s & vbCrLf & "WHILE (@@FETCH_STATUS = 0)"
          s = s & vbCrLf & "BEGIN"
          s = s & vbCrLf & "  EXECUTE sp_fulltext_table @TableName, 'Drop'"
          s = s & vbCrLf & "  FETCH NEXT FROM @FullTextTableCursor INTO @TableOwner, @TableName, @FullTextKeyIndexName, @FullTextKeyColID, @FullTextIndexActive, @FullTextCatalogName"
          s = s & vbCrLf & "End"
          s = s & vbCrLf & "CLOSE @FullTextTableCursor"
          s = s & vbCrLf & "DEALLOCATE @FullTextTableCursor"
          s = s & vbCrLf & "go"
          
          ' грохаем сам каталог
          s = s & vbCrLf & "if exists  (select name from sysfulltextcatalogs where name ='fulltext_catalog')"
          s = s & vbCrLf & "Exec sp_fulltext_catalog 'fulltext_catalog','Drop'"
          s = s & vbCrLf & "go"
          
          ' есть ли каталог ?
          s = s & vbCrLf & "if not exists  (select name from sysfulltextcatalogs where name ='fulltext_catalog')"
          s = s & vbCrLf & "Exec sp_fulltext_catalog 'fulltext_catalog','Create'"
          s = s & vbCrLf & "go"
          
          
          
        
          FullTextClean = s
        End Function
        
        
        Private Function FullTextStart() As String
        Dim s As String
          s = ""
          s = s & vbCrLf & "IF DATABASEPROPERTYEX(DB_NAME() , 'IsFulltextEnabled') = 1"
          s = s & vbCrLf & "EXECUTE sp_fulltext_catalog 'fulltext_catalog','start_full'"
          s = s & vbCrLf & "go"
          
          s = s & vbCrLf & "declare @id BINARY(16)"
          s = s & vbCrLf & "declare @jname nvarchar(255)"
          s = s & vbCrLf & "declare @jcmd nvarchar(4000)"
          s = s & vbCrLf & "declare @dbname nvarchar(4000)"
          s = s & vbCrLf & "set @jname =  N'Start_Incremental on ' + db_name()"
          s = s & vbCrLf & "set @dbname =  db_name()"
          s = s & vbCrLf & "set @jcmd =  N'use [' + db_name() + N'] exec sp_fulltext_catalog N''fulltext_catalog'', N''start_incremental'''"
          s = s & vbCrLf & ""
          s = s & vbCrLf & "exec msdb..sp_add_job"
          s = s & vbCrLf & "@job_name = @jname,"
          s = s & vbCrLf & "@enabled = 1,"
          s = s & vbCrLf & "@start_step_id = 1,"
          s = s & vbCrLf & "@notify_level_eventlog = 2,"
          s = s & vbCrLf & "@notify_level_email = 0,"
          s = s & vbCrLf & "@notify_level_netsend = 0,"
          s = s & vbCrLf & "@notify_level_page = 0,"
          s = s & vbCrLf & "@delete_level = 0,"
          s = s & vbCrLf & "@category_name = N'Full-Text',"
          s = s & vbCrLf & "@job_id = @id OUTPUT"
          s = s & vbCrLf & ""
          s = s & vbCrLf & "exec msdb..sp_add_jobstep"
          s = s & vbCrLf & " @job_id = @id ,"
          s = s & vbCrLf & " @step_id = 1,"
          s = s & vbCrLf & " @cmdexec_success_code = 0,"
          s = s & vbCrLf & " @on_success_action = 1,"
          s = s & vbCrLf & " @on_success_step_id = 0,"
          s = s & vbCrLf & " @on_fail_action = 2,"
          s = s & vbCrLf & " @on_fail_step_id = 0,"
          s = s & vbCrLf & " @retry_attempts = 0,"
          s = s & vbCrLf & " @retry_interval = 0,"
          s = s & vbCrLf & " @os_run_priority = 0,"
          s = s & vbCrLf & " @flags = 0,"
          s = s & vbCrLf & " @step_name = N'Full-Text Indexing',"
          s = s & vbCrLf & " @subsystem = N'TSQL',"
          s = s & vbCrLf & " @command = @jcmd,"
          s = s & vbCrLf & " @database_name = @DBNAME"
          s = s & vbCrLf & ""
          s = s & vbCrLf & " exec msdb..sp_add_jobserver"
          s = s & vbCrLf & " @job_id = @id,"
          s = s & vbCrLf & " @server_name = N'(local)'"
          
          s = s & vbCrLf & " exec msdb..sp_add_jobschedule"
          s = s & vbCrLf & "@job_id = @id,"
          s = s & vbCrLf & "@name = N'step shedule',"
          s = s & vbCrLf & "@enabled = 1,"
          s = s & vbCrLf & "@freq_type = 4,"
          s = s & vbCrLf & "@freq_interval = 1,"
          s = s & vbCrLf & "@freq_subday_type = 8,"
          s = s & vbCrLf & "@freq_subday_interval = 2,"
          s = s & vbCrLf & "@freq_relative_interval = 0,"
          s = s & vbCrLf & "@freq_recurrence_factor = 1,"
          s = s & vbCrLf & "@active_start_date = 20030122,"
          s = s & vbCrLf & "@active_end_date = 99991231,"
          s = s & vbCrLf & "@active_start_time = 0,"
          s = s & vbCrLf & "@active_end_time = 235959"
          s = s & vbCrLf & "go"
          FullTextStart = s
        End Function
        
        
        
        
        Private Function AutoCloseJob() As String
         Dim s As Writer
         Set s = New Writer
         
         s.putBuf "declare @id BINARY(16)"
          s.putBuf "declare @jname nvarchar(255)"
          s.putBuf "declare @jcmd nvarchar(4000)"
          s.putBuf "declare @dbname nvarchar(4000)"
          s.putBuf "set @jname =  N'AutoCloseSession on ' + db_name()"
          s.putBuf "set @dbname =  db_name()"
          s.putBuf "set @jcmd =  N'use [' + db_name() + N'] exec AutoCloseSession'"
          s.putBuf ""
          s.putBuf "exec msdb..sp_add_job"
          s.putBuf "@job_name = @jname,"
          s.putBuf "@enabled = 1,"
          s.putBuf "@start_step_id = 1,"
          s.putBuf "@notify_level_eventlog = 2,"
          s.putBuf "@notify_level_email = 0,"
          s.putBuf "@notify_level_netsend = 0,"
          s.putBuf "@notify_level_page = 0,"
          s.putBuf "@delete_level = 0,"
          s.putBuf "@category_name = N'Database Maintenance',"
          s.putBuf "@job_id = @id OUTPUT"
          s.putBuf ""
          s.putBuf "exec msdb..sp_add_jobstep"
          s.putBuf " @job_id = @id ,"
          s.putBuf " @step_id = 1,"
          s.putBuf " @cmdexec_success_code = 0,"
          s.putBuf " @on_success_action = 1,"
          s.putBuf " @on_success_step_id = 0,"
          s.putBuf " @on_fail_action = 2,"
          s.putBuf " @on_fail_step_id = 0,"
          s.putBuf " @retry_attempts = 0,"
          s.putBuf " @retry_interval = 0,"
          s.putBuf " @os_run_priority = 0,"
          s.putBuf " @flags = 0,"
          s.putBuf " @step_name = N'Close lost session',"
          s.putBuf " @subsystem = N'TSQL',"
          s.putBuf " @command = @jcmd,"
          s.putBuf " @database_name = @DBNAME"
          s.putBuf ""
          s.putBuf " exec msdb..sp_add_jobserver"
          s.putBuf " @job_id = @id,"
          s.putBuf " @server_name = N'(local)'"
          
          s.putBuf " exec msdb..sp_add_jobschedule"
          s.putBuf "@job_id = @id,"
          s.putBuf "@name = N'step shedule',"
          s.putBuf "@enabled = 1,"
          s.putBuf "@freq_type = 4,"
          s.putBuf "@freq_interval = 1,"
          s.putBuf "@freq_subday_type = 4,"
          s.putBuf "@freq_subday_interval = 10,"
          s.putBuf "@freq_relative_interval = 0,"
          s.putBuf "@freq_recurrence_factor = 1,"
          s.putBuf "@active_start_date = 20030122,"
          s.putBuf "@active_end_date = 99991231,"
          s.putBuf "@active_start_time = 0,"
          s.putBuf "@active_end_time = 235959"
          s.putBuf "go"
          AutoCloseJob = s.getBuf
        End Function
        
        
        Private Function FullTextPartSearch(os As PART) As String
 <! If os.PartType = 3 Then
 !>     If os.PartType = PartType_Rassirenie Then
            DebugOutput "SQLGEN.FullTextPartSearch:skipped " & os.Caption
            Exit Function
        End If
        Dim st As PART
        Set st = os
        Dim chos As PART, i As Integer
        Dim s As String
        
        log = log & vbCrLf & "-->full text table " & os.Name
        
        On Error GoTo bye
          Dim hasFields As Boolean
          
          hasFields = False
          s = ""
          Dim ft As FIELDTYPE
          If st.ManualRegister = Boolean_Net Then
            st.FIELD.Sort = "sequence"
            For i = 1 To st.FIELD.Count
 !>           If (st.FIELD.Item(i).FIELDTYPE.TypeStyle <> TypeStyle_Element_oformleniy) Then
                Set ft = st.FIELD.Item(i).FIELDTYPE
                If UCase(ft.Name) = "FILE" Then
                   hasFields = True
                Else
                  If ft.AllowLikeSearch Then
                    hasFields = True
                  End If
                End If
 !>           End If
            Next
          End If
          If hasFields Then
            s = s & vbCrLf & "Insert Into queryResult(queryResultid,result) select @tmpid," & os.Name & "id from " & os.Name & " where contains(*,@filter)"
            s = s & vbCrLf & "exec RowsToInstances @tmpID, @tmp2ID, '" & os.Name & "', @CURSESSION"
            s = s & vbCrLf & "delete from QueryResult where queryResultid =@tmpid"
          End If
          
          For i = 1 To os.PART.Count
            Set chos = os.PART.Item(i)
 <!     If Not chos.PartType = 3 Then
 !>         If Not chos.PartType = PartType_Rassirenie Then
                s = s & vbCrLf & FullTextPartSearch(chos)
            End If
          Next
          FullTextPartSearch = s
        Exit Function
    bye:
        log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
        'Resume
        End Function
 <! Public Function CheckPartMLF(ByRef os As PART, ByRef log As String) As String
 <! On Error GoTo Error_Detected
 <! Dim i As Long
 <! Dim j As Long
 <! Dim f As FIELD
 <! Dim bDetected As Boolean
 <- Dim s As Writer
 <- Set s = New Writer
 <- Dim collist As String
 <! 'Exit Function
 <!     bDetected = False
 <!     For i = 1 To os.FIELD.Count
 <!         If UCase(os.FIELD.Item(i).FIELDTYPE.Name) = UCase("MultiLanguage String") Or _
 <!             UCase(os.FIELD.Item(i).FIELDTYPE.Name) = UCase("MultiLanguage Memo") Then
 <!             bDetected = True
 <!         End If
 <!     Next
 <! 
 <!     If bDetected Then
 <!         'create table for each cultures
 <!         For i = 1 To os.Application.LocalizeInfo.Count
 <!             Dim sTableName As String
 <-             Set s = Nothing
 <!             Set s = New Writer
 <!             sTableName = os.Name + "_" & os.Application.LocalizeInfo.Item(i).LangShort
 <!             log = log & vbCrLf & "-->MLE CreateStruct " & os.Name + ":" + os.Application.LocalizeInfo.Item(i).LangFull + " (" + os.Application.LocalizeInfo.Item(i).LangShort + ")"
 <!             s.putBuf "/*" & os.Caption & "_" & os.Application.LocalizeInfo.Item(i).LangShort & "*/"
 <!             s.putBuf "if not exists (select * from sysobjects where id = object_id(N'" & sTableName & "') and OBJECTPROPERTY(id, N'IsUserTable') = 1)"
 <-             s.putBuf "BEGIN"
 <!             s.putBuf "create table " & sTableName & "/*" & os.the_comment & "*/ ("
 <-             collist = ""
 <-             If TypeName(os.Parent.Parent) = "OBJECTTYPE" Then
 <-                 s.putBuf "InstanceID uniqueidentifier ,"
 <-                 collist = collist & "'InstanceID'"
 <-             Else
 <-                 s.putBuf "ParentStructRowID uniqueidentifier not null,"
 <-                 collist = collist & "'ParentStructRowID'"
 <-             End If
 <- 
 <!             s.putBuf os.Name & "id uniqueidentifier not null rowguidcol default ( newid())  "
 <!             collist = collist & ",'" & os.Name & "ID'"
 <- 
 <-             s.putBuf ",ChangeStamp datetime not null default ( getdate()) /* Время последнего изменения */"
 <-             collist = collist & ",'ChangeStamp'"
 <- 
 <-             s.putBuf ",TimeStamp timestamp not null  /* для организации инкрементального индексирования полнотекстовой информации */"
 <-             collist = collist & ",'TimeStamp'"
 <- 
 <- 
 <!             's.putBuf ",LockSessionID uniqueidentifier null  /* temporary lock */"
 <!             'collist = collist & ",'LockSessionID'"
 <!             's.putBuf ",LockUserID uniqueidentifier null /* checkout lock */"
 <!             'collist = collist & ",'LockUserID'"
 <!             's.putBuf ",SecurityStyleID uniqueidentifier null /* security formula */"
 <!             'collist = collist & ",'SecurityStyleID'"
 <! 
 <! 
 <- 
 <-             ' дерево
 <-             If os.PartType = 2 Then
 <-               s.putBuf ",ParentRowid uniqueidentifier "
 <-               collist = collist & ",'ParentRowid'"
 <-             End If
 <- 
 <-             s.putBuf ")"
 <-             s.putBuf "END"
 <-             s.putBuf "go"
 <- 
 <- 
 <!             os.FIELD.Sort = "sequence"
 <!             For j = 1 To os.FIELD.Count
 <!                 'Только ML поля
 <!                 If UCase(os.FIELD.Item(j).FIELDTYPE.Name) = UCase("MultiLanguage String") Or _
 <!                     UCase(os.FIELD.Item(j).FIELDTYPE.Name) = UCase("MultiLanguage Memo") Then
 <!                     ' Добавляем
 <!                     s.putBuf "if  not exists(select * from syscolumns where name='" & os.FIELD.Item(j).Name & "' and id=object_id(N'" & sTableName & "'))"
 <!                     s.putBuf "alter table " & sTableName & " add "
 <!                     s.putBuf FieldForCreate(os.FIELD.Item(j))
 <!                     collist = collist & ",'" & os.FIELD.Item(j).Name & "'"
 <-                     s.putBuf "go"
 <!                 End If
 <!             Next
 <!                 
 <!             s.putBuf ColumnDropSQL(sTableName, collist)
 <-             o.Module = "--Tables"
 <-             o.Block = "--body"
 <-             o.OutNL s.getBuf
 <-             
 <-             Set s = Nothing
 <!             Set s = New Writer
 <!             s.putBuf PkeyDropSQL(sTableName, "pk_" & sTableName)
 <!             s.putBuf "alter table " & sTableName & " add constraint pk_" & sTableName & " primary key (" & os.Name & "ID)"
 <!             o.Module = "--Tables"
 <!             o.Block = "--body"
 <!             o.OutNL s.getBuf
 <!             o.OutNL "GO"
 <!             
 <!             Set s = Nothing
 <!             Set s = New Writer
 <!             s.putBuf keyDropSQL(sTableName, "fk_" & MakeName(os.ID + os.Application.LocalizeInfo.Item(i).LangShort))
 <!             s.putBuf "alter table " & sTableName & " add constraint fk_" & MakeName(os.ID + os.Application.LocalizeInfo.Item(i).LangShort) & " foreign key(INSTANCEID) references INSTANCE (INSTANCEID)"
 <!             o.Module = "--Tables"
 <!             o.Block = "--ForeignKey"
 <!             o.OutNL s.getBuf
 <!             o.OutNL "GO"
 <!             
 <!             Set s = Nothing
 <!             Set s = New Writer
 <!             s.putBuf indexDropSQL(sTableName, "parent_" & sTableName)
 <!             s.putBuf "create index parent_" & sTableName & " on " & sTableName & "(INSTANCEID)"
 <!             o.Module = "--Tables"
 <!             o.Block = "--Index"
 <!             o.OutNL s.getBuf
 <!             o.OutNL "GO"
 <!         Next
 <!     End If
 <!     Exit Function
 <! Error_Detected:
 <!     MsgBox "CheckPartMLF:" + Err.Description
 <! End Function
 <! 
 <! Private Function IsMLFPart(ByRef os As PART) As Boolean
 <! Dim j As Long
 <!     IsMLFPart = False
 <!     For j = 1 To os.FIELD.Count
 <!         If UCase(os.FIELD.Item(j).FIELDTYPE.Name) = UCase("MultiLanguage String") Or _
 <!             UCase(os.FIELD.Item(j).FIELDTYPE.Name) = UCase("MultiLanguage Memo") Then
 <!             IsMLFPart = True
 <!             Exit Function
 <!         End If
 <!     Next
 <! End Function
 <! 
 <! Private Function IsMLFField(ByRef f As FIELD) As Boolean
 <!     IsMLFField = False
 <!     If UCase(f.FIELDTYPE.Name) = UCase("MultiLanguage String") Or _
 <!         UCase(f.FIELDTYPE.Name) = UCase("MultiLanguage Memo") Then
 <!         IsMLFField = True
 <!     End If
 <! End Function
