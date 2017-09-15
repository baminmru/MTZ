VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "MakeSchema"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Dim m As MTZMetaModel.Application
Dim o As MTZGenerator.Response
Dim tid As String
Dim parent As Generator

Public Sub Init(ap As Generator, am As MTZMetaModel.Application, ao As MTZGenerator.Response, ByVal atid As String)
  Set parent = ap
  Set m = am
  Set o = ao
  tid = atid
End Sub


Public Sub Run()
  Dim ot As OBJECTTYPE
  Dim j As Long, i As Long
  Dim os As PART
  Dim mp As MakePart
  KernelTables
  For i = 1 To m.OBJECTTYPE.Count
    Set ot = m.OBJECTTYPE.Item(i)
    For j = 1 To ot.PART.Count
      Set os = ot.PART.Item(j)
      CreateStruct os
    Next
    o.Status "Schema " & ot.Name, i
  Next
End Sub




Private Sub KernelTables()
  Dim SQL As Writer
  Set SQL = New Writer
  
  DoEvents
  On Error GoTo bye
  DebugOutput "POSTGRESGEN.KERNEL:start"
  
  
  SQL.putBuf "-- Kernel Tables --"
  
  SQL.putBuf "drop table sysoptions"
  SQL.putBuf ";"
  SQL.putBuf "create table sysoptions("
  SQL.putBuf "sysoptionsID CHAR(38) primary key,"
  SQL.putBuf "Name varchar(255) null,"
  SQL.putBuf "TheValue varchar(255) null,"
  SQL.putBuf "OptionType varchar(255) null"
  SQL.putBuf ")"
  SQL.putBuf ";"
  
  
  SQL.putBuf "drop table typelist"
  SQL.putBuf ";"
  SQL.putBuf "create  table typelist("
  SQL.putBuf "typelistID CHAR(38) primary key  ,"
  SQL.putBuf "Name varchar(255) not null,"
  SQL.putBuf "SecurityStyleID CHAR(38) null, "
  SQL.putBuf "RegisterProc varchar(255) null,"
  SQL.putBuf "DeleteProc varchar(255) null,"
  SQL.putBuf "HCLProc varchar(255) null ,"
  SQL.putBuf "PropagateProc varchar(255) null "
  SQL.putBuf ")"
  SQL.putBuf ";"
  
 
  SQL.putBuf "drop table Instance"
  SQL.putBuf ";"
  SQL.putBuf "create table Instance("
  SQL.putBuf "InstanceID CHAR(38) not null primary key,"
  SQL.putBuf "LockUserID CHAR(38) null, "
  SQL.putBuf "LockSessionID CHAR(38) null, "
  SQL.putBuf "SecurityStyleID CHAR(38) null, "
  SQL.putBuf "Name varchar(255) null,"
  SQL.putBuf "ObjType varchar(255) null"
  SQL.putBuf ")"
  SQL.putBuf ";"
  
   SQL.putBuf "alter table instance add OwnerPartName varchar(255) null"
   SQL.putBuf ";"
   
   SQL.putBuf "alter table instance add OwnerRowID CHAR(38) null"
   SQL.putBuf ";"
   
   SQL.putBuf "alter  table instance add status CHAR(38) null"
   SQL.putBuf ";"

   SQL.putBuf "alter  table instance add archived numeric null"
   SQL.putBuf ";"

   SQL.putBuf "drop table QueryResult"
   SQL.putBuf ";"
   SQL.putBuf "CREATE TABLE QueryResult ("
   SQL.putBuf "  QueryResultid CHAR(38) NOT NULL ,"
   SQL.putBuf "  result CHAR(38) NULL "
   SQL.putBuf ")"
   SQL.putBuf ";"
   
   SQL.putBuf "drop table RPRESULT"
   SQL.putBuf ";"
   SQL.putBuf "CREATE TABLE RPRESULT ("
   SQL.putBuf "  RPRESULTID CHAR(38) NOT NULL ,"
   SQL.putBuf "  PARENTLEVEL numeric NOT NULL ,"
   SQL.putBuf "  PARTNAME varchar (255) NULL ,"
   SQL.putBuf "  THEROWID CHAR(38) NULL "
