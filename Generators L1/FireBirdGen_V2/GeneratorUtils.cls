VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "GeneratorUtils"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
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



