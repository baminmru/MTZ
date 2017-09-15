VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "ARIS integeration test"
   ClientHeight    =   8835
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   11520
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8835
   ScaleWidth      =   11520
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdAris2Mtz 
      Caption         =   "ARIS->MTZ"
      Enabled         =   0   'False
      Height          =   300
      Left            =   120
      TabIndex        =   13
      Top             =   1200
      Width           =   1650
   End
   Begin MSComctlLib.ProgressBar pb 
      Height          =   255
      Left            =   120
      TabIndex        =   12
      Top             =   8520
      Visible         =   0   'False
      Width           =   11295
      _ExtentX        =   19923
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.Frame Frame1 
      Height          =   1575
      Left            =   1920
      TabIndex        =   8
      Top             =   0
      Width           =   1935
      Begin VB.ComboBox cmbBase 
         Height          =   315
         Left            =   120
         Style           =   2  'Dropdown List
         TabIndex        =   11
         Top             =   1080
         Width           =   1635
      End
      Begin VB.CommandButton cmdUse 
         Caption         =   "Use"
         Enabled         =   0   'False
         Height          =   315
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Width           =   1635
      End
      Begin VB.ComboBox cmbLang 
         Height          =   315
         ItemData        =   "Form1.frx":0E42
         Left            =   120
         List            =   "Form1.frx":0E52
         Style           =   2  'Dropdown List
         TabIndex        =   9
         Top             =   600
         Width           =   1635
      End
   End
   Begin VB.Frame fr 
      Height          =   3735
      Left            =   4920
      TabIndex        =   7
      Top             =   1320
      Width           =   3495
      Begin VB.Image pic1 
         Appearance      =   0  'Flat
         Height          =   3495
         Left            =   0
         Stretch         =   -1  'True
         Top             =   240
         Width           =   3615
      End
   End
   Begin VB.CommandButton cmdMTZ2Aris 
      Caption         =   "MTZ->ARIS"
      Enabled         =   0   'False
      Height          =   300
      Left            =   120
      TabIndex        =   5
      Top             =   840
      Width           =   1650
   End
   Begin MSFlexGridLib.MSFlexGrid gr 
      Height          =   1830
      Left            =   4395
      TabIndex        =   4
      Top             =   4515
      Visible         =   0   'False
      Width           =   4530
      _ExtentX        =   7990
      _ExtentY        =   3228
      _Version        =   393216
      Cols            =   4
      FixedCols       =   0
      AllowUserResizing=   1
      FormatString    =   "what |      name         |        type             |    type2"
   End
   Begin VB.CommandButton cmdConnect 
      Caption         =   "Connect"
      Height          =   300
      Left            =   120
      TabIndex        =   3
      Top             =   105
      Width           =   1650
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   3600
      Top             =   600
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      UseMaskColor    =   0   'False
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   3
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":0E6B
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":12BD
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form1.frx":170F
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.TreeView tv 
      Height          =   6765
      Left            =   120
      TabIndex        =   2
      Top             =   1650
      Width           =   4080
      _ExtentX        =   7197
      _ExtentY        =   11933
      _Version        =   393217
      HideSelection   =   0   'False
      Indentation     =   176
      LabelEdit       =   1
      LineStyle       =   1
      Style           =   7
      Appearance      =   1
   End
   Begin VB.CommandButton cmdDisconnect 
      Caption         =   "Disconnect"
      Enabled         =   0   'False
      Height          =   300
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   1650
   End
   Begin VB.TextBox Text1 
      Height          =   795
      Left            =   4680
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   1560
      Visible         =   0   'False
      Width           =   4320
   End
   Begin MSComctlLib.TabStrip TabStrip1 
      Height          =   8295
      Left            =   4320
      TabIndex        =   6
      Top             =   120
      Width           =   7095
      _ExtentX        =   12515
      _ExtentY        =   14631
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   3
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Диаграмма"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Список"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Отчет"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim al As AttrList
 '= 1049
