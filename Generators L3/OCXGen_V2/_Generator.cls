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

Public Sub Setup()
Dim objFrmSettings As New frmSettings
    frmSettings.Show 1
  'MsgBox "Этот генератор не требует настройки", vbInformation, "Генератор интерфейса"
End Sub



Public Function Run(Model As Object, Output As Object, targetid As String, Optional TypeID As String = "") As String
 Set m = Model
 Set o = Output
 tid = targetid
 LastTID = targetid
 log = ""
 
 Dim i As Long, j As Long
 Dim desc As String, body As String
 Dim OS As PART
 
 LoadTrashSettings
 
 On Error GoTo bye
 
 'Object={8408294B-9E97-428D-999B-82C43BF0BFFA}#1.0#0; JWRAP.ocx
 'Object={E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0; GridEX20.ocx
 'Object={1801C003-859D-471D-BF31-D4428050324B}#1.0#0; MTZ_PANEL.ocx
 o.Project.Attributes.Add("Type").value = "ocx"
 o.Project.Attributes.Add("Toolbox").value = _
 "{E684D8A3-716C-4E59-AA94-7144C04B0074};" & _
 "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1};" & _
 "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B};" & _
 "{1801C003-859D-471D-BF31-D4428050324B};" & _
 "{F9043C88-F6F2-101A-A3C9-08002B2F49FB};" & _
 "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1};" & _
 "{C932BA88-4374-101B-A56C-00AA003668DC}"
 
 '"{8408294B-9E97-428D-999B-82C43BF0BFFA};" & _
 '"{E684D8A3-716C-4E59-AA94-7144C04B0074};" & _

'Reference=*\G{F5078F18-C551-11D3-89B9-0000F81FE221}#3.0#0#E:\WINDOWS\System32\msxml3.dll#Microsoft XML, v3.0
'Reference=*\G{58DF4A4A-346E-4A52-82D1-1DC4A6CB4A60}#3.0#0#..\..\MTZManager\MTZManager.dll#MTZManager
'Reference=*\G{27532C15-381F-49B2-83D7-087D2BB897B8}#4.1#0#..\..\MTZUtil\MTZUtil.dll#MTZUtil
'Reference=*\G{45D6DB85-69D5-45C6-AD58-BB2DA56CCC79}#5.0#0#..\..\MTZSession\MTZSession.dll#MTZSession
'Reference=*\G{EF53050B-882E-4776-B643-EDA472E8E3F2}#2.7#0#E:\Program Files\Common Files\system\ado\msado15.dll#Microsoft ActiveX Data Objects 2.7 Library
'Reference=*\G{B33EE44C-4362-4227-932E-7BAD125CC18D}#1.0#0#..\..\..\MTZ_CU~1\MTZ_CUSTOMTAB.dll#MTZ_CUSTOMTAB
 
 o.Project.Attributes.Add("References").value = _
 "{2A75196C-D9EB-4129-B803-931327F72D5C};" & _
 "{45D6DB85-69D5-45C6-AD58-BB2DA56CCC79};" & _
 "{27532C15-381F-49B2-83D7-087D2BB897B8};" & _
 "{58DF4A4A-346E-4A52-82D1-1DC4A6CB4A60};" & _
 "{F5078F18-C551-11D3-89B9-0000F81FE221};" & _
 "{B33EE44C-4362-4227-932E-7BAD125CC18D}"
  

 
 For i = 1 To m.OBJECTTYPE.Count
  If TypeID = "" Then
    log = log & vbCrLf & "Define TYPE ID!!!"
    Exit For
  End If
  If TypeID = m.OBJECTTYPE.item(i).ID Then
    o.Project.Attributes.Add("ProjectName").value = NoLF(m.OBJECTTYPE.item(i).the_comment)
    o.Project.Attributes.Add("Name").value = m.OBJECTTYPE.item(i).name & "GUI"
    log = log & vbCrLf & "Create code for type " & m.OBJECTTYPE.item(i).name
    CreatetypeObject m.OBJECTTYPE.item(i)
    MakeUtil m.OBJECTTYPE.item(i)
  End If
 Next
 
 Run = log

 Exit Function
bye:


  
 log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"
 'Resume
 MsgBox Err.Description, vbCritical
 Run = log

End Function


''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' UTILS
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'
' return phisical type for fieldtypeid
Private Function MapFT(ByVal TypeID As String) As String
On Error GoTo bye

  Dim i, s
  Dim ft As FIELDTYPE
  MapFT = "INTEGER"
  Set ft = m.FIELDTYPE.item(TypeID)
  If ft Is Nothing Then Exit Function
  For i = 1 To ft.FIELDTYPEMAP.Count
    If (Not ft.FIELDTYPEMAP.item(i).Target Is Nothing) Then
      If ft.FIELDTYPEMAP.item(i).Target.ID = tid Then
        s = ft.FIELDTYPEMAP.item(i).StoageType
        Exit For
      End If
    End If
  Next
  MapFT = s
  Exit Function
bye:
MsgBox Err.Description, vbCritical
log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"

End Function


Private Function MapScript(ByVal sc As Object) As String
On Error GoTo bye
  Dim i
  
  For i = 1 To sc.Count
    If sc.item(i).Target.ID = tid Then
      MapScript = sc.item(i).code
      Exit Function
    End If
  Next
  
  Exit Function
bye:
MsgBox Err.Description, vbCritical
log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"

End Function

Private Function MapFTObj(ByVal TypeID As String) As FIELDTYPEMAP
On Error GoTo bye
  
  Dim i, s
  Dim ft As FIELDTYPE
  Set ft = m.FIELDTYPE.item(TypeID)
  If ft Is Nothing Then Exit Function
  For i = 1 To ft.FIELDTYPEMAP.Count
    If ft.FIELDTYPEMAP.item(i).Target.ID = tid Then
      Set MapFTObj = ft.FIELDTYPEMAP.item(i)
      Exit For
    End If
  Next
  Exit Function
bye:
MsgBox Err.Description, vbCritical
log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"

End Function

Private Function GetScript(scol As SCRIPT_COL) As String
  Dim i As Long
  
  On Error GoTo bye
  For i = 1 To scol.Count
    If scol.item(i).Target.ID = tid Then
      GetScript = scol.item(i).code
      Exit Function
    End If
  Next
  Exit Function
bye:
MsgBox Err.Description, vbCritical
log = log & vbCrLf & "ERROR-->" & Err.Description & "<--ERROR"


End Function




