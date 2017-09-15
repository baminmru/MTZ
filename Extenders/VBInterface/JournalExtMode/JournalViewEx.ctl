VERSION 5.00
Object = "{BB95CD0C-5138-4A76-AF3C-30EFB10D1594}#27.0#0"; "MTZJournal.ocx"
Begin VB.UserControl JournalViewEx 
   ClientHeight    =   5190
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6675
   ScaleHeight     =   5190
   ScaleWidth      =   6675
   Begin MTZJournal.JournalView jv 
      Height          =   4455
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   6015
      _ExtentX        =   10610
      _ExtentY        =   7858
   End
End
Attribute VB_Name = "JournalViewEx"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Public Item As Object
Public Host As Object
Public ModalMode As Boolean
Public ParentForm As Object
Public TargetPlatformID As String
Private objJournalExtender As STDJournalExt.Application

Private IsFirtsInit As Boolean

Public Event OnAdd(usedefaut As Boolean, Refesh As Boolean)
Public Event OnRun(ByVal RowIndex As Long, usedefaut As Boolean, Refesh As Boolean)
Public Event OnEdit(ByVal RowIndex As Long, usedefaut As Boolean, Refesh As Boolean)
Public Event OnFilter(usedefaut As Boolean)
Public Event OnClearFilter()
Public Event OnPrint(usedefaut As Boolean)
Public Event OnInit(bAdd As Boolean, bEdit As Boolean, bRun As Boolean, bDel As Boolean, bFilter As Boolean)
Public Event OnDel(ByVal RowIndex As Long, usedefaut As Boolean, Refesh As Boolean)

Public CurrentTop As Long
Public CurrentLeft As Long
Public CurrentHeight As Long
Public CurrentWidth As Long


Dim ParentPart As String
'Управление добавлением/удалением.
Dim DeleteParentRow As Boolean
Dim AddParentRow As Boolean
Dim ParentFieldName As String
Dim IsSingleParentObjectMode As Boolean
' Парт, в сингл моде куда засовывать строки, кого создавать
Dim ParentObjectPartName As String
Dim ParentObjectName As String
Dim ParentObjectField As String
Dim IsCreateParentObject As String
Dim oParentObject As Object

Public Sub OnTabClick()
    If IsFirtsInit Then
        IsFirtsInit = False
        Call InitJournal
    End If
    UserControl_Resize
End Sub

Private Sub InitJournal()
    
    If CStr(objJournalExtender.STDJournlaExtInfo.Item(1).TheJournalRef.ID) = "" Then Exit Sub
    
    Set jv.Journal = Manager.GetInstanceObject(CStr(objJournalExtender.STDJournlaExtInfo.Item(1).TheJournalRef.ID))
    Manager.LockInstanceObject jv.Journal.ID
    jv.OpenModal = False
    'Filter HAVE TO Settings...
    Call SetFilter
    'EOF Filter Settings...
    jv.AllowAdd = CBool(GetParam("AllowAdd", CStr(jv.AllowAdd)))
    jv.AllowDel = CBool(GetParam("AllowDel", CStr(jv.AllowDel)))
    jv.AllowEdit = CBool(GetParam("AllowEdit", CStr(jv.AllowEdit)))
    jv.AllowFilter = CBool(GetParam("AllowFilter", CStr(jv.AllowFilter)))
    jv.AllowRun = CBool(GetParam("AllowRun", CStr(jv.AllowRun)))
    jv.AutoRefresh = CBool(GetParam("AutoRefresh", CStr(jv.AutoRefresh)))
    
    jv.Refresh
    
    DeleteParentRow = CBool(GetParam("DeleteParentRow", CStr(False)))
    AddParentRow = CBool(GetParam("AddParentRow", CStr(False)))
    ParentFieldName = GetParam("ParentFieldName", "")
    ParentPart = GetParam("ParentPart", "")
    
End Sub


Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
    Debug.Print "...Dummy OnClick..." + vbCrLf
End Sub

Public Sub OnSave()
    Debug.Print "...Dummy onsave..." + vbCrLf
End Sub


Public Sub Save()
    Debug.Print "...Dummy save..." + vbCrLf
End Sub

Public Function HideControls()