Const ServerName = "LOCAL"                                    'Servername
Const FilterGUID = "DD838074-AC29-11D4-85B8-00005A4053FF"
Const UserName = "system"                                     'Username
Const Password = "manager"                                    'Password


Private Sub cmdAris2Mtz_Click()
Dim o As Object
Set o = database.FindOID(tv.SelectedItem.Key)
'ShowAttr o.AttrList(LocaleID)
If tv.SelectedItem.Tag = "Model" Then
  SaveAris2Mtz o
  
End If
End Sub

Private Sub cmdConnect_Click()

Set aris = CreateObject("ARIS.Application.6.2")
Set report = aris.GetComponent("Report")

Dim ab As New ARIS_BASIC_Extension

Dim i As Long, j As Long
Dim slist() As String
Dim slist2() As String
slist = report.GetServerNames
cmbBase.Clear
'For i = LBound(slist) To UBound(slist)
'  Text1.Text = Text1.Text & vbCrLf & "srv=" & slist(i)
'  slist2 = report.GetDatabaseNames(slist(i))
  slist2 = report.GetDatabaseNames("LOCAL")
  For j = LBound(slist2) To UBound(slist2)
    Text1.Text = Text1.Text & vbCrLf & "DB=" & slist2(j)
    cmbBase.AddItem slist2(j)
  Next
'Next
cmdConnect.Enabled = False
cmdUse.Enabled = True
cmdDisconnect.Enabled = True
If cmbBase.ListCount > 0 Then cmbBase.ListIndex = 0
cmbLang.ListIndex = 0
End Sub

Private Sub cmdMTZ2Aris_Click()
frmMtz2ArisOpt.Show vbModal
If frmMtz2ArisOpt.ok Then
  With frmMtz2ArisOpt
  optOrg = .chkorg.Value = vbChecked
  optDoc = .chkDoc.Value = vbChecked
  optDocSt = .chkDocState.Value = vbChecked
  optProc = .chkProcess.Value = vbChecked
  optFType = .chkFieldType.Value = vbChecked
  
  End With
  MTZ2Aris
  cmdExplorer_Click
End If
End Sub

Private Sub cmdDisconnect_Click()
  Set database = Nothing
  Set report = Nothing
  Set aris = Nothing
  tv.Nodes.Clear
  cmbBase.Clear
  gr.Rows = 1
  pic1.Picture = LoadPicture()
  Text1.Text = ""
  cmdUse.Enabled = False
  cmdConnect.Enabled = True
  cmdDisconnect.Enabled = False
  cmdMTZ2Aris.Enabled = False
  cmdAris2Mtz.Enabled = False

End Sub

Private Sub cmdUse_Click()
On Error Resume Next

If aris Is Nothing Then Exit Sub
If report Is Nothing Then Exit Sub
If cmbBase.ListIndex = -1 Then
  MsgBox "Надо выбрать базу данных"
  Exit Sub
End If

If cmbLang.ListIndex = -1 Then
  MsgBox "Надо выбрать язык"
  Exit Sub
End If
LocaleID = cmbLang.ItemData(cmbLang.ListIndex)

Dim i As Long, j As Long
Set database = report.database(ServerName, cmbBase.Text, FilterGUID, UserName, Password, LocaleID)
'Set database = report.database(ServerName, SourceDB, FilterGUID, UserName, Password, 1033)
If database Is Nothing Then
  MsgBox Err.Description & " База данных не открыта"
  Exit Sub
End If
On Error Resume Next
Set al = database.AttrList(LocaleID)

Dim att As Attr
For i = 0 To al.Count - 1
  Set att = al.Get(i)
  Text1.Text = Text1.Text & vbCrLf & att.Type & "=" & att.Value
Next
cmdExplorer_Click
cmdMTZ2Aris.Enabled = True
cmdAris2Mtz.Enabled = True
End Sub

