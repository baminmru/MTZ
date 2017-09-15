Attribute VB_Name = "FastReportSupport"
Option Explicit


Public Declare Function WideCharToMultiByte Lib "kernel32" (ByVal CodePage As Long, ByVal dwFlags As Long, ByVal lpWideCharStr As Long, ByVal cchWideChar As Long, ByRef lpMultiByteStr As Any, ByVal cchMultiByte As Long, ByVal lpDefaultChar As String, ByVal lpUsedDefaultChar As Long) As Long

Public Declare Function MultiByteToWideChar Lib "kernel32" (ByVal CodePage As Long, ByVal dwFlags As Long, ByRef lpMultiByteStr As Any, ByVal cchMultiByte As Long, ByVal lpWideCharStr As Long, ByVal cchWideChar As Long) As Long

Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (lpvDest As Any, lpvSource As Any, ByVal cbCopy As Long)
Public Const CP_UTF8 = 65001

Private Const ShiftGap As Long = 18.89765

Private Const bUseQuery = False '"TfrxADOQuery" 'TfrxADOTable
Private Const bUseFirstQueryNextData = True
Dim bFirstRepData As Boolean
Dim LevelParAdder As Long

Dim sRootPart As String
'Dim sReportName As String

Private Function GetDataStringView(objView As PARTVIEW, ByRef sbuffer As String, bFirst As Boolean)
Dim sDelimeterL As String
Dim sDelimeterR As String
Dim objPartView As PARTVIEW
Dim stodo As String
    sDelimeterL = "00010C"
    sDelimeterR = "00000020"
    If bFirst Then
        sbuffer = "08446174617365747301010C"
    End If
    
        Set objPartView = objView
        stodo = "DataSet=""" + objPartView.the_Alias + """ DataSetName=""" + objPartView.Name + """"
        If bFirst Then
            sbuffer = sbuffer + Hex(Len(stodo) + 1) + "00000020"
        Else
            sbuffer = sbuffer + sDelimeterL + Hex(Len(stodo) + 1) + "00000020"
        End If
        sbuffer = sbuffer + Ascii2Hex(stodo)
    
End Function

Private Function GetDataStringPART(objPart As PART, ByRef sbuffer As String, bFirst As Boolean)
Dim sDelimeterL As String
Dim sDelimeterR As String
Dim objPartView As PARTVIEW
Dim stodo As String
    sDelimeterL = "00010C"
    sDelimeterR = "00000020"
    If bFirst Then
        sbuffer = "08446174617365747301010C"
    End If
    If objPart.PARTVIEW.Count > 0 Then
        Set objPartView = objPart.PARTVIEW.item(1)
        stodo = "DataSet=""" + objPartView.the_Alias + """ DataSetName=""" + objPartView.Name + """"
        If bFirst Then
            sbuffer = sbuffer + Hex(Len(stodo) + 1) + "00000020"
        Else
            sbuffer = sbuffer + sDelimeterL + Hex(Len(stodo) + 1) + "00000020"
        End If
        sbuffer = sbuffer + Ascii2Hex(stodo)
'Name=""" + objView.the_Alias + """ UserName=""" + objView.Name + ""
        Dim i As Long
        For i = 1 To objPart.PART.Count
            GetDataStringPART objPart.PART.item(i), sbuffer, False
        Next
    End If
End Function


Private Function GetPropData(objObject As objectType, objViewColl As Collection) As String
'Перебираем все парты, в их seq
Dim sCommon As String
    
    sCommon = "" '"08446174617365747301010C" + Hex(Len(stodo) + 1) + "00000020"
    Dim i As Long
    Dim objPart As PART
    
    Dim bFirst As Boolean
    bFirst = True
    objObject.PART.Sort = "Sequence"
    For i = 1 To objObject.PART.Count
        Set objPart = objObject.PART.item(i)
        If objPart.PARTVIEW.Count > 0 Then
            Call GetDataStringPART(objPart, sCommon, bFirst)
            If bFirst Then
                bFirst = False
            End If
        End If
    Next
    
    Dim oPartView As PARTVIEW
    If Not objViewColl Is Nothing Then
    For Each oPartView In objViewColl
        GetDataStringView oPartView, sCommon, bFirst
        If bFirst Then
            bFirst = False
        End If
    Next
    End If
    GetPropData = sCommon + "0000095661726961626C65730100055374796C650100"
End Function

Public Function MakeSingleFRForView(fnOut As String, objObject As MTZMetaModel.objectType, Optional IsFullAutoMode As Boolean = False, Optional IsAddViews As Boolean = False, Optional IsGroup As Boolean = False, Optional IsDataTableOnly As Boolean = False, Optional ReportTitleFile As String = "", Optional oPartViews As Collection = Nothing)
Dim ffout
Dim sBufferIn As String
'Dim oPartViews As New Collection
Dim oPartView As MTZMetaModel.PARTVIEW
Dim lGapTitle As Double
Dim CI As New MTZFRConnector
Dim cn As String
Dim prv As String