End Function

Public Function IsChanged() As Boolean
  IsChanged = False
End Function

Public Sub CloseClass()
    Debug.Print "...Dummy CloseClass..." + vbCrLf
End Sub

Private Sub UserControl_Initialize()
    UserControl_Resize
    
    Dim bAdd As Boolean, bEdit As Boolean, bRun As Boolean, bDel As Boolean, bFilter As Boolean
    bAdd = False
    bEdit = False
    bRun = False
    bDel = False
    bFilter = False
    RaiseEvent OnInit(bAdd, bEdit, bRun, bDel, bFilter)
    jv.AllowAdd = bAdd
    jv.AllowEdit = bEdit
    jv.AllowRun = bRun
    jv.AllowDel = bDel
    jv.AllowFilter = bFilter
    jv.AutoRefresh = True
    
    
End Sub

Private Sub UserControl_Resize()
    jv.Left = 0
    jv.Top = 0
    jv.Height = Height
    jv.Width = Width
End Sub

Private Function ParseAndCall(ByRef objObject, ByVal CallString) As Variant
Dim tmpObj As Object
Dim V
Dim i As Long
    If Left(CallString, 1) = "." Then
        CallString = Right(CallString, Len(CallString) - 1)
    End If
    If InStr(CallString, ".") > 0 Then
        V = Split(CallString, ".")
        For i = LBound(V) To UBound(V) - 1
            Set tmpObj = CallByName(objObject, CStr(V(i)), VbGet, Nothing)
        Next
        ParseAndCall = CallByName(objObject, CStr(V(UBound(V))), VbGet, Nothing)
    Else
        ParseAndCall = CallByName(objObject, CallString, VbGet)
    End If
End Function

Public Sub OnInit(aItem As Object, ConfigObjectID As String, Optional pForm As Object = Nothing)
Dim i As Long
    IsFirtsInit = True
    Set Manager = aItem.Application.Manager
    Set objJournalExtender = aItem.Application.Manager.GetInstanceObject(ConfigObjectID)
    Dim o As Object
    'Set o = aItem.Application.Manager.GetInstanceObject(ConfigObjectID)
    Set Item = aItem
    
    On Error Resume Next
    Manager.LockInstanceObject objJournalExtender.ID
    Set MyRole = Manager.GetCustomObjects("ROLE")
    IsSingleParentObjectMode = CBool(GetParam("SingleParentMode", "False"))
    ParentObjectPartName = GetParam("ParentObjectPartName", "")
    ParentObjectName = GetParam("ParentObjectName", "")
    ParentObjectField = GetParam("ParentObjectField", "")
    IsCreateParentObject = CBool(GetParam("CreateParentObject", "False"))
    If IsSingleParentObjectMode And IsSingleParentObjectMode And _
        ParentObjectName <> "" And ParentObjectPartName <> "" And ParentObjectField <> "" Then
        Dim sqlTest As String
        sqlTest = "Select * from " + ParentObjectPartName + " where " + ParentObjectField + "='" + Item.Application.ID + "'"
        Dim objRS As Object
        Set objRS = Manager.GetSession.GetData(sqlTest)
        If Not objRS Is Nothing Then
            If objRS.EOF = False And objRS.BOF = False Then
                Set oParentObject = Manager.GetInstanceObject(objRS!InstanceID)
            Else
                'Создаем родительский объект
                Dim IID As String
                IID = CreateGUID2
                If Manager.NewInstance(IID, ParentObjectName, ParentObjectName + ":" + Item.Application.Name) Then
                    Set oParentObject = Manager.GetInstanceObject(IID)
                    Dim oPart As Object
                    Dim oColl As Object
                    Set oColl = CallByName(oParentObject, ParentObjectPartName, VbGet)
                    Set oPart = oColl.Add
                    Call CallByName(oPart, ParentObjectField, VbSet, Item.Application)
                    oPart.Save
                    oParentObject.Save
                End If
            End If
        End If
    End If
    
End Sub