Private Sub cmdExplorer_Click()
Dim gr As Group
If database Is Nothing Then Exit Sub
Set gr = database.RootGroup
Dim grl As GroupList
Dim Node As Node
  tv.Nodes.Clear
  tv.ImageList = ImageList1
  Set Node = tv.Nodes.Add(, , gr.ObjectID(2), gr.Name(LocaleID), 1)
  Node.Tag = "Group"
  Set grl = gr.Childs
  On Error Resume Next
  fillmodel Node, gr.ModelList
  'filltable Node, gr.TableList
  
  Call fillgroup(Node, grl)

End Sub

Private Sub fillgroup(n As Node, grl As GroupList)
Dim i As Long
Dim gr As Group
Dim Node As Node
For i = 0 To grl.Count - 1
  Set gr = grl.Get(i)
  Set Node = tv.Nodes.Add(n.Key, tvwChild, gr.ObjectID(2), gr.Name(LocaleID), 1)
  Node.Tag = "Group"
  fillgroup Node, gr.Childs
  fillmodel Node, gr.ModelList
  filltable Node, gr.TableList
Next
End Sub

Private Sub fillmodel(n As Node, ml As ModelList)
Dim i As Long
Dim m As model
Dim Node As Node
For i = 0 To ml.Count - 1
  Set m = ml.Get(i)
  Set Node = tv.Nodes.Add(n, tvwChild, m.ObjectID(2), m.Name(LocaleID), 3)
  Node.Tag = "Model"
Next
End Sub

Private Sub filltable(n As Node, ml As TableList)
Dim i As Long
Dim m As Table
Dim Node As Node
For i = 0 To ml.Count - 1
  Set m = ml.Get(i)
  Set Node = tv.Nodes.Add(n, tvwChild, m.ObjectID(2), m.Name(LocaleID), 2)
  Node.Tag = "Table"
Next
End Sub

Private Sub ShowAttr(al As AttrList)
Dim att As Attr
Dim i As Long
Text1.Text = ""
For i = 0 To al.Count - 1
  Set att = al.Get(i)
  Text1.Text = Text1.Text & vbCrLf & att.Type & "=" & att.Value
Next
End Sub

Private Sub Form_Load()
Set TabStrip1.SelectedItem = TabStrip1.Tabs.Item(3)
End Sub

Private Sub TabStrip1_Click()
fr.Visible = False
gr.Visible = False
Text1.Visible = False
If TabStrip1.SelectedItem.Index = 1 Then
  fr.Visible = True
  fr.Top = TabStrip1.ClientTop
  fr.Left = TabStrip1.ClientLeft
  fr.Height = TabStrip1.ClientHeight
  fr.Width = TabStrip1.ClientWidth
  pic1.Top = 0
  pic1.Left = 0
  pic1.Width = fr.Width
  pic1.Height = fr.Height
End If
If TabStrip1.SelectedItem.Index = 2 Then
  gr.Visible = True
  gr.Top = TabStrip1.ClientTop
  gr.Left = TabStrip1.ClientLeft
  gr.Height = TabStrip1.ClientHeight
  gr.Width = TabStrip1.ClientWidth
End If
If TabStrip1.SelectedItem.Index = 3 Then
  Text1.Visible = True
  Text1.Top = TabStrip1.ClientTop
  Text1.Left = TabStrip1.ClientLeft
  Text1.Height = TabStrip1.ClientHeight
  Text1.Width = TabStrip1.ClientWidth
End If

End Sub

Private Sub tv_NodeClick(ByVal Node As MSComctlLib.Node)
On Error Resume Next
Dim o As Object
Set o = database.FindOID(Node.Key)
ShowAttr o.AttrList(LocaleID)
If Node.Tag = "Model" Then
  ShowModel o
  
End If
End Sub

Private Sub ShowModel(m As ATDRepDb.model)
Dim obcc As ObjOcc
Dim obd As ObjDef
Dim obl As ObjOccList
Dim cn As CxnOcc
Dim c As Cxn
Dim cnl As CxnOccList
Dim nvs As NamedValues
Dim nvs1 As NamedValues
'Dim nvs2 As NamedValues
Dim nv As NamedValue
Set nvs = New NamedValues
Set nvs1 = New NamedValues
'Set nvs2 = New NamedValues
Dim pic As ATDRepDb.Picture
Set pic = m.Graphic(False, False, LocaleID)
pic.Save (App.Path & "\tmp.jpg")
pic1.Picture = LoadPicture(App.Path & "\tmp.jpg")
DoEvents