CI.GetFRConnectString Manager.GetSession.site, cn, prv

    ffout = FreeFile
    bFirstRepData = True
    LevelParAdder = 0
    
    'oPartViews
     If IsAddViews And oPartViews Is Nothing Then
        Dim IID As String
        Dim brief As String
        If MsgBox("группировать вью?", vbYesNo) = vbYes Then
            IsGroup = True
        End If

        If MsgBox("Только данные?", vbYesNo) = vbYes Then
            IsDataTableOnly = True
        End If

        While MsgBox("Добавить View?", vbYesNo) = vbYes

            If Manager.GetReferenceDialogEx2("PARTVIEW", IID, brief) Then
                Set oPartView = MyUser.Application.FindRowObject("PARTVIEW", IID)
                oPartViews.Add oPartView
            End If
        Wend
    End If
    'Open fnOut For Binary Access Write As #ffout
    Open fnOut For Output As #ffout
    sBufferIn = "<?xml version=""1.0"" encoding=""utf-8""?>"
    Print #ffout, sBufferIn
    sBufferIn = "<TfrxReport Version=""3.24.25"" DotMatrixReport=""False"" EngineOptions.UseFileCache=""True"" IniFile=""\Software\Fast Reports"" PreviewOptions.Buttons=""4095"" PreviewOptions.Zoom=""1"" PrintOptions.Printer=""По умолчанию"" ReportOptions.ConnectionName=""PCB_10"" ReportOptions.CreateDate=""39121,7834778241"" ReportOptions.Description.Text="""" ReportOptions.LastChange=""39122,7265765972"" ScriptLanguage=""C++Script"" ScriptText.Text=""&#13;&#10;{&#13;&#10;&#13;&#10;}"" PropData=""" + GetPropData(objObject, oPartViews) + """>"
    Print #ffout, sBufferIn
    sBufferIn = "  <TfrxReportPage Name=""Page1"" PaperWidth=""210"" PaperHeight=""297"" PaperSize=""9"" LeftMargin=""10"" RightMargin=""10"" TopMargin=""10"" BottomMargin=""10"" ColumnWidth=""0"" ColumnPositions.Text="""" LargeDesignHeight=""True"" HGuides.Text="""" VGuides.Text="""">"
    Print #ffout, sBufferIn
    If ReportTitleFile <> "" Then
        Dim ffTitle
        Dim llen As Long
        Dim sBuf As String
        ffTitle = FreeFile
        Open ReportTitleFile For Input Access Read As #ffTitle
        Input #ffTitle, sBuf
        lGapTitle = CDbl(sBuf)
        llen = Len(sBuf)
        
        sBuf = input(LOF(ffTitle) - llen - 2, #ffTitle)
        'sBuf = Right(sBuf, Len(sBuf) - llen)
        sBuf = Replace(sBuf, "Title of report", UTF8_Encode(objObject.the_comment))
        Print #ffout, sBuf
'        Do While Not EOF(ffTitle)
'            Input #ffTitle, sBuf
'            If InStr(1, Trim(sBuf), "<TfrxMemoView Name=""Title""") Then
'                sBuf = Replace(sBuf, UTF8_Encode("Title of report"), UTF8_Encode(objObject.the_comment))
'            End If
'            Print #ffout, sBuf
'        Loop
        Close #ffTitle
    Else
        sBufferIn = "    <TfrxReportTitle Name=""ReportTitle1"" Height=""34,01577"" Left=""0"" Top=""18,89765"" Width=""718,1107"">"
        Print #ffout, sBufferIn
        sBufferIn = "      <TfrxMemoView Name=""ReportHeaderName"" Left=""0"" Top=""0"" Width=""718,1107"" Height=""30,23624"" Font.Charset=""1"" Font.Color=""-16777208"" Font.Height=""-18"" Font.Name=""Arial"" Font.Style=""1"" ParentFont=""False"" Text=""" + UTF8_Encode(objObject.the_comment) + """/>"
        
        Print #ffout, sBufferIn
        sBufferIn = "    </TfrxReportTitle>"
        Print #ffout, sBufferIn
    End If
    
    'sBufferIn = "    <TfrxMasterData Name=""MasterData1"" Height=""241,88992"" Left=""0"" Top=""102,04731"" Width=""718,1107"" ColumnWidth=""0"" ColumnGap=""0"" DataSetName=""Задача Изготовлеие ПП"" RowCount=""0""/>"
    'Print #ffout, sBufferIn
    sBufferIn = "    <TfrxPageFooter Name=""PageFooter1"" Height=""22,67718"" Left=""0"" Top=""404,40971"" Width=""718,1107""/>"
    Print #ffout, sBufferIn
    'sBufferIn = "    <TfrxADODatabase Name=""ADODatabase"" DatabaseName=""Provider=SQLOLEDB.1;Persist Security Info=False;User ID=sa;Initial Catalog=PCB_15;Data Source=PHIL;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=PHIL;Use Encryption for Data=False;Tag with column collation when possible=False"" LoginPrompt=""False"" Connected=""True""/>"
    sBufferIn = "    <TfrxADODatabase Name=""ADODatabase"" DatabaseName=""" + cn + """ LoginPrompt=""False"" Connected=""True""/>"
    Print #ffout, sBufferIn
    'Перебираем все парты, в их seq
    Dim i As Long
    Dim objPart As PART
    Dim objRootPartView As PARTVIEW
    Dim objPartView As PARTVIEW
    objObject.PART.Sort = "Sequence"
    Dim dblStart As Double
    If lGapTitle <> 0 Then
        dblStart = 113.3859
    Else
        dblStart = lGapTitle
    End If
    For i = 1 To objObject.PART.Count
        Set objPart = objObject.PART.item(i)
        If objPart.PARTVIEW.Count > 0 Then
            If objRootPartView Is Nothing Then
                Set objRootPartView = objPart.PARTVIEW.item(1)
            End If
            
            MakePartForFR objPart, objRootPartView, ffout, "InstanceID", 1, dblStart
        End If
    Next
    ' Надо ли добавлять дополнительные view
    If IsAddViews Then
        For Each oPartView In oPartViews
            MakePartForFR oPartView.Parent.Parent, Nothing, ffout, "InstanceID", 2, dblStart, Nothing, False, oPartView, IsGroup, IsDataTableOnly
        Next
    End If
    sBufferIn = "  </TfrxReportPage>"
    Print #ffout, sBufferIn
    sBufferIn = "</TfrxReport>"
    Print #ffout, sBufferIn
    Close #ffout
    Dim vbRes As VbMsgBoxResult
    If IsFullAutoMode Then
        vbRes = vbYes
    Else
        vbRes = MsgBox("Добавить Описание в PCB_Reports?", vbYesNo)
    End If
    If vbRes = vbYes Then
        On Error Resume Next
        Dim objREP As Object
        Dim objRepInfo As Object
        Dim objRepParam As Object
        Set objREP = GetDictionary("PCB_Reports")
        If Not objREP Is Nothing Then
            objREP.PCB_REPORT_INFO.Filter = "ReportName='" + objObject.the_comment + "'"
            If objREP.PCB_REPORT_INFO.Count > 0 Then
                objREP.PCB_REPORT_INFO.item(1).Delete
            End If
            objREP.PCB_REPORT_INFO.Filter = ""
            
            Set objRepInfo = objREP.PCB_REPORT_INFO.Add
            objRepInfo.ReportName = objObject.the_comment
            objRepInfo.ReportFilePath = fnOut
            objRepInfo.Save
            Set objRepParam = objRepInfo.PCB_REP_PARAM.Add
            objRepParam.TheReportPAR = "InstanceID='%OBJECT%'"
            objRepParam.ObjectName = objObject.Name
            objRepParam.TheObjectName = sRootPart
            objRepParam.Save
        End If
    End If
    If Not IsFullAutoMode Then
        If MsgBox("Открыть отчёт?", vbYesNo) = vbYes Then
            ShellExecute 0, "open", fnOut, "", "", 0
        End If
    End If
Exit Function
On Error Resume Next
'Dim Rep As New FastReport.TfrxReport
'Call Rep.LoadReportFromFile(fnOut)
'Dim pO As IfrxComponent
'Set pO = Rep.FindObject("AUTOPCB_MPP_Layers")
'Dim k As TfrxADOTable
'Set k = pO
'k.DataBase = Rep.FindObject("ADODatabase")
'Call Rep.SaveReportToFile(fnOut + "assa.fr3")
End Function

Private Function GetInfoLeft(level As Long) As String
If level = 1 Then
    GetInfoLeft = "0"
Else
    GetInfoLeft = CStr(CDbl(ShiftGap * (level - 1)))
End If
End Function

Private Function GetInfoWidthDiffer(the_width As Double, level As Long) As Double
If level = 1 Then
    GetInfoWidthDiffer = the_width
Else
    GetInfoWidthDiffer = the_width - (level - 1) * ShiftGap
End If
End Function

Private Function GetInfoWidth(level As Long, Optional dblWidth As Double = 355.27582) As String
If level = 1 Then
    GetInfoWidth = CStr(dblWidth)
Else
    '18,89765
    Dim dblL As Double
    GetInfoWidth = CStr(GetInfoWidthDiffer(dblWidth, level))
End If
End Function


Private Function GetMasterDataTypeByLevel(level As Long) As String
Dim lIn As Long
lIn = LevelParAdder + level

    Select Case lIn
        Case 1:
            GetMasterDataTypeByLevel = "TfrxMasterData"
        Case 2:
            GetMasterDataTypeByLevel = "TfrxDetailData"
        Case 3:
            GetMasterDataTypeByLevel = "TfrxSubdetailData"
        Case 4:
            GetMasterDataTypeByLevel = "TfrxDataBand4"
        Case 5:
            GetMasterDataTypeByLevel = "TfrxDataBand5"
        Case 6:
            GetMasterDataTypeByLevel = "TfrxDataBand6"
        Case Else:
            GetMasterDataTypeByLevel = "TfrxDataBand" + CStr(level)
    End Select
End Function


Private Function MakePartForFR(objPart As PART, objRootPartView As PARTVIEW, ffout, TrackField, ByRef level As Long, ByRef dblStart As Double, Optional ParentView As PARTVIEW, Optional IsRecursive As Boolean = True, Optional TheView As PARTVIEW = Nothing, Optional IsForceGroup As Boolean = False, Optional IsNoData As Boolean = False)
Dim sBufferIn As String
Dim objView As PARTVIEW
Dim sDataFields As String
Dim sParentLink As String
Dim objField As MTZMetaModel.Field
    'Перебираем все поля вьюх...
    On Error GoTo Error_Detected
    Dim i As Long
    Dim objColumn As ViewColumn
    Dim sHeaderData As String
'    If objPart.PARTVIEW.Count > 1 Then
'        'Выбираем необходимый партвью
'        Dim IID As String
'        Dim IBrief As String
'        If Manager.GetReferenceDialogEx2("PARTVIEW", IID, IBrief, , , "ParentStructRowID='" + objPart.ID + "'") Then
'            Set objView = objPart.Application.FindRowObject("PARTVIEW", Left(IID, 38))
'        Else
'            Set objView = objPart.PARTVIEW.item(1)
'        End If
'    Else
    If TheView Is Nothing Then
        Set objView = objPart.PARTVIEW.item(1)
    Else
        Set objView = TheView
    End If
'    End If
    If Not objRootPartView Is Nothing Then
    
    If objView.ID <> objRootPartView.ID Then
        If ParentView Is Nothing Then
            sParentLink = "IndexFieldNames=""InstanceID"" Master=""" + objRootPartView.the_Alias + """ MasterFields=""InstanceID=InstanceID"""
        Else
            'sParentLink = "IndexFieldNames=""" + ParentView.Parent.Parent.Name + "ID"" Master=""" + ParentView.the_Alias + """ MasterFields=""" + ParentView.Parent.Parent.Name + "ID=" + objView.Parent.Parent.Name + "ID"""
            sParentLink = "IndexFieldNames=""" + ParentView.Parent.Parent.Name + "ID"" Master=""" + ParentView.the_Alias + """ MasterFields=""" + ParentView.Parent.Parent.Name + "ID=" + ParentView.Parent.Parent.Name + "ID"""
        End If
    End If
    End If
    '"+sReportDataStyle+"
    '"+sReportDataStyle+"
    If bUseFirstQueryNextData Then
        If bFirstRepData Then
            sBufferIn = "    <TfrxADOQuery Name=""" + objView.the_Alias + """ UserName=""" + objView.Name + """ CloseDataSource=""False"" SQL.Text=""select * from v_" + objView.the_Alias + """ CommandTimeout=""60"" FieldAliases.Text="""
            sRootPart = objView.the_Alias
        Else
            sBufferIn = "    <TfrxADOTable Name=""" + objView.the_Alias + """ UserName=""" + objView.Name + """ CloseDataSource=""False"" SQL.Text=""select * from v_" + objView.the_Alias + """ CommandTimeout=""60"" FieldAliases.Text="""
        End If
        'bFirstRepData = False
    Else
        If bUseQuery Then
            sBufferIn = "    <TfrxADOQuery Name=""" + objView.the_Alias + """ UserName=""" + objView.Name + """ CloseDataSource=""False"" SQL.Text=""select * from v_" + objView.the_Alias + """ CommandTimeout=""60"" FieldAliases.Text="""
        Else
            sBufferIn = "    <TfrxADOTable Name=""" + objView.the_Alias + """ UserName=""" + objView.Name + """ CloseDataSource=""False"" SQL.Text=""select * from v_" + objView.the_Alias + """ CommandTimeout=""60"" FieldAliases.Text="""
        End If
    End If
    sBufferIn = sBufferIn + objPart.Name + "ID=" + objPart.Name + "ID&#13;&#10;"
    'Заголовок - имя парта

    '"+GetInfoWidth (level) + "
    'sHeaderData = "      <TfrxMemoView Name=""" + objView.the_Alias + "CAP"" Left=""0"" Top=""0"" Width=""718,1107"" Height=""18,89765"" Color=""12632256"" Font.Charset=""1"" Font.Color=""-16777208"" Font.Height=""-16"" Font.Name=""Arial"" Font.Style=""1"" Frame.Typ=""15"" ParentFont=""False"" Text=""" + UTF8_Encode(objView.Name) + """/>" + vbCrLf
    sHeaderData = "      <TfrxMemoView Name=""" + objView.the_Alias + "CAP"" Left=""" + GetInfoLeft(level) + """ Top=""0"" Width=""" + GetInfoWidth(level, 718.1107) + """ Height=""18,89765"" Font.Charset=""1"" Font.Color=""-16777208"" Font.Height=""-16"" Font.Name=""Arial"" Font.Style=""1"" ParentFont=""False"" Text=""" + UTF8_Encode(objView.Name) + """/>" + vbCrLf
    
    sDataFields = ""
    objView.ViewColumn.Sort = "sequence"
    Dim dblTop As Double
    Dim dblGap As Double
    Dim bAgrigationNeeds As Boolean
    Dim bGoupWill As Boolean
    bGoupWill = False
    If objPart.PartType = PartType_Kollekciy Or objPart.PartType = PartType_Derevo Or objPart.PartType = PartType_Rassirenie_s_dannimi Then
        bGoupWill = True
    End If
    If IsForceGroup Then
        bGoupWill = True
    End If
    Dim sAgregation As String
    Dim dblAgrTop As Double
    dblAgrTop = dblGap
    bAgrigationNeeds = False
    sAgregation = ""
    dblGap = 18.89765
    If bGoupWill Then
        dblTop = 0
    Else
        dblTop = dblGap
    End If
    
    For i = 1 To objView.ViewColumn.Count
        Set objColumn = objView.ViewColumn.item(i)
        If objColumn.Aggregation <> AggregationType_none Then
            bAgrigationNeeds = True
            If objColumn.Aggregation = AggregationType_SUM Then
                sAgregation = sAgregation + "      <TfrxMemoView Name=""GF" + objColumn.the_Alias + "N"" Left=""" + GetInfoLeft(level) + """ Top=""" + CStr(dblAgrTop) + """ Width=""" + GetInfoWidth(level) + """ Height=""" + CStr(dblGap) + """ Font.Charset=""1"" Font.Color=""-16777208"" Font.Height=""-13"" Font.Name=""Arial"" Font.Style=""2"" Frame.Typ=""15"" ParentFont=""False"" Text=""" + UTF8_Encode("Сумма: " + MakeFieldForXML(objColumn.Name)) + """/>" + vbCrLf
                sAgregation = sAgregation + "      <TfrxMemoView Name=""GF" + objColumn.the_Alias + "F"" Align=""baLeft"" Left=""355,27582"" Top=""" + CStr(dblAgrTop) + """ Width=""362,83488"" Height=""" + CStr(dblGap) + """ DataSet=""" + objView.the_Alias + """ DataSetName=""" + objView.Name + """ Font.Charset=""1"" Font.Color=""-16777208"" Font.Height=""-13"" Font.Name=""Arial"" Font.Style=""0"" Frame.Typ=""15"" ParentFont=""False"" Text=""[SUM(&#60;" + _
                UTF8_Encode(objView.Name) + ".&#34;" + UTF8_Encode(MakeFieldForXML(objColumn.Name)) + "&#34;&#62;," + objView.the_Alias + "MD)]""/>" + vbCrLf
                '[SUM(<Отверстия на заготовке авто(Отверстия на заготовке)."Диаметр (Отверстия на заготовке)">,AUTOPCB_MPP_MHoleMD)]
                dblAgrTop = dblAgrTop + dblGap
            ElseIf objColumn.Aggregation = AggregationType_COUNT Then
                
            End If
            
        End If
        'Проверяем отображаемое ли поле...
        
        Set objField = objColumn.Field
        If Not (UCase(objField.FIELDTYPE.Name) = "FILE" Or UCase(objField.FIELDTYPE.Name) = "BUTTON") Then
            If objField.ReferenceType <> ReferenceType_Na_istocnik_dannih Then
                sBufferIn = sBufferIn + objColumn.the_Alias + "=" + MakeFieldForXML(objColumn.Name) + "&#13;&#10;"
            End If
            If objField.ReferenceType = ReferenceType_Na_ob_ekt_ Then
                'sBufferIn = sBufferIn + objColumn.the_Alias + "_ID=" + MakeFieldForXML(objColumn.Name) + "_ID&#13;&#10;"
                sBufferIn = sBufferIn + objColumn.the_Alias + "_ID=" + MakeFieldForXML(objColumn.the_Alias) + "_ID&#13;&#10;"
            End If
            If objField.ReferenceType = ReferenceType_Na_stroku_razdela Then
                'sBufferIn = sBufferIn + objColumn.the_Alias + "_ID=" + MakeFieldForXML(objColumn.Name) + "_ID&#13;&#10;"
                sBufferIn = sBufferIn + objColumn.the_Alias + "_ID=" + MakeFieldForXML(objColumn.the_Alias) + "_ID&#13;&#10;"
            End If
            'Имя поля
            'On Error Resume Next
            If Not IsNoData Then
                If UCase(objField.FIELDTYPE.Name) = "MEMO" Then
                    sDataFields = sDataFields + "      <TfrxMemoView Name=""" + objColumn.the_Alias + "N"" Left=""" + GetInfoLeft(level) + """ Top=""" + CStr(dblTop) + """ Width=""" + GetInfoWidth(level) + """ Height=""" + CStr(dblGap * 3) + """ Color=""12632256"" Font.Charset=""1"" Font.Color=""-16777208"" Font.Height=""-13"" Font.Name=""Arial"" Font.Style=""0"" Frame.Typ=""15"" ParentFont=""False"" Text=""" + UTF8_Encode(MakeFieldForXML(objColumn.Name)) + """/>" + vbCrLf
                    sDataFields = sDataFields + "      <TfrxMemoView Name=""" + objColumn.the_Alias + "F"" Align=""baLeft"" Left=""355,27582"" Top=""" + CStr(dblTop) + """ Width=""362,83488"" Height=""" + CStr(dblGap * 3) + """ DataField=""" + MakeFieldForXML(objColumn.Name) + """ DataSet=""" + objView.the_Alias + """ DataSetName=""" + objView.Name + """ Font.Charset=""1"" Font.Color=""-16777208"" Font.Height=""-13"" Font.Name=""Arial"" Font.Style=""0"" Frame.Typ=""15"" ParentFont=""False"" Text=""" + MakeFieldForXML(objColumn.Name) + """/>" + vbCrLf
                    dblTop = dblTop + dblGap * 3
                Else
                    sDataFields = sDataFields + "      <TfrxMemoView Name=""" + objColumn.the_Alias + "N"" Left=""" + GetInfoLeft(level) + """ Top=""" + CStr(dblTop) + """ Width=""" + GetInfoWidth(level) + """ Height=""" + CStr(dblGap) + """ Color=""12632256"" Font.Charset=""1"" Font.Color=""-16777208"" Font.Height=""-13"" Font.Name=""Arial"" Font.Style=""0"" Frame.Typ=""15"" ParentFont=""False"" Text=""" + UTF8_Encode(MakeFieldForXML(objColumn.Name)) + """/>" + vbCrLf
                    sDataFields = sDataFields + "      <TfrxMemoView Name=""" + objColumn.the_Alias + "F"" Align=""baLeft"" Left=""355,27582"" Top=""" + CStr(dblTop) + """ Width=""362,83488"" Height=""" + CStr(dblGap) + """ DataField=""" + MakeFieldForXML(objColumn.Name) + """ DataSet=""" + objView.the_Alias + """ DataSetName=""" + objView.Name + """ Font.Charset=""1"" Font.Color=""-16777208"" Font.Height=""-13"" Font.Name=""Arial"" Font.Style=""0"" Frame.Typ=""15"" ParentFont=""False"" Text=""" + MakeFieldForXML(objColumn.Name) + """/>" + vbCrLf
                    dblTop = dblTop + dblGap
                End If
            End If
        End If
    Next
'Clear Memo
''<TfrxMemoView Name=""Memo2"" Left=""0"" Top=""264,5671"" Width=""718,1107"" Height=""18,89765"" Font.Charset=""1"" Font.Color=""-16777208"" Font.Height=""-16"" Font.Name=""Arial"" Font.Style=""0"" ParentFont=""False"" Text=""""/>
    'Пустая строка без бордюра
    sDataFields = sDataFields + "<TfrxMemoView Name=""" + objView.the_Alias + "EMD"" Left=""0"" Top=""" + CStr(dblTop) + """ Width=""718,1107"" Height=""18,89765"" Font.Charset=""1"" Font.Color=""-16777208"" Font.Height=""-16"" Font.Name=""Arial"" Font.Style=""0"" ParentFont=""False"" Text=""""/>"
    dblTop = dblTop + dblGap
    'EOF Пустая строка без бордюра
    If Not ParentView Is Nothing Then
        sBufferIn = sBufferIn + ParentView.Parent.Parent.Name + "ID=" + ParentView.Parent.Parent.Name + "ID&#13;&#10;"
    End If
    
    sBufferIn = sBufferIn + objView.Parent.Parent.Name + "ID=" + objView.Parent.Parent.Name + "ID&#13;&#10;" + "InstanceID=InstanceID&#13;&#10;ID=ID&#13;&#10;VIEWBASE=VIEWBASE&#13;&#10;StatusName=StatusName&#13;&#10;INTSANCEStatusID=INTSANCEStatusID"" Filter="""" Filtered=""False"" TableName=""dbo.V_" + objView.the_Alias + """ Database=""ADODatabase""" + sParentLink + "/>"
    
    Print #ffout, sBufferIn
    'Group, if needs

    If bAgrigationNeeds Or bGoupWill Then
        'заголовок агрегации
        Dim sParentG As String
        If ParentView Is Nothing Then
            sParentG = MakeFieldForXML(objView.Name) + ".&#34;InstanceID&#34;"
        Else
            sParentG = MakeFieldForXML(objView.Name) + ".&#34;" + ParentView.Parent.Parent.Name + "ID&#34;"
        End If
        sBufferIn = "    <TfrxGroupHeader Name=""GH" + objView.the_Alias + """ Height=""" + CStr(dblGap) + """ Left=""" + GetInfoLeft(level) + """ Top=""" + CStr(CDbl(dblStart + dblGap)) + """ Width=""" + GetInfoWidth(level, 718.1107) + """ Condition=""" + sParentG + """>"
        Print #ffout, sBufferIn
        'Вставим заголовок парта
        sBufferIn = "      <TfrxMemoView Name=""GHN" + objView.the_Alias + """ Left=""" + GetInfoLeft(level) + """ Top=""0"" Width=""" + GetInfoWidth(level, 718.1107) + """ Height=""18,89765"" Font.Charset=""1"" Font.Color=""-16777208"" Font.Height=""-16"" Font.Name=""Arial"" Font.Style=""1"" ParentFont=""False"" Text=""" + UTF8_Encode(objView.Name) + """/>"
        Print #ffout, sBufferIn
        sBufferIn = "    </TfrxGroupHeader>"
        Print #ffout, sBufferIn
    End If
    'Master data
    sBufferIn = "    <" + GetMasterDataTypeByLevel(level) + " Name=""" + objView.the_Alias + "MD"" Height=""" + CStr(CDbl(dblTop)) + """ Left=""0"" Top=""" + CStr(IIf(bGoupWill, CDbl(dblStart + 4 * dblGap), dblStart)) + """ Width=""718,1107"" AllowSplit=""True"" ColumnWidth=""0"" ColumnGap=""0"" DataSet=""" + objView.the_Alias + """ DataSetName=""" + objView.Name + """ RowCount=""0"" Stretched=""True"">"

    Print #ffout, sBufferIn
    If bGoupWill = False Then
        sDataFields = sHeaderData + sDataFields
    End If
    Print #ffout, sDataFields
    sBufferIn = "    </" + GetMasterDataTypeByLevel(level) + ">"
        If bFirstRepData Then
        LevelParAdder = 1
        bFirstRepData = False
    End If
    Print #ffout, sBufferIn
    dblStart = dblStart + dblTop + dblGap + dblGap
    'group footer, if needs
    If bAgrigationNeeds Or bGoupWill Then
        'подвал агрегации
        sBufferIn = "    <TfrxGroupFooter Name=""GF" + objView.the_Alias + """ Height=""" + CStr(dblAgrTop) + """ Left=""0"" Top=""" + CStr(dblStart + dblGap) + """ Width=""718,1107"">"
        Print #ffout, sBufferIn
        If bAgrigationNeeds Then
            'данные агрегации
            Print #ffout, sAgregation
        End If
        sBufferIn = "    </TfrxGroupFooter>"
        Print #ffout, sBufferIn
        dblStart = dblStart + 4 * dblGap + dblAgrTop + dblGap
           
    End If
    
    'Теперь для всех дочерних партов... рекурсивно.
    level = level + 1
    For i = 1 To objPart.PART.Count
        If objPart.PART.item(i).PARTVIEW.Count > 0 Then
            Call MakePartForFR(objPart.PART.item(i), objRootPartView, ffout, TrackField, level, dblStart, objView)
        End If
    Next
    Exit Function
Error_Detected:
    MsgBox "Error: " + Err.Description
    Exit Function
    Resume
End Function

Public Function UTF8_Encode(ByVal strUnicode As String, Optional ByVal bHTML As Boolean = True) As String
   Dim i                As Long
   Dim TLen             As Long
   Dim lPtr             As Long
   Dim UTF16            As Long
   Dim UTF8_EncodeLong  As String

   TLen = Len(strUnicode)
   If TLen = 0 Then Exit Function

   If True Then
      Dim lngBufferSize    As Long
      Dim lngResult        As Long
      Dim bytUtf8()        As Byte
      'Set buffer for longest possible string.
      lngBufferSize = TLen * 3 + 1
      ReDim bytUtf8(lngBufferSize - 1)
      'Translate using code page 65001(UTF-8).
      lngResult = WideCharToMultiByte(CP_UTF8, 0, StrPtr(strUnicode), _
         TLen, bytUtf8(0), lngBufferSize, vbNullString, 0)
      'Trim result to actual length.
      If lngResult Then
         lngResult = lngResult - 1
         ReDim Preserve bytUtf8(lngResult)
         'CopyMemory StrPtr(UTF8_Encode), bytUtf8(0&), lngResult
         UTF8_Encode = StrConv(bytUtf8, vbUnicode)
         ' For i = 0 To lngResult
         '    UTF8_Encode = UTF8_Encode & Chr$(bytUtf8(i))
         ' Next
      End If
   Else
      For i = 1 To TLen
         ' Get UTF-16 value of Unicode character
         lPtr = StrPtr(strUnicode) + ((i - 1) * 2)
         CopyMemory UTF16, ByVal lPtr, 2
         'Convert to UTF-8
         If UTF16 < &H80 Then                                      ' 1 UTF-8 byte
            UTF8_EncodeLong = Chr$(UTF16)
         ElseIf UTF16 < &H800 Then                                 ' 2 UTF-8 bytes
            UTF8_EncodeLong = Chr$(&H80 + (UTF16 And &H3F))              ' Least Significant 6 bits
            UTF16 = UTF16 \ &H40                                   ' Shift right 6 bits
            UTF8_EncodeLong = Chr$(&HC0 + (UTF16 And &H1F)) & UTF8_EncodeLong  ' Use 5 remaining bits
         Else                                                      ' 3 UTF-8 bytes
            UTF8_EncodeLong = Chr$(&H80 + (UTF16 And &H3F))              ' Least Significant 6 bits
            UTF16 = UTF16 \ &H40                                   ' Shift right 6 bits
            UTF8_EncodeLong = Chr$(&H80 + (UTF16 And &H3F)) & UTF8_EncodeLong  ' Use next 6 bits
            UTF16 = UTF16 \ &H40                                   ' Shift right 6 bits
            UTF8_EncodeLong = Chr$(&HE0 + (UTF16 And &HF)) & UTF8_EncodeLong   ' Use 4 remaining bits
         End If
         UTF8_Encode = UTF8_Encode & UTF8_EncodeLong
      Next
   End If

   'Substitute vbCrLf with HTML line breaks if requested.
   If bHTML Then
      UTF8_Encode = Replace$(UTF8_Encode, vbCrLf, "")
   End If
End Function


Private Function MakeFieldForXML(sIn As String) As String
Dim sOut As String
    sOut = Replace(sIn, """", "")
    MakeFieldForXML = sOut
  
End Function

Public Function MakeFRForObject(fnIn As String, fnOut As String, objView As MTZMetaModel.PARTVIEW)
Dim ff
Dim ffout
Dim sBufferIn As String
    ff = FreeFile
    ffout = FreeFile
    Open fnIn For Input Access Read As #ff
    Open fnOut For Output As #ffout
    'Читаем
    
    Do While Not EOF(ff)   ' Loop until end of file.
        Input #ff, sBufferIn
        'if instr(sBufferIn
    Loop

    
    Close #ffout
    Close #ff
End Function

Public Function hex2ascii(ByVal hextext As String) As String
    Dim y As Long
    Dim num As String
    Dim Value As String
For y = 1 To Len(hextext)
    num = Mid(hextext, y, 2)
    Value = Value & Chr(Val("&h" & num))
    y = y + 1
Next y

hex2ascii = Value
End Function

Function Ascii2Hex(ByRef Text As String) As String
Dim Size As Long
Dim Buffer As String
Dim Car As Byte
Dim i As Long
Size = Len(Text)
Buffer = Space$(2 * Size)
For i = 1 To Size
Car = Asc(Mid$(Text, i, 1))
If Car <= 16 Then
Mid$(Buffer, (i * 2) - 1, 2) = "0" & Hex$(Car)
Else
Mid$(Buffer, (i * 2) - 1, 2) = Hex$(Car)
End If
DoEvents
Next i
Ascii2Hex = Buffer
End Function

