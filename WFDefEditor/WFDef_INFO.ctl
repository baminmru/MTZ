VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.0#0"; "MTZ_PANEL.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{977E00DE-73F3-4EDE-9EA4-56BD3EA46E00}#6.0#0"; "MTZGraph.ocx"
Begin VB.UserControl WFDef_INFO 
   ClientHeight    =   7680
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8190
   ScaleHeight     =   7680
   ScaleWidth      =   8190
   Begin MTZ_PANEL.HFrames panel 
      Height          =   5775
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6135
      _ExtentX        =   10821
      _ExtentY        =   10186
      Begin VB.Frame sframe 
         Height          =   4815
         Left            =   120
         TabIndex        =   2
         Top             =   960
         Width           =   6135
         Begin VB.Timer Timer1 
            Enabled         =   0   'False
            Interval        =   3000
            Left            =   5280
            Top             =   4200
         End
         Begin VB.TextBox txtDescription 
            Height          =   360
            Left            =   120
            ScrollBars      =   3  'Both
            TabIndex        =   4
            ToolTipText     =   "Описание"
            Top             =   360
            Width           =   5040
         End
         Begin MTZGraph.GraphPanel p 
            Height          =   3135
            Left            =   120
            TabIndex        =   3
            Top             =   840
            Width           =   5535
            _ExtentX        =   9763
            _ExtentY        =   5530
         End
         Begin VB.Label lblDescription 
            BackStyle       =   0  'Transparent
            Caption         =   "Описание"
            ForeColor       =   &H00FF0000&
            Height          =   300
            Left            =   120
            TabIndex        =   5
            Top             =   120
            Width           =   3000
         End
      End
      Begin MSComctlLib.Toolbar Toolbar1 
         Height          =   630
         Left            =   0
         TabIndex        =   1
         Top             =   0
         Width           =   5955
         _ExtentX        =   10504
         _ExtentY        =   1111
         ButtonWidth     =   1032
         ButtonHeight    =   1005
         AllowCustomize  =   0   'False
         Appearance      =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
      End
      Begin MSComctlLib.ImageList ImageList1 
         Left            =   5160
         Top             =   480
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   32
         ImageHeight     =   32
         MaskColor       =   12632256
         _Version        =   393216
      End
   End
End
Attribute VB_Name = "WFDef_INFO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Public rItem As WFDEf.Application
Public Dic As WFDic.Application
Dim ToolBarButton As Long
Dim UpdateDisabled As Boolean
Public item As Object
Private OnInit As Boolean
Public Event Changed()

Private Sub panel_MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  Toolbar1.Left = 0
  Toolbar1.Top = 0
  Toolbar1.Width = Width
  On Error Resume Next
  If Height < Toolbar1.Height Then
  panel.SpliterPosition = Toolbar1.Height + 10 * Screen.TwipsPerPixelY
  End If
End Sub

Private Sub panel_SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
  On Error Resume Next
  sframe.Top = Top
  sframe.Left = Left
  sframe.Width = Width
  sframe.Height = Height
  p.Width = sframe.Width - 8 * Screen.TwipsPerPixelY
  p.Height = sframe.Height - p.Top
End Sub


Private Sub Usercontrol_resize()
  On Error Resume Next
  panel.Left = 0
  panel.Top = 0
  panel.Width = UserControl.Width
  panel.Height = UserControl.Height
  
End Sub

Private Sub txtDiagram_Change()
  Changing
End Sub
Private Sub txtDescription_Change()
  Changing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

  IsOK = mIsOK
End Function
Public Sub InitPanel()
OnInit = True
Dim iii As Long ' for combo only
If item.CanChange Then
  sframe.Enabled = True
Else
  sframe.Enabled = False
End If
Init item.Application

txtDescription = item.the_Description
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub
 item.Diagram = p.SaveProjectToString()
 item.the_Description = txtDescription
 RaiseEvent Changed
End Sub
 Public Sub OptimalSize(x As Single, y As Single)
   
 End Sub
 
 
 Public Function OptimalY() As Single
   
 End Function
 Public Sub Customize()
   
 End Sub
 Public Property Get PanelCustomisationString() As String
   PanelCustomisationString = ""
 End Property
 Public Property Let PanelCustomisationString(s As String)
   
 End Property
 Public Property Get Enabled() As Boolean
   Enabled = sframe.Enabled
 End Property
 Public Property Let Enabled(ByVal v As Boolean)
   sframe.Enabled = v
 End Property

