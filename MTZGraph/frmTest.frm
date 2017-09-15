VERSION 5.00
Object = "{977E00DE-73F3-4EDE-9EA4-56BD3EA46E00}#5.0#0"; "MTZGraph.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form Form1 
   Caption         =   "”правление маршрутом"
   ClientHeight    =   8355
   ClientLeft      =   3255
   ClientTop       =   2310
   ClientWidth     =   9645
   Icon            =   "frmTest.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   8355
   ScaleWidth      =   9645
   Begin MTZGraph.GraphPanel p 
      Height          =   3975
      Left            =   240
      TabIndex        =   1
      Top             =   1080
      Width           =   6135
      _extentx        =   10821
      _extenty        =   7011
   End
   Begin MSComDlg.CommonDialog dlg 
      Left            =   3000
      Top             =   7200
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   660
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9645
      _ExtentX        =   17013
      _ExtentY        =   1164
      ButtonWidth     =   1032
      ButtonHeight    =   1005
      Appearance      =   1
      ImageList       =   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   9
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "start"
            ImageIndex      =   1
            Style           =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "node"
            ImageIndex      =   2
            Style           =   1
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "autonode"
            ImageIndex      =   3
            Style           =   1
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "multy"
            ImageIndex      =   4
            Style           =   1
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "and"
            ImageIndex      =   5
            Style           =   1
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "stop"
            ImageIndex      =   6
            Style           =   1
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "time"
            ImageIndex      =   7
            Style           =   1
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "process"
            ImageIndex      =   8
            Style           =   1
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "subprocess"
            ImageIndex      =   9
            Style           =   1
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   1680
      Top             =   7080
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   11
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmTest.frx":0442
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmTest.frx":06D4
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmTest.frx":0966
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmTest.frx":0BF8
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmTest.frx":0E8A
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmTest.frx":111C
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmTest.frx":13AE
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmTest.frx":1530
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmTest.frx":16B2
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmTest.frx":1834
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmTest.frx":1AC6
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuNew 
         Caption         =   "New"
      End
      Begin VB.Menu mnuLoad 
         Caption         =   "Load"
      End
      Begin VB.Menu mnuSave 
         Caption         =   "Save"
      End
      Begin VB.Menu mnuSep 
         Caption         =   "-"
      End
      Begin VB.Menu mnuToMain 
         Caption         =   "To main page"
      End
   End
   Begin VB.Menu mnuControl 
      Caption         =   "Control"
      Begin VB.Menu mnuDisablegRAPH 
         Caption         =   "DisableGraph"
      End
      Begin VB.Menu mnuEnableGraph 
         Caption         =   "Enable graph"
      End
      Begin VB.Menu mnuExportImage 
         Caption         =   "Export Image"
      End
      Begin VB.Menu mnuFImage 
         Caption         =   "Export Form Image"
      End
      Begin VB.Menu mnuDecompose 
         Caption         =   "Allow Decomposition"
         Checked         =   -1  'True
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim iii As Integer
Dim ToolBarButton As Integer

Private Declare Function CoCreateGuid Lib "OLE32.DLL" (pGUID As GUID) As Long
Private Declare Function StringFromGUID2 Lib "OLE32.DLL" (pGUID As GUID, ByVal S As String, ByVal sz As Long) As Long
Private Type GUID
   Data1 As Long
   Data2 As Integer
   Data3 As Integer
   Data4(7) As Byte
End Type




Public Function CreateGUID2() As String

 On Error GoTo bye
 Dim g As GUID, S As String * 80, i As Long, j As Long
 Dim lpBuf As Long, out As String
 
 S = Space(80) & Chr(0)
 
 CoCreateGuid g
 i = StringFromGUID2(g, S, 80)
 
  For j = 1 To 38
    out = out & Mid(S, j * 2 - 1, 1)
  Next
  CreateGUID2 = out
bye:
End Function