'   sql.putBuf "  ,CONSTRAINT PRIMARY KEY  "
'   sql.putBuf "  ("
'   sql.putBuf "    RPRESULTID,"
'   sql.putBuf "    PARENTLEVEL"
'   sql.putBuf "  )"
   SQL.putBuf ")"
   SQL.putBuf ";"
   
   
   o.Module = "--Tables"
   o.Block = "--kernel"
   o.OutNL SQL.getBuf
  
  
 
  
DebugOutput "POSTGRESGEN.KERNEL:done"
    Exit Sub
bye:
   
    DebugOutput "POSTGRESGEN.KERNEL:" & Err.Description
    'Resume
    'Stop
    Set SQL = Nothing

End Sub

Private Sub CreateStruct(os As PART)
DebugOutput "POSTGRESGEN.CreateStruct:start " & os.Caption
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
''' "-->CreateStruct " & VF(os.Name)


On Error GoTo bye
s.putBuf "/*" & os.Caption & "*/"

's.putBuf "if not exists (select * from sysobjects where id = object_id('" & vf(os.name) & "') and OBJECTPROPERTY(id, 'IsUserTable') = 1)"
's.putBuf "BEGIN"
s.putBuf "drop table " & VF(os.Name) & "/*" & os.the_comment & "*/ "
s.putBuf ";"
s.putBuf "create table " & VF(os.Name) & "/*" & os.the_comment & "*/ ("
collist = ""
If TypeName(os.parent.parent) = "OBJECTTYPE" Then
  s.putBuf "InstanceID CHAR(38) ,"
  collist = collist & "'InstanceID'"
Else
  s.putBuf "ParentStructRowID CHAR(38) not null,"
  collist = collist & "'ParentStructRowID'"
End If

s.putBuf VF(os.Name) & "id CHAR(38) not null primary key  "
collist = collist & ",'" & VF(os.Name) & "ID' "

s.putBuf ",ChangeStamp date default (sysdate)  /* Время последнего изменения */"
collist = collist & ",'ChangeStamp'"


s.putBuf ",LockSessionID CHAR(38) null  /* temporary lock */"
collist = collist & ",'LockSessionID'"
s.putBuf ",LockUserID CHAR(38) null /* checkout lock */"
collist = collist & ",'LockUserID'"
s.putBuf ",SecurityStyleID CHAR(38) null /* security formula */"
collist = collist & ",'SecurityStyleID'"

' дерево
If os.PartType = 2 Then
  s.putBuf ",ParentRowid CHAR(38) "
  collist = collist & ",'ParentRowid'"
End If

s.putBuf ")"
's.putBuf "END"
s.putBuf ";"

st.FIELD.Sort = "sequence"
For i = 1 To st.FIELD.Count
  'If i > 1 Then
  
  's.putbuf ","
  's.putBuf "if  not exists(select * from syscolumns where name='" & vf(st.FIELD.Item(i).Name) & "' and id=object_id('" & st.Name & "'))"
  s.putBuf "alter  table " & VF(st.Name) & " add "
  s.putBuf parent.FieldForCreate(st.FIELD.Item(i))
  s.putBuf ";"
  collist = collist & ",'" & VF(st.FIELD.Item(i).Name) & "'"
  
  'support extention field if file type used
  If UCase(st.FIELD.Item(i).FIELDTYPE.Name) = "FILE" Then
     's.putBuf "if  not exists(select * from syscolumns where name='" & vf(st.FIELD.Item(i).Name) & "_EXT' and id=object_id('" & st.Name & "'))"
     s.putBuf "alter  table " & VF(st.Name) & " add "
     s.putBuf " " & VF(st.FIELD.Item(i).Name) & "_EXT char(4) null"
     collist = collist & ",'" & VF(st.FIELD.Item(i).Name) & "_EXT'"
     s.putBuf ";"
  End If
  
Next

o.Module = "--Tables"
o.Block = "--body"
o.OutNL s.getBuf



If TypeName(os.parent.parent) <> "OBJECTTYPE" Then
  Set s = Nothing
  Set s = New Writer
  s.putBuf parent.keyDropSQL(os.Name, "fk_" & parent.FKMap(os.ID))
  s.putBuf "alter  table " & VF(os.Name) & " add constraint fk_" & parent.FKMap(os.ID) & " foreign key(ParentStructRowID) references " & VF(os.parent.parent.Name) & " (" & VF(os.parent.parent.Name) & "ID)"
  s.putBuf ";"
  o.Module = "--Tables"
  o.Block = "--ForeignKey"
  o.OutNL s.getBuf
  
  
  Set s = Nothing
  Set s = New Writer
  s.putBuf parent.indexDropSQL(os.Name, "parent_" & VF(os.Name))
  s.putBuf "create index parent_" & VF(os.Name) & " on " & VF(os.Name) & "(ParentStructRowID)"
  s.putBuf ";"
  o.Module = "--Tables"
  o.Block = "--Index"
  o.OutNL s.getBuf
  
Else
  Set s = Nothing
  Set s = New Writer
  s.putBuf parent.keyDropSQL(os.Name, "fk_" & parent.FKMap(os.ID))
  s.putBuf "alter  table " & VF(os.Name) & " add constraint fk_" & parent.FKMap(os.ID) & " foreign key(INSTANCEID) references INSTANCE (INSTANCEID)"
  s.putBuf ";"
  o.Module = "--Tables"
  o.Block = "--ForeignKey"
  o.OutNL s.getBuf
  

  
  Set s = Nothing
  Set s = New Writer
  s.putBuf parent.indexDropSQL(os.Name, "parent_" & VF(os.Name))
  s.putBuf "create index parent_" & VF(os.Name) & " on " & VF(os.Name) & "(""INSTANCEID"")"
  s.putBuf ";"
  o.Module = "--Tables"
  o.Block = "--Index"
  o.OutNL s.getBuf

End If


For i = 1 To os.PART.Count
  Set chos = os.PART.Item(i)
  CreateStruct chos
Next

Set s = Nothing

Exit Sub
bye:
''' "ERROR-->" & Err.Description & "<--ERROR"
DebugOutput "POSTGRESGEN.CreateStruct: " & os.Caption & " " & Err.Description
'Resume
Set s = Nothing

End Sub


Friend Function ColumnDropSQL(t As String, collist As String) As String
    Dim s As String
    s = " "
'    s = s & vbCrLf & "-- drop extra columns from generated table: " & t
'    s = s & vbCrLf & "an varchar(255)"
'    s = s & vbCrLf & "ae_str varchar(4000)"
'    s = s & vbCrLf & ""
'    s = s & vbCrLf & "nnn declare cursor local for"
'    s = s & vbCrLf & "select name from syscolumns where id = object_id('" & t & "')"
'    s = s & vbCrLf & "and name not in(" & collist & ")"
'    s = s & vbCrLf & "--open nnn"
'    s = s & vbCrLf & "fetch next from nnn into an"
'    s = s & vbCrLf & "while aafetch_status >=0"
'    s = s & vbCrLf & "begin"
'    s = s & vbCrLf & "  set ae_str='create or replace  table " + t + " drop column '+an"
'    s = s & vbCrLf & "   sp_sqlae_str"
'    s = s & vbCrLf & "  fetch next from nnn into an"
'    s = s & vbCrLf & "End"
'    s = s & vbCrLf & "Close nnn"
'    s = s & vbCrLf & "deallocate nnn"
    ColumnDropSQL = s
End Function