Dim i As Long, j As Long
Set obl = m.ObjOccList


gr.Rows = 1
gr.Cols = 6
Form1.pb.Min = 0
Form1.pb.Max = obl.Count
Form1.pb.Value = 0
Form1.pb.Visible = True
For i = 0 To obl.Count - 1
  Form1.pb.Value = i
  gr.Rows = gr.Rows + 1
  Set obcc = obl.Get(i)
  obcc.SymbolNum
  Set obd = obcc.ObjDef
  gr.TextMatrix(gr.Rows - 1, 0) = "объект"
  gr.TextMatrix(gr.Rows - 1, 1) = obd.Name(LocaleID)
  gr.TextMatrix(gr.Rows - 1, 2) = obd.Type
  gr.TextMatrix(gr.Rows - 1, 3) = obd.TypeNum
  gr.TextMatrix(gr.Rows - 1, 4) = obcc.SymbolName
  gr.TextMatrix(gr.Rows - 1, 5) = obcc.SymbolNum
  On Error Resume Next
  'Call nvs.Add("otype:" & obd.Type, "public const " & MakeValidName(Trim(m.Type & "_T_" & obd.Type)) & "=" & obd.TypeNum)
  'Call nvs1.Add("stype:" & obcc.SymbolName, "public const " & MakeValidName(Trim(m.Type & "_S_" & obcc.SymbolName)) & "=" & obcc.SymbolNum)
  Call nvs.Add(obd.Type & ":" & obcc.SymbolName, _
  "public function " & MakeValidName(m.Type) & "_" & MakeValidName(obcc.SymbolName) & "( cat as group, mdl as model, byval caption as string) as objocc " & _
  vbCrLf & "on error resume next " & _
  vbCrLf & "Dim cls As ObjDef " & _
  vbCrLf & "Set cls = cat.CreateObjDef(" & obd.TypeNum & ", caption, LocaleID)" & _
  vbCrLf & "Set " & MakeValidName(m.Type) & "_" & MakeValidName(obcc.SymbolName) & " = mdl.CreateObjOcc(" & obcc.SymbolNum & ", cls, 1, 1, False)" & _
  vbCrLf & "end function")
 
  On Error GoTo 0
  
  Set cnl = obcc.OutEdges(EDGES_ALL)
  'EDGES_ALL: evaluate all relationships
  'EDGES_STRUCTURE: only evaluate structurally relevant relationships
  'EDGES_NONSTRUCTURE: only evaluate non-structurally relevant relationships.
  
  For j = 0 To cnl.Count - 1
    Set cn = cnl.Get(j)
    Set c = cn.Cxn
    gr.Rows = gr.Rows + 1
    gr.TextMatrix(gr.Rows - 1, 0) = "связь"
    gr.TextMatrix(gr.Rows - 1, 1) = c.Name(LocaleID)
    gr.TextMatrix(gr.Rows - 1, 2) = c.ActiveType
    gr.TextMatrix(gr.Rows - 1, 3) = c.TypeNum
    
    On Error Resume Next
    Call nvs1.Add("link:" & c.ActiveType, "public const " & MakeValidName(Trim(m.Type & "_L_" & c.ActiveType)) & "=" & c.TypeNum)
    On Error GoTo 0
  Next
  
  
Next
Form1.pb.Visible = False
Text1.Text = "const " & MakeValidName(m.Type) & " =" & m.TypeNum & vbCrLf
For j = 1 To nvs.Count
    Set nv = nvs.Item(j)
    Text1.Text = Text1.Text & vbCrLf & nv.Value
Next
For j = 1 To nvs1.Count
    Set nv = nvs1.Item(j)
    Text1.Text = Text1.Text & vbCrLf & nv.Value
Next

End Sub
