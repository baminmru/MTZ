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
Private mMaintein As Boolean
Private gencnt As Long

Public Map As Collection
Public aFKMap As Collection

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




Public Function Run(Model As Object, out As Object, targetid As String) As String
 Dim i As Long, j As Long, k As Long
 Dim os As PART
 
 Set m = Model
 Set o = out
 tid = targetid
 log = ""
 DebugOutput "ORAGEN.Run:start"
 LoadMap
 LoadFKMap
 
'read settings


OptInit = GetSetting(App.Title, "ORAGEN", "INIT", vbChecked) = 1
OptKernel = GetSetting(App.Title, "ORAGEN", "KERNEL", vbChecked) = 1
OptMethod = GetSetting(App.Title, "ORAGEN", "METHODS", vbChecked) = 1
OptProcs = GetSetting(App.Title, "ORAGEN", "PROCS", vbChecked) = 1
OptTables = GetSetting(App.Title, "ORAGEN", "TABLES", vbChecked) = 1
OptViews = GetSetting(App.Title, "ORAGEN", "VIEW", vbChecked) = 1
OptManual = GetSetting(App.Title, "ORAGEN", "MANUAL", vbChecked) = 1
  
 o.Module = "--PreInstall"
 o.Block = "--body"
 o.OutNL ""
  
  
 o.Module = "--Tables"
 o.Block = "--kernel"
 o.OutNL " "
 
 o.Module = "--Tables"
 o.Block = "--body"
 o.OutNL " "
 
 o.Module = "--Tables"
 o.Block = "--ForeignKey"
 o.OutNL " "
 
 o.Module = "--Tables"
 o.Block = "--index"
 o.OutNL " "
 
 
 o.Module = "--Functions.Header"
 o.Block = "--body"
 o.OutNL " "
 
 o.Module = "--Views"
 o.Block = "--body"
 o.OutNL " "
 
 o.Module = "--Procedures.Kernel.Header"
 o.Block = "--body"
 o.OutNL " "
 
 
 o.Module = "--Procedures.Type.Header"
 o.Block = "--body"
 o.OutNL " "
   
 o.Module = "--Procedures.Methods"
 o.Block = "--body"
 o.OutNL " "
 
 o.Module = "--Custom"
 o.Block = "--body"
 o.OutNL " "
 
 o.Module = "--Functions.Body"
 o.Block = "--body"
 o.OutNL " "
 
 o.Module = "--Procedures.Kernel.Body"
 o.Block = "--body"
 o.OutNL " "
 
 o.Module = "--Procedures.Type.Body"
 o.Block = "--body"
 o.OutNL " "
 
 o.Module = "--Init"
 o.Block = "--body"
 o.OutNL " "
   
 DebugOutput "ORAGEN.Run:Kernel"
 LoadWords
 On Error GoTo bye
 
 If OptKernel Then
    Dim mk As New MakeKernel
    mk.Init Me, m, o, tid
    mk.Run
 End If
 
 DebugOutput "ORAGEN.Run:Schema"
 Dim msc As MakeSchema
 If OptTables Then
     Set msc = New MakeSchema
     msc.Init Me, m, o, tid
     msc.Run
 End If

 If OptViews Then
    Dim mf As New MakeFunc
    mf.Init Me, m, o, tid
    mf.Run
 End If
  
  
 DebugOutput "ORAGEN.Run:Views"
 If OptViews Then
    Dim mv As New MakeView
    mv.Init Me, m, o, tid
    mv.Run
 End If
  
 
 DebugOutput "ORAGEN.Run:Types"
 Dim mt As MakeType
 #If TIRAL = 1 Then
      If Date < DateSerial(2005, 9, 20) Then
        If OptProcs Then
           For i = 1 To m.OBJECTTYPE.Count
              Set mt = New MakeType
              mt.Init Me, m, o, tid
              mt.Run m.OBJECTTYPE.Item(i)
              o.Status "Type procs " & m.OBJECTTYPE.Item(i).Name, i
           Next
        End If
      End If
 #Else
       If OptProcs Then
           For i = 1 To m.OBJECTTYPE.Count
              Set mt = New MakeType
              mt.Init Me, m, o, tid
              mt.Run m.OBJECTTYPE.Item(i)
              o.Status "Type procs " & m.OBJECTTYPE.Item(i).Name, i
           Next
        End If
 #End If

 DebugOutput "ORAGEN.Run:Methods"
 If OptMethod Then
   Dim mc As MakeCustom
   Set mc = New MakeCustom
   mc.Init Me, m, o, tid
   mc.Run
 End If
 
 
 DebugOutput "ORAGEN.Run:LoadOptions"
 If OptInit Then
  Dim mi As New MakeInit
  mi.Init Me, m, o, tid
  mi.Run
 End If
 
 
 Run = log
 DebugOutput "ORAGEN.Run:done"
 SaveMap
 SaveFKMap
 Exit Function