Private Function GetSQLOperator(ByVal ConditionType As enumConditionType) As String
    Select Case ConditionType
        Case ConditionType_EQ:
            GetSQLOperator = "="
        Case ConditionType_GT:
            GetSQLOperator = ">"
        Case ConditionType_GTEQ:
            GetSQLOperator = ">="
        Case ConditionType_like:
            GetSQLOperator = " like "
        Case ConditionType_LS:
            GetSQLOperator = "<"
        Case ConditionType_LSEQ:
            GetSQLOperator = "<="
        Case ConditionType_LSGT:
            GetSQLOperator = "<>"
        Case ConditionType_none:
            GetSQLOperator = ""
    End Select
End Function

Private Sub SetFilter()
Dim strFilter As String
Dim l As Long
Dim i As Long
Dim objFltElement As STDJournalExt.STDJournalExtField
    
    For l = 1 To objJournalExtender.STDJournalExtFlt.Count
        strFilter = ""
        objJournalExtender.STDJournalExtFlt.Item(l).STDJournalExtField.Filter = "TargetPlatform='" + TargetPlatformID + "'"
        If objJournalExtender.STDJournalExtFlt.Item(l).STDJournalExtField.Count > 0 Then
            If strFilter = "" Then strFilter = " 1=1 "
            For i = 1 To objJournalExtender.STDJournalExtFlt.Item(l).STDJournalExtField.Count
                Set objFltElement = objJournalExtender.STDJournalExtFlt.Item(l).STDJournalExtField.Item(i)
                If objFltElement.FieldSource <> "" And objFltElement.ConstantValue <> "" And InStr(1, objFltElement.ConstantValue, "%FIELDSOURCE%", vbTextCompare) > 0 Then
                    strFilter = strFilter + " and " + objFltElement.ViewField + GetSQLOperator(objFltElement.ConditionType) + Replace(objFltElement.ConstantValue, "%FIELDSOURCE%", ParseAndCall(Item, objFltElement.FieldSource))
                ElseIf objFltElement.FieldSource <> "" Then
                    strFilter = strFilter + " and " + objFltElement.ViewField + GetSQLOperator(objFltElement.ConditionType) + "'" + IIf(objFltElement.ConditionType = ConditionType_like, "%", "") + ParseAndCall(Item, objFltElement.FieldSource) + "'"
                ElseIf objFltElement.ConstantValue <> "" And GetSQLOperator(objFltElement.ConditionType) = "" Then
                    strFilter = strFilter + " " + ReplaceKeyWords(objFltElement.ConstantValue) + " "
                ElseIf objFltElement.ConstantValue <> "" Then
                    strFilter = strFilter + " and " + objFltElement.ViewField + GetSQLOperator(objFltElement.ConditionType) + objFltElement.ConstantValue + ""
                End If
            Next
        End If
        objJournalExtender.STDJournalExtFlt.Item(l).STDJournalExtField.Filter = "TargetPlatform is null"
        If objJournalExtender.STDJournalExtFlt.Item(l).STDJournalExtField.Count > 0 Then
            If strFilter = "" Then strFilter = " 1=1 "
            For i = 1 To objJournalExtender.STDJournalExtFlt.Item(l).STDJournalExtField.Count
                Set objFltElement = objJournalExtender.STDJournalExtFlt.Item(l).STDJournalExtField.Item(i)
                If objFltElement.FieldSource <> "" Then
                    strFilter = strFilter + " and " + objFltElement.ViewField + GetSQLOperator(objFltElement.ConditionType) + "'" + IIf(objFltElement.ConditionType = ConditionType_like, "%", "") + "'" + ParseAndCall(Item, objFltElement.FieldSource) + "'"
                ElseIf objFltElement.ConstantValue <> "" And GetSQLOperator(objFltElement.ConditionType) = "" Then
                    strFilter = strFilter + " and " + ReplaceKeyWords(objFltElement.ConstantValue) + " "
                ElseIf objFltElement.ConstantValue <> "" Then
                    strFilter = strFilter + " and " + objFltElement.ViewField + GetSQLOperator(objFltElement.ConditionType) + objFltElement.ConstantValue + ""
                End If
            Next
        End If
        If strFilter <> "" Then
            jv.Filter.Add objJournalExtender.STDJournalExtFlt.Item(l).ViewSource, strFilter
        End If
    Next
    
End Sub

