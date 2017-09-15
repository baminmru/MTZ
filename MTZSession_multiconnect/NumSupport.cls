VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "NumeratorSupport"
Attribute VB_GlobalNameSpace = True
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Public Function ChangeNumber(ByVal Item As Object, NumField As String, ByVal NumeratorID As String, ByVal zoneTemplate As String, ByVal oldDate As Date, Optional ByVal oldORG As String = "", Optional newDate As Date, Optional newOrg As String = "")
  ChangeNumber = False
  If FreeNumValue(Item, NumField, NumeratorID, zoneTemplate, oldDate, oldORG) Then
    ChangeNumber = GetNumValue(Item, NumField, NumeratorID, zoneTemplate, newDate, newOrg)
  End If
End Function

Public Function FreeNumValue(ByVal Item As Object, NumField As String, ByVal NumeratorID As String, ByVal zoneTemplate As String, ByVal oldDate As Date, Optional ByVal oldORG As String = "") As Boolean
Dim oldval As Double
FreeNumValue = True
If Item Is Nothing Then Exit Function
On Error GoTo bye
oldval = CallByName(Item, NumField, VbGet)

If oldval > 0 Then
  Dim nvs As NamedValues
  Dim n As Long
  Dim prf As String
  Set nvs = New NamedValues
  Dim nvi As NamedValue
  Set nvi = nvs.Add("NumeratorID", NumeratorID)
  nvi.ORACLE_GUID
  prf = MakeItemNumString(Item, oldDate, zoneTemplate, oldORG)
  nvs.Add "the_Zone", prf
  
  n = oldval
  Set nvi = nvs.Add("num", n)
  nvi.ValueType = adInteger
  
  
  Call Item.Application.MTZSession.Exec("EraseNumber", nvs)
  CallByName Item, NumField, VbLet, 0
  Item.Save
End If
Exit Function
bye:
  FreeNumValue = False
End Function

Public Function GetNumValue(ByRef Item As Object, ByVal NumField As String, ByVal NumeratorID As String, ByVal newDate As Date, ByVal zonetmplate As String, ByVal newOrg As String)
  
  On Error GoTo bye
  GetNumValue = True
  If Item Is Nothing Then Exit Function
     
  Dim nvs As NamedValues
  Dim y As Long
  Dim n As Long
  Dim prf As String
  
  Set nvs = New NamedValues
  Dim nvi As NamedValue
  prf = MakeItemNumString(Item, newDate, zonetmplate, newOrg)
  nvs.Add "the_Zone", prf

  Set nvi = nvs.Add("NumeratorID", NumeratorID)
  nvi.ORACLE_GUID
  n = 0
  Set nvi = nvs.Add("num", n)
  nvi.ValueDirection = adParamOutput
  nvi.ValueType = adInteger
  
  Set nvi = nvs.Add("OwnerPartName", Item.PartName)
  
  Set nvi = nvs.Add("OwnerRowID", Item.ID)
  nvi.ORACLE_GUID
  
  
  
  On Error Resume Next
  Call Item.Application.MTZSession.Exec("GetFreeNumber", nvs)
  CallByName Item, NumField, VbLet, nvs.Item("num").Value
  Err.Clear
  
  Item.Save
  
  If Err.Number > 0 Then
    Item.Application.MTZSession.EraseLostNumbers
  End If
  
  Exit Function
bye:
  GetNumValue = False
  Debug.Print Err.Description
End Function

Public Function MakeItemNumString(ByVal Item As Object, ByVal d As Date, ByVal template As String, ByVal org As String) As String
Dim s As String
On Error Resume Next
s = MakeNumString(d, template, org)
s = Replace(s, "%P", Item.Parent.Parent.ID)
s = Replace(s, "%A", Item.Application.ID)
MakeItemNumString = s
End Function

Public Function MakeNumString(ByVal d As Date, ByVal template As String, ByVal org As String) As String
  Dim out As String
  Dim ST As String
  Dim SY As String
  Dim SQ As String
  Dim SM As String
  Dim SD As String
 
  SD = Right("0" & Day(d), 2)
  SM = Right("0" & Month(d), 2)
  SY = Right("00" & Year(d), 2)
  ST = Right("0000" & Year(d), 4)
  SQ = 1 + ((Month(d) - 1) \ 3)
  
  out = template
  out = Replace(out, "%D", SD)
  out = Replace(out, "%M", SM)
  out = Replace(out, "%Q", SQ)
  out = Replace(out, "%Y", SY)
  out = Replace(out, "%T", ST)
  out = Replace(out, "%O", org)
  
  MakeNumString = out
End Function