bye:

 'MsgBox Err.Description
 'Resume
 DebugOutput "ORAGEN.Run:" & Err.Description
 Run = log
 SaveMap
 SaveFKMap
End Function











Friend Function FieldForCreate(f As FIELD) As String
 DebugOutput "ORAGEN.FieldForCreate:start"
 On Error Resume Next
 

 
  Dim s As String, ftm As FIELDTYPEMAP
  s = VF(f.Name)
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
    s = s & vbCrLf & " check (" & VF(f.Name) & " >= " & f.FIELDTYPE.Minimum & " and " & VF(f.Name) & " <= " & f.FIELDTYPE.Maximum & ")"
   End If
   
   If f.FIELDTYPE.TypeStyle = TypeStyle_Perecislenie Then
    If f.FIELDTYPE.ENUMITEM.Count > 0 Then
      s = s & vbCrLf & " check (" & VF(f.Name) & " in ( "
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
'     s = s & vbCrLf & "," & vf(f.Name) & "_EXT varchar2(4) null"
'   End If
   
   FieldForCreate = s
   DebugOutput "ORAGEN.FieldForCreate:done"
   Exit Function
bye:
  

End Function


Friend Function FieldForParam(f As FIELD) As String
  DebugOutput "ORAGEN.FieldForParam:start"
On Error GoTo bye
   
   
 
  Dim s As String, ftm As FIELDTYPEMAP
  s = "a" & VF(f.Name)
  Set ftm = MapFTObj(f.FIELDTYPE.ID)
  If ftm.FixedSize <> 0 Then
   s = s & " " & ftm.StoageType  ' & "(" & ftm.FixedSize & ")"
  Else
   s = s & vbCrLf & " " & ftm.StoageType
   If f.FIELDTYPE.AllowSize Then
     If f.DataSize <> 0 Then
      s = s  ' & " (" & f.DataSize & ")"
     Else
      s = s ' & " (1)"
     End If
   End If
  End If
  
  If f.AllowNull Then
   s = s & " := null "
  End If
  
  s = s & "/* " & f.Caption & " */"
  
  'support extention field if file type used
   If UCase(f.FIELDTYPE.Name) = "FILE" Then
     s = s & vbCrLf & ",a" & VF(f.Name) & "_EXT varchar2 "
   End If
  
  FieldForParam = s & "/* " & f.Caption & " */"
  DebugOutput "ORAGEN.FieldForParam:done"
  Exit Function
bye:
 
 'Resume
End Function







