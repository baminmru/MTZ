Attribute VB_Name = "Utils"
Public MapObjectSQL_ As String

Public Function GenerateRightsStruct(NameObj As String) As String
  GenerateRights = ""
  If (OptRights) Then
    GenerateRights = GenerateRights & "revoke all on [dbo].[" & NameObj & "] to [public]"
    GenerateRights = GenerateRights & "GO"
    GenerateRights = GenerateRights & "grant select on [dbo].[" & NameObj & "] to [public]"
    'sql.putBuf "grant delete on [dbo].[RPRESULT] to [public]"
    GenerateRights = GenerateRights & "GO"
  End If
End Function

Public Function GenerateRightsProc(NameObj As String) As String
  GenerateRights = ""
  If (OptRights) Then
    GenerateRights = GenerateRights & "revoke all on [dbo].[" & NameObj & "] to [public]"
    GenerateRights = GenerateRights & "GO"
    GenerateRights = GenerateRights & "grant execute on [dbo].[" & NameObj & "] to [public]"
    GenerateRights = GenerateRights & "GO"
  End If
End Function

Public Function viewDropSQL(p As String) As String
  Dim s As String
  MapObjectSQL_ = MapObjectSQL_ & "VIEW:" & p & "|"
  s = "if exists (select * from sysobjects where id = object_id(N'" & p & "') and OBJECTPROPERTY(id, N'IsView') = 1)"
  s = s & vbCrLf & "  drop view " & p & ""
  s = s & vbCrLf & "GO"
  viewDropSQL = s
End Function

Public Function columnIfSQL(c As String, t As String) As String
  MapObjectSQL_ = MapObjectSQL_ & "COLM:" & c & "-" & t & "|"
  columnIfSQL = "if not exists(select * from syscolumns where name='" & c & "' and id=object_id(N'" & t & "'))"
End Function

Public Function procDropSQL(p As String) As String
  Dim s As String
  MapObjectSQL_ = MapObjectSQL_ & "PROC:" & p & "|"
  s = "if exists (select * from sysobjects where id = object_id(N'" & p & "') and OBJECTPROPERTY(id, N'IsProcedure') = 1)"
  s = s & vbCrLf & "drop procedure " & p & ""
  s = s & vbCrLf & "GO"
  procDropSQL = s
End Function

Public Function funcDropSQL(p As String) As String
  Dim s As String
  MapObjectSQL_ = MapObjectSQL_ & "FUNC:" & p & "|"
  s = "if exists (select * from sysobjects where id = object_id(N'" & p & "') and xtype in (N'FN', N'IF', N'TF'))"
  s = s & vbCrLf & "drop function " & p & ""
  s = s & vbCrLf & "GO"
  funcDropSQL = s
End Function

Public Function indexDropSQL(tbl As String, idx As String) As String
  Dim s As String
  s = "if exists (select * from sysindexes where name = N'" & idx & "' and id = object_id(N'" & tbl & "'))"
  s = s & vbCrLf & "drop index " & tbl & "." & idx
  s = s & vbCrLf & "GO"
  indexDropSQL = s
End Function

Public Function keyDropSQL(tbl As String, key As String) As String
  Dim s As String
  s = "if exists(select * from sysobjects where id=object_id(N'" & key & "') and type='F')"
  s = s & vbCrLf & "ALTER TABLE " & tbl & " DROP CONSTRAINT " & key
  s = s & vbCrLf & "GO"
  keyDropSQL = s
End Function

Public Function PkeyDropSQL(tbl As String, key As String) As String
  Dim s As String
  s = "if exists(select * from sysobjects where id=object_id(N'" & key & "') and xtype='PK' and type='K')"
  s = s & vbCrLf & "ALTER TABLE " & tbl & " DROP CONSTRAINT " & key
  s = s & vbCrLf & "GO"
  PkeyDropSQL = s
End Function

Public Function PkeyNotDropSQL(tbl As String, key As String) As String
  Dim s As String
  s = "if not exists(select * from sysobjects where id=object_id(N'" & key & "') and xtype='PK' and type='K')"
  PkeyNotDropSQL = s
End Function

Public Function IfCreateTable(tbl As String) As String
  Dim s As String
  MapObjectSQL_ = MapObjectSQL_ & "TABL:" & tbl & "|"
  s = "if not exists (select * from sysobjects where id = object_id(N'" & tbl & "') and OBJECTPROPERTY(id, N'IsUserTable') = 1)"
  IfCreateTable = s
End Function