Private Sub CreateEditForm(wdp As PART, ByVal mode As String)
    Dim SaveFields As String, LoadFields As String
    Dim mproc As String, CheckFields As String, NullFields As String, decl As String, code As String
    ' check existance
    Dim fd As FormData
    Dim ctl As ControlData
    
    
     o.Module = "frm" & wdp.name & "_" & mode
     o.Block = "'form"
      With o.Project.Modules.item(o.Module).Blocks.item(o.Block)
      .Attributes.Add("Type").value = "form"
      Set fd = .FormData
      End With

    
    
    AddFProp fd, "Caption", NoLF(wdp.Caption)
    AddFProp fd, "BorderStyle", 5
    AddFProp fd, "Left", 0
    AddFProp fd, "Top", 0
    AddFProp fd, "StartupPosition", 1
    AddFProp fd, "Minbutton", False
    
    
    
    Dim pos As Long, fld As String
    Dim COLUMN As Long, MINPOS As Long

    On Error GoTo bye
    pos = 5 * Screen.TwipsPerPixelY

    decl = ""
    decl = decl & vbCrLf & "   public OK as boolean"
    decl = decl & vbCrLf & "   public item as object"
    decl = decl & vbCrLf & "   Public NotFirstTime As Boolean"
    decl = decl & vbCrLf & ""
    
    SaveFields = ""
    LoadFields = ""

    COLUMN = 0
    MINPOS = pos
  


    ' place controls to edit form
    Dim i As Long
    Dim p As FIELD
    
    Set ctl = fd.ControlData.Add
    ctl.ProgID = TypeForStruct(wdp).name & "GUI." & wdp.name & mode
    AddProp ctl, "Name", "Panel"
    AddProp ctl, "Top", 0
    AddProp ctl, "Left", 0
    AddProp ctl, "Height", 400 * Screen.TwipsPerPixelY
    AddProp ctl, "Width", 600 * Screen.TwipsPerPixelX
    

    
    Set ctl = fd.ControlData.Add
    
    ctl.ProgID = "VB.CommandButton"
    ctl.name = "cmdOK"



    Dim OKVisible As Boolean
    OKVisible = True
    Dim iFields As Long
    For iFields = 1 To wdp.FIELD.Count
      If (wdp.FIELD.item(iFields).FIELDTYPE.TypeStyle = TypeStyle_Element_oformleniy) Then
        If (Trim(LCase(wdp.FIELD.item(iFields).name)) = "buttonok") Then
          OKVisible = False
        End If
      End If
    Next



     ' OK / cancel buttons
     AddProp ctl, "NAME", "cmdOK"
     AddProp ctl, "Caption", "&OK"
     AddProp ctl, "Default", False
     AddProp ctl, "Top", 415 * Screen.TwipsPerPixelY
     AddProp ctl, "Left", 85 * Screen.TwipsPerPixelX 'vbc.Properties("Width") - 150 * Screen.TwipsPerPixelX
     AddProp ctl, "Height", 23 * Screen.TwipsPerPixelY
     AddProp ctl, "Width", 55 * Screen.TwipsPerPixelY
     AddProp ctl, "ToolTipText", NoLF(wdp.the_comment)
     AddProp ctl, "Visible", OKVisible
     
    

     Set ctl = fd.ControlData.Add
     ctl.ProgID = "VB.CommandButton"
     ctl.name = "cmdCancel"
     AddProp ctl, "NAME", "cmdCancel"
     AddProp ctl, "Caption", "Отмена"
     AddProp ctl, "Cancel", True
     AddProp ctl, "CausesValidation", False
     AddProp ctl, "Top", 415 * Screen.TwipsPerPixelY
     AddProp ctl, "Left", 150 * Screen.TwipsPerPixelX 'vbc.Properties("Width") - 85 * Screen.TwipsPerPixelX
     AddProp ctl, "Height", 23 * Screen.TwipsPerPixelY
     AddProp ctl, "Width", 65 * Screen.TwipsPerPixelY
     AddProp ctl, "Visible", OKVisible
    

     pos = pos + 25 * Screen.TwipsPerPixelY
     With fd.PropertyData.Add()
      .name = "Height"
       .PropValue = 480 * Screen.TwipsPerPixelY
     End With
     With fd.PropertyData.Add()
      .name = "Width"
      .PropValue = 640 * Screen.TwipsPerPixelY
     End With

    ' Cancel button proc
    code = code & vbCrLf & "sub cmdCancel_Click()"
    code = code & vbCrLf & "OK=false" & vbCrLf & "me.hide"
    code = code & vbCrLf & "end sub"
    code = code & vbCrLf & ""
    
    
    code = code & vbCrLf & "sub cmdOK_Click()"
    code = code & vbCrLf & " on error goto bye"
    code = code & vbCrLf & " if panel.isOK then"
    code = code & vbCrLf & "   panel.save"
    code = code & vbCrLf & "   OK=true"
    code = code & vbCrLf & "   me.hide"
    code = code & vbCrLf & " else"
    code = code & vbCrLf & "   MsgBox ""Не все обязательные поля заполнены"",vbOKOnly + VBExclamation"
    code = code & vbCrLf & " end if"
    code = code & vbCrLf & "bye:"
    code = code & vbCrLf & "end sub"
    code = code & vbCrLf & ""
    
    code = code & vbCrLf & "Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)"
    code = code & vbCrLf & "  on error resume next"
    code = code & vbCrLf & "  if me.Visible then SaveToSkin"
    code = code & vbCrLf & "end sub"
    
    code = code & vbCrLf & "sub form_Unload(Cancel As Integer)"
    code = code & vbCrLf & "      'SaveToSkin"
    code = code & vbCrLf & "End sub"
    
    code = code & vbCrLf & "sub form_resize()"
    code = code & vbCrLf & " if me.windowstate =1 then exit sub"
    code = code & vbCrLf & " on error resume next"
    code = code & vbCrLf & " panel.top=0"
    code = code & vbCrLf & " Panel.left=0"
    code = code & vbCrLf & " cmdOK.left=0"
    code = code & vbCrLf & " cmdCancel.left=cmdok.width + 5*screen.TwipsPerPixelY"
    code = code & vbCrLf & " cmdOK.Top = Me.ScaleHeight - cmdOK.Height "
    code = code & vbCrLf & " cmdCancel.Top = Me.ScaleHeight - cmdCancel.Height"
    code = code & vbCrLf & " Panel.Width = Me.ScaleWidth"
    'code = code & vbCrLf & " Panel.Height = cmdOK.Top -3 * screen.TwipsPerPixelY"
    code = code & vbCrLf & " If (cmdOK.Visible) Then"
    code = code & vbCrLf & "    panel.Height = cmdOK.Top - 3 * Screen.TwipsPerPixelY"
    code = code & vbCrLf & " Else"
    code = code & vbCrLf & "    panel.Height = Me.ScaleHeight - 3 * Screen.TwipsPerPixelY"
    code = code & vbCrLf & " End If"

    code = code & vbCrLf & "end sub"




    code = code & vbCrLf & "sub form_load()"
    code = code & vbCrLf & " dim x as single, y as single"

    code = code & vbCrLf & " LoadFormSkin"
    
    
    code = code & vbCrLf & " panel.optimalsize x,y"
    code = code & vbCrLf & " Me.Move Me.Left, Me.Top, X + Me.panel.Left * 2 + 20 * Screen.TwipsPerPixelX, Me.panel.Top + Y + cmdOK.Height + 40 * Screen.TwipsPerPixelX"
    code = code & vbCrLf & " "
    code = code & vbCrLf & "end sub"


    code = code & vbCrLf & "sub form_DblCLick()"
    code = code & vbCrLf & " panel.customize"
    code = code & vbCrLf & " if me.visible then SaveToSkin"
    code = code & vbCrLf & "end sub"



    code = code & vbCrLf & "sub panel_Changed()"
    code = code & vbCrLf & " cmdOK.Enabled = true"
    code = code & vbCrLf & "end sub"


    code = code & vbCrLf & "sub form_Activate()"
    code = code & vbCrLf & " if NotFirstTime then exit sub"
    code = code & vbCrLf & " OnInit"
    code = code & vbCrLf & " notFirsttime = true"
    code = code & vbCrLf & "end sub"
    
    
    code = code & vbCrLf & "public sub OnInit()"
    code = code & vbCrLf & " set Panel.item = item"
    code = code & vbCrLf & " Panel.initPanel"
    code = code & vbCrLf & " cmdOK.Enabled = false"
    code = code & vbCrLf & "end sub"
    
    
    code = code & vbCrLf & "private sub LoadFormSkin"
    code = code & vbCrLf & "  on error resume next"
    code = code & vbCrLf & "  Dim s As String"
    code = code & vbCrLf & "  s = GetSetting(""MTZ"", ""CONFIG"", ""LAYOUTS"",App.Path & ""\LAYOUTS\"")"
    code = code & vbCrLf & "  SaveSetting ""MTZ"", ""CONFIG"", ""LAYOUTS"", s"
    code = code & vbCrLf & "  Dim ff As Long, buf As String"
    code = code & vbCrLf & "  ff = FreeFile"
    code = code & vbCrLf & "  Open s & Me.name & """ & wdp.ID & """ For Input As #ff"
    code = code & vbCrLf & "  buf = Input(LOF(ff), ff)"
    code = code & vbCrLf & "  Close #ff"
    code = code & vbCrLf & "  if buf <>"""" then panel.PanelCustomisationString = buf"
    code = code & vbCrLf & "end sub"
    code = code & vbCrLf & ""
    
    
    code = code & vbCrLf & "private sub SaveToSkin"
    code = code & vbCrLf & "  on error resume next"
    code = code & vbCrLf & "  Dim s As String"
    code = code & vbCrLf & "  s = GetSetting(""MTZ"", ""CONFIG"", ""LAYOUTS"", App.Path & ""\LAYOUTS\"")"
    code = code & vbCrLf & "  SaveSetting ""MTZ"", ""CONFIG"", ""LAYOUTS"", s"
    code = code & vbCrLf & "  Dim ff As Long"
    code = code & vbCrLf & "  ff = FreeFile"
    code = code & vbCrLf & "  kill s & Me.name & """ & wdp.ID & """"
    code = code & vbCrLf & "  Open s & Me.name & """ & wdp.ID & """ For output As #ff"
    code = code & vbCrLf & "  print #ff, panel.PanelCustomisationString"
    code = code & vbCrLf & "  Close #ff"
    code = code & vbCrLf & "end sub"
    code = code & vbCrLf & ""
      
    
    
    SaveModule "frm" & wdp.name & "_" & mode, "form", decl, code
    
    
    
    ''' create edit form for child structures
    Dim iii As Long
    For iii = 1 To wdp.PART.Count
      If IsPresent(wdp.PART.item(iii), mode) Then
        CreateEditForm wdp.PART.item(iii), mode
      End If
    Next
    
    Exit Sub
bye:

    MsgBox Err.Description, vbCritical
    'Stop
    'Resume
End Sub


Private Function AddForms(pcol As PART_COL, ByVal mode As String) As String
  Dim body As String, i As Integer
  body = body & vbCrLf & " If Mode = """ & mode & """ Then"
    
  For i = 1 To pcol.Count
    If IsPresent(pcol.item(i), mode) Then
      body = body & vbCrLf & "  If UCase(PartName) = """ & UCase(pcol.item(i).name) & """ Then"
      body = body & vbCrLf & "    Set f = New frm" & pcol.item(i).name & "_" & mode
      body = body & vbCrLf & "  End If"
      body = body & vbCrLf & AddForms(pcol.item(i).PART, mode)
    End If
  Next
  body = body & vbCrLf & " End If"
  AddForms = body
End Function



Private Sub CreatePanel(wdp As PART, ByVal mode As String)
    Dim SaveFields As String, LoadFields As String
    Dim mproc As String, CheckFields As String, NullFields As String, decl As String, code As String
    Dim fd As FormData
    Dim panel As ControlData
    Dim pos As Long, fld As String
    Dim COLUMN As Long, MINPOS As Long
    Dim ctl As ControlData
    
    On Error GoTo bye
    
    'o.Module = "ctl" & wdp.name & "_" & mode
    o.Module = wdp.name & mode
    o.Block = "'form"
    With o.Project.Modules.item(o.Module).Blocks.item(o.Block)
      .Attributes.Add("Type").value = "form"
      Set fd = .FormData
    End With
    
    

    
    pos = 5 * Screen.TwipsPerPixelY

    decl = ""
    decl = decl & vbCrLf & "   public Item as object"
    decl = decl & vbCrLf & "   private OnInit as boolean"
    decl = decl & vbCrLf & "   public event Changed()"
    decl = decl & vbCrLf & "   Private mIsChanged As Boolean"
      
    
    SaveFields = ""
    LoadFields = ""

    COLUMN = 0
    MINPOS = pos
    
    Set panel = fd.ControlData.Add()
    panel.ProgID = "MTZ_PANEL.Scrolledwindow"
    panel.name = "Panel"
    Call AddProp(panel, "BackStyle", 0)
    Call AddProp(panel, "NAME", "Panel")
    Call AddProp(panel, "Top", 0)
    Call AddProp(panel, "Left", 0)
    Call AddProp(panel, "Height", 1000)
    Call AddProp(panel, "Width", 1000)


    code = code & vbCrLf & "Public Function IsChanged() As Boolean"
    code = code & vbCrLf & "  IsChanged = mIsChanged"
    code = code & vbCrLf & "End Function"
    
    code = code & vbCrLf & "private sub Usercontrol_resize()"
    code = code & vbCrLf & "  on error resume next"
    code = code & vbCrLf & "  panel.width = usercontrol.width"
    code = code & vbCrLf & "  panel.height = usercontrol.height"
    code = code & vbCrLf & "end sub"
    code = code & vbCrLf & ""
    

    ' place controls to edit form
    Dim i As Long
    Dim p As FIELD, ftmap As String, RO As Boolean
    wdp.FIELD.Sort = "sequence"
    
    For i = 1 To wdp.FIELD.Count
      Set p = wdp.FIELD.item(i)
      If IsFieldPresent(wdp, p.ID, mode) Then
        RO = IsFieldReadOnly(wdp, p.ID, mode)
        ftmap = MapFT(p.FIELDTYPE.ID)
        GenerateControls tid, panel, p, pos, SaveFields, LoadFields, COLUMN, MINPOS, mode, code, decl, ftmap, CheckFields, RO
      End If
      RO = False
    Next
    
    
    code = code & vbCrLf & "Private Sub UserControl_Terminate()"
    code = code & vbCrLf & "  Set item = Nothing"
    code = code & vbCrLf & "End Sub"

    code = code & vbCrLf & "public function IsOK() as boolean"
    code = code & vbCrLf & "  On error resume next"
    code = code & vbCrLf & "  dim mIsOK as boolean"
    code = code & vbCrLf & "  mIsOk = true"
    code = code & vbCrLf & CheckFields
    code = code & vbCrLf & "  IsOk = mIsOk"
    code = code & vbCrLf & "end function"

    code = code & vbCrLf & "Private Function AddSQLRefIds(ByVal strTo As String, ByVal fldName As String, ByVal strFrom As String) As String"
    code = code & vbCrLf & "  Dim XMLDocFrom As New DOMDocument"
    code = code & vbCrLf & "  Dim XMLDocTo As New DOMDocument"
    code = code & vbCrLf & "  AddSQLRefIds = strTo"
    code = code & vbCrLf & "  On Error GoTo err"
    code = code & vbCrLf & "  Call XMLDocTo.loadXML(strTo)"
    code = code & vbCrLf & "  Call XMLDocFrom.loadXML(strFrom)"
    code = code & vbCrLf & "  Dim Node As MSXML2.IXMLDOMNode"
    code = code & vbCrLf & "  Dim ID As String"
    code = code & vbCrLf & "  For Each Node In XMLDocFrom.childNodes.item(0).childNodes"
    code = code & vbCrLf & "    If (Node.baseName = ""ID"") Then"
    code = code & vbCrLf & "      ID = Node.Text"
    code = code & vbCrLf & "      Dim NodeTO As MSXML2.IXMLDOMNode"
    code = code & vbCrLf & "      Dim bAdded As Boolean"
    code = code & vbCrLf & "      bAdded = False"
    code = code & vbCrLf & "      For Each NodeTO In XMLDocTo.childNodes.item(0).childNodes"
    code = code & vbCrLf & "       If (NodeTO.baseName = fldName & ""ID"") Then"
    code = code & vbCrLf & "         NodeTO.Text = ID"
    code = code & vbCrLf & "         bAdded = True"
    code = code & vbCrLf & "         Exit For"
    code = code & vbCrLf & "       End If"
    code = code & vbCrLf & "      Next"
    code = code & vbCrLf & "      If (Not bAdded) Then"
    code = code & vbCrLf & "       Dim newNode As MSXML2.IXMLDOMNode"
    code = code & vbCrLf & "       Set newNode = XMLDocTo.createNode(MSXML2.NODE_ELEMENT, fldName & ""ID"", XMLDocTo.namespaceURI)"
    code = code & vbCrLf & "        newNode.Text = ID"
    code = code & vbCrLf & "       Call XMLDocTo.childNodes.item(0).appendChild(newNode)"
    code = code & vbCrLf & "      End If"
    code = code & vbCrLf & "      AddSQLRefIds = XMLDocTo.xml"
    code = code & vbCrLf & "      Exit For"
    code = code & vbCrLf & "    End If"
    code = code & vbCrLf & "  Next"
    code = code & vbCrLf & "err:"
    code = code & vbCrLf & "End Function"
    
    code = code & vbCrLf & "public sub InitPanel()"
    code = code & vbCrLf & "OnInit = true"
    code = code & vbCrLf & "dim iii as long ' for combo only"
    code = code & vbCrLf & "if item.CanChange then"
    code = code & vbCrLf & "  panel.enabled = true"
    code = code & vbCrLf & "else"
    code = code & vbCrLf & "  panel.enabled = false"
    code = code & vbCrLf & "end if"
    code = code & vbCrLf & LoadFields
    code = code & vbCrLf & "' Добавим значения ID ко всем SQLReference"
    For i = 1 To wdp.FIELD.Count
      Set p = wdp.FIELD.item(i)
      If IsFieldPresent(wdp, p.ID, mode) Then
        If (p.FIELDTYPE.name = "ReferenceSQL") Then
            Dim ij As Long
            For ij = 1 To wdp.FIELD.Count
              If IsFieldPresent(wdp, wdp.FIELD.item(ij).ID, mode) Then
                If (wdp.FIELD.item(ij).FIELDTYPE.name = "ReferenceSQL") Then
                   If (wdp.FIELD.item(ij).name <> p.name) Then
                      code = code & vbCrLf & "txt" & wdp.FIELD.item(ij).name & ".Tag = AddSQLRefIds(txt" & wdp.FIELD.item(ij).name & ".Tag, """ & p.name & """, txt" & p.name & ".Tag)"
                   End If
                End If
              End If
            Next
        End If
      End If
    Next
  
    
    
    
    code = code & vbCrLf & "OnInit = false"
    code = code & vbCrLf & "end sub"
    
    code = code & vbCrLf & "private sub Changing"
    code = code & vbCrLf & "if OnInit then exit sub"
    
    code = code & vbCrLf & MapScript(wdp.VALIDATOR)
    
    'code = code & vbCrLf & SaveFields
    
    code = code & vbCrLf & " mIsChanged=true "
    code = code & vbCrLf & " raiseevent Changed()"
    code = code & vbCrLf & "end sub"
        
    code = code & vbCrLf & "Public sub Save"
    code = code & vbCrLf & "if OnInit then exit sub"
    code = code & vbCrLf & SaveFields
    code = code & vbCrLf & " mIsChanged=false "
    code = code & vbCrLf & " raiseevent Changed()"
    code = code & vbCrLf & "end sub"
        
        
    code = code & vbCrLf & " Public sub OptimalSize(x As Single, y as single)"
    code = code & vbCrLf & "   Panel.OptimalSize x, y"
    code = code & vbCrLf & "   x=x + panel.left"
    code = code & vbCrLf & "   y=y + panel.top"
    code = code & vbCrLf & " End sub"
    code = code & vbCrLf & " "
    code = code & vbCrLf & " "
    code = code & vbCrLf & " Public Function OptimalY() As Single"
    code = code & vbCrLf & "   Dim x As Single, y As Single"
    code = code & vbCrLf & "   Panel.OptimalSize x, y"
    code = code & vbCrLf & "   OptimalY = y"
    code = code & vbCrLf & " End Function"

    
    code = code & vbCrLf & " Public sub Customize()"
    code = code & vbCrLf & "   Panel.Customize"
    code = code & vbCrLf & " End sub"
    
    code = code & vbCrLf & " Public property get PanelCustomisationString() as string"
    code = code & vbCrLf & "   PanelCustomisationString =Panel.PanelCustomisationString"
    code = code & vbCrLf & " End property"
    
    code = code & vbCrLf & " Public property Let PanelCustomisationString(s as string)"
    code = code & vbCrLf & "   Panel.PanelCustomisationString = s"
    code = code & vbCrLf & " End property"
    
    
    code = code & vbCrLf & " Public property get Enabled() as boolean"
    code = code & vbCrLf & "   Enabled =Panel.Enabled"
    code = code & vbCrLf & " End property"
    
    code = code & vbCrLf & " Public property Let Enabled(byval v as boolean)"
    code = code & vbCrLf & "   Panel.Enabled = v"
    code = code & vbCrLf & " End property"
    
    
    'SaveModule "ctl" & wdp.name & "_" & mode, "control", decl, code
    SaveModule wdp.name & mode, "control", decl, code
    
    
    
    ''' create edit form for child structures
    Dim iii As Long
    For iii = 1 To wdp.PART.Count
      If IsPresent(wdp.PART.item(iii), mode) Then
        CreatePanel wdp.PART.item(iii), mode
      End If
    Next
    
    Exit Sub
bye:

    MsgBox Err.Description, vbCritical
    'Stop
    'Resume
End Sub


Public Sub SaveModule(ByVal name As String, moduleType As String, desc As String, body As String)
Attribute SaveModule.VB_Description = "mt:class, form, module, control, mdi, designer "
    On Error GoTo bye
    o.Module = name
    'o.Project.Modules.Item(o.Module).ModuleName = name
    o.Project.Modules.item(o.Module).Attributes.Add("Type").value = moduleType
    'o.Project.Modules.Item(o.Module).Attributes.Add("Instancing").value = "multiuse"
    
    o.Block = "'description"
    o.Project.Modules.item(o.Module).Blocks.item(o.Block).Attributes.Add("Type").value = "description"
    o.OutNL desc
    
    o.Block = "'codebody"
    o.Project.Modules.item(o.Module).Blocks.item(o.Block).Attributes.Add("Type").value = "code"
    o.OutNL body
    
'    If frm <> "" Then
'      o.Block = "'form"
'      o.Project.Modules.Item(o.Module).Blocks.Item(o.Block).Attributes.Add("Type").value = "form"
'      o.OutNL frm
'    End If
    Exit Sub
bye:

    MsgBox Err.Description, vbCritical
    'Stop
    'Resume
End Sub

Private Sub CreatetypeObject(ot As OBJECTTYPE)
  Dim i As Long, mode As Long
  Dim decl As String, body As String, frm As String
  On Error GoTo bye
  
  o.Module = "GUI"
  o.Project.Modules.item(o.Module).Attributes.Add("Instancing").value = "multiuse"
  
    
'  decl = "public Item as object"
  decl = ""
  decl = decl & vbCrLf & "private mOpenModal as Boolean"
  decl = decl & vbCrLf & "Dim opf As OpenFormInfo"
  decl = decl & vbCrLf & "Dim openForms As Collection"
  
  
  body = ""
  body = body & vbCrLf & "Private Sub Class_Initialize()"
  body = body & vbCrLf & " Set openForms = New Collection"
  body = body & vbCrLf & " App.Title = """ & NoLF(ot.the_comment) & """"
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""
  body = body & vbCrLf & "Private Sub Class_Terminate()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "CloseClass"
  body = body & vbCrLf & "End Sub"
  
  body = body & vbCrLf & "Public Sub CloseClass()"
  body = body & vbCrLf & "Dim f As OpenFormInfo"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "For Each f In openForms"
  body = body & vbCrLf & "    Set f.Form.Host = Nothing"
  body = body & vbCrLf & "    Unload f.Form"
  body = body & vbCrLf & "    Set f.Form = Nothing"
  body = body & vbCrLf & "Next"
  body = body & vbCrLf & "Set openForms = Nothing"
  body = body & vbCrLf & "End Sub"
  
  body = body & vbCrLf & "Private Function FindForm(ByVal InstanceID As String, ByVal mode As String) as object"
  body = body & vbCrLf & "  Dim f As OpenFormInfo"
  body = body & vbCrLf & "  For Each f In openForms"
  body = body & vbCrLf & "    If f.InstanceID = InstanceID And f.mode = mode and f.modal = false Then"
  body = body & vbCrLf & "      Set FindForm = f"
  body = body & vbCrLf & "      Exit Function"
  body = body & vbCrLf & "    End If"
  body = body & vbCrLf & "  Next"
  body = body & vbCrLf & "End Function"

body = body & vbCrLf & "Public function GUIPath() as string"
body = body & vbCrLf & "    GUIPath=app.path & ""\"" & app.exename & "".ocx"" "
body = body & vbCrLf & "End function"

body = body & vbCrLf & "Public function FormCount(ByVal InstanceID As String) as long"
body = body & vbCrLf & "    Dim f As OpenFormInfo"
body = body & vbCrLf & "    Dim  cnt As Long"
body = body & vbCrLf & "    cnt = 0"
body = body & vbCrLf & "    For Each f In openForms"
body = body & vbCrLf & "      If f.InstanceID = InstanceID Then"
body = body & vbCrLf & "        cnt=cnt+1"
body = body & vbCrLf & "      End If"
body = body & vbCrLf & "    Next"
body = body & vbCrLf & "    FormCount = cnt"
body = body & vbCrLf & "End function"

body = body & vbCrLf & "Public Sub EraseForm(ByVal InstanceID As String, ByVal mode As String, byval ModalMode as boolean)"
body = body & vbCrLf & "    on error resume next"
body = body & vbCrLf & "    Dim f As OpenFormInfo"
body = body & vbCrLf & "    Dim i As Long, cnt As Long"
body = body & vbCrLf & "    i = 1"
body = body & vbCrLf & "    cnt = FormCount(InstanceID)"
body = body & vbCrLf & "    For Each f In openForms"
body = body & vbCrLf & "      If f.InstanceID = InstanceID And f.mode = mode and f.modal=modalmode Then"
body = body & vbCrLf & "        goto found"
body = body & vbCrLf & "      End If"
body = body & vbCrLf & "      i = i + 1"
body = body & vbCrLf & "    Next"
body = body & vbCrLf & "    exit sub"
body = body & vbCrLf & "found:"
body = body & vbCrLf & "    openForms.Remove i"
body = body & vbCrLf & "    With f.Form"
body = body & vbCrLf & "      If Not .item Is Nothing Then"
body = body & vbCrLf & "         .item.Manager.FreeInstanceObject .item.ID"
body = body & vbCrLf & "      End If"
body = body & vbCrLf & "    end with"
body = body & vbCrLf & "    Set f.Form.Host = Nothing"
body = body & vbCrLf & "End Sub"

  
  body = body & vbCrLf & "public property get IsModal() as boolean"
  body = body & vbCrLf & " IsModal = mOpenModal"
  body = body & vbCrLf & "end property"

  
  body = body & vbCrLf & "public sub Show(byval mode as string, ObjItem as object, optional OpenModal as boolean = false)"
  body = body & vbCrLf & " dim f as form"
  body = body & vbCrLf & " dim defaccess as boolean"
  body = body & vbCrLf & " on error resume next"
  body = body & vbCrLf & " mOpenModal = OpenModal"
  body = body & vbCrLf & " App.Title = ObjItem.Brief & "" (тип: " & NoLF(ot.the_comment) & ")"" "
  body = body & vbCrLf & " defaccess = ObjItem.MTZSession.CheckRight(objItem.SecureStyleID,""OPEN"") "
  
  ' modeless version
  body = body & vbCrLf & "if not OpenModal then"
  For mode = 1 To ot.OBJECTMODE.Count
    body = body & vbCrLf & "if mode=""" & ot.OBJECTMODE.item(mode).name & """ then"
    body = body & vbCrLf & "  if defaccess or ( (not defaccess) and ObjItem.MTZSession.CheckRight(objItem.SecureStyleID,""" & ot.name & ":" & ot.OBJECTMODE.item(mode).name & """) ) then"
    body = body & vbCrLf & "   set opf = FindForm(objitem.id,mode)"
    body = body & vbCrLf & "   if opf is nothing then"
    body = body & vbCrLf & "     set f = new frm" & ot.OBJECTMODE.item(mode).name & "_main"
    body = body & vbCrLf & "     Set opf = New OpenFormInfo"
    body = body & vbCrLf & "     Set opf.Form = f"
    body = body & vbCrLf & "     opf.InstanceID = ObjItem.ID"
    body = body & vbCrLf & "     opf.mode = mode"
    body = body & vbCrLf & "     opf.modal = openmodal"
    body = body & vbCrLf & "     openForms.Add opf"
    body = body & vbCrLf & "   end if"
    body = body & vbCrLf & "   set f = opf.Form"
    body = body & vbCrLf & "   f.init objItem, me,openmodal"
    body = body & vbCrLf & "   f.show"
    body = body & vbCrLf & "   f.windowState=0"
    body = body & vbCrLf & "   exit sub"
    body = body & vbCrLf & "  else"
    body = body & vbCrLf & "   mode ="""" "
    body = body & vbCrLf & "  end if"
    body = body & vbCrLf & "end if"
  Next
  body = body & vbCrLf & "  if defaccess or ( (not defaccess) and ObjItem.MTZSession.CheckRight(objItem.SecureStyleID,""" & ot.name & ":"")) then"
  body = body & vbCrLf & "   set opf = FindForm(objitem.id,mode)"
  body = body & vbCrLf & "   if opf is nothing then"
  body = body & vbCrLf & "     set f = new frm_main"
  body = body & vbCrLf & "     Set opf = New OpenFormInfo"
  body = body & vbCrLf & "     Set opf.Form = f"
  body = body & vbCrLf & "     opf.InstanceID = ObjItem.ID"
  body = body & vbCrLf & "     opf.mode = mode"
  body = body & vbCrLf & "     opf.modal = openmodal"
  body = body & vbCrLf & "     openForms.Add opf"
  body = body & vbCrLf & "   end if"
  body = body & vbCrLf & "   set f = opf.Form"
  body = body & vbCrLf & "   f.init objItem, me,openmodal"
  body = body & vbCrLf & "   f.show"
  body = body & vbCrLf & "   f.windowState=0"
  body = body & vbCrLf & "  else"
  body = body & vbCrLf & "   MsgBox ""Доступ к документу запрещен"",vbokonly+vbCritical ,""" & NoLF(ot.the_comment) & """ "
  body = body & vbCrLf & "  end if"
  body = body & vbCrLf & "end if"
   
  
  ' modal version
  body = body & vbCrLf & "if OpenModal then"
  For mode = 1 To ot.OBJECTMODE.Count
    body = body & vbCrLf & "if mode=""" & ot.OBJECTMODE.item(mode).name & """ then"
    body = body & vbCrLf & "  if defaccess or ( (not defaccess) and ObjItem.MTZSession.CheckRight(objItem.SecureStyleID,""" & ot.name & ":" & ot.OBJECTMODE.item(mode).name & """)) then"
    body = body & vbCrLf & "     set f = new frm" & ot.OBJECTMODE.item(mode).name & "_main"
    body = body & vbCrLf & "     Set opf = New OpenFormInfo"
    body = body & vbCrLf & "     Set opf.Form = f"
    body = body & vbCrLf & "     opf.InstanceID = ObjItem.ID"
    body = body & vbCrLf & "     opf.mode = mode"
    body = body & vbCrLf & "     opf.modal = openmodal"
    body = body & vbCrLf & "     openForms.Add opf"
    body = body & vbCrLf & "     f.init objItem, me,openmodal"
    body = body & vbCrLf & "     f.show vbmodal"
    body = body & vbCrLf & "     unload f"
    body = body & vbCrLf & "     set f  =nothing"
    body = body & vbCrLf & "     exit sub"
    body = body & vbCrLf & "  else"
    body = body & vbCrLf & "     mode ="""" "
    body = body & vbCrLf & "  end if"
    body = body & vbCrLf & "end if"
  Next
  body = body & vbCrLf & "  if defaccess or ( (not defaccess) and ObjItem.MTZSession.CheckRight(objItem.SecureStyleID,""" & ot.name & ":"")) then"
  body = body & vbCrLf & "    set f = new frm_main"
  body = body & vbCrLf & "     Set opf = New OpenFormInfo"
  body = body & vbCrLf & "     Set opf.Form = f"
  body = body & vbCrLf & "     opf.InstanceID = ObjItem.ID"
  body = body & vbCrLf & "     opf.mode = mode"
  body = body & vbCrLf & "     opf.modal = openmodal"
  body = body & vbCrLf & "     openForms.Add opf"
  body = body & vbCrLf & "   f.init objItem, me,openmodal"
  body = body & vbCrLf & "     f.show vbmodal"
  body = body & vbCrLf & "     unload f"
  body = body & vbCrLf & "     set f  =nothing"
  body = body & vbCrLf & "  else"
  body = body & vbCrLf & "   MsgBox ""Доступ к документу запрещен"",vbokonly+vbCritical ,""" & NoLF(ot.the_comment) & """ "
  body = body & vbCrLf & "  end if"
  body = body & vbCrLf & "end if"
  
  body = body & vbCrLf & "end sub"
  
  
 body = body & vbCrLf & "Public Function ShowAddForm(ByVal Mode As String, RowItem As Object) As Boolean"
 body = body & vbCrLf & " Dim f As Form"
 body = body & vbCrLf & " Dim OK As Boolean"
 body = body & vbCrLf & " On Error Resume Next"
 body = body & vbCrLf & " Set f = Nothing"
 body = body & vbCrLf & " Dim PartName As String"
 body = body & vbCrLf & " PartName = TypeName(RowItem)"
 
 
 For mode = 1 To ot.OBJECTMODE.Count
    body = body & vbCrLf & AddForms(ot.PART, ot.OBJECTMODE.item(mode).name)
 Next
 body = body & vbCrLf & AddForms(ot.PART, "")
 
  
 body = body & vbCrLf & "  If f Is Nothing Then"
 body = body & vbCrLf & "    OK = False"
 body = body & vbCrLf & "  Else"
 body = body & vbCrLf & ""
 body = body & vbCrLf & "    Set f.Item = RowItem"
 body = body & vbCrLf & "    f.OnInit"
 body = body & vbCrLf & "    f.Show vbModal"
 body = body & vbCrLf & "    Set f.Item = Nothing"
 body = body & vbCrLf & "    OK = f.OK"
 body = body & vbCrLf & "    Unload f"
 body = body & vbCrLf & "    Set f = Nothing"
 body = body & vbCrLf & "  End If"
 body = body & vbCrLf & "  ShowAddForm = OK"
 body = body & vbCrLf & "End Function"
 body = body & vbCrLf & ""
  
   
  SaveModule "GUI", "class", decl, body
  
  
  '''' create panels for default mode
  For i = 1 To ot.PART.Count
      If IsPresent(ot.PART.item(i), "") Then
        CreatePanel ot.PART.item(i), ""
      End If
  Next
  
  
  '''' create panels for default other
  For mode = 1 To ot.OBJECTMODE.Count
    For i = 1 To ot.PART.Count
      If IsPresent(ot.PART.item(i), ot.OBJECTMODE.item(mode).name) Then
        CreatePanel ot.PART.item(i), ot.OBJECTMODE.item(mode).name
      End If
    Next
    
  Next
  
  
  '''' create forms for default mode
  For i = 1 To ot.PART.Count
      If IsPresent(ot.PART.item(i), "") Then
        CreateEditForm ot.PART.item(i), ""
      End If
  Next
  
  
 

  
  
  
  '''' create forms for default other
  For mode = 1 To ot.OBJECTMODE.Count
    For i = 1 To ot.PART.Count
      If IsPresent(ot.PART.item(i), ot.OBJECTMODE.item(mode).name) Then
        CreateEditForm ot.PART.item(i), ot.OBJECTMODE.item(mode).name
      End If
    Next
    CreateMainCtl ot, ot.OBJECTMODE.item(mode).name
    CreateMainForm ot, ot.OBJECTMODE.item(mode).name
    
  Next
 
    #If TRIAL = 1 Then
      If Date < DateSerial(2007, 4, 1) Then
          CreateMainCtl ot, ""
          CreateMainForm ot, ""
      End If
    #Else
        CreateMainCtl ot, ""
        CreateMainForm ot, ""
    #End If
  
  
  Exit Sub
bye:
  MsgBox Err.Description, vbCritical
  'Stop
  'Resume

End Sub

Private Function FormByName(osc As PART_COL, ByVal mode As String) As String
  Dim i As Long
  Dim out As String
  On Error GoTo bye
  
  For i = 1 To osc.Count
    If IsPresent(osc.item(i), mode) Then
      out = out & vbCrLf & "if Name=""" & osc.item(i).name & """ then "
      out = out & vbCrLf & " set FormByName = new frm" & osc.item(i).name & "_" & mode
      out = out & vbCrLf & " exit function"
      out = out & vbCrLf & "end if"
      out = out & vbCrLf & FormByName(osc.item(i).PART, mode)
    End If
  Next
  FormByName = out
  Exit Function
bye:
  MsgBox Err.Description, vbCritical
  'Stop
  'Resume
  
End Function


Private Sub MakeUtil(ot As OBJECTTYPE)
  Dim i As Long, mode As Long
  Dim decl As String, body As String, frm As String
  On Error GoTo bye
  
  decl = ""
  body = ""
  
  body = body & vbCrLf & "public function FormByName( byval Name as string, optional byval Mode as string ="""" ) as form"
  For i = 1 To ot.OBJECTMODE.Count
    body = body & vbCrLf & "if Mode=""" & ot.OBJECTMODE.item(i).name & """ then"
    body = body & vbCrLf & FormByName(ot.PART, ot.OBJECTMODE.item(i).name)
    body = body & vbCrLf & "end if"
  Next
  
  body = body & vbCrLf & "if Mode="""" then"
  body = body & vbCrLf & FormByName(ot.PART, "")
  body = body & vbCrLf & "end if"
  
  
  body = body & vbCrLf & "end function"
  
  
  body = body & vbCrLf & "Public Sub SaveToBuffer(u As Object)"
  body = body & vbCrLf & "      Dim xdom As MSXML2.DOMDocument"
  body = body & vbCrLf & "      Set xdom = New MSXML2.DOMDocument"
  body = body & vbCrLf & "      xdom.loadXML ""<I></I>"""
  body = body & vbCrLf & "      u.XMLSave xdom.lastChild, xdom"
  body = body & vbCrLf & "      u.Application.Manager.SetBuffer u.PartName, xdom.xml"
  body = body & vbCrLf & "      Set xdom = Nothing"
  body = body & vbCrLf & "End Sub"
  body = body & vbCrLf & ""
  body = body & vbCrLf & "Public Function GetFromBuffer(u As Object) As Boolean"
  body = body & vbCrLf & "      On Error GoTo bye"
  body = body & vbCrLf & "      Dim xdom As MSXML2.DOMDocument"
  body = body & vbCrLf & "      Set xdom = New MSXML2.DOMDocument"
  body = body & vbCrLf & "      GetFromBuffer = False"
  body = body & vbCrLf & "      If u.Application.Manager.GetBuffer(u.PartName) <> """" Then"
  body = body & vbCrLf & "        xdom.loadXML u.Application.Manager.GetBuffer(u.PartName)"
  body = body & vbCrLf & "        u.XMLLoad xdom.lastChild, 2"
  body = body & vbCrLf & "        U.BatchUpdate"
  body = body & vbCrLf & "        GetFromBuffer = True"
  body = body & vbCrLf & "      Else"
  body = body & vbCrLf & "        MsgBox ""Буфер данных для этого раздела пуст"", vbInformation"
  body = body & vbCrLf & "      End If"
  body = body & vbCrLf & "    Exit Function"
  body = body & vbCrLf & "bye:"
  body = body & vbCrLf & "    MsgBox Err.Description, vbCritical"
  body = body & vbCrLf & "End Function"

  
  o.Module = "Util"
  o.Project.Modules.item(o.Module).Attributes.Add("Instancing").value = "private"
  
  SaveModule "Util", "module", decl, body
bye:

End Sub


Private Sub CreateViewPanel(ot As OBJECTTYPE, root As PART, ByVal mode As String)
  Const maxCD As Long = 20
  Dim i As Long
  Dim fd As FormData, decl As String, body As String, frm As String
  Dim Interface As String, childInterface As String
  Dim Child As PART, parent As PART
  Dim pctl As ControlData, tctl As ControlData
  Dim lctl As ControlData, rctl As ControlData, mctl As ControlData, smctl As ControlData
  Dim tsClick As String, tsInit As String
  Dim fnd1 As String, fnd2 As String
  Dim OnSave As String, IsChanged As String
  
  On Error GoTo bye
  
  
    o.Module = "vpn" & root.name & "_" & mode
    o.Block = "'form"
     
    With o.Project.Modules.item(o.Module).Blocks.item(o.Block)
      .Attributes.Add("Type").value = "controlset"
      Set fd = .FormData
    End With
          

   decl = "public Item as object"
   decl = decl & vbCrLf & "public ParentForm as Object"
   decl = decl & vbCrLf & "public ModalMode as boolean"
  
   
   Set pctl = fd.ControlData.Add()
   pctl.name = "pnl" & root.name
   pctl.ProgID = "VB.Frame"
   AddProp pctl, "Name", pctl.name
   AddProp pctl, "visible", True
   AddProp pctl, "Top", 0 * Screen.TwipsPerPixelX
   AddProp pctl, "Left", 0 * Screen.TwipsPerPixelX
   AddProp pctl, "Width", 600 * Screen.TwipsPerPixelX
   AddProp pctl, "Height", 400 * Screen.TwipsPerPixelY


    ' все методы, которые есть в этом и подчиненных разделах
    MakePartOp root, mode, body
        
    Interface = AnalizeInterface(root, mode)
    Select Case Interface
    
    ' tree
    Case "tree"
      AddProp pctl, "BorderStyle", 0
      MakeSingleTree pctl, root, mode, body, tsClick, tsInit
      CreateTreePopup fd, root, body, decl, mode
    
    ' grid
    Case "grid"
      AddProp pctl, "BorderStyle", 0
      decl = decl & vbCrLf & "private fnd" & root.name & " as object"
      fnd1 = "fnd" & root.name
      MakeSingleGrid pctl, root, mode, body, tsClick, tsInit
      CreateGridPopup fd, root, body, decl, mode
      
    ' extender
    Case "extender"
     
      AddProp pctl, "BorderStyle", 0
      
      Dim sRefValues As String
      Dim sClsID As String
      Dim sProgID As String
      
      sRefValues = o.Project.Attributes.item("Toolbox").value
      
      root.ExtenderInterface.Filter = "TargetPlatform='" + LastTID + "'"
      If root.ExtenderInterface.Count > 0 Then
        sProgID = root.ExtenderInterface.item(1).TheObject
        sClsID = root.ExtenderInterface.item(1).TheName  'GetCLSID_fromPROGID(sProgID)
        If InStr(sRefValues, sClsID) <= 0 Then
            sRefValues = sRefValues + ";" + sClsID
            o.Project.Attributes.item("Toolbox").value = sRefValues
        End If
      
        MakeSingleExtender pctl, ot, root, mode, body, tsClick, tsInit
        
        IsChanged = IsChanged & vbCrLf & " m_isChanged = m_isChanged or edit" & root.name & ".IsChanged"
        
        OnSave = OnSave & vbCrLf & "  edit" & root.name & ".Save"
        OnSave = OnSave & vbCrLf & "if edit" & root.name & ".item.Changed then"
        OnSave = OnSave & vbCrLf & "  edit" & root.name & ".item.Save"
        OnSave = OnSave & vbCrLf & "end if"
      End If
      
      
      
    ' panel
    Case "panel"
     
      AddProp pctl, "BorderStyle", 0
      MakeSinglePanel pctl, ot, root, mode, body, tsClick, tsInit
      
      IsChanged = IsChanged & vbCrLf & " m_isChanged = m_isChanged or edit" & root.name & ".IsChanged"
      
      OnSave = OnSave & vbCrLf & "  edit" & root.name & ".Save"
      OnSave = OnSave & vbCrLf & "if edit" & root.name & ".item.Changed then"
      OnSave = OnSave & vbCrLf & "  edit" & root.name & ".item.Save"
      OnSave = OnSave & vbCrLf & "end if"
      
    ' complex tree
    Case "common"
      pctl.ProgID = "MTZ_PANEL.VFrames"
      tsClick = tsClick & vbCrLf & pctl.name & ".RestorePosition"
      
      body = body & vbCrLf & "Private Sub " & pctl.name & "_PositionChanged()"
      body = body & vbCrLf & "  " & pctl.name & ".SavePosition"
      body = body & vbCrLf & "End Sub"
      
      decl = decl & vbCrLf & "private fnd" & root.name & " as object"
      fnd1 = "fnd" & root.name
      MakeComplexTree pctl, root, mode, body, tsClick, tsInit
      
      CreateComplexPopup fd, root, body, decl, mode
  
    ' tree +
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Case "lefttree"
      pctl.ProgID = "MTZ_PANEL.VFrames"
      tsClick = tsClick & vbCrLf & pctl.name & ".RestorePosition"
      
      body = body & vbCrLf & "Private Sub " & pctl.name & "_PositionChanged()"
      body = body & vbCrLf & "  " & pctl.name & ".SavePosition"
      body = body & vbCrLf & "End Sub"
      
      Set Child = GetFirstChild(root, mode)
      childInterface = AnalizeInterface(Child, mode)
      CreateTreePopup fd, root, body, decl, mode
                
      Select Case childInterface
   
      ' tree + tree
      Case "righttree"
        MakeTreeAndTree pctl, root, Child, mode, body, tsClick, tsInit
        CreateTreePopup fd, Child, body, decl, mode
        
      ' tree + grid
      Case "rightgrid"
        fnd1 = "fnd" & Child.name
        decl = decl & vbCrLf & "private fnd" & Child.name & " as object"
        MakeTreeAndGrid pctl, root, Child, mode, body, tsClick, tsInit
        CreateGridPopup fd, Child, body, decl, mode
      
      ' tree + panel
      Case "rightpanel"
        MakeTreeAndPanel pctl, ot, root, Child, mode, body, tsClick, tsInit
      
      End Select
    
    'panel +
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Case "leftpanel"
      pctl.ProgID = "MTZ_PANEL.HFrames"
      tsClick = tsClick & vbCrLf & pctl.name & ".RestorePosition"
      
      body = body & vbCrLf & "Private Sub " & pctl.name & "_PositionChanged()"
      body = body & vbCrLf & "  " & pctl.name & ".SavePosition"
      body = body & vbCrLf & "End Sub"
      
      Set Child = GetFirstChild(root, mode)
      childInterface = AnalizeInterface(Child, mode)
      
      IsChanged = IsChanged & vbCrLf & " m_isChanged = m_isChanged or item.Changed"
      
      OnSave = OnSave & vbCrLf & "  edit" & root.name & ".Save"
      OnSave = OnSave & vbCrLf & "if edit" & root.name & ".item.Changed then"
      OnSave = OnSave & vbCrLf & "  edit" & root.name & ".item.Save"
      OnSave = OnSave & vbCrLf & "end if"
      
      Select Case childInterface
      
      ' panel + tree
      Case "righttree"
        MakePanelAndTree pctl, ot, root, Child, mode, body, tsClick, tsInit
         CreateTreePopup fd, Child, body, decl, mode
      
      ' panel + grid
      Case "rightgrid"
        fnd1 = "fnd" & Child.name
        decl = decl & vbCrLf & "private fnd" & Child.name & " as object"
        MakePanelAndGrid pctl, ot, root, Child, mode, body, tsClick, tsInit
        CreateGridPopup fd, Child, body, decl, mode
      
      ' panel + panel
      Case "rightpanel"
        MakePanelAndPanel pctl, ot, root, Child, mode, body, tsClick, tsInit
      End Select
    
    
    ' grid +
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Case "topgrid"
      pctl.ProgID = "MTZ_PANEL.HFrames"
      fnd1 = "fnd" & root.name
      decl = decl & vbCrLf & "private fnd" & root.name & " as object"
      
      tsClick = tsClick & vbCrLf & pctl.name & ".RestorePosition"
      
      
      body = body & vbCrLf & "Private Sub " & pctl.name & "_PositionChanged()"
      body = body & vbCrLf & "  " & pctl.name & ".SavePosition"
      body = body & vbCrLf & "End Sub"
      
      
      Set Child = GetFirstChild(root, mode)
      childInterface = AnalizeInterface(Child, mode)
       CreateGridPopup fd, root, body, decl, mode
      
      Select Case childInterface  ' Second control
      ' grid + tree
      Case "bottomtree"
        MakeGridAndTree pctl, root, Child, mode, body, tsClick, tsInit
        CreateTreePopup fd, Child, body, decl, mode
      
      ' grid + grid
      Case "bottomgrid"
        fnd2 = "fnd" & Child.name
        decl = decl & vbCrLf & "private fnd" & Child.name & " as object"
        MakeGridAndGrid pctl, root, Child, mode, body, tsClick, tsInit
         CreateGridPopup fd, Child, body, decl, mode
        
      ' grid + panel
      Case "bottompanel"
         MakeGridAndPanel pctl, ot, root, Child, mode, body, tsClick, tsInit
      End Select ' Second control
      
    End Select ' First control
    
    body = body & vbCrLf & "public sub OnInit(aItem as object, optional pForm as object = nothing)"
    body = body & vbCrLf & " on error resume next"
    body = body & vbCrLf & " set Item =aItem"
    body = body & vbCrLf & " set ParentForm = pForm"
    body = body & vbCrLf & tsInit
    body = body & vbCrLf & "end sub"
    
    body = body & vbCrLf & "private sub OnTabClick()"
    body = body & vbCrLf & tsClick
    body = body & vbCrLf & "end sub"
    
    body = body & vbCrLf & "public sub OnClick(aItem as object, optional pForm as object = nothing)"
    body = body & vbCrLf & "  on error resume next"
    body = body & vbCrLf & "  set Item =aItem"
    body = body & vbCrLf & "  set ParentForm = pForm"
    body = body & vbCrLf & "  OnTabClick"
    body = body & vbCrLf & "end sub"
    
    body = body & vbCrLf & "public sub OnSave()"
    body = body & vbCrLf & "  " & OnSave
    body = body & vbCrLf & "end sub"
    
    body = body & vbCrLf & "public function IsChanged() as boolean"
    body = body & vbCrLf & "  dim m_IsChanged as boolean"
    body = body & vbCrLf & "  on error resume next"
    body = body & vbCrLf & "  " & IsChanged
    body = body & vbCrLf & "  IsChanged = m_IsChanged"
    body = body & vbCrLf & "end function"
    
    body = body & vbCrLf & "private sub UserControl_Resize()"
    body = body & vbCrLf & "  On Error Resume Next"
    body = body & vbCrLf & "  " & pctl.name & ".Move 0, 0, UserControl.Width, UserControl.Height"
    body = body & vbCrLf & "  OnTabClick"
    body = body & vbCrLf & "end sub"
    
    
    
    body = body & vbCrLf & "public sub CloseClass()"
    body = body & vbCrLf & "  On Error Resume Next"
    body = body & vbCrLf & "  set parentForm = nothing"
    body = body & vbCrLf & "  set item = nothing"
    If fnd1 <> "" Then
    body = body & vbCrLf & "  set " & fnd1 & " = nothing"
    End If
    If fnd2 <> "" Then
    body = body & vbCrLf & "  set " & fnd2 & " = nothing"
    End If
    
    body = body & vbCrLf & "end sub"
    
    
    body = body & vbCrLf & "private sub UserControl_Terminate()"
    body = body & vbCrLf & "  On Error Resume Next"
    body = body & vbCrLf & "  CloseClass"
    body = body & vbCrLf & "end sub"
    
bye:

  Dim sss As String
  For i = 1 To m.SHAREDMETHOD.Count
    sss = MakeMethodCode(m.SHAREDMETHOD.item(i))
    If sss <> "" Then
      body = body & vbCrLf & sss
    End If
  Next

  SaveModule "vpn" & root.name & "_" & mode, "control", decl, body
  
End Sub




Private Sub CreateMainForm(ot As OBJECTTYPE, ByVal mode As String)
  Const maxCD As Long = 20
  Dim i As Long
  Dim fd As FormData, decl As String, body As String, frm As String
  Dim Interface As String, childInterface As String
  Dim Child As PART, parent As PART
  Dim pctl As ControlData, tctl As ControlData
  Dim lctl As ControlData, rctl As ControlData, mctl As ControlData, smctl As ControlData
  Dim tsClick As String, tsInit As String
  
  ' Это тип поля - для которого нету данных в БД.
  ' Его надо исключить из проверок
    
  
  On Error GoTo bye
    
  o.Module = "frm" & mode & "_main"
  o.Block = "'form"
  With o.Project.Modules.item(o.Module).Blocks.item(o.Block)
    .Attributes.Add("Type").value = "form"
    Set fd = .FormData
  End With
  
  AddFProp fd, "tag", "Card.ICO"
  AddFProp fd, "caption", NoLF(ot.the_comment)
  AddFProp fd, "ShowInTaskBar", True
  
    
  decl = "public Item as object"
  decl = decl & vbCrLf & "public Host as GUI"
  decl = decl & vbCrLf & "public ModalMode as boolean"
  
  
  Set mctl = fd.ControlData.Add()
  mctl.name = "mnuFile"
  mctl.ProgID = "VB.Menu"
  AddProp mctl, "Caption", "Файл"
  AddProp mctl, "Name", mctl.name
  
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnuSaveAsXML"
  smctl.ProgID = "VB.Menu"
  AddProp smctl, "Caption", "Сохранить в формате XML"
  AddProp smctl, "Name", smctl.name
  
  If Utility.MTZGetSetting("GENERATOR", "VB_OCX_Buttons", "", "True") = "True" Then
  
    Set smctl = mctl.ControlData.Add()
    smctl.name = "mnuLoadFromXML"
    smctl.ProgID = "VB.Menu"
    AddProp smctl, "Caption", "Загрузить из XML"
    AddProp smctl, "Name", smctl.name
  
  
    Set smctl = mctl.ControlData.Add()
    smctl.name = "mnuSecure"
    smctl.ProgID = "VB.Menu"
    AddProp smctl, "Caption", "Стиль защиты"
    AddProp smctl, "Name", smctl.name

  End If
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnuLock"
  smctl.ProgID = "VB.Menu"
  AddProp smctl, "Caption", "Заблокировать"
  AddProp smctl, "Name", smctl.name
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnuUnlock"
  smctl.ProgID = "VB.Menu"
  AddProp smctl, "Caption", "Разблокировать"
  AddProp smctl, "Name", smctl.name
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnuRename"
  smctl.ProgID = "VB.Menu"
  AddProp smctl, "Caption", "Переименовать"
  AddProp smctl, "Name", smctl.name
  
  If Utility.MTZGetSetting("GENERATOR", "VB_OCX_Buttons", "", "True") = "True" Then
    Set smctl = mctl.ControlData.Add()
    smctl.name = "mnuDelete"
    smctl.ProgID = "VB.Menu"
    AddProp smctl, "Caption", "Удалить"
    AddProp smctl, "Name", smctl.name
  End If
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnuExit"
  smctl.ProgID = "VB.Menu"
  AddProp smctl, "Caption", "Выход"
  AddProp smctl, "Name", smctl.name
   
  Set mctl = fd.ControlData.Add()
  mctl.name = "mnuStatus"
  mctl.ProgID = "VB.Menu"
  AddProp mctl, "Caption", "Состояния"
  AddProp mctl, "Name", mctl.name
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnuState"
  smctl.ProgID = "VB.Menu"
  AddProp smctl, "Caption", "..."
  AddProp smctl, "Name", smctl.name
  AddProp smctl, "Index", 1
  
  '''''''''''''''''''''' FILE-MENU
  body = body & vbCrLf & "private sub mnuSaveAsXML_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & " If item.application.MTZSession.CheckRight(item.SecureStyleID, ""XMLSAVE"") Then"
  body = body & vbCrLf & "   Item.LockResource True"
  body = body & vbCrLf & "   Item.LoadAll"
  body = body & vbCrLf & "   Item.WorkOffline = True"
  body = body & vbCrLf & "   Dim xdom As MSXML2.DOMDocument"
  body = body & vbCrLf & "   Set xdom = New MSXML2.DOMDocument"
  body = body & vbCrLf & "   xdom.loadXML ""<root></root>"""
  body = body & vbCrLf & "   Item.XMLSave xdom.lastChild, xdom"
  body = body & vbCrLf & "   xdom.Save App.Path & ""\"" & Item.ID & "".xml"""
  body = body & vbCrLf & "   Item.WorkOffline = False"
  body = body & vbCrLf & " end if"
  body = body & vbCrLf & "end sub"
  
  body = body & vbCrLf & "private sub mnuSecure_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  Item.Application.Manager.ShowSecurityDialog item"
  body = body & vbCrLf & "end sub"
  
  body = body & vbCrLf & "private sub mnuUnlock_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  if Item.IsLocked then "
  body = body & vbCrLf & "    Item.UnlockResource"
  body = body & vbCrLf & "  else"
  body = body & vbCrLf & "  msgbox ""Объект не заблокирован"",vbInformation "
  body = body & vbCrLf & "  end if"
  body = body & vbCrLf & "end sub"
  
  body = body & vbCrLf & "private sub mnuLock_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "    Item.LockResource true"
  body = body & vbCrLf & "end sub"
  
  body = body & vbCrLf & "private sub mnuRename_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  dim n as string"
  body = body & vbCrLf & "  n=inputbox(""Новое название"",""Переименовать"",item.name)"
  body = body & vbCrLf & "  if n <>"""" and n <>item.name then"
  body = body & vbCrLf & "    Item.name = n"
  body = body & vbCrLf & "    Item.Save"
  body = body & vbCrLf & "    me.caption = item.name"
  body = body & vbCrLf & "  end if"
  body = body & vbCrLf & "end sub"
  
  body = body & vbCrLf & "private sub mnuExit_Click()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  unload me"
  body = body & vbCrLf & "end sub"
  
  body = body & vbCrLf & "private sub mnuDelete_Click()"
  body = body & vbCrLf & "  on error goto bye"
  body = body & vbCrLf & "  If MsgBox(""Удалить документ?"", vbQuestion + vbYesNo) = vbYes Then"
  body = body & vbCrLf & "    Item.UnlockResource"
  body = body & vbCrLf & "    Item.WorkOffline = false"
  body = body & vbCrLf & "    Item.Manager.DeleteInstance Item.id "
  body = body & vbCrLf & "    item.Manager.FreeInstanceObject item.ID"
  body = body & vbCrLf & "    unload me"
  body = body & vbCrLf & "  end if"
  body = body & vbCrLf & "  exit sub"
  body = body & vbCrLf & "bye:"
  body = body & vbCrLf & "   MsgBox err.description, vbCritical,""Ошибка при удалении"" "
  body = body & vbCrLf & "end sub"
  
  body = body & vbCrLf & "private sub mnuLoadFromXML_Click()"
  body = body & vbCrLf & " on error resume next"
  body = body & vbCrLf & " If item.application.MTZSession.CheckRight(item.SecureStyleID, ""XMLLOAD"") Then"
  body = body & vbCrLf & "  Dim xdom As MSXML2.DOMDocument"
  body = body & vbCrLf & "  Set xdom = New MSXML2.DOMDocument"
  body = body & vbCrLf & "  xdom.load App.Path & ""\"" & Item.ID & "".xml"""
  body = body & vbCrLf & "  Item.XMLLoad xdom.lastChild, 1"
  body = body & vbCrLf & "  Item.WorkOffline = False"
  body = body & vbCrLf & "  Item.BatchUpdate"
  body = body & vbCrLf & "  Set xdom = Nothing"
  body = body & vbCrLf & " end if"
  body = body & vbCrLf & "end sub"
  
  
  body = body & vbCrLf & "private function ParentForm() as form"
  body = body & vbCrLf & "  set parentForm =me"
  body = body & vbCrLf & "end function"
  
  
  ''''''''''''''''''''''''''''''' make parts ''''''''''''''''''''''''
  
  ' TabStrip
  Set tctl = fd.ControlData.Add()
  tctl.name = "ctl"
  AddProp tctl, "Name", tctl.name
  tctl.ProgID = ot.name & "GUI.ctl" & mode & "_main"
  AddProp tctl, "Top", 0
  AddProp tctl, "Left", 0
  AddProp tctl, "Width", 100 * Screen.TwipsPerPixelX
  AddProp tctl, "Height", 100 * Screen.TwipsPerPixelY
  
    
  body = body & vbCrLf & "public sub Init( ObjItem as object, MyHost as GUI,aModalMode as boolean)"
  body = body & vbCrLf & " set Item = objItem"
  body = body & vbCrLf & " set Host = myHost"
  body = body & vbCrLf & " ModalMode = aModalMode"
  body = body & vbCrLf & " ctl.Init ObjItem,MyHost,aModalMode,me"
  body = body & vbCrLf & " CheckStatus"
  body = body & vbCrLf & "end sub"
    
  body = body & vbCrLf & "Private Sub CheckStatus()"
  body = body & vbCrLf & " If ctl.StatusMenuCount > 0 Then"
  body = body & vbCrLf & "    Dim i As Long"
  body = body & vbCrLf & "    Dim mm() As Object"
  body = body & vbCrLf & "    ReDim mm(1 To ctl.StatusMenuCount)"
  body = body & vbCrLf & "    For i = 1 To ctl.StatusMenuCount"
  body = body & vbCrLf & "      Set mm(i) = mnuState(i)"
  body = body & vbCrLf & "    Next"
  body = body & vbCrLf & "    ctl.CheckStatusMenu mm"
  body = body & vbCrLf & "  End If"
  body = body & vbCrLf & "End Sub"

  body = body & vbCrLf & "Private Sub Form_Activate()"
  body = body & vbCrLf & " CheckStatus"
  body = body & vbCrLf & "end sub"
  
  body = body & vbCrLf & "Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  if me.visible then SaveToSkin"
  body = body & vbCrLf & "end sub"
  
  
  body = body & vbCrLf & "Private Sub Form_Load()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  me.caption = Item.brief"
  body = body & vbCrLf & "  Dim ff As Long, buf As String"
  body = body & vbCrLf & "  LoadFromSkin "
  body = body & vbCrLf & "  ctl.Move 0,0,Me.ScaleWidth,Me.ScaleHeight"
  body = body & vbCrLf & "  If ctl.StatusMenuCount > 0 Then"
  body = body & vbCrLf & "    Dim i As Long"
  body = body & vbCrLf & "    Dim mm() As Object"
  body = body & vbCrLf & "    ReDim mm(1 To ctl.StatusMenuCount)"
  body = body & vbCrLf & "    Set mm(1) = mnuState(1)"
  body = body & vbCrLf & "    For i = 2 To ctl.StatusMenuCount"
  body = body & vbCrLf & "     Load mnuState(i)"
  body = body & vbCrLf & "     Set mm(i) = mnuState(i)"
  body = body & vbCrLf & "    Next"
  body = body & vbCrLf & "    ctl.SetupStatusMenu mm"
  body = body & vbCrLf & "    CheckStatus"
  body = body & vbCrLf & "  Else"
  body = body & vbCrLf & "    mnuStatus.Visible = False"
  body = body & vbCrLf & "  End If"
  body = body & vbCrLf & "End Sub"
  
  ''''''''''''''''''''''''''''''''''''''''''''''''
  body = body & vbCrLf & "Private Sub mnuState_Click(Index As Integer)"
  body = body & vbCrLf & "  On Error Resume Next"
  body = body & vbCrLf & "  If BeforeChangeStatus(item, mnuState(Index).Tag) Then"
  body = body & vbCrLf & "    Item.Statusid = mnuState(Index).Tag"
  body = body & vbCrLf & "    CheckStatus"
  body = body & vbCrLf & "  End If"
  body = body & vbCrLf & "end sub"
  
  body = body & vbCrLf & "Public Function BeforeChangeStatus(item As Object, NewStatus As String) As Boolean"
  body = body & vbCrLf & "  Dim logic As Object"
  body = body & vbCrLf & "  Dim result As Boolean"
  body = body & vbCrLf & "  result = True"
  body = body & vbCrLf & "  On Error Resume Next"
  body = body & vbCrLf & "  Dim MyUser As Object"
  body = body & vbCrLf & "  Set MyUser = item.FindRowObject(""Users"", item.mtzSession.GetSessionUserID())"
  body = body & vbCrLf & "  Set logic = CreateObject(item.TypeName & ""BST.BEFORESTATUS"")"
  body = body & vbCrLf & "  If Not logic Is Nothing Then"
  body = body & vbCrLf & "    result = logic.Check(item, NewStatus, MyUser, item.TypeName)"
  body = body & vbCrLf & "    Set logic = Nothing"
  body = body & vbCrLf & "  End If"
  body = body & vbCrLf & "  BeforeChangeStatus = result"
  body = body & vbCrLf & "End Function"
  
'''  body = body & vbCrLf & "Private Sub Form_Unload(Cancel As Integer)"
'''  body = body & vbCrLf & "  on error resume next"
'''  body = body & vbCrLf & "  If Not item Is Nothing Then "
'''  body = body & vbCrLf & "    If Not item.manager Is Nothing Then "
'''  body = body & vbCrLf & "      if ctl.IsChanged then"
'''  body = body & vbCrLf & "  on error goto bye"
'''  body = body & vbCrLf & "        ctl.OnSave "
'''  body = body & vbCrLf & "      End If"
'''  body = body & vbCrLf & "    End If"
'''  body = body & vbCrLf & "  End If"
'''  body = body & vbCrLf & "  on error resume next"
'''  body = body & vbCrLf & "  If Not Host Is Nothing Then"
'''  body = body & vbCrLf & "   Host.EraseForm item.ID, """ & mode & """,ModalMode"
'''  body = body & vbCrLf & "  End If"
'''  body = body & vbCrLf & "  set item=nothing"
'''  body = body & vbCrLf & "  Set Host = Nothing"
'''  body = body & vbCrLf & "  SaveToSkin
'''  body = body & vbCrLf & "  exit sub"
'''  body = body & vbCrLf & "bye:"
'''  body = body & vbCrLf & "  msgbox err.description,vbokonly"
'''  body = body & vbCrLf & "  cancel = -1"
'''  body = body & vbCrLf & "End Sub"
  
  body = body & vbCrLf & "Private Sub Form_Unload(Cancel As Integer)"
  body = body & vbCrLf & "  If Not Host Is Nothing Then"
  body = body & vbCrLf & "    If Not Item Is Nothing Then"
  body = body & vbCrLf & "      If Not ctl Is Nothing Then"
  body = body & vbCrLf & "On Error GoTo bye"
  body = body & vbCrLf & "        If ctl.IsChanged Then"
  body = body & vbCrLf & "            'If MsgBox(""Закрыть без сохранения?"", vbCritical + vbYesNo, Me.Caption) = vbYes Then"
  body = body & vbCrLf & "                If Not CheckIsOk(Item) Then"
  body = body & vbCrLf & "                    If MsgBox(""Поля не заполнены. Удалить документ?"", vbCritical + vbYesNo, Me.Caption) = vbYes Then"
  body = body & vbCrLf & "                        On Error Resume Next"
  body = body & vbCrLf & "                        Item.Manager.DeleteInstance Item.ID"
  body = body & vbCrLf & "                        Host.EraseForm Item.ID,""" & mode & """,ModalMode"
  body = body & vbCrLf & "                        Set Item = Nothing"
  body = body & vbCrLf & "                        Exit Sub"
  body = body & vbCrLf & "                    End If"
  body = body & vbCrLf & "                End If"
  body = body & vbCrLf & "            'Else"
  body = body & vbCrLf & "            '    Cancel = -1"
  body = body & vbCrLf & "            '    Exit Sub"
  body = body & vbCrLf & "            'End If"
  body = body & vbCrLf & "        Else"
  body = body & vbCrLf & "            If CheckIsNew(Item) Then"
  body = body & vbCrLf & "              On Error Resume Next"
  body = body & vbCrLf & "              Item.Manager.DeleteInstance Item.ID"
  body = body & vbCrLf & "              Host.EraseForm Item.ID, """ & mode & """,ModalMode"
  body = body & vbCrLf & "              Set Item = Nothing"
  body = body & vbCrLf & "              Exit Sub"
  body = body & vbCrLf & "            End If"
  body = body & vbCrLf & ""
  body = body & vbCrLf & "            If Not CheckIsOk(Item) Then"
  body = body & vbCrLf & "                If MsgBox(""Поля не заполнены. Удалить документ?"", vbCritical + vbYesNo, Me.Caption) = vbYes Then"
  body = body & vbCrLf & "                    On Error Resume Next"
  body = body & vbCrLf & "                    Item.Manager.DeleteInstance Item.ID"
  body = body & vbCrLf & "                    Host.EraseForm Item.ID,""" & mode & """,ModalMode"
  body = body & vbCrLf & "                    Set Item = Nothing"
  body = body & vbCrLf & "                    Exit Sub"
  body = body & vbCrLf & "                End If"
  body = body & vbCrLf & "            End If"
  body = body & vbCrLf & "        End If"
  body = body & vbCrLf & "On Error Resume Next"
  body = body & vbCrLf & "      End If"
  body = body & vbCrLf & "      Host.EraseForm Item.ID, """ & mode & """,ModalMode"
  body = body & vbCrLf & "    End If"
  body = body & vbCrLf & "  End If"
  body = body & vbCrLf & "  'SaveToSkin"
  body = body & vbCrLf & "  Exit Sub"
  body = body & vbCrLf & "bye:"
  body = body & vbCrLf & "  If MsgBox(""Ошибка при закрытии:"" & vbCrLf & Err.Description, vbCritical + vbYesNo, ""Закрыть окно?"") = vbNo Then"
  body = body & vbCrLf & "    Cancel = -1"
  body = body & vbCrLf & "  End If"
  body = body & vbCrLf & ""
  body = body & vbCrLf & ""
  body = body & vbCrLf & "End Sub"
  
  body = body & vbCrLf & "Public Function CheckIsOk(o As Object)"
  body = body & vbCrLf & "    'get plain part"
  body = body & vbCrLf & "    Dim res As Boolean"
  body = body & vbCrLf & "    Dim p_col As Object"
  body = body & vbCrLf & "    Dim p As Object"
  body = body & vbCrLf & "    Dim rs As ADODB.Recordset"
  body = body & vbCrLf & "    Dim rsf As ADODB.Recordset"
  body = body & vbCrLf & "    Dim val As Object"
  body = body & vbCrLf & "    Dim strval As String"
  body = body & vbCrLf & "    Dim numres As Double"
  body = body & vbCrLf & ""
  body = body & vbCrLf & "    res = False"
  body = body & vbCrLf & "    Set rs = o.MTZSession.GetData(""select part.name as pName,PartType from part, objecttype where part.parentstructrowid=objecttype.objecttypeid and objecttype.Name='"" & o.TypeName & ""' and part.parentrowid is null"") ' and part.Parttype=0"")"
  body = body & vbCrLf & ""
  body = body & vbCrLf & "    While Not rs.EOF"
  body = body & vbCrLf & "        Dim PartName As String"
  body = body & vbCrLf & "        Dim FieldName As String"
  body = body & vbCrLf & "        PartName = rs!pName & """""
  body = body & vbCrLf & "        If rs!PartType = 0 Then"
  body = body & vbCrLf & "          Set p_col = CallByName(o, PartName, VbGet, False)"
  body = body & vbCrLf & "          Set p = p_col.Item(1)"
  body = body & vbCrLf & "          Set rsf = o.Application.MTZSession.GetData(""select field.name as fName from field, part where field.parentstructrowId=part.partid and part.name='"" & PartName & ""'"")"
  body = body & vbCrLf & "          While Not rsf.EOF"
  body = body & vbCrLf & "              FieldName = rsf!fname & """""
  body = body & vbCrLf & "              On Error Resume Next"
  body = body & vbCrLf & "              Set val = CallByName(p, FieldName, VbGet)"
  body = body & vbCrLf & "              If Err.Number <> 0 Then"
  body = body & vbCrLf & "                  Err.Clear"
  body = body & vbCrLf & "                  numres = CallByName(p, FieldName, VbGet)"
  body = body & vbCrLf & "                  If Err.Number <> 0 Then"
  body = body & vbCrLf & "                      Err.Clear"
  body = body & vbCrLf & "                      strval = CallByName(p, FieldName, VbGet)"
  body = body & vbCrLf & "                      If Len(strval) > 0 Then"
  body = body & vbCrLf & "                          CheckIsOk = True"
  body = body & vbCrLf & "                      End If"
  body = body & vbCrLf & "                  Else"
  body = body & vbCrLf & "                      If numres <> 0 Then"
  body = body & vbCrLf & "                          CheckIsOk = True"
  body = body & vbCrLf & "                      End If"
  body = body & vbCrLf & "                  End If"
  body = body & vbCrLf & "              Else"
  body = body & vbCrLf & "                  If Not (val Is Nothing) Then"
  body = body & vbCrLf & "                      CheckIsOk = True"
  body = body & vbCrLf & "                  End If"
  body = body & vbCrLf & "              End If"
  body = body & vbCrLf & "              rsf.MoveNext"
  body = body & vbCrLf & "          Wend"
  body = body & vbCrLf & "        ElseIf rs!PartType <> 3 Then"
  body = body & vbCrLf & "          On Error Resume next"
  body = body & vbCrLf & "          Set p_col = CallByName(o, PartName, VbGet, False)"
  body = body & vbCrLf & "          if (Not p_col is nothing) then"
  body = body & vbCrLf & "            If p_col.Count > 0 Then"
  body = body & vbCrLf & "              CheckIsOk = True"
  body = body & vbCrLf & "            End If"
  body = body & vbCrLf & "          End If"
  body = body & vbCrLf & "        End If"
  body = body & vbCrLf & "        rs.MoveNext"
  body = body & vbCrLf & "    Wend"
  body = body & vbCrLf & "End Function"
  body = body & vbCrLf & ""
  body = body & vbCrLf & ""
  body = body & vbCrLf & "Public Function CheckIsNew(o As Object)"
  body = body & vbCrLf & "    'get plain part"
  body = body & vbCrLf & "    Dim res As Boolean"
  body = body & vbCrLf & "    Dim p_col As Object"
  body = body & vbCrLf & "    Dim p As Object"
  body = body & vbCrLf & "    Dim rs As ADODB.Recordset"
  body = body & vbCrLf & "    Dim rsf As ADODB.Recordset"
  body = body & vbCrLf & "    Dim rsfcheck As ADODB.Recordset"
  body = body & vbCrLf & "    Dim val As Object"
  body = body & vbCrLf & "    Dim strval As String"
  body = body & vbCrLf & "    Dim numres As Double"
  body = body & vbCrLf & ""
  body = body & vbCrLf & "    res = False"
  body = body & vbCrLf & "    CheckIsNew = True"
  body = body & vbCrLf & "    Set rs = o.MTZSession.GetData(""select part.name as pName from part, objecttype where part.parentrowid is null and  part.parentstructrowid=objecttype.objecttypeid and objecttype.Name='"" & o.TypeName & ""'"") ' and part.Parttype=0"")"
  body = body & vbCrLf & ""
  body = body & vbCrLf & "    While Not rs.EOF"
  body = body & vbCrLf & "        Dim PartName As String"
  body = body & vbCrLf & "        Dim FieldName As String"
  body = body & vbCrLf & "        PartName = rs!pName & """""
  body = body & vbCrLf & "        on error resume next"
  body = body & vbCrLf & "        Set rsf = o.Application.MTZSession.GetData(""select Count(*) cnt from "" & PartName & "" where instanceid='"" & o.ID & ""'"")"
  body = body & vbCrLf & "        on error goto 0"
  body = body & vbCrLf & "        If Not rsf Is Nothing Then"
  body = body & vbCrLf & "          If Not rsf.EOF Then"
  body = body & vbCrLf & "            If rsf!cnt > 0 Then"
  body = body & vbCrLf & "              Set rsf = o.Application.MTZSession.GetData(""select field.name as fName from field, part where field.parentstructrowId=part.partid and part.name='"" & PartName & ""'  and  IsAutoNumber=0"") 'AllowNull=-1 and"
  body = body & vbCrLf & "              while not rsf.eof"
  body = body & vbCrLf & "                On error resume next "
  body = body & vbCrLf & "                Err.Clear "
  body = body & vbCrLf & "                Set rsfcheck = o.Application.MTZSession.GetData(""select Count(*) cnt from "" & PartName & "" where instanceid='"" & o.ID & ""' and "" & rsf!fname & "" is not null"")"
  body = body & vbCrLf & "                if  (Err.Number = 0) then "
  body = body & vbCrLf & "                  If Not rsfcheck Is Nothing Then"
  body = body & vbCrLf & "                    If Not rsfcheck.EOF Then"
  body = body & vbCrLf & "                      If rsfcheck!cnt > 0 Then"
  body = body & vbCrLf & "                        CheckIsNew = False"
  body = body & vbCrLf & "                       End If"
  body = body & vbCrLf & "                    End If"
  body = body & vbCrLf & "                  End If"
  body = body & vbCrLf & "                Else "
  body = body & vbCrLf & "                  Err.Clear"
  body = body & vbCrLf & "                End If"
  body = body & vbCrLf & "                On Error Goto 0"
  body = body & vbCrLf & "                rsf.movenext"
  body = body & vbCrLf & "              Wend"
  body = body & vbCrLf & "            End If"
  body = body & vbCrLf & "          End If"
  body = body & vbCrLf & "        End If"
  body = body & vbCrLf & "        Set rsf = Nothing"
  body = body & vbCrLf & "        rs.MoveNext"
  body = body & vbCrLf & "    Wend"
  body = body & vbCrLf & "    Set rs = Nothing"
  body = body & vbCrLf & "End Function"

  
  
  
  body = body & vbCrLf & "private sub Form_Resize()"
  body = body & vbCrLf & " if me.windowstate =1 then exit sub"
  body = body & vbCrLf & " on error resume next"
  body = body & vbCrLf & " ctl.Move 0,0,Me.ScaleWidth,Me.ScaleHeight"
  body = body & vbCrLf & "end sub"
  
  
  body = body & vbCrLf & "private sub LoadFromSkin()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  Dim s As String, arr() as string"
  body = body & vbCrLf & "  s = GetSetting(""MTZ"", ""CONFIG"", ""LAYOUTS"", App.Path & ""\LAYOUTS\"")"
    body = body & vbCrLf & "  SaveSetting ""MTZ"", ""CONFIG"", ""LAYOUTS"", s"
  body = body & vbCrLf & "  Dim ff As Long, buf As String"
  body = body & vbCrLf & "  ff = FreeFile"
  body = body & vbCrLf & "  Open s & ""MainForm"" & """ & ot.name & """  For Input As #ff"
  body = body & vbCrLf & "  buf = Input(LOF(ff), ff)"
  body = body & vbCrLf & "  Close #ff"
  body = body & vbCrLf & "  arr = split(buf, vbcrlf)"
  body = body & vbCrLf & "  Dim arr2() As String, i as long"
  body = body & vbCrLf & "For i = 0 To UBound(arr)"
  body = body & vbCrLf & "  arr2 = Split(arr(i), "":"")"
  body = body & vbCrLf & "  Select Case arr2(0)"
  body = body & vbCrLf & "  case ""FormTag"""
  body = body & vbCrLf & "    Tag = arr2(1)"
  body = body & vbCrLf & "  Case ""FormTop"""
  body = body & vbCrLf & "    Top = arr2(1)"
  body = body & vbCrLf & "  Case ""FormLeft"""
  body = body & vbCrLf & "    left = arr2(1)"
  body = body & vbCrLf & "  Case ""FormWidth"""
  body = body & vbCrLf & "    Width = arr2(1)"
  body = body & vbCrLf & "  Case ""FormHeight"""
  body = body & vbCrLf & "    Height = arr2(1)"
  body = body & vbCrLf & "  Case Else"
  body = body & vbCrLf & "    Controls(arr2(0)).tag = Val(arr2(1))"
  body = body & vbCrLf & "  End Select"
  body = body & vbCrLf & "Next"
  body = body & vbCrLf & "  s = """" "
  body = body & vbCrLf & "  s = GetSetting(""MTZ"", ""CONFIG"", ""IMAGEPATH"", App.Path & ""\IMAGES\"")"
  body = body & vbCrLf & "  SaveSetting ""MTZ"", ""CONFIG"", ""IMAGEPATH"", s"
  body = body & vbCrLf & "  set icon = LoadPicture(s & Me.tag)"
  body = body & vbCrLf & "end sub"
  body = body & vbCrLf & ""
  
  body = body & vbCrLf & "private sub SaveToSkin"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  Dim s As String, buf as string"
  body = body & vbCrLf & "  s = GetSetting(""MTZ"", ""CONFIG"", ""LAYOUTS"", App.Path & ""\LAYOUTS\"")"
  body = body & vbCrLf & "  SaveSetting ""MTZ"", ""CONFIG"", ""LAYOUTS"", s"
  body = body & vbCrLf & "  Me.WindowState =0 "
  body = body & vbCrLf & "  Dim ff As Long"
  body = body & vbCrLf & "  ff = FreeFile"
  body = body & vbCrLf & "  kill s & ""MainForm"" & """ & ot.name & """"
  body = body & vbCrLf & "  Open s & ""MainForm"" & """ & ot.name & """  For output As #ff"
  body = body & vbCrLf & "  buf =  ""FormTag:"" & Me.Tag "
  body = body & vbCrLf & "  buf = buf & vbcrlf & ""FormTop:"" & Me.Top "
  body = body & vbCrLf & "  buf = buf & vbCrLf & ""FormLeft:"" & Me.Left"
  body = body & vbCrLf & "  buf = buf & vbCrLf & ""FormWidth:"" & Me.Width"
  body = body & vbCrLf & "  buf = buf & vbCrLf & ""FormHeight:"" & Me.Height"
  body = body & vbCrLf & "  print #ff, buf"
  body = body & vbCrLf & "  Close #ff"
  body = body & vbCrLf & "end sub"
  body = body & vbCrLf & ""
  
  
  
'  Dim sss As String
'  For i = 1 To m.SHAREDMETHOD.Count
'    sss = MakeMethodCode(m.SHAREDMETHOD.item(i))
'    If sss <> "" Then
'      body = body & vbCrLf & sss
'    End If
'  Next
    
    
    
  SaveModule "frm" & mode & "_main", "form", decl, body
  
  Set fd = Nothing
  Exit Sub
bye:
  MsgBox Err.Description, vbCritical
  'Stop
  'Resume
End Sub





Private Sub CreateMainCtl(ot As OBJECTTYPE, ByVal mode As String)
  Const maxCD As Long = 20
  Dim i As Long
  Dim j As Long
  Dim fd As FormData, decl As String, body As String, frm As String
  Dim Interface As String, childInterface As String
  Dim Child As PART, parent As PART
  Dim pctl As ControlData, tctl As ControlData
  Dim lctl As ControlData, rctl As ControlData, mctl As ControlData, smctl As ControlData
  Dim tsClick As String, tsInit As String
  
  
  On Error GoTo bye
  ot.PART.Sort = "sequence"
  For i = 1 To ot.PART.Count
      If IsPresent(ot.PART.item(i), mode) Then
        CreateViewPanel ot, ot.PART.item(i), mode
      End If
  Next
  
  o.Module = "ctl" & mode & "_main"
  o.Block = "'form"
  With o.Project.Modules.item(o.Module).Blocks.item(o.Block)
    .Attributes.Add("Type").value = "controlset"
    Set fd = .FormData
  End With
  
  AddFProp fd, "tag", "Card.ICO"
  AddFProp fd, "caption", NoLF(ot.the_comment)
  AddFProp fd, "ShowInTaskBar", False
    
  decl = "public Item as object"
  decl = decl & vbCrLf & "public Host as GUI"
  decl = decl & vbCrLf & "public ModalMode as boolean"
  decl = decl & vbCrLf & "public ParentForm as object"
  decl = decl & vbCrLf & "Private TSCustom As MTZ_CUSTOMTAB.TabStripCustomizer"
  
  
  
  Set mctl = fd.ControlData.Add()
  mctl.name = "mnuCtl"
  mctl.ProgID = "VB.Menu"
  AddProp mctl, "Caption", "mnuCtl"
  AddProp mctl, "Name", mctl.name
  AddProp mctl, "Visible", False
  
  Set smctl = mctl.ControlData.Add()
  smctl.name = "mnuSetup"
  smctl.ProgID = "VB.Menu"
  AddProp smctl, "Caption", "Настройка"
  AddProp smctl, "Name", smctl.name
  AddProp smctl, "Enabled", True
  AddProp smctl, "Visible", True
  ''Support for default size
  body = body & vbCrLf & "Public Property Get PrefferedWidth() As Long"
  body = body & vbCrLf & "    PrefferedWidth = 0"
  body = body & vbCrLf & "End Property"
  body = body & vbCrLf & ""
  body = body & vbCrLf & "Public Property Get PrefferedHeight() As Long"
  body = body & vbCrLf & "    PrefferedHeight = 0"
  body = body & vbCrLf & "End Property"
  body = body & vbCrLf & ""
  ''''''''''''''''' SUPPORT FOR TAB CUSTOMIZATION '''''''''''''''
  body = body & vbCrLf & "Private Sub mnuSetup_Click()"
  body = body & vbCrLf & "TSCustom.Setup ts"
  body = body & vbCrLf & "End Sub"
  
  body = body & vbCrLf & "Private Sub ts_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)"
  body = body & vbCrLf & "  If Button = 2 And Shift = 0 Then"
  body = body & vbCrLf & "    PopupMenu mnuCtl"
  body = body & vbCrLf & "  End If"
  body = body & vbCrLf & "End Sub"
  
  
  ''''''''''''''''''''''''''''''' make parts ''''''''''''''''''''''''
 
  ' TabStrip
  Set tctl = fd.ControlData.Add()
  tctl.name = "ts"
  AddProp tctl, "Name", "ts"
  tctl.ProgID = "mscomctllib.tabstrip"
  AddProp tctl, "Top", 0
  AddProp tctl, "Left", 0
  AddProp tctl, "Width", 100 * Screen.TwipsPerPixelX
  AddProp tctl, "Height", 100 * Screen.TwipsPerPixelY
  
  
  '''' create panels for main form
  ot.PART.Sort = "sequence"
  For i = 1 To ot.PART.Count
      If IsPresent(ot.PART.item(i), mode) Then
        ' panel
        Set pctl = fd.ControlData.Add()
        pctl.name = "pnl" & ot.PART.item(i).name
        pctl.ProgID = ot.name & "GUI.vpn" & ot.PART.item(i).name & "_" & mode
        AddProp pctl, "Name", pctl.name
        AddProp pctl, "visible", False
        AddProp pctl, "Top", 100 * Screen.TwipsPerPixelX * (i \ 5)
        AddProp pctl, "Left", 100 * Screen.TwipsPerPixelX * (i Mod 5)
        AddProp pctl, "Width", 100 * Screen.TwipsPerPixelX
        AddProp pctl, "Height", 100 * Screen.TwipsPerPixelY
        
        If tsInit = "" Then
          tsInit = tsInit & vbCrLf & "ts.Tabs.Item(1).Caption = """ & NoLF(ot.PART.item(i).Caption) & """"
          tsInit = tsInit & vbCrLf & "ts.Tabs.Item(1).key = """ & ot.PART.item(i).name & """"
        Else
          tsInit = tsInit & vbCrLf & "call ts.Tabs.Add(, """ & ot.PART.item(i).name & """, """ & NoLF(ot.PART.item(i).Caption) & """)"
        End If
        
        tsInit = tsInit & vbCrLf & pctl.name & ".OnInit item, parentForm"
        
        
        If tsClick = "" Then
          tsClick = tsClick & vbCrLf & "   Select Case ts.SelectedItem.Key"
        End If
        
        Dim sTemp As String
        sTemp = ""
        If ot.PART.item(i).PartType = PartType_Rassirenie Then
            sTemp = "  " & pctl.name & ".Visible = False" & vbCrLf
            sTemp = sTemp + pctl.name + ".HideControls" & vbCrLf
            sTemp = sTemp + pctl.name + ".SetSize ts.ClientTop, ts.ClientLeft, ts.ClientWidth, ts.ClientHeight" & vbCrLf
            tsClick = sTemp + tsClick
        Else
            tsClick = "  " & pctl.name & ".Visible = False" & vbCrLf & tsClick
        End If
        
        tsClick = tsClick & vbCrLf & "   Case """ & ot.PART.item(i).name & """"
        tsClick = tsClick & vbCrLf & "     With " & pctl.name
        tsClick = tsClick & vbCrLf & "     .Top = ts.ClientTop"
        tsClick = tsClick & vbCrLf & "     .Left = ts.ClientLeft"
        tsClick = tsClick & vbCrLf & "     .Width = ts.ClientWidth"
        tsClick = tsClick & vbCrLf & "     .Height = ts.ClientHeight"
        tsClick = tsClick & vbCrLf & "     .Visible = True"
        tsClick = tsClick & vbCrLf & "     .ZOrder 0"
        tsClick = tsClick & vbCrLf & "     " & pctl.name & ".OnClick item,parentform"
        tsClick = tsClick & vbCrLf & "     End With"
      End If
  Next
  
  
  If tsClick <> "" Then
    tsClick = tsClick & vbCrLf & "     End select"
    body = body & vbCrLf & "private sub ts_click()"
    body = body & vbCrLf & "  on error resume next"
    
    body = body & vbCrLf & tsClick
    body = body & vbCrLf & "end sub"
  End If
  
  body = body & vbCrLf & "public sub Init( ObjItem as object, MyHost as GUI,aModalMode as boolean , aParentForm as object)"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & " set Item = objItem"
  body = body & vbCrLf & " set Host = myHost"
  body = body & vbCrLf & " set ParentForm = aParentForm"
  body = body & vbCrLf & " ModalMode = aModalMode"
  body = body & vbCrLf & "  Dim ff As Long, buf As String"
  body = body & vbCrLf & tsInit
  body = body & vbCrLf & "  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer"
  body = body & vbCrLf & "  TSCustom.Init ts, """ & ot.name & """, ""ctl" & mode & "_main"""
  body = body & vbCrLf & "  TSCustom.SetupFromRegistry ts"
  body = body & vbCrLf & " ts_click"
  body = body & vbCrLf & "end sub"
  
  body = body & vbCrLf & "Private Sub UserControl_Terminate()"
  body = body & vbCrLf & "  on error resume next"
  body = body & vbCrLf & "  set item=nothing"
  body = body & vbCrLf & "  Set Host = Nothing"
  body = body & vbCrLf & "  Set ParentForm = Nothing"
  body = body & vbCrLf & "  Set TSCustom = Nothing"
  For i = 1 To ot.PART.Count
      If IsPresent(ot.PART.item(i), mode) Then
  body = body & vbCrLf & " pnl" & ot.PART.item(i).name & ".CloseClass"
      End If
  Next
  body = body & vbCrLf & "End Sub"
  
  body = body & vbCrLf & "public sub OnSave()"
    For i = 1 To ot.PART.Count
    If IsPresent(ot.PART.item(i), mode) Then
      body = body & vbCrLf & " pnl" & ot.PART.item(i).name & ".OnSave"
    End If
  Next
  body = body & vbCrLf & "end sub"
    
  body = body & vbCrLf & "public function IsChanged() as boolean"
  body = body & vbCrLf & "  dim m_IsChanged as boolean"
  body = body & vbCrLf & "  on error resume next"
  
  For i = 1 To ot.PART.Count
    If IsPresent(ot.PART.item(i), mode) Then
      body = body & vbCrLf & "m_IsChanged = m_IsChanged or pnl" & ot.PART.item(i).name & ".IsChanged"
    End If
  Next
  body = body & vbCrLf & "  IsChanged = m_IsChanged"
  body = body & vbCrLf & "end function"
  
  body = body & vbCrLf & "private sub UserControl_Resize()"
  body = body & vbCrLf & " on error resume next"
  body = body & vbCrLf & "ts.Top = 0"
  body = body & vbCrLf & "ts.Left = 0"
  body = body & vbCrLf & "ts.Width = usercontrol.Width"
  body = body & vbCrLf & "ts.Height = usercontrol.Height"
  body = body & vbCrLf & "ts_Click"
  body = body & vbCrLf & "end sub"
  
  Dim sss As String
  For i = 1 To m.SHAREDMETHOD.Count
    sss = MakeMethodCode(m.SHAREDMETHOD.item(i))
    If sss <> "" Then
      body = body & vbCrLf & sss
    End If
  Next
    
    
    
  body = body & vbCrLf & "Public Function StatusMenuCount() As Integer"
  body = body & vbCrLf & "  StatusMenuCount = " & ot.OBJSTATUS.Count
  body = body & vbCrLf & "End Function"
  
  body = body & vbCrLf & "Public Function SetupStatusMenu(m() As Object)"
  body = body & vbCrLf & "    Dim i As Long"
  body = body & vbCrLf & "    On Error Resume Next"
  body = body & vbCrLf & "    i = 0"
  For i = 1 To ot.OBJSTATUS.Count
    body = body & vbCrLf & "    i = i + 1"
    body = body & vbCrLf & "    m(i).Caption = """ & ot.OBJSTATUS.item(i).name & """"
    body = body & vbCrLf & "    m(i).Visible = True"
    body = body & vbCrLf & "    m(i).Enabled = True"
    body = body & vbCrLf & "    m(i).Checked = false"
    body = body & vbCrLf & "    m(i).Tag = """ & ot.OBJSTATUS.item(i).ID & """"
  Next
  body = body & vbCrLf & "End function  "
  
  body = body & vbCrLf & "Public sub CheckStatusMenu(m() As Object)"
  body = body & vbCrLf & "    Dim i As Long"
  body = body & vbCrLf & "    On Error Resume Next"
  body = body & vbCrLf & "    For i = 1 To StatusMenuCount"
  body = body & vbCrLf & "        m(i).Checked = False"
  body = body & vbCrLf & "        m(i).Enabled = False"
  body = body & vbCrLf & "        If Not Item Is Nothing Then"
  body = body & vbCrLf & "          If m(i).Tag = Item.Statusid Then"
  body = body & vbCrLf & "            m(i).Checked = True"
  body = body & vbCrLf & "          End If"
  body = body & vbCrLf & "        End If"
  body = body & vbCrLf & "    Next"
  body = body & vbCrLf & "    If Not Item Is Nothing Then"
  
  For i = 1 To ot.OBJSTATUS.Count
  body = body & vbCrLf & "      If Item.Statusid = """ & ot.OBJSTATUS.item(i).ID & """ Then"
  body = body & vbCrLf & "        For i = 1 To StatusMenuCount"
  
  For j = 1 To ot.OBJSTATUS.item(i).NEXTSTATE.Count
  body = body & vbCrLf & "          If m(i).Tag = """ & ot.OBJSTATUS.item(i).NEXTSTATE.item(j).TheState.ID & """ Then"
  body = body & vbCrLf & "            m(i).Enabled = True"
  body = body & vbCrLf & "          End If"
  Next
  
  body = body & vbCrLf & "        Next"
  body = body & vbCrLf & "      End If"
  Next
  
  body = body & vbCrLf & "   End If"
  body = body & vbCrLf & "End sub  "
  
  SaveModule "ctl" & mode & "_main", "control", decl, body
  
  Set fd = Nothing
  Exit Sub
bye:
  MsgBox Err.Description, vbCritical
  'Stop
  'Resume
End Sub







Private Sub MakePartOp(p As PART, mode As String, body As String)
Dim cp As PART, i As Long
Dim met As SHAREDMETHOD
Dim j As Long, s As String
Dim map As PARTPARAMMAP
On Error GoTo bye

For i = 1 To p.PARTMENU.Count
  body = body & vbCrLf & "private sub op" & p.name & "_" & p.PARTMENU.item(i).name & "_" & mode & "(RowItem as object)"
  body = body & vbCrLf & "with RowItem"
  Set met = p.PARTMENU.item(i).the_Action
  If Not met Is Nothing Then
    s = MapScript(met.SCRIPT)
    If s <> "" Then
      s = "Run_" & met.name & " "
      For j = 1 To p.PARTMENU.item(i).PARTPARAMMAP.Count
        Set map = p.PARTMENU.item(i).PARTPARAMMAP.item(j)
        If j > 1 Then s = s & ","
        s = s & " " & map.ParamName & ":="
        s = s & map.fieldName
      Next
      If p.PARTMENU.item(i).PARTPARAMMAP.Count > 0 Then
        s = s & ", "
      End If
      
      s = s & " RowItem:=RowItem"
    End If
  End If
  body = body & vbCrLf & s
  body = body & vbCrLf & "end with"
  body = body & vbCrLf & "end sub"
Next
For i = 1 To p.PART.Count
  MakePartOp p.PART.item(i), mode, body
Next
Exit Sub
bye:
MsgBox Err.Description
'Stop
'Resume
End Sub




Private Function MakeMethodCode(sm As SHAREDMETHOD) As String

 On Error GoTo bye
 Dim out As String, i As Long, p As Parameters, scr As String
 scr = MapScript(sm.SCRIPT)
 If scr = "" Then Exit Function
 
 out = out & vbCrLf & "'" & NoLF(sm.the_comment)
 out = out & vbCrLf & "'" & sm.ID
 
 If sm.ReturnType Is Nothing Then
   out = out & vbCrLf & "private sub Run_" & sm.name & " ( "
 Else
   out = out & vbCrLf & "private function Run_" & sm.name & " ("
 End If
 
 Dim params As PARAMETERS_COL
 Set params = GetParameters(sm.SCRIPT, tid)
 For i = 1 To params.Count
   Set p = params.item(i)
   If i > 1 Then out = out & ","
   If p.AllowNull Then out = out & " Optional "
   out = out & p.name & " as variant " ' & MapFT(p.TypeOfParm.ID)
 Next
 If params.Count > 0 Then
  out = out & ", "
 End If
 out = out & "optional RowItem as object )"
 out = out & vbCrLf & scr
  

 If sm.ReturnType Is Nothing Then
   out = out & vbCrLf & "end sub"
 Else
   out = out & vbCrLf & "end function"
 End If
 out = out & vbCrLf
 out = out & vbCrLf
 MakeMethodCode = out
 Exit Function
bye:
 MsgBox Err.Description
 'Stop
End Function