Friend Function UniqueCheck(os As PART) As String
 DoEvents
  DebugOutput "ORAGEN.UniqueCheck:start " & os.Caption
 
  On Error GoTo bye
  Dim s As String
  Dim st As PART
  Dim uc As UNIQUECONSTRAINT
  Dim cf As CONSTRAINTFIELD
  Dim i As Long, j As Long
  Set st = os
  s = ""
  Dim z As String
  For i = 1 To st.UNIQUECONSTRAINT.Count
    Set uc = st.UNIQUECONSTRAINT.Item(i)
    z = ""
    If uc.CONSTRAINTFIELD.Count > 0 Then
    
      For j = 1 To uc.CONSTRAINTFIELD.Count
        Set cf = uc.CONSTRAINTFIELD.Item(j)
        If Not cf.TheField Is Nothing Then
          z = z & vbCrLf & " and " & VF(cf.TheField.Name) & "=a" & VF(cf.TheField.Name)
         
        End If
      Next
      
      If uc.PerParent Then
        If os.PartType = PartType_Derevo Then
          If TypeName(os.parent.parent) = "OBJECTTYPE" Then
            s = s & vbCrLf & " if aParentRowID is null then"
            s = s & vbCrLf & "   select Count(*) into aUniqueRowCount from " & VF(os.Name) & " where InstanceID=aInstanceID and ParentRowID is null " & z & ";"
            s = s & vbCrLf & " else "
            s = s & vbCrLf & "   select Count(*) into aUniqueRowCount from " & VF(os.Name) & " where InstanceID=aInstanceID and ParentRowID=aParentRowID " & z & ";"
            s = s & vbCrLf & " end if;"
          Else
            s = s & vbCrLf & " if aParentRowID is null then"
            s = s & vbCrLf & "   select Count(*) into aUniqueRowCount from " & VF(os.Name) & " where ParentStructRowID=aParentStructRowID and ParentRowID is null " & z & ";"
            s = s & vbCrLf & " else "
            s = s & vbCrLf & "   select Count(*) into aUniqueRowCount from " & VF(os.Name) & " where ParentStructRowID=aParentStructRowID and ParentRowID =aParentRowID " & z & ";"
            s = s & vbCrLf & " end if;"
          End If
        Else
          If TypeName(os.parent.parent) = "OBJECTTYPE" Then
            s = s & vbCrLf & " select Count(*) into aUniqueRowCount from " & VF(os.Name) & " where InstanceID=aInstanceID " & z & ";"
          Else
            s = s & vbCrLf & "select Count(*) into aUniqueRowCount from " & VF(os.Name) & " where ParentStructRowID=aParentStructRowID " & z & ";"
          End If
        End If
      Else
        s = s & vbCrLf & "select Count(*) into aUniqueRowCount from " & VF(os.Name) & " where 1=1  " & z & ";"
      End If
      
    
    
    End If
    s = s & vbCrLf & "if aUniqueRowCount>=2"
    s = s & vbCrLf & "then"
    s = s & vbCrLf & " raise_application_error(-20000,'Нарущение уникальности сочетания полей. Раздел=" & VF(os.Name) & "');"
    s = s & vbCrLf & " return;"
    s = s & vbCrLf & "end if;"
  Next
  UniqueCheck = s
  DebugOutput "ORAGEN.UniqueCheck:done " & os.Caption
  Exit Function
bye:
 
  'Resume
End Function






Friend Function TypeForStruct(ByVal s As PART) As OBJECTTYPE
DebugOutput "ORAGEN.TypeForStruct:start " & s.Caption
Dim i As Long
Dim obj As Object
Set obj = s.parent.parent

' ищем что за тип объекта
While TypeName(obj) <> "OBJECTTYPE"
  Set obj = obj.parent.parent
Wend

Set TypeForStruct = obj

DebugOutput "ORAGEN.TypeForStruct:done " & s.Caption
End Function






''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' UTILS
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' return phisical type for FIELDTYPE
Friend Function MapFT(ByVal typeID As String) As String
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
    If ft.FIELDTYPEMAP.Item(i).Target.ID = tid Then
      ftmap.Add ft.FIELDTYPEMAP.Item(i), typeID
      s = ft.FIELDTYPEMAP.Item(i).StoageType
      If ft.FIELDTYPEMAP.Item(i).FixedSize <> 0 Then
        s = s & vbCrLf & " (" & ft.FIELDTYPEMAP.Item(i).FixedSize & ")"
      End If
      Exit For
    End If
  Next
  MapFT = s
  Exit Function
bye:
''' "ERROR-->" & Err.Description & "<--ERROR"

End Function


Friend Function MapFTObj(ByVal typeID As String) As FIELDTYPEMAP
On Error Resume Next
  
  If ftmap Is Nothing Then Set ftmap = New Collection
  If ftmap.Item(typeID) Is Nothing Then
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
    If ft.FIELDTYPEMAP.Item(i).Target.ID = tid Then
      ftmap.Add ft.FIELDTYPEMAP.Item(i), typeID
      Set MapFTObj = ft.FIELDTYPEMAP.Item(i)
      Exit For
    End If
  Next
  Exit Function
bye:
''' "ERROR-->" & Err.Description & "<--ERROR"

End Function

Friend Function MakeName(ByVal s As String) As String
  Dim tt As String
'  tt = s
'  tt = Replace(tt, "-", "")
'  tt = Replace(tt, "{", "")
'  tt = Replace(tt, "}", "")
'  tt = Replace(tt, " ", "_")
'  MakeName = tt
MakeName = GetMap(s)
End Function



Friend Function IsParent(p As PART, parent As String) As Boolean
  Dim o  As Object
  Set o = p
  While TypeName(o) <> "OBJECTTYPE"
    Set o = o.parent.parent
    If o.ID = parent Then
      IsParent = True
      Exit Function
    End If
  Wend
  IsParent = False

