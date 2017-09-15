VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ReportSupport"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim repcn As ADODB.Connection
Dim repcstr As String

Public Sub Init()
  repcstr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & App.Path & "\report.mdb;Persist Security Info=False"
  Set repcn = New ADODB.Connection
  repcn.ConnectionString = repcstr
  repcn.Open
End Sub

Public Sub FillReport(ByVal ID As String, rs As ADODB.Recordset, ByVal name As String)
  ' проверяем, что нет такого отчета
  Dim rssh As ADODB.Recordset
  Dim rs2 As ADODB.Recordset
  Dim exists As Boolean
  Dim fld As ADODB.Field
  Dim strm As ADODB.Stream
  Set strm = New ADODB.Stream
  strm.mode = adModeReadWrite
  rs.Save strm, adPersistXML
  strm.SaveToFile App.Path & "\temp.xml", adSaveCreateOverWrite
  strm.Position = 0
  
  'Set rssh = repcn.OpenSchema(adSchemaTables)


  If Not exists Then
    ' создаем таблицу для хранения данных
    
    Dim s As String, f As Boolean
    s = "create table [" & name & "] ("
    's = s & vbCrLf & "ReportID text(40) not null"
    f = True
    For Each fld In rs.Fields
      If Not f Then
         s = s & ","
      End If
       s = s & vbCrLf & "[" & fld.name & "]" & MapFT(fld)
       f = False
    Next
    s = s & vbCrLf & ")"
    On Error Resume Next
    repcn.Execute s
  End If

  ' заливаем таблицу
  Dim flds() As String
  Dim vals() As Variant
  ReDim flds(1 To rs.Fields.Count)
  ReDim vals(1 To rs.Fields.Count)
  Dim i As Long
  'flds(1) = "ReportID"
  i = 1
  For Each fld In rs.Fields
      flds(i) = fld.name
      i = i + 1
  Next
  
  Set rs2 = New ADODB.Recordset
'  'rst.Open "c:\Pubs.adtg", "Provider=MSPersist;", adOpenForwardOnly, adLockBatchOptimistic, adCmdFile
'
'  rs2.Open strm, , adOpenStatic, adLockBatchOptimistic
'  rs2.Open strm, "Provider=MSPersist;", adOpenForwardOnly, adLockBatchOptimistic, adCmdFile
'
'
'  rs2.ActiveConnection = repcn
'  'rs2.UpdateBatch
'  Err.Clear
'
'  rs2.MoveFirst
'  While Not rs2.EOF
'    rs2.MarshalOptions = adMarshalAll
'    rs2.Update
'    rs2.MoveNext
'  Wend
'
'
  repcn.CursorLocation = adUseServer
  repcn.mode = adModeReadWrite
  rs2.Open "[" & name & "]", repcn, adOpenDynamic, adLockPessimistic
 ' Set rs2 = repcn.Execute("[" & name & "]", , adOpenDynamic)
'
'  'rs2.RecordCount
'
'Set rs2 = repcn.Execute("select * from [" & name & "] where ReportID='" & ID & "'")
'Set rs2 = repcn.Execute("select * from [" & name & "]")
  While Not rs.EOF
    
    
    'vals(1) = ID
    i = 1
    For Each fld In rs.Fields
      vals(i) = fld.Value
      i = i + 1
    Next
    rs2.AddNew flds, vals
    rs2.Update
    rs.MoveNext
  Wend
  

End Sub


Public Function GetReport(ByVal ID As String, ByVal name As String) As ADODB.Recordset
 Dim rs2 As ADODB.Recordset
 Set rs2 = New ADODB.Recordset
 'rs2.Open "select * from [" & name & "] where ReportID='" & ID & "'", repcn, adOpenStatic, adLockReadOnly
 rs2.Open "select * from [" & name & "]", repcn, adOpenStatic, adLockReadOnly
 Set GetReport = rs2
End Function

Public Function ClearReptort(ByVal ID As String, ByVal name As String) As ADODB.Recordset
  On Error Resume Next
  repcn.Execute "delete from [" & name & "] where ReportID='" & ID & "'"
End Function


Private Function MapFT(ByVal fld As ADODB.Field) As String
Dim s As String
  Select Case fld.Type
    Case dbBigInt
      s = "Big Integer"
    Case dbBinary
      s = "Binary" & "(" & fld.DefinedSize & ")"
    Case dbBoolean
      s = "Boolean"
    Case dbByte
      s = "Byte"
    Case dbChar
      s = "Char" & "(" & fld.DefinedSize & ")"
    Case dbCurrency
      s = "Currency"
    Case dbDate
      s = "Date/Time"
    Case dbDecimal
      s = "Decimal"
    Case dbDouble
      s = "Double"
    Case dbFloat
      s = "Float"
    Case dbGUID
      s = "Guid"
    Case dbInteger
      s = "Integer"
    Case dbLong
      s = "Long"
    Case dbLongBinary
      s = "Long Binary"
    Case dbMemo
      s = "Memo"
    Case dbNumeric
      s = "Numeric"
    Case dbSingle
      s = "Single"
    Case dbText
      s = "Text" & "(" & fld.DefinedSize & ")"
    Case dbTime
      s = "Time"
    Case dbTimeStamp
      s = "Time Stamp"
    Case dbVarBinary
      s = "VarBinary" & "(" & fld.DefinedSize & ")"
    Case Else
      s = "Text" & "(255)"
  End Select
  MapFT = s
End Function

Private Sub Class_Terminate()
  If Not repcn Is Nothing Then
    On Error Resume Next
    repcn.Close
  End If
  Set repcn = Nothing
End Sub