Private Function IconPath(ByVal ID As String) As String
  Dim s As String
  s = ""
  s = GetSetting("MTZ", "CONFIG", "IMAGEPATH", "")
  If s = "" Then
    IconPath = App.Path & "\" & ID & ".ico"
  Else
    IconPath = s & "\" & ID & ".ico"
  End If
End Function

Private Sub Init(ObjItem As Object)
 Set rItem = ObjItem
 Dim rs As ADODB.Recordset

 Set rs = rItem.Manager.ListInstances("", "WFDic")
 If rs.RecordCount = 0 Then
  MsgBox "Отсутствует словарь  подсистемы управления процессами"
  Exit Sub
 End If
 Set Dic = rItem.Manager.GetInstanceObject(rs!InstanceID)
 Set rs = Nothing
 Dim i As Long
 On Error Resume Next
 'Dic.WFDic_func.Sort = "IconName"
 
 Dic.WFDic_func.Sort = "IconName"
 
 For i = 1 To Dic.WFDic_func.Count
  With Dic.WFDic_func.item(i)
   Call ImageList1.ListImages.Add(i, .ID, LoadPicture(IconPath(.IconName)))
   Toolbar1.Buttons.Add(i, .ID, "", tbrDefault, .ID).ToolTipText = .Name
   Call p.LoadImage(IconPath(.IconName), i, .ID)
  End With
 Next
 
 If rItem.WFDef_INFO.Count > 0 Then
  If Len(rItem.WFDef_INFO.item(1).Diagram) > 255 Then
    UpdateDisabled = True
    p.ReadProjectFromString rItem.WFDef_INFO.item(1).Diagram
    UpdateDisabled = False
  End If
 End If
 
 Usercontrol_resize
' If rItem.IsLocked = NoLock Then
'  UpdateDisabled = True
'  p.GraphEnabled = True
'  Toolbar1.Enabled = True
' End If
 
End Sub


Private Sub p_EdgeAdd(fn As MTZGraph.Node, tn As MTZGraph.Node, e As MTZGraph.Edge)
  If UpdateDisabled Then Exit Sub
  On Error GoTo bye
  
  With rItem.WFDef_links.Add(e.ID)
    Set .FromFunction = rItem.WFDef_func.item(fn.ID)
    Set .ToFunc = rItem.WFDef_func.item(tn.ID)
    .AcceptAnyResults = Boolean_Da
    .Save
  End With
  SaveDiagram
  Exit Sub
bye:
  fn.Edges.Remove (e.ID)
  UpdateDisabled = True
  p.ReadProjectFromString rItem.WFDef_INFO.item(1).Diagram
  UpdateDisabled = False
End Sub

Private Sub p_EdgeDelete(e As MTZGraph.Edge)
  If UpdateDisabled Then Exit Sub
  SaveDiagram
  With rItem.WFDef_links.item(e.ID)
    .Delete
  End With
End Sub

Private Sub p_NodeAdd(n As MTZGraph.Node)
  If UpdateDisabled Then Exit Sub
  SaveDiagram
  Dim ID As String, i As Long
  ID = CreateGUID2
  Dim WFFD As WFFD.Application
  
  If rItem.Application.Manager.NewInstance(ID, "WFFD", "WFFD " & Now) Then
    Set WFFD = rItem.Application.Manager.GetInstanceObject(ID)
    
    With rItem.WFDef_func.Add(n.ID)
      Set .Func = WFFD
      .Save
    End With
    
    ' жесткая привязка
    rItem.Application.MTZSession.SetOwner ID, "WFDef_func", n.ID
    
    With WFFD.WFFD_common.Add()
      .Name = n.Caption
      Set .StepType = Dic.WFDic_func.item(n.ImageKey)
      .AutoCheckState = Boolean_Net
      .ReuseStep = Boolean_Net
      .MinPriority = 0
      .MaxPriority = 0
      .IncPriority = 0
      .GrowPriorityInterval = 0
      .StateCeckInterval = 0
      .ReStartInterval = 0
      .Save
    End With
    
    If Dic.WFDic_func.item(n.ImageKey).WFDic_presets.Count > 0 Then
      For i = 1 To Dic.WFDic_func.item(n.ImageKey).WFDic_presets.Count
        On Error Resume Next
        With Dic.WFDic_func.item(n.ImageKey).WFDic_presets.item(i)
          CallByName WFFD.WFFD_common.item(1), .Name, VbLet, .the_Value
        End With
      Next
      WFFD.WFFD_common.item(1).Save
    End If
    
  End If