End Function

' создаем view для журналов
Friend Sub MakeJournals()
'  DebugOutput "ORAGEN.MakeJournals:start "
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
'      s = s & vbCrLf & " from V_" & js.PARTVIEW.the_alias
'
'    Next j
'    o.Module = "--Journals--"
'    o.Block = "--Journals--"
'    o.OutNL s
'    o.OutNL ";"
'  Next i
'  DebugOutput "ORAGEN.MakeJournals:done "
End Sub






Friend Sub LoadMap()
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


Friend Sub LoadFKMap()
  Dim ff As Integer
  Dim ID1S As String, IDMTZ As String
  Dim idm As IDMAP
  ff = FreeFile
  Set aFKMap = New Collection
  On Error GoTo bye
  Open App.Path & "\FKMAP.txt" For Input As #ff
  While Not EOF(ff)
    Input #ff, ID1S, IDMTZ
    Set idm = New IDMAP
    If ID1S <> "" Then
      idm.ID1S = ID1S
      idm.IDMTZ = IDMTZ
      On Error Resume Next
      aFKMap.Add idm, ID1S
      On Error GoTo bye
    End If
  Wend
  Close #ff
  gencnt = Val(FKMap("GENCNT"))
bye:

End Sub

Friend Sub SaveMap()
  Dim ff As Integer
  Dim idm As IDMAP
  ff = FreeFile
  Open App.Path & "\IDMAP.txt" For Output As #ff
  On Error Resume Next
   
  For Each idm In Map
    Write #ff, idm.ID1S, idm.IDMTZ
  Next
  Close #ff
End Sub

Friend Sub SaveFKMap()
  Dim ff As Integer
  Dim idm As IDMAP
  ff = FreeFile
  Open App.Path & "\FKMAP.txt" For Output As #ff
  On Error Resume Next
  If (aFKMap.Item("GENCNT") Is Nothing) Then
    Set idm = New IDMAP
    idm.ID1S = "GENCNT"
    idm.IDMTZ = gencnt
    aFKMap.Add idm, "GENCNT"
  End If
  aFKMap.Item("GENCNT").IDMTZ = gencnt
  
  For Each idm In aFKMap
    Write #ff, idm.ID1S, idm.IDMTZ
  Next
  Close #ff
End Sub

Friend Function FKMap(ID1S As String) As String
  Dim idm As IDMAP
  On Error Resume Next
  Set idm = Nothing
  Set idm = aFKMap.Item(ID1S)
  If idm Is Nothing Then
    Set idm = New IDMAP
    idm.ID1S = ID1S
    idm.IDMTZ = gencnt
    gencnt = gencnt + 1
    aFKMap.Add idm, ID1S
  End If
 FKMap = idm.IDMTZ
End Function

Friend Function GetMap(ID1S As String) As String
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

Friend Sub Class_Initialize()
  LoadMap
  LoadFKMap
End Sub

Friend Sub Class_Terminate()
  SaveMap
  SaveFKMap
End Sub


Friend Function procDropSQL(p As String) As String
    Dim s As String
    s = "drop procedure " & p & vbCrLf & "/"
    procDropSQL = s
End Function

Friend Function funcDropSQL(p As String) As String
    Dim s As String
'    s = "if exists (select * from sysobjects where id = object_id('" & p & "') and xtype in ('F', 'IF', 'TF'))"
'    s = s & vbCrLf & "drop function " & p & ""
'    s = s & vbCrLf & "/"
    funcDropSQL = s
End Function

Friend Function indexDropSQL(tbl As String, idx As String) As String
    Dim s As String
'    s = "if exists (select * from sysindexes where name = '" & idx & "' and id = object_id('" & tbl & "'))"
    s = "drop index " & idx
    s = s & vbCrLf & "/"
    indexDropSQL = s
End Function

Friend Function keyDropSQL(tbl As String, key As String) As String
    Dim s As String
'    s = "if exists(select * from sysobjects where id=object_id('" & key & "') and type='F')"
    s = "alter  TABLE " & tbl & " DROP CONSTRAINT " & key
    s = s & vbCrLf & "/"
    keyDropSQL = s
End Function

Friend Function PkeyDropSQL(tbl As String, key As String) As String
    Dim s As String
'    s = s & vbCrLf & "drop TABLE " & tbl
'    s = s & vbCrLf & "/"
    PkeyDropSQL = s
End Function