Private Sub Form_Load()
    'Set p.ImageList = ImageList1
    Dim i As Integer
    For i = 19 To 1 Step -1
        Call p.LoadImage(App.Path & "\ICO\" & i & ".ico", 20 - i, "IMG" & i)
    Next
End Sub

Private Sub Form_Resize()
On Error Resume Next
p.Top = Toolbar1.Height
p.Left = 0
p.Width = Me.ScaleWidth
p.Height = Me.ScaleHeight - Toolbar1.Height
End Sub


Private Sub mnuDecompose_Click()
    p.AllowDecomposition = Not p.AllowDecomposition
    mnuDecompose.Checked = p.AllowDecomposition
End Sub

Private Sub mnuDisablegRAPH_Click()
p.GraphEnabled = False
End Sub

Private Sub mnuEnableGraph_Click()
p.GraphEnabled = True
End Sub

Private Sub mnuExportImage_Click()
    p.ExportImage App.Path & "\test.bmp"
End Sub

Private Sub mnuFImage_Click()
p.ExportFormImage App.Path & "\test2.bmp"
End Sub

Private Sub mnuLoad_Click()
  dlg.Filter = "graph files|*.grf"
  dlg.Flags = cdlOFNFileMustExist + cdlOFNHideReadOnly
  dlg.ShowOpen
  If dlg.FileName <> "" Then
    p.ReadProjectFromFile dlg.FileName
    
  End If
End Sub

Private Sub mnuNew_Click()
    p.SelectGraph p.ProjectInfo.Item(1).id
    p.ClearAllEntity
End Sub

Private Sub mnuSave_Click()
  dlg.Filter = "graph files|*.grf"
  dlg.Flags = cdlOFNOverwritePrompt + cdlOFNPathMustExist
  dlg.ShowSave
  If dlg.FileName <> "" Then
    Debug.Print p.SaveProjectToString()
    p.SaveProjectToFile dlg.FileName
    MsgBox "Saved!", vbOKOnly
  End If
End Sub

Private Sub mnuToMain_Click()
    p.SelectGraph p.ProjectInfo.Item(1).id
End Sub

Private Sub p_CanvasMouseDown(ByVal button As Integer, ByVal shift As Integer, ByVal x As Double, ByVal y As Double)
If button = 1 And shift = 0 Then
    If ToolBarButton > 0 Then
        Dim id As String
        id = p.NewEntity2("new node", 0, "IMG" & ToolBarButton, x, y, CreateGUID2, ToolBarButton = 9)
       ' Set p.GraphInfo.Nodes.Item(id).Picture = Image1(0).Picture
        
        
        Toolbar1.Buttons.Item(ToolBarButton).Value = tbrUnpressed
        
        ToolBarButton = 0
    End If
End If

End Sub

Private Sub p_EdgeClick(e As MTZGraph.Edge)
  'MsgBox "Edge Click", vbOKOnly, e.FromNode.Caption & "->" & e.ToNode.Caption
End Sub

Private Sub p_EditEdgeClick(e As MTZGraph.Edge)
 e.ToolTipText = InputBox("Edge Name:", "Edge edit", e.ToolTipText)
End Sub

Private Sub p_EditNodeClick(n As MTZGraph.Node)
  n.Caption = InputBox("Node Name:", "Node edit", n.Caption)
End Sub

Private Sub p_ModeChanged(Link As Boolean, Move As Boolean)
If Not Link Then
    Toolbar1.Buttons(11).Value = tbrUnpressed
Else
    Toolbar1.Buttons(11).Value = tbrPressed
End If
If Not Move Then
    Toolbar1.Buttons(12).Value = tbrUnpressed
Else
    Toolbar1.Buttons(12).Value = tbrPressed
End If

End Sub

Private Sub p_NodeClick(n As MTZGraph.Node)
  'MsgBox "Node Click", vbOKOnly, n.Caption
End Sub

Private Sub p_NodeDblClick(n As MTZGraph.Node)
' iii = iii + 1
 'If iii = ImageList1.ListImages.Count + 1 Then iii = 1
'
' n.ImageIndex = iii
' p.Repaint
    n.Caption = InputBox("Node Name:", "Node edit", n.Caption)
End Sub

Private Sub Toolbar1_ButtonClick(ByVal button As MSComctlLib.button)
If button.Image <= 9 Then
    Dim i As Integer
    For i = 1 To 9
      If button.Image <> i Then
        Toolbar1.Buttons.Item(i).Value = tbrUnpressed
      End If
    Next
    ToolBarButton = button.Image
End If



'p.GraphInfo.Nodes(id).ImageIndex = Button.Image
'p.Repaint
End Sub