End Sub

Private Sub p_NodeDelete(n As MTZGraph.Node)
  If UpdateDisabled Then Exit Sub
  SaveDiagram
  On Error Resume Next
  rItem.WFDef_func.Delete (n.ID)
  rItem.Application.Manager.DeleteInstance rItem.WFDef_func.item(n.ID).Func.ID
End Sub

Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
 Dim i As Long
 Timer1.Enabled = False
 For i = 1 To Toolbar1.Buttons.Count
  If Toolbar1.Buttons.item(i).Value = tbrPressed Then
    Toolbar1.Buttons.item(i).Value = tbrUnpressed
    DoEvents
  End If
 Next
 Toolbar1.Refresh
 
 ToolBarButton = 0
 If Button Is Nothing Then Exit Sub
 Button.Value = tbrPressed
 Timer1.Enabled = True
 ToolBarButton = Button.Index
 Toolbar1.Refresh
End Sub

Private Sub Timer1_Timer()
ToolBarButton = 0
Toolbar1_ButtonClick Nothing
Timer1.Enabled = False
End Sub


Private Sub p_CanvasMouseDown(ByVal Button As Integer, ByVal Shift As Integer, ByVal x As Double, ByVal y As Double)
  If Button = 1 And Shift = 0 Then
      If ToolBarButton > 0 Then
          Dim ID As String
          ID = p.NewEntity2("new " & Toolbar1.Buttons.item(ToolBarButton).Caption, 0, Dic.WFDic_func.item(ToolBarButton).ID, x, y, CreateGUID2)
          Toolbar1.Buttons.item(ToolBarButton).Value = tbrUnpressed
          ToolBarButton = 0
      End If
  End If
  Dim i
  For i = 1 To Toolbar1.Buttons.Count
    Toolbar1.Buttons.item(i).Value = tbrUnpressed
  Next
End Sub

Private Sub p_EdgeClick(e As MTZGraph.Edge)
  'MsgBox "Edge Click", vbOKOnly, e.FromNode.Caption & "->" & e.ToNode.Caption
End Sub

Private Sub p_EditEdgeClick(e As MTZGraph.Edge)
 Dim f As frmEditLink
 Set f = New frmEditLink
 Dim e2 As Object
 Set e2 = rItem.WFDef_links.item(e.ID)
 If e2 Is Nothing Then Exit Sub
 Set f.item = e2
 f.panel.OnInit e2, f
 f.Show
 
 
End Sub

Private Sub p_EditNodeClick(n As MTZGraph.Node)
   On Error Resume Next
   EditNode n.ID, True
   n.Caption = rItem.WFDef_func.item(n.ID).Func.WFFD_common.item(1).Name
End Sub

Private Sub p_ModeChanged(Link As Boolean, Move As Boolean)
  'MsgBox "ModeChanged", vbOKOnly
End Sub

Private Sub p_NodeClick(n As MTZGraph.Node)
  'MsgBox "Node Click", vbOKOnly, n.Caption
End Sub

Private Sub p_NodeDblClick(n As MTZGraph.Node)
    'n.Caption = InputBox("Node Name:", "Node edit", n.Caption)
    On Error Resume Next
    EditNode n.ID
    n.Caption = rItem.WFDef_func.item(n.ID).Func.WFFD_common.item(1).Name
End Sub

Private Sub EditNode(ByVal ID As String, Optional NoMode As Boolean = False)
On Error Resume Next
    Dim u As WFDEf.WFDef_func
    Set u = rItem.FindRowObject("WFDef_func", ID)
    Dim objGui As Object
    Dim wfff As WFFD.Application
    Dim ftype As WFDic_func
    Set wfff = u.Func
    Set ftype = wfff.WFFD_common.item(1).StepType
    If NoMode Then
      Set objGui = rItem.Manager.GetInstanceGUI(u.Func.ID)
      objGui.Show "", u.Func, True
    Else
      If ftype.ProgId = "" Then
          Set objGui = rItem.Manager.GetInstanceGUI(u.Func.ID)
      Else
        Set objGui = CreateObject(ftype.ProgId)
      End If
      objGui.Show ftype.EdtMode, u.Func, True
    End If
    Set objGui = Nothing
End Sub

Private Sub SaveDiagram()
    If rItem.WFDef_INFO.Count = 0 Then
      rItem.WFDef_INFO.Add
    End If
    rItem.WFDef_INFO.item(1).Diagram = p.SaveProjectToString()
    rItem.WFDef_INFO.item(1).Save

End Sub