Private Function GetParam(pName As String, Optional pDefaultValue As String = "") As String

    objJournalExtender.STDJournalExtParam.Filter = "ParamName='" + pName + "'"
    If objJournalExtender.STDJournalExtParam.Count > 0 Then
        GetParam = objJournalExtender.STDJournalExtParam.Item(1).fieldName
    Else
        GetParam = pDefaultValue
    End If
    objJournalExtender.STDJournalExtParam.Filter = ""
End Function


Private Function GetParams(pName As String, Optional pDefaultValue As String = "") As Variant
Dim V() As Variant
Dim Value As String
Dim lCount As Long
Dim i As Long
On Error GoTo Error_Detected
    objJournalExtender.STDJournalExtParam.Filter = "ParamName='" + pName + "'"
    lCount = objJournalExtender.STDJournalExtParam.Count
    If lCount > 0 Then
        For i = 1 To lCount
            ReDim Preserve V(i)
            Value = objJournalExtender.STDJournalExtParam.Item(i).fieldName
            V(i) = Value
        Next
        GetParams = V
    Else
        GetParams = vbEmpty
    End If
    Exit Function
Error_Detected:
    GetParams = vbEmpty
End Function

Private Sub UserControl_Terminate()
    On Error Resume Next
    Manager.UnLockInstanceObject jv.Journal.ID
    Manager.UnLockInstanceObject objJournalExtender.ID
    Set jv.Journal = Nothing
End Sub

Private Sub jv_JVGetDocMode(ByVal Doc As Object, mode As String, IsDenied As Boolean)
  IsDenied = IsDocDenied(Doc)
  mode = GetDocumentMode(Doc)
End Sub

Private Sub jv_JVIsDocDeletable(ByVal Doc As Object, IsDeletable As Boolean)
  IsDeletable = RoleDocAllowDelete(Doc)
End Sub

Private Sub jv_JVOnAdd(usedefaut As Boolean, Refesh As Boolean)
Dim ObjType As String
Dim V As Variant
Dim Vvis() As Variant
Dim i As Long
On Error GoTo Error_Detected

    If IsSingleParentObjectMode Then
        Dim AddObjectType As String
        Dim AddRowType As String
        Dim ParentPartName
        AddObjectType = GetParam("AddObjectType", "NONE")
        If AddObjectType = "NONE" Then Exit Sub
        AddRowType = GetParam("AddRowType", "NONE")
        If AddRowType = "NONE" Then Exit Sub
        Dim obj As Object
        Dim objGUI As Object
        
        On Error Resume Next
        Dim oCol As Object
        Dim oRow As Object
        Dim oRefField As Object
        
        Set obj = oParentObject
        Set objGUI = Manager.GetInstanceGUI(obj.ID)
        Dim oParentCol As Object
        Dim oParentRow As Object
        Set oParentCol = CallByName(obj, AddRowType, VbGet)
        Set oParentRow = oParentCol.Add("")
        
        Dim sCustomLib As String
        
        sCustomLib = GetParam("CustomAddLib", "")
        
        If sCustomLib <> "" Then
            On Error Resume Next
            Dim oCustomLib As Object
            Set oCustomLib = CreateObject(sCustomLib)
            Call oCustomLib.OnAdd(obj, oParentRow)
        End If
        
        If Not objGUI.ShowAddForm("", oParentRow) Then
            oParentRow.Delete
        Else
            oParentRow.Save
        End If
    Else
    
        V = GetParams("AddObjectType")
    
        
        If IsEmpty(V) Then
            RaiseEvent OnAdd(usedefaut, Refesh)
        Else
            If UBound(V) > 1 Then
                For i = 1 To UBound(V)
                    ObjType = GetParam(CStr(V(i)), CStr(V(i)))
                    ReDim Preserve Vvis(i)
                    
                    'Vvis(i) = ObjType
                    Vvis(i) = GetDefaultObjectName(ObjType)
                    
                Next
                ObjType = ""
                Dim frmCHo As New frmChooseObject
                frmCHo.ObjectList = Vvis
                frmCHo.Show 1
                ObjType = V(frmCHo.ChoosenObjectType)
            Else
                ObjType = V(1)
            End If
            If ObjType <> "" Then AddObject (ObjType)
        End If
    End If
    Exit Sub
