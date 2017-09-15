VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "MakeView"
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
  
  Dim SQL As Writer
  Set SQL = New Writer
  SQL.putBuf "create or replace view v_INSTANCE as"
  SQL.putBuf "select instance.*,objstatus.name statusname,objstatus.IsArchive"
  SQL.putBuf "from instance left join objstatus on instance.status=objstatus.objstatusid"
  SQL.putBuf ";"
  o.Module = "--Views"
  o.Block = "--body"
  o.out SQL.getBuf
  
  For i = 1 To m.OBJECTTYPE.Count
    Set ot = m.OBJECTTYPE.Item(i)
    For j = 1 To ot.PART.Count
      Set os = ot.PART.Item(j)
      MakeAllViews os
    Next
    o.Status "View for " & ot.Name, i
  Next
End Sub


Friend Sub MakeAllViews(ppart As PART)
DebugOutput "POSTGRESGEN.MakeAllViews:start " & ppart.Caption
Dim i As Long
  For i = 1 To ppart.PARTVIEW.Count
    MakeViews ppart.PARTVIEW.Item(i)
  Next
  DebugOutput "POSTGRESGEN.MakeAllViews:children " & ppart.Caption
  For i = 1 To ppart.PART.Count
    MakeAllViews ppart.PART.Item(i)
  Next
  
End Sub


Friend Sub MakeViews(pv As PARTVIEW)
 DebugOutput "POSTGRESGEN.MakeViews:start " & pv.Name
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
  Dim from As String, group As String
  Dim noagg As Long
  Dim structfld As String
  On Error GoTo bye
  
  Set BP = pv.parent.parent
  
  Set s = New Writer
  
  ' найти раздел первого уровн€ и построить цепочку пр€мых join
  Set root = BP
  from = " from " & BP.Name
   structfld = BP.Name & "ID"
  While TypeName(root.parent.parent) <> "OBJECTTYPE"
    from = from & vbCrLf & " join " & root.parent.parent.Name & " on " & root.parent.parent.Name & "." & root.parent.parent.Name & "ID=" & root.Name & ".ParentStructRowID "
    structfld = structfld & "," & root.parent.parent.Name & "ID"
    Set root = root.parent.parent
  Wend
  
  from = from & vbCrLf & " join INSTANCE on " & root.Name & ".INSTANCEID=INSTANCE.INSTANCEID"
  from = from & vbCrLf & " left join objstatus XXXMYSTATUSXXX on instance.status=XXXMYSTATUSXXX.objstatusid"
  
  group = " group by " & root.Name & ".InstanceID, " & BP.Name & "." & BP.Name & "ID "
  
  ' стандартное начало
  s.putBuf "create or replace view V_" & pv.the_Alias & " as "
  s.putBuf "select   " & structfld
  Dim fcnt As Long
  fcnt = 0
  
  For i = 1 To pv.ViewColumn.Count
    Set vc = pv.ViewColumn.Item(i)
    Set p = vc.FromPart
    Set f = vc.FIELD
    If Not (p Is Nothing) And Not (f Is Nothing) Then
      fcnt = fcnt + 1
'      If fcnt > 1 Then
        s.putBuf ", "
'      End If
      If vc.Aggregation = AggregationType_none Then
        Set ft = f.FIELDTYPE
        If ft.TypeStyle = TypeStyle_Perecislenie Then
          ' вписываем значение перечслени€
          s.putBuf " " & p.Name & "." & f.Name & "  "
          s.putBuf vc.the_Alias & "_VAL, "
          
          ' и его расшифровку
          s.putBuf " decode(" & p.Name & "." & VF(f.Name) & " "
          For j = 1 To ft.ENUMITEM.Count
            s.putBuf ", " & ft.ENUMITEM.Item(j).NameValue & " ,'" & ft.ENUMITEM.Item(j).Name & "'"
          Next
          s.putBuf ", '???') "
        ElseIf ft.TypeStyle = TypeStyle_Ssilka Then
          ' вписываем значение ссылки
          s.putBuf " " & p.Name & "." & f.Name & "  "
          s.putBuf vc.the_Alias & "_ID, "
          
          ' и расшифрованное значение
          If f.ReferenceType = ReferenceType_Na_ob_ekt_ Then
            s.putBuf "  INSTANCE_BRIEF_F(" & p.Name & "." & VF(f.Name) & ") "
          ElseIf f.ReferenceType = ReferenceType_Na_stroku_razdela Then
            Set refp = f.RefToPart
            s.putBuf "  " & refp.Name & "_BRIEF_F(" & p.Name & "." & VF(f.Name) & ") "
          Else
            s.putBuf p.Name & "." & VF(f.Name) & " "
          End If
        Else
      
          s.putBuf p.Name & "." & VF(f.Name) & " "
        End If
        
        
        noagg = noagg + 1
        group = group & vbCrLf & "," & p.Name & "." & VF(f.Name) & " "
      ElseIf vc.Aggregation = AggregationType_MAX Then
         s.putBuf "MAX(" & p.Name & "." & VF(f.Name) & ") "
      ElseIf vc.Aggregation = AggregationType_MIN Then
        s.putBuf "MIN(" & p.Name & "." & VF(f.Name) & ") "
      ElseIf vc.Aggregation = AggregationType_AVG Then
        s.putBuf "AVG(" & p.Name & "." & VF(f.Name) & ") "
      ElseIf vc.Aggregation = AggregationType_SUM Then
        s.putBuf "SUM(" & p.Name & "." & VF(f.Name) & ") "
      ElseIf vc.Aggregation = AggregationType_COUNT Then
        s.putBuf "COUNT(" & p.Name & "." & VF(f.Name) & ") "
      End If
      s.putBuf vc.the_Alias & " "
      Dim isOK As Boolean
      If BP.ID = p.parent.parent.ID Then
        isOK = False
        
        ' провер€ем пол€, которые вход€т в раздел
        For j = 1 To i - 1
        
          If pv.ViewColumn.Item(j).FromPart.ID = p.ID Then
            isOK = True
            Exit For
          End If
        Next
        
        ' если в разделе есть пол€, то включаем его в запрос
        If Not isOK Then
          from = from & " left join " & p.Name & " on " & BP.Name & "." & BP.Name & "ID = " & p.Name & ".ParentStructRowID"
        End If
      End If
      
      
      ' провер€ем верхние разделы, которые не  €вл€ютс€ непосредственными родител€ми нашего базового раздела
      If TypeName(p.parent.parent) = "OBJECTTYPE" And (p.ID <> root.ID) Then
        isOK = False
        For j = 1 To i - 1
          If pv.ViewColumn.Item(j).FromPart.ID = p.ID Then
            isOK = True
            Exit For
          End If
        Next
        ' есть пол€ из верхнего раздела
        If Not isOK Then
          from = from & " left join " & p.Name & " ON " & p.Name & ".InstanceID=" & root.Name & ".InstanceID"
        End If
      End If
    Else
   
    End If
  Next
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
  
  o.Module = "--Views"
  o.Block = "--body"
  
  
  o.out s.getBuf & " " & from & " " & group & vbCrLf & ";"
  Set s = Nothing
  DebugOutput "POSTGRESGEN.MakeViews:done " & pv.Name
  Exit Sub
bye:
''' "ERROR-->" & Err.Description & "<--ERROR"
 ' Stop
 Set s = Nothing
'  Resume
End Sub