Error_Detected:
    usedefaut = False
    Exit Sub
    Resume
   
End Sub


Private Sub jv_JVOnClearFilter()
  RaiseEvent OnClearFilter
End Sub

Private Sub jv_JVOnDel(ByVal RowIndex As Long, usedefaut As Boolean, Refesh As Boolean)
  usedefaut = True
  RaiseEvent OnDel(RowIndex, usedefaut, Refesh)
  If usedefaut Then
    'ищем нашу строку
    If DeleteParentRow Then
        Dim oRow As Object
        Dim oCol As Object
        Set oCol = CallByName(Item, ParentPart, VbGet)
        Dim i As Long
        Dim sid As String
        
        If MsgBox("Удалить документ?", vbYesNo) = vbYes Then
        
            For i = 1 To oCol.Count
                Dim aTaskField As Object
                Set oRow = oCol.Item(i)
                Set aTaskField = CallByName(oRow, ParentFieldName, VbGet)
                If aTaskField.ID = jv.RowInstanceID(jv.Row) Then
                    oRow.Delete
                    Call Manager.DeleteInstance(jv.RowInstanceID(jv.Row))
                    usedefaut = False
                    Exit For
                End If
            Next
        'Set oRow = oCol.Item(jv.RowInstanceID(jv.Row))
        Else
            usedefaut = False
        End If
    End If
  End If
  
End Sub

Private Sub jv_JVOnEdit(ByVal RowIndex As Long, usedefaut As Boolean, Refesh As Boolean)
  RaiseEvent OnEdit(RowIndex, usedefaut, Refesh)
End Sub

Private Sub jv_JVOnFilter(usedefaut As Boolean)
  
  SetFilter
  usedefaut = False
  RaiseEvent OnFilter(usedefaut)
End Sub

Private Sub jv_JVOnPrint(usedefaut As Boolean)
  RaiseEvent OnPrint(usedefaut)
End Sub

Private Sub jv_JVOnRun(ByVal RowIndex As Long, usedefaut As Boolean, Refesh As Boolean)
  RaiseEvent OnRun(RowIndex, usedefaut, Refesh)
End Sub

Private Sub AddObject(ObjType As String)
    Dim ID2 As String
    Dim obj As Object
    Dim objGUI As Object
    ID2 = CreateGUID2
    If Manager.NewInstance(ID2, ObjType, GetDefaultObjectName(ObjType)) Then
        Set obj = Manager.GetInstanceObject(ID2)
        
        Dim sCustomLib As String
        
        sCustomLib = GetParam("CustomAddLib", "")
        
        If sCustomLib <> "" Then
            On Error Resume Next
            Dim oCustomLib As Object
            Set oCustomLib = CreateObject(sCustomLib)
            Call oCustomLib.OnAdd(Item, obj)
        End If
        
        Set objGUI = Manager.GetInstanceGUI(ID2)
        objGUI.Show GetDocumentMode(obj), obj
        
        If AddParentRow Then
            If Not Item Is Nothing Then
                Dim oRow As Object
                Dim oCol As Object
                Set oCol = CallByName(Item, ParentPart, VbGet)
                Set oRow = oCol.Add
                CallByName oRow, ParentFieldName, VbSet, obj
                oRow.Save
            End If
        End If
        
    End If
End Sub

Private Function ReplaceKeyWords(sIn As String) As String
'InsatnceID
'Parent
Dim sOut As String
    sOut = Replace(sIn, "%InstanceID%", "'" + Item.Application.ID + "'", , , vbTextCompare)
ReplaceKeyWords = sOut
End Function


Public Function GetDefaultObjectName(ByVal objectType As String) As String
Dim objRecordset As Object
On Error GoTo Error_Detected
    Set objRecordset = Manager.GetSession.GetData("select the_Comment from objecttype where Name='" + objectType + "'")
    If Not (objRecordset.BOF And objRecordset.EOF) Then
       GetDefaultObjectName = objRecordset!the_comment
    Else
       GetDefaultObjectName = " "
    End If
    Exit Function
Error_Detected:
    GetDefaultObjectName = " "
End Function
