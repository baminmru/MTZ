VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl GraphPanel 
   ClientHeight    =   5955
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7980
   ClipControls    =   0   'False
   FillStyle       =   0  'Solid
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   8.25
      Charset         =   204
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   ScaleHeight     =   5955
   ScaleWidth      =   7980
   ToolboxBitmap   =   "GraphPanel.ctx":0000
   Begin MSComctlLib.ImageList GImageList 
      Left            =   360
      Top             =   4560
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
   End
   Begin VB.VScrollBar VScroll1 
      Height          =   3855
      Left            =   5820
      TabIndex        =   3
      TabStop         =   0   'False
      Top             =   0
      Width           =   255
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   120
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   3840
      Width           =   5655
   End
   Begin VB.Frame panel 
      BackColor       =   &H80000001&
      BorderStyle     =   0  'None
      ClipControls    =   0   'False
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2895
      Left            =   0
      TabIndex        =   1
      Top             =   240
      Width           =   5325
      Begin MTZGraph.CBorder Entity 
         Height          =   900
         Index           =   0
         Left            =   3480
         TabIndex        =   4
         Top             =   1680
         Visible         =   0   'False
         Width           =   1095
         _ExtentX        =   1931
         _ExtentY        =   1588
         Caption         =   "объект"
         BackColor       =   -2147483633
         Decomposition   =   0   'False
      End
      Begin VB.Line LinkLine 
         BorderColor     =   &H0000FF00&
         Visible         =   0   'False
         X1              =   2760
         X2              =   4200
         Y1              =   1440
         Y2              =   1560
      End
      Begin VB.Line Lines 
         Index           =   0
         Visible         =   0   'False
         X1              =   810
         X2              =   2610
         Y1              =   360
         Y2              =   960
      End
      Begin VB.Line HLine1 
         BorderStyle     =   3  'Dot
         DrawMode        =   3  'Not Merge Pen
         Visible         =   0   'False
         X1              =   720
         X2              =   2100
         Y1              =   1560
         Y2              =   1560
      End
      Begin VB.Line HLine2 
         BorderStyle     =   3  'Dot
         DrawMode        =   3  'Not Merge Pen
         Visible         =   0   'False
         X1              =   720
         X2              =   2100
         Y1              =   2040
         Y2              =   2040
      End
      Begin VB.Line VLine2 
         BorderStyle     =   3  'Dot
         DrawMode        =   3  'Not Merge Pen
         Visible         =   0   'False
         X1              =   2100
         X2              =   2100
         Y1              =   2040
         Y2              =   1560
      End
      Begin VB.Line VLine1 
         BorderStyle     =   3  'Dot
         DrawMode        =   3  'Not Merge Pen
         Visible         =   0   'False
         X1              =   720
         X2              =   720
         Y1              =   1560
         Y2              =   1980
      End
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H8000000B&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   435
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1755
   End
   Begin VB.Menu mnuNode 
      Caption         =   "Node"
      Begin VB.Menu mnuNodeEdit 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuDeleteObject 
         Caption         =   "Удалить"
      End
      Begin VB.Menu mnusep 
         Caption         =   "-"
      End
      Begin VB.Menu mnuDecompose 
         Caption         =   "Подпроцес"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuRemoveDecomposition 
         Caption         =   "Удалить подпроцесс"
      End
   End
   Begin VB.Menu mnuEdge 
      Caption         =   "Edge"
      Begin VB.Menu mnuEditEdge 
         Caption         =   "Свойства"
      End
      Begin VB.Menu mnuDeleteEdge 
         Caption         =   "Удалить"
      End
   End
   Begin VB.Menu mnuApp 
      Caption         =   "App"
      Begin VB.Menu mnuActualSize 
         Caption         =   "100%"
      End
      Begin VB.Menu mnuZoom 
         Caption         =   "Увеличение"
      End
      Begin VB.Menu mnuZoomIn 
         Caption         =   "Увеличить"
      End
      Begin VB.Menu mnuZoomOut 
         Caption         =   "Уменьшить"
      End
      Begin VB.Menu s1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuCopy 
         Caption         =   "Копировать"
      End
      Begin VB.Menu mnuPaste 
         Caption         =   "Вставить"
         Enabled         =   0   'False
      End
      Begin VB.Menu s3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuParent 
         Caption         =   "На уровень выше"
      End
      Begin VB.Menu mnuClearAll 
         Caption         =   "Удлить все"
      End
   End
End
Attribute VB_Name = "GraphPanel"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private CurX As Long, CurY As Long
Private CenterX As Long, CenterY As Long, CurScale As Double
Private W As Double, H As Double
Private MaxLines As Long, LoadedLines As Long
Private CurrentEntity As Long
Private gr As Graph
Private CntObj As Long
Private mvarSelectedEdge As Edge
Private m_bAllowDecomposition As Boolean
'Private SelectX, SelectY As Integer
Private BufferNodes As Nodes
Private LinkFrom As Integer, LinkTo As Integer

'Private HMax, HMin, VMax, VMin As Integer

Event NodeClick(n As Node)
Event EdgeAdd(fn As Node, tn As Node, e As Edge)
Event EdgeClick(e As Edge)
Event NodeDblClick(n As Node)
Event EditEdgeClick(e As Edge)
Event EditNodeClick(n As Node)
Event NodeDelete(n As Node)
Event EdgeDelete(e As Edge)
Event NodeAdd(n As Node)
Event CanvasMouseDown(ByVal Button As Integer, ByVal Shift As Integer, ByVal x As Double, ByVal y As Double)
Event EMouseMove(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
'Property Variables:
Private m_ImageList As Object
Private grs As Graphs



Public Property Get SelectedEdge() As Edge
  Set SelectedEdge = mvarSelectedEdge
End Property

Public Property Set SelectedEdge(ByVal vNewValue As Edge)
  Dim n As Node
  Dim e As Edge
  Dim l As LineItem
  If vNewValue Is Nothing Then
    Set mvarSelectedEdge = Nothing
    Exit Property
  End If
  For Each n In gr.Nodes
    For Each e In n.Edges
      If e.id = vNewValue.id Then
        Set mvarSelectedEdge = e
        GoTo found
      End If
      Next
  Next
found:
  RepaintLines
End Property


Private Sub Entity_Click(Index As Integer)
  RaiseEvent NodeClick(FindNode(Index))
End Sub

Private Sub Entity_DblClick(Index As Integer)
  RaiseEvent NodeDblClick(FindNode(Index))
End Sub

Private Sub Entity_GotFocus(Index As Integer)
  CurrentEntity = Index
  Entity(Index).BSelect
End Sub

Private Sub Entity_LinkMouseDown(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
LinkFrom = Index
LinkLine.X1 = x + Entity(Index).Left
LinkLine.Y1 = y + Entity(Index).Top
LinkLine.X2 = x + Entity(Index).Left
LinkLine.Y2 = y + Entity(Index).Top
LinkLine.ZOrder
LinkLine.Visible = True
End Sub

Private Sub Entity_LinkMouseMove(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
  LinkLine.X2 = x + Entity(Index).Left
  LinkLine.Y2 = y + Entity(Index).Top
  LinkLine.ZOrder
End Sub

Private Sub Entity_LinkMouseUp(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
  LinkLine.Visible = False
  Dim fn As Node, tn As Node, e As Edge
  Set fn = FindNode(LinkFrom)
  For Each tn In gr.Nodes
    If tn.Control.Top <= LinkLine.Y2 And LinkLine.Y2 <= tn.Control.Top + tn.Control.Height Then
      If tn.Control.Left <= LinkLine.X2 And LinkLine.X2 <= tn.Control.Left + tn.Control.Width Then
      Set e = fn.Edges.Add(Util.CreateGUID2, fn, tn)
      FirstPoint = 0
      RepaintNode fn
      FirstPoint = 0
      RaiseEvent EdgeAdd(fn, tn, e)
      Exit Sub
      End If
    End If
  Next
  LinkFrom = -1
End Sub

Private Sub Entity_LostFocus(Index As Integer)
  CurrentEntity = 0
  Entity(Index).BDeSelect
End Sub


Private Sub Entity_MouseMove(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
  RaiseEvent EMouseMove(Index, Button, Shift, x, y)
End Sub

Private Sub Entity_Moving(Index As Integer, ByVal XStart As Double, ByVal x As Single, ByVal YStart As Double, ByVal y As Single, UserDefault As Boolean)
On Error GoTo bye:

   Dim n As Node, m As Node
   Dim X1 As Double, Y1 As Double
      
   For Each m In gr.Nodes
    If m.ControlIndex = Index Then
        If m.IsSelected Then
           X1 = (x - XStart) / CurScale
           Y1 = (y - YStart) / CurScale
            For Each n In gr.Nodes
                If n.IsSelected Then
                    n.x = n.x + X1
                    n.y = n.y + Y1
                    Call MoveObject(n)
                End If
            Next
            Call MoveObject(m)
            UserDefault = False
        End If
        Exit For
     End If
    Next
bye:
End Sub

Private Sub mnuActualSize_Click()
  Dim i As Integer
  On Error Resume Next
  CurScale = 1
  MoveObjects
  RepaintLines
End Sub



Private Sub mnuClearAll_Click()
  If gr.Nodes.Count > 0 Then
    If MsgBox("Remove all nodes and decompositions?", vbYesNo, "???") = vbYes Then
        ClearAllEntity
    End If
  End If
End Sub


Private Sub mnuCopy_Click()
On Error Resume Next
    BufferCopy
End Sub

Private Sub mnuDecompose_Click()
  If CurrentEntity > 0 Then
    Dim n As Node
    Set n = FindNode(CurrentEntity)
    If Not n Is Nothing Then
        If n.DecomposeID = "" Then
            DecomposeNode n.id
        End If
        SelectGraph n.DecomposeID
    End If
  End If
End Sub

Private Sub mnuDeleteEdge_Click()
  If SelectedEdge Is Nothing Then Exit Sub
  Dim ee As Edges
  Set ee = FindEdges(SelectedEdge.id)
  If Not ee Is Nothing Then
    RaiseEvent EdgeDelete(SelectedEdge)
    ee.Remove SelectedEdge.id
    Set SelectedEdge = Nothing
    RecalcAllNodes
    MoveObjects
  End If
End Sub

Private Sub mnuDeleteObject_Click()
Dim n As Node
    
If CurrentEntity > 0 Then
    Set n = FindNode(CurrentEntity)
    If Not n.IsSelected Then
        
        If n.DecomposeID <> "" Then
            If MsgBox("Remove node with decomposition?", vbYesNo, "???") = vbYes Then
                RemoveDecomposition n.id
                DropEntity CurrentEntity
                RaiseEvent NodeDelete(n)
            End If
        Else
            If MsgBox("Remove node?", vbYesNo, "???") = vbYes Then
                DropEntity CurrentEntity
                RaiseEvent NodeDelete(n)
            End If
        End If
        
        Call RecalcScrolls
        GoTo bye:
    End If
End If

Dim find As Boolean
find = False

For Each n In gr.Nodes
    
   If n.IsSelected Then
    If Not find Then
        If MsgBox("Remove all nodes?", vbYesNo, "???") = vbNo Then GoTo bye:
        find = True
    End If
    
        If n.DecomposeID <> "" Then
            If MsgBox("Remove node '" & n.Caption & "' with decomposition?", vbYesNo, "???") = vbYes Then
                RemoveDecomposition n.id
                DropEntity n.ControlIndex
                RaiseEvent NodeDelete(n)
            End If
        Else
            DropEntity n.ControlIndex
            RaiseEvent NodeDelete(n)
        End If
        End If
Next
        
  If find Then Call RecalcScrolls
  
bye:
  FirstPoint = 0
  WaitObject = False
End Sub

Private Sub mnuEditEdge_Click()
  If SelectedEdge Is Nothing Then Exit Sub
  RaiseEvent EditEdgeClick(SelectedEdge)
End Sub

Private Sub mnuNodeEdit_Click()
  If CurrentEntity > 0 Then
    RaiseEvent EditNodeClick(FindNode(CurrentEntity))
  End If
  
End Sub

Private Sub mnuParent_Click()
If gr.Parentid <> "" Then
    SelectGraph gr.Parentid
End If
End Sub

Private Sub mnuPaste_Click()
On Error Resume Next
    BufferPaste
End Sub


Private Sub mnuRemoveDecomposition_Click()
  If CurrentEntity > 0 Then
    Dim n As Node
    Set n = FindNode(CurrentEntity)
    If Not n Is Nothing Then
        If n.DecomposeID <> "" Then
            If MsgBox("Remove decomposition?", vbYesNo, "???") = vbYes Then
                RemoveDecomposition n.id
            End If
        End If
    End If
  End If
End Sub

Private Sub mnuZoom_Click()
    On Error Resume Next
    Dim f As New fmZoom
    f.CurScale = CurScale
    f.Show vbModal
    'InputBox("New scale:", "Zoom", Str(CurScale))
    If f.OkClicked Then
        Call Zoom(f.CurScale / CurScale)
    End If
    Unload f
    UserControl.SetFocus
End Sub

Private Sub mnuZoomIn_Click()
  Dim i As Integer
  On Error Resume Next
  Call Zoom(1.5)
End Sub

Private Sub mnuZoomOut_Click()
  Dim i As Integer
  On Error Resume Next
  Call Zoom(0.666666)
End Sub


Private Sub panel_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    Dim i As Long, curobj As Long
    Dim n As Node
    Dim e As Edge
    Dim l As LineItem
    Dim scx As Double, scy As Double
    Dim ttt As String
    ttt = ""

        scx = NodePosX(x)
        scy = NodePosY(y)

   If HLine1.Visible Then
    
        HLine1.X2 = x
        HLine2.X2 = x
        HLine2.Y1 = y
        HLine2.Y2 = y
    
        VLine1.Y2 = y
        VLine2.Y2 = y
        VLine2.X1 = x
        VLine2.X2 = x
        
  Else
        For Each n In gr.Nodes
            For Each e In n.Edges
                If e.HitTest(scx, scy) Then
                ttt = e.ToolTipText
                GoTo setttt
                End If
            Next
        Next
setttt:
    panel.ToolTipText = ttt
    End If
End Sub

Private Sub panel_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If HLine1.Visible Then
        Dim n As Node

        Dim scx As Double, scy As Double
        
        
        For Each n In gr.Nodes
            scx = DispPosX(n.x)
            scy = DispPosY(n.y)
                    
            If scx > Min(HLine1.X1, HLine1.X2) And (scx + n.W * CurScale) < Max(HLine2.X2, HLine2.X1) And _
               scy > Min(VLine1.Y1, VLine1.Y2) And (scy + n.H * CurScale) < Max(VLine2.Y1, VLine2.Y2) Then
                n.IsSelected = True
            Else
                n.IsSelected = False
            End If
        Next
    End If

    HLine1.Visible = False
    VLine1.Visible = False
    HLine2.Visible = False
    VLine2.Visible = False
End Sub

Private Function Min(ByVal X1 As Integer, ByVal X2 As Integer) As Integer
    If X1 < X2 Then Min = X1 Else Min = X2
End Function

Private Function Max(ByVal X1 As Integer, ByVal X2 As Integer) As Integer
    If X1 > X2 Then Max = X1 Else Max = X2
End Function


Private Sub UserControl_Initialize()
    Set Module1.Util = New Common
    Set grs = New Graphs
    Set gr = grs.Add(Util.CreateGUID2)
    HScroll1.Min = 0
    HScroll1.Max = 0
    VScroll1.Min = 0
    VScroll1.Max = 0
    VScroll1.Value = 0
    HScroll1.Value = 0
    CurScale = 1
    Entity(0).BackColor = panel.BackColor
'    SelectShape.Visible = False
End Sub


Private Sub panel_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  Dim i As Long, curobj As Long
  Dim n As Node
    Dim e As Edge
    Dim l As LineItem
Dim scx As Double, scy As Double
  If Button = 2 Then
    
    scx = NodePosX(x)
    scy = NodePosY(y)
    
    ' меняем стрелку на связи
    For Each n In gr.Nodes
      For Each e In n.Edges
        If e.HitTest(scx, scy) Then
          Set SelectedEdge = e
           If Shift = 0 Then
            PopupMenu mnuEdge, 0, x, y
           ElseIf Shift = 1 Then
            e.BorderStyle = e.BorderStyle + 1
            If e.BorderStyle = 6 Then e.BorderStyle = 1
            RepaintLines
           Else
            e.ER_Arrow = Not e.ER_Arrow
            Repaint
           End If
          Exit Sub
        End If
      Next
    Next
    
    'показываем меню
    If gr.Parentid = "" Then
        mnuParent.Enabled = False
    Else
        mnuParent.Enabled = True
    End If
    mnuParent.Visible = m_bAllowDecomposition
    PopupMenu mnuApp, 0, x, y
    
  End If
  
  ' новый объект
  If Button = 1 And Shift = 0 And WaitObject Then
    CntObj = CntObj + 1
    Load Entity(CntObj)
    With gr.Nodes.Add(Util.CreateGUID2)
      Set .Control = Entity(CntObj)
      .ControlIndex = CntObj
      .Caption = "New Node" & CntObj
      Set .NodeObject = Nothing
      .IsSelected = False
      .x = NodePosX(x)
      .y = NodePosY(y)
      '.X = (CenterX + X) / CurScale
      '.Y = (CenterY + Y) / CurScale
      .W = Entity(CntObj).Width
      .H = Entity(CntObj).Height
    End With
    RecalcAllNodes
    RepaintLines
    MoveObjects
    WaitObject = False
    
  Else
    
    'кликнули на связи
    scx = NodePosX(x)
    scy = NodePosY(y)
    For Each n In gr.Nodes
      For Each e In n.Edges
        If e.HitTest(scx, scy) Then
          Set SelectedEdge = e
          RaiseEvent EdgeClick(e)
          Exit Sub
        End If
      Next
    Next
    
    ' потащили - рисуем прямоугольник
    If Button = 1 And Shift <> 2 Then
    
            HLine1.X1 = x
            HLine1.Y1 = y
            HLine1.X2 = x
            HLine1.Y2 = y
            
            HLine2.X1 = x
            HLine2.Y1 = y
            HLine2.X2 = x
            HLine2.Y2 = y
            
            VLine1.X1 = x
            VLine1.Y1 = y
            VLine1.X2 = x
            VLine1.Y2 = y
            
            VLine2.X1 = x
            VLine2.Y1 = y
            VLine2.X2 = x
            VLine2.Y2 = y
            
            HLine1.Visible = True
            HLine2.Visible = True
            VLine1.Visible = True
            VLine2.Visible = True
    End If
  End If
  
  RaiseEvent CanvasMouseDown(Button, Shift, x, y)
End Sub

Private Sub UserControl_KeyUp(KeyCode As Integer, Shift As Integer)
    On Error GoTo bye:

    Select Case KeyCode
    Case 33
        If VScroll1.Value > VScroll1.Min + VScroll1.LargeChange Then VScroll1.Value = VScroll1.Value - VScroll1.LargeChange Else VScroll1.Value = VScroll1.Min
    Case 34
        If VScroll1.Value < VScroll1.Max - VScroll1.LargeChange Then VScroll1.Value = VScroll1.Value + VScroll1.LargeChange Else VScroll1.Value = VScroll1.Max
    Case 36
        VScroll1.Value = VScroll1.Min
    Case 35
        VScroll1.Value = VScroll1.Max
    Case 37
        If HScroll1.Value > HScroll1.Min Then HScroll1.Value = HScroll1.Value - HScroll1.SmallChange
    Case 38
        If VScroll1.Value > VScroll1.Min Then VScroll1.Value = VScroll1.Value - VScroll1.SmallChange
    Case 39
        If HScroll1.Value < HScroll1.Max Then HScroll1.Value = HScroll1.Value + HScroll1.SmallChange
    Case 40
        If VScroll1.Value < VScroll1.Max Then VScroll1.Value = VScroll1.Value + VScroll1.SmallChange
    Case 46
        mnuDeleteObject_Click
    Case 67
        If Shift = 2 Then
            BufferCopy
        End If
    Case 86
        If Shift = 2 Then
            BufferPaste
        End If
    Case 90
        Call mnuZoom_Click
    Case 187
        Call mnuZoomIn_Click
    Case 189
        Call mnuZoomOut_Click
    End Select
bye:
End Sub

Private Sub BufferCopy()
        Dim n As Node, nn As Node
        Dim e As Edge
            
        If Not BufferNodes Is Nothing Then
            Do While BufferNodes.Count > 0
                Call BufferNodes.Remove(1)
            Loop
        Else
            Set BufferNodes = New Nodes
        End If
            
        For Each n In gr.Nodes
            If n.IsSelected Then
                Set nn = BufferNodes.Add(n.id)
                nn.x = n.x
                nn.y = n.y
                nn.Caption = n.Caption
                nn.H = n.H
                nn.W = n.W
                nn.ImageIndex = n.ImageIndex
                nn.ImageKey = n.ImageKey
                For Each e In n.Edges
                   nn.Edges.Add e.id, e.FromNode, e.ToNode
                Next
            End If
        Next
        
        If BufferNodes.Count > 0 Then mnuPaste.Enabled = True Else mnuPaste.Enabled = False
        
        Set n = Nothing: Set nn = Nothing: Set e = Nothing
End Sub

Private Sub BufferPaste()
        Dim GUID As String
        Dim n As Node
        Dim e As Edge
        Dim tempGUID As New Collection
            
        For Each n In gr.Nodes
            n.IsSelected = False
        Next
        
        For Each n In BufferNodes
            GUID = NewEntity2(n.Caption, n.ImageIndex, n.ImageKey, DispPosX(n.x) + n.W * CurScale / 2, DispPosY(n.y) + n.H * CurScale / 2, Util.CreateGUID2)
            tempGUID.Add GUID, n.id
            gr.Nodes(GUID).H = n.H
            gr.Nodes(GUID).W = n.W
            gr.Nodes(GUID).IsSelected = True
        Next
            
        On Error Resume Next
        
        For Each n In BufferNodes
            For Each e In n.Edges
                    Err.Clear
                    gr.Nodes(tempGUID(n.id)).Edges.Add Util.CreateGUID2, gr.Nodes(tempGUID(n.id)), gr.Nodes(tempGUID(e.ToNode.id))
                    If Err.Number > 0 Then gr.Nodes(tempGUID(n.id)).Edges.Add Util.CreateGUID2, gr.Nodes(tempGUID(n.id)), gr.Nodes(e.ToNode.id)
            Next
        Next
            
        Set tempGUID = Nothing
        Set n = Nothing: Set e = Nothing
        
        Repaint
End Sub

Private Sub UserControl_Resize()
  On Error Resume Next
  H = UserControl.ScaleHeight - HScroll1.Height
  W = UserControl.ScaleWidth - HScroll1.Height
  
  HScroll1.Visible = False
  VScroll1.Visible = False
  HScroll1.Top = H
  HScroll1.Width = W
  HScroll1.Left = 0
  
  VScroll1.Top = 0
  VScroll1.Height = H
  VScroll1.Left = W
  
  panel.Top = 0
  panel.Left = 0
  panel.Width = W
  panel.Height = H
  MoveObjects
  RepaintLines
  RecalcScrolls
  HScroll1.Visible = True
  VScroll1.Visible = True
End Sub

Private Sub HScroll1_Change()
    panel.Visible = False
    CenterX = CLng(HScroll1.Value) * 100 ' * W / 10
    MoveObjects
    RepaintLines
    panel.Visible = True
End Sub


Public Sub ClearAllEntity()
Dim i As Integer
On Error Resume Next
        For i = 1 To CntObj
          Unload Entity(i)
        Next
        While gr.Nodes.Count > 0
          RaiseEvent NodeDelete(gr.Nodes.Item(1))
          gr.Nodes.Remove 1
        Wend
        
        FirstPoint = 0
        WaitObject = False
        
        VScroll1.Value = 0
        HScroll1.Value = 0
        CurScale = 1
        RecalcAllNodes
        RecalcScrolls
        MoveObjects
End Sub


Private Sub DeleteCurentEntity()
  If CurrentEntity > 0 Then
    DropEntity CurrentEntity
  End If
End Sub

Public Sub ZoomIn()
On Error Resume Next
    Call Zoom(1.5)
End Sub

Public Sub Zoom(ZoomFactor As Double)
On Error Resume Next
If ZoomFactor > 0 Then
    CurScale = CurScale * ZoomFactor
    panel.Visible = False
    Call RecalcScrolls
    MoveObjects
    RepaintLines
    panel.Visible = True
End If
End Sub

Public Sub ZoomOut()
On Error Resume Next
  Call Zoom(0.666666)
End Sub




Private Sub Entity_MouseDown(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
  Dim i As Integer
  
  Dim fn As Node, tn As Node, e As Edge
      
  If Button = 1 And Shift = 0 Then
      XStart = x
      YStart = y
      Dim find As Boolean
      find = False
      For Each tn In gr.Nodes
          If tn.IsSelected Then
              If tn.ControlIndex = Index Then find = True
              If tn Is Nothing Then Exit Sub
              SetLine tn.LineItems, tn.x, tn.y, tn.x, tn.y + tn.H
              SetLine tn.LineItems, tn.x, tn.y, tn.x + tn.W, tn.y
              SetLine tn.LineItems, tn.x + tn.W, tn.y, tn.x + tn.W, tn.y + tn.H
              SetLine tn.LineItems, tn.x, tn.y + tn.H, tn.x + tn.W, tn.y + tn.H
              
              Entity(tn.ControlIndex).ZOrder 0
          End If
      Next
      
      If Not find Then
          Set tn = FindNode(Index)
              If tn Is Nothing Then Exit Sub
              SetLine tn.LineItems, tn.x, tn.y, tn.x, tn.y + tn.H
              SetLine tn.LineItems, tn.x, tn.y, tn.x + tn.W, tn.y
              SetLine tn.LineItems, tn.x + tn.W, tn.y, tn.x + tn.W, tn.y + tn.H
              SetLine tn.LineItems, tn.x, tn.y + tn.H, tn.x + tn.W, tn.y + tn.H
      End If
        
      
  End If
  If Button = 2 And Shift = 0 Then
    Entity(Index).SetFocus
    Dim n As Node
    Set n = FindNode(Index)
    DoEvents
    If n.DecomposeID = "" Then
      mnuRemoveDecomposition.Enabled = False
    Else
      mnuRemoveDecomposition.Enabled = True
    End If
    mnuDecompose.Visible = (m_bAllowDecomposition And Entity(Index).AllowDecomposition)
    mnuRemoveDecomposition.Visible = (m_bAllowDecomposition And Entity(Index).AllowDecomposition)
    mnusep.Visible = (m_bAllowDecomposition And Entity(Index).AllowDecomposition)
    PopupMenu mnuNode, 0, x + Entity(Index).Left, y + Entity(Index).Top
  End If
  
  If Button = 1 And Shift = 2 Then
    FindNode(Index).IsSelected = True
  End If
End Sub


Private Sub Entity_MouseUp(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 1 And Shift = 0 Then   'And Mode = 0
    Dim find As Boolean
    Dim n As Node
    For Each n In gr.Nodes
    If n.IsSelected Then
        If n.ControlIndex = Index Then find = True
        While n.LineItems.Count > 0
            Lines(n.LineItems(1).CotrolIndex).Tag = "N"
            Lines(n.LineItems(1).CotrolIndex).Visible = False
            n.LineItems.Remove 1
        Wend
        RecalcNodeLines n
        RecalcToNodeLines n
    End If
    
    Next
    
    If Not find Then

    Set n = FindNode(Index)
    Dim cx, cy, scx, scy

    scx = NodePosX(Entity(Index).Left)
    scy = NodePosY(Entity(Index).Top)
    n.x = scx
    n.y = scy
    n.W = Entity(Index).Width / CurScale
    n.H = Entity(Index).Height / CurScale
    
    While n.LineItems.Count > 0
     Lines(n.LineItems(1).CotrolIndex).Tag = "N"
     Lines(n.LineItems(1).CotrolIndex).Visible = False
     n.LineItems.Remove 1
    Wend
    RepaintNode n
    
    End If
    
   RecalcScrolls
  End If
    
  'Entity(Index).DrawMode = False
  
End Sub

Private Sub Entity_ResizeMe(Index As Integer, ByVal Coner As Long, ByVal OldX As Long, OldY As Long, ByVal x As Long, ByVal y As Long)
    
    On Error Resume Next
    Entity(Index).ZOrder 0
    Select Case Coner
    Case 0
      Entity(Index).Left = Entity(Index).Left + x - OldX
      Entity(Index).Top = Entity(Index).Top + y - OldY
      Entity(Index).Width = Entity(Index).Width + OldX - x
      Entity(Index).Height = Entity(Index).Height + OldY - y
    Case 1
      Entity(Index).Top = Entity(Index).Top + y - OldY
      Entity(Index).Height = Entity(Index).Height + OldY - y
    Case 2
      Entity(Index).Top = Entity(Index).Top - OldY + y
      Entity(Index).Width = Entity(Index).Width - OldX + x
      Entity(Index).Height = Entity(Index).Height - y + OldY
    Case 3
      Entity(Index).Width = Entity(Index).Width - OldX + x
    Case 4
      Entity(Index).Width = Entity(Index).Width - OldX + x
      Entity(Index).Height = Entity(Index).Height - OldY + y
    Case 5
      Entity(Index).Height = Entity(Index).Height - OldY + y
    Case 6
      Entity(Index).Left = Entity(Index).Left + x - OldX
      Entity(Index).Width = Entity(Index).Width + OldX - x
      Entity(Index).Height = Entity(Index).Height - OldY + y
    Case 7
      Entity(Index).Left = Entity(Index).Left + x - OldX
      Entity(Index).Width = Entity(Index).Width + OldX - x
    End Select
    
    Dim n As Node
    Set n = FindNode(Index)
    Dim scx, scy

    scx = NodePosX(Entity(Index).Left)
    scy = NodePosY(Entity(Index).Top)
    
    n.x = scx
    n.y = scy
    n.W = Entity(Index).Width / CurScale
    n.H = Entity(Index).Height / CurScale
    Entity(Index).DrawMode = False
    While n.LineItems.Count > 0
     Lines(n.LineItems(1).CotrolIndex).Tag = "N"
     Lines(n.LineItems(1).CotrolIndex).Visible = False
     n.LineItems.Remove 1
    Wend
    Call RecalcScrolls
    RepaintNode n
End Sub


Private Sub Entity_Resizing(Index As Integer, ByVal Coner As Long, ByVal OldX As Long, OldY As Long, ByVal x As Long, ByVal y As Long)
    Static InERM As Boolean
    If InERM Then Exit Sub
    InERM = True
     Dim fn As Node, tn As Node
     Set tn = FindNode(Index)
     If tn.LineItems.Count = 0 Then
        SetLine tn.LineItems, tn.x, tn.y, tn.x, tn.y + tn.H
        SetLine tn.LineItems, tn.x, tn.y, tn.x + tn.W, tn.y
        SetLine tn.LineItems, tn.x + tn.W, tn.y, tn.x + tn.W, tn.y + tn.H
        SetLine tn.LineItems, tn.x, tn.y + tn.H, tn.x + tn.W, tn.y + tn.H
     End If
    
    On Error Resume Next
    Entity(Index).DrawMode = True
    Entity(Index).ZOrder 0
    Select Case Coner
    Case 0
      Entity(Index).Left = Entity(Index).Left + x - OldX
      Entity(Index).Top = Entity(Index).Top + y - OldY
      Entity(Index).Width = Entity(Index).Width + OldX - x
      Entity(Index).Height = Entity(Index).Height + OldY - y
    Case 1
      Entity(Index).Top = Entity(Index).Top + y - OldY
      Entity(Index).Height = Entity(Index).Height + OldY - y
    Case 2
      Entity(Index).Top = Entity(Index).Top - OldY + y
      Entity(Index).Width = Entity(Index).Width - OldX + x
      Entity(Index).Height = Entity(Index).Height - y + OldY
    Case 3
      Entity(Index).Width = Entity(Index).Width - OldX + x
    Case 4
      Entity(Index).Width = Entity(Index).Width - OldX + x
      Entity(Index).Height = Entity(Index).Height - OldY + y
    Case 5
      Entity(Index).Height = Entity(Index).Height - OldY + y
    Case 6
      Entity(Index).Left = Entity(Index).Left + x - OldX
      Entity(Index).Width = Entity(Index).Width + OldX - x
      Entity(Index).Height = Entity(Index).Height - OldY + y
    Case 7
      Entity(Index).Left = Entity(Index).Left + x - OldX
      Entity(Index).Width = Entity(Index).Width + OldX - x
    End Select
    
    Dim n As Node
    Set n = FindNode(Index)
    Dim scx, scy

    scx = NodePosX(Entity(Index).Left)
    scy = NodePosY(Entity(Index).Top)
    n.x = scx
    n.y = scy
    n.W = Entity(Index).Width / CurScale
    n.H = Entity(Index).Height / CurScale
    'RepaintNode n
    InERM = False
End Sub



Public Sub RepaintLines()
  Dim i As Integer, j As Integer, d As Long, ii As Long
  Dim l As LineItem
  Dim Color As Long
  
  For ii = 1 To gr.Nodes.Count
    For i = 1 To gr.Nodes.Item(ii).Edges.Count
     
     With gr.Nodes.Item(ii).Edges.Item(i)
     
      If Not SelectedEdge Is Nothing Then
        If .id = SelectedEdge.id Then
          Color = .SelectedColor
        Else
          Color = .DefaultColor
        End If
      End If
      
      For Each l In .LineItems
        Lines(l.CotrolIndex).BorderColor = Color
        Lines(l.CotrolIndex).X1 = DispPosX(l.FromX)
        Lines(l.CotrolIndex).Y1 = DispPosY(l.FromY)
        Lines(l.CotrolIndex).X2 = Lines(l.CotrolIndex).X1 + NewSize(l.ToX - l.FromX)
        Lines(l.CotrolIndex).Y2 = Lines(l.CotrolIndex).Y1 + NewSize(l.ToY - l.FromY)
        Lines(l.CotrolIndex).BorderStyle = .BorderStyle
      Next
      End With
    Next
    For i = 1 To gr.Nodes.Item(ii).LineItems.Count
     
     'With gr.Nodes.Item(ii).LineItems.Item(i)
      For Each l In gr.Nodes.Item(ii).LineItems
        Lines(l.CotrolIndex).BorderColor = 0
        Lines(l.CotrolIndex).X1 = DispPosX(l.FromX)
        Lines(l.CotrolIndex).Y1 = DispPosY(l.FromY)
        Lines(l.CotrolIndex).X2 = Lines(l.CotrolIndex).X1 + NewSize(l.ToX - l.FromX)
        Lines(l.CotrolIndex).Y2 = Lines(l.CotrolIndex).Y1 + NewSize(l.ToY - l.FromY)
        Lines(l.CotrolIndex).BorderStyle = 1
      Next
      'End With
    Next
  Next

End Sub


Private Function NewSize(ByVal x As Double) As Double
    NewSize = CurScale * x
End Function

Private Function DispPosX(ByVal x As Double) As Double
    DispPosX = (x + W / 2 / CurScale - CenterX) * CurScale '+ W / 2
End Function
Private Function DispPosY(ByVal y As Double) As Double
    DispPosY = (y + H / 2 / CurScale - CenterY) * CurScale '+ H / 2
End Function

Private Function NodePosX(ByVal x As Double) As Double
    'NodePosX = CenterX + (X - W / 2) / CurScale - W / 2 / CurScale
    NodePosX = CenterX + (x) / CurScale - W / 2 / CurScale
End Function

Private Function NodePosY(ByVal y As Double) As Double
    'NodePosY = CenterY + (Y - H / 2) / CurScale - H / 2 / CurScale
    NodePosY = CenterY + (y) / CurScale - H / 2 / CurScale
End Function

Private Sub RecalcAllNodes()
 Dim n As Node
 ClearLines
 For Each n In gr.Nodes
  On Error Resume Next
  RecalcNodeLines n
 Next
 ClearLinesAfter
End Sub

Private Sub RecalcToNodeLines(n As Node)
  Dim i As Integer
  Dim n1 As Node
  Dim e As Edge
  For Each n1 In gr.Nodes
    i = 1
    For Each e In n1.Edges
      i = i + 1
      If e.ToNode.id = n.id Then
       RecalcEdge e, 2 'i
      End If
    Next
  Next
  'DoEvents
End Sub


Private Sub RecalcNodeLines(n As Node)
  Dim i As Integer
  'Debug.Print "FROM"; n.Caption
  For i = 1 To n.Edges.Count
     RecalcEdge n.Edges(i), 2 'i + 1
     'Debug.Print "TO"; n.Edges(i).ToNode.Caption
  Next
End Sub


Private Sub RecalcEdge(e As Edge, ByVal d As Integer)
  Dim i As Integer, j As Integer, ii As Long

     With e
      While .LineItems.Count > 0
       Lines(.LineItems.Item(1).CotrolIndex).Tag = "N"
       Lines(.LineItems.Item(1).CotrolIndex).Visible = False
       .LineItems.Remove 1
      Wend
     
     findPoints.findPoints .FromNode.x + .FromNode.W / d, _
               .FromNode.y + .FromNode.H / d, _
               .FromNode.W / d, .FromNode.H / d, _
               .ToNode.x + .ToNode.W / d, _
               .ToNode.y + .ToNode.H / d, _
               .ToNode.W / d, .ToNode.H / d, _
               .FromNode.W / d * (d - 1), .FromNode.H / d * (d - 1), _
               .ToNode.W / d * (d - 1), .ToNode.H / d * (d - 1)
     
     '''''''''''''''''''''''''''' Original Algoritm
'     Select Case Algoritm
'
'     Case -2
'        Call SetLine(.LineItems, pts(0, 0), pts(0, 1), pts(0, 0), pts(1, 1))
'        Call SetLine(.LineItems, pts(0, 0), pts(1, 1), pts(1, 0), pts(1, 1))
'
'
'     Case 2
'        Call SetLine(.LineItems, pts(0, 0), pts(0, 1), pts(1, 0), pts(0, 1))
'        Call SetLine(.LineItems, pts(1, 0), pts(0, 1), pts(1, 0), pts(1, 1))
'
'     Case 3
'        Call SetLine(.LineItems, pts(0, 0), pts(0, 1), (pts(0, 0) + pts(1, 0)) / 2, pts(1, 1))
'        Call SetLine(.LineItems, (pts(0, 0) + pts(1, 0)) / 2, pts(1, 1), pts(1, 0), pts(1, 1))
'     Case -3
'        Call SetLine(.LineItems, pts(0, 0), pts(0, 1), pts(1, 0), (pts(0, 1) + pts(1, 1)) / 2)
'        Call SetLine(.LineItems, pts(1, 0), (pts(0, 1) + pts(1, 1)) / 2, pts(1, 0), pts(1, 1))
'     Case 4
'
'      Call SetLine(.LineItems, .FromNode.x, .FromNode.y + .FromNode.H / d, _
'      .FromNode.x - .FromNode.W / d, .FromNode.y + .FromNode.H / d)
'
'      Call SetLine(.LineItems, .FromNode.x - .FromNode.W / d, .FromNode.y + .FromNode.H / d, _
'      .FromNode.x - .FromNode.W / d, .FromNode.y - .FromNode.H / d)
'
'      Call SetLine(.LineItems, .FromNode.x - .FromNode.W / d, .FromNode.y - .FromNode.H / d, _
'         .FromNode.x + .FromNode.W / d, .FromNode.y - .FromNode.H / d)
'
'      Call SetLine(.LineItems, .FromNode.x + .FromNode.W / d, .FromNode.y - .FromNode.H / d, _
'         .FromNode.x + .FromNode.W / d, .FromNode.y)
'     End Select
    
     ''''''''''''''''''''''''''''''' STD
     Select Case Algoritm
     
     Case -2
        Call SetLine(.LineItems, pts(0, 0), pts(0, 1), pts(0, 0), pts(1, 1))
        Call SetLine(.LineItems, pts(0, 0), pts(1, 1), pts(1, 0), pts(1, 1))
        
     Case 2
        Call SetLine(.LineItems, pts(0, 0), pts(0, 1), pts(1, 0), pts(0, 1))
        Call SetLine(.LineItems, pts(1, 0), pts(0, 1), pts(1, 0), pts(1, 1))
        
     Case 3
        Call SetLine(.LineItems, pts(0, 0), pts(0, 1), (pts(0, 0) + pts(1, 0)) / 2, pts(0, 1))
        Call SetLine(.LineItems, (pts(0, 0) + pts(1, 0)) / 2, pts(0, 1), (pts(0, 0) + pts(1, 0)) / 2, pts(1, 1))
        Call SetLine(.LineItems, (pts(0, 0) + pts(1, 0)) / 2, pts(1, 1), pts(1, 0), pts(1, 1))
     
     Case -3
        Call SetLine(.LineItems, pts(0, 0), pts(0, 1), pts(0, 0), (pts(0, 1) + pts(1, 1)) / 2)
        Call SetLine(.LineItems, pts(0, 0), (pts(0, 1) + pts(1, 1)) / 2, pts(1, 0), (pts(0, 1) + pts(1, 1)) / 2)
        Call SetLine(.LineItems, pts(1, 0), (pts(0, 1) + pts(1, 1)) / 2, pts(1, 0), pts(1, 1))
     
     Case 4
      Call SetLine(.LineItems, .FromNode.x, .FromNode.y + .FromNode.H / d, _
      .FromNode.x - .FromNode.W / d, .FromNode.y + .FromNode.H / d)
      
      Call SetLine(.LineItems, .FromNode.x - .FromNode.W / d, .FromNode.y + .FromNode.H / d, _
      .FromNode.x - .FromNode.W / d, .FromNode.y - .FromNode.H / d)
      
      Call SetLine(.LineItems, .FromNode.x - .FromNode.W / d, .FromNode.y - .FromNode.H / d, _
         .FromNode.x + .FromNode.W / d, .FromNode.y - .FromNode.H / d)
      
      Call SetLine(.LineItems, .FromNode.x + .FromNode.W / d, .FromNode.y - .FromNode.H / d, _
         .FromNode.x + .FromNode.W / d, .FromNode.y)
     End Select
    
     
     
     
     ' Draw Arrow Lines
     j = 6 * (Screen.TwipsPerPixelX + Screen.TwipsPerPixelY)
     
     
    ' Arrows() encoding
    '0    /\
    '1    <-
    '2    \/
    '3    ->
    
     If Not e.ER_Arrow Then
        Select Case Arrows(1)
           Case 0
             'down
             Call SetLine(.LineItems, pts(1, 0), pts(1, 1), pts(1, 0) - j / 2, pts(1, 1) - j)
             Call SetLine(.LineItems, pts(1, 0), pts(1, 1), pts(1, 0) + j / 2, pts(1, 1) - j)
           Case 1
             'left
             Call SetLine(.LineItems, pts(1, 0), pts(1, 1), pts(1, 0) + j, pts(1, 1) - j / 2)
             Call SetLine(.LineItems, pts(1, 0), pts(1, 1), pts(1, 0) + j, pts(1, 1) + j / 2)
           Case 2
             'up
             Call SetLine(.LineItems, pts(1, 0), pts(1, 1), pts(1, 0) - j / 2, pts(1, 1) + j)
             Call SetLine(.LineItems, pts(1, 0), pts(1, 1), pts(1, 0) + j / 2, pts(1, 1) + j)
           Case 3
             'right
             Call SetLine(.LineItems, pts(1, 0), pts(1, 1), pts(1, 0) - j, pts(1, 1) - j / 2)
             Call SetLine(.LineItems, pts(1, 0), pts(1, 1), pts(1, 0) - j, pts(1, 1) + j / 2)
         End Select
      Else
         Select Case Arrows(1)
           Case 0
             'down
             Call SetLine(.LineItems, pts(1, 0), pts(1, 1) - j, pts(1, 0) - j / 2, pts(1, 1))
             Call SetLine(.LineItems, pts(1, 0), pts(1, 1) - j, pts(1, 0) + j / 2, pts(1, 1))
           Case 1
             'left
             Call SetLine(.LineItems, pts(1, 0) + j, pts(1, 1), pts(1, 0), pts(1, 1) - j / 2)
             Call SetLine(.LineItems, pts(1, 0) + j, pts(1, 1), pts(1, 0), pts(1, 1) + j / 2)
           Case 2
             'up
             Call SetLine(.LineItems, pts(1, 0), pts(1, 1) + j, pts(1, 0) - j / 2, pts(1, 1))
             Call SetLine(.LineItems, pts(1, 0), pts(1, 1) + j, pts(1, 0) + j / 2, pts(1, 1))
           Case 3
             'right
             Call SetLine(.LineItems, pts(1, 0) - j, pts(1, 1), pts(1, 0), pts(1, 1) - j / 2)
             Call SetLine(.LineItems, pts(1, 0) - j, pts(1, 1), pts(1, 0), pts(1, 1) + j / 2)
         End Select

      
      End If
      Dim Color
      If Not SelectedEdge Is Nothing Then
        If .id = SelectedEdge.id Then
          Color = .SelectedColor
        Else
          Color = .DefaultColor
        End If
      End If
      Dim l As LineItem
      For Each l In .LineItems
        Lines(l.CotrolIndex).BorderColor = Color
        Lines(l.CotrolIndex).BorderStyle = .BorderStyle
      Next
      
      
      End With
nxt:
End Sub


Public Sub DropEntity(ByVal Index As Integer)
  Dim n As Node, n2 As Node
  
  Set n = FindNode(Index)
  Dim e As Edge
  While n.Edges.Count > 0
    RaiseEvent EdgeDelete(n.Edges.Item(1))
    n.Edges.Remove 1
  Wend
  For Each n2 In gr.Nodes
again:
    For Each e In n2.Edges
      If e.ToNode.id = n.id Then
       RaiseEvent EdgeDelete(e)
       n2.Edges.Remove e.id
       GoTo again
      End If
    Next
  Next
  gr.Nodes.Remove n.id
  Unload Entity(Index)
  RecalcAllNodes
  MoveObjects
  
End Sub


Private Sub MoveObject(n As Node)
  On Error Resume Next
    Entity(n.ControlIndex).Move _
    DispPosX(n.x), _
    DispPosY(n.y), _
    IIf(n.W * CurScale < 60 * Screen.TwipsPerPixelX, 60 * Screen.TwipsPerPixelX, n.W * CurScale), _
    IIf(n.H * CurScale < 60 * Screen.TwipsPerPixelX, 60 * Screen.TwipsPerPixelX, n.H * CurScale)
End Sub


Private Sub MoveObjects()
  On Error Resume Next
  Dim n As Node
  
  Dim TopY As Double, BottomY As Double, LeftX As Double, RightX As Double
  TopY = CenterY - H / 2 / CurScale
  LeftX = CenterX - W / 2 / CurScale
  RightX = CenterX + W / 2 / CurScale
  BottomY = CenterY + H / 2 / CurScale
  
  For Each n In gr.Nodes
   
    
    If ((n.x + n.W) > LeftX) And (n.x < RightX) And _
    ((n.y + n.H) > TopY) And (n.y < BottomY) Then
        Entity(n.ControlIndex).Move _
        DispPosX(n.x), _
        DispPosY(n.y), _
        IIf(n.W * CurScale < 60 * Screen.TwipsPerPixelX, 60 * Screen.TwipsPerPixelX, n.W * CurScale), _
        IIf(n.H * CurScale < 60 * Screen.TwipsPerPixelX, 60 * Screen.TwipsPerPixelX, n.H * CurScale)
        If Entity(n.ControlIndex).Visible <> True Then
            Entity(n.ControlIndex).Visible = True
        End If
    Else
        Entity(n.ControlIndex).Visible = False
    End If
  Next
End Sub


Private Sub UserControl_Terminate()
  For Each gr In grs
    gr.CloseClass
  Next
  Set gr = Nothing
  Set grs = Nothing
End Sub

Private Sub VScroll1_Change()
    panel.Visible = False
    CenterY = CLng(VScroll1.Value) * 100
    MoveObjects
    RepaintLines
    panel.Visible = True
End Sub

Private Sub ClearLines()
  Dim i As Long
  Dim n1 As Node
  Dim e As Edge
  For i = 1 To LoadedLines
    Lines(i).Tag = "N"
  Next
  For Each n1 In gr.Nodes
    For Each e In n1.Edges
        While e.LineItems.Count > 0
            Lines(e.LineItems(1).CotrolIndex).Tag = "N"
            e.LineItems.Remove 1
        Wend
    Next
  Next
  
End Sub


Private Sub ClearNodeLines(n As Node)
  Dim l As LineItem
  Dim n1 As Node
  Dim e As Edge
  For Each n1 In gr.Nodes
    For Each e In n1.Edges
      If e.ToNode.id = n.id Or e.FromNode.id = n.id Then
        While e.LineItems.Count > 0
            Lines(e.LineItems(1).CotrolIndex).Tag = "N"
            e.LineItems.Remove 1
        Wend
      End If
    Next
  Next
  'DoEvents
End Sub


Private Sub ClearLinesAfter()
 Dim i As Long
  For i = 1 To LoadedLines
    If Lines(i).Tag = "N" Then Lines(i).Visible = False
  Next
End Sub

Private Function FindLine() As Long
    Dim i As Long
    For i = 1 To LoadedLines
        If Lines(i).Tag = "N" Then
          FindLine = i
          Lines(i).Visible = True
          Lines(i).Tag = "Y"
          Exit Function
        End If
    Next
    LoadedLines = LoadedLines + 1
    Load Lines(LoadedLines)
    Lines(LoadedLines).Visible = True
    Lines(LoadedLines).Tag = "Y"
    FindLine = LoadedLines
End Function

Private Sub SetLine(c As LineItems, X1, Y1, X2, Y2)
    Dim lid As Long

    
    lid = FindLine
    c.Add X1, Y1, X2, Y2, lid
    

    Lines(lid).BorderColor = 0
    Lines(lid).BorderStyle = 1
    
    If Lines(lid).X1 <> DispPosX(X1) Then
      Lines(lid).X1 = DispPosX(X1)
    End If
    If Lines(lid).Y1 <> DispPosY(Y1) Then
      Lines(lid).Y1 = DispPosY(Y1)
    End If
    If Lines(lid).X2 <> DispPosX(X2) Then
      Lines(lid).X2 = DispPosX(X2)
    End If
    If Lines(lid).Y2 <> DispPosY(Y2) Then
      Lines(lid).Y2 = DispPosY(Y2)
    End If
    
End Sub

'Private Sub SetBar(c As LineItems, x1, y1, x2, y2)
'  Call SetLine(c, x1, y1, x2, y1)
'  Call SetLine(c, x2, y1, x2, y2)
'  Call SetLine(c, x2, y2, x1, y2)
'  Call SetLine(c, x1, y1, x1, y2)
'End Sub

Public Function FindNode(ByVal EIndex As Long) As Node
  Dim n As Node
  For Each n In gr.Nodes
    If n.ControlIndex = EIndex Then
      Set FindNode = n
      Exit Function
    End If
  Next
  Set FindNode = Nothing
End Function

Public Function FindEdge(ByVal id As String) As Edge
  Dim n As Node
  Dim e As Edge
  Set FindEdge = Nothing
  For Each n In gr.Nodes
    For Each e In n.Edges
      If e.id = id Then
        Set FindEdge = e
        Exit Function
      End If
      Next
  Next
End Function

Public Function FindEdges(ByVal id As String) As Edges
  Dim n As Node
  Dim e As Edge
  Set FindEdges = Nothing
  For Each n In gr.Nodes
    For Each e In n.Edges
      If e.id = id Then
        Set FindEdges = n.Edges
        Exit Function
      End If
      Next
  Next
End Function


Public Property Get GraphInfo() As Graph
  Set GraphInfo = gr
End Property

Public Property Get ProjectInfo() As Graphs
  If grs Is Nothing Then
    Set grs = New Graphs
  End If
  Set ProjectInfo = grs
  
End Property


'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MemberInfo=15,0,2,0
Public Function ImageList() As Object
Attribute ImageList.VB_MemberFlags = "400"
    Set ImageList = GImageList
End Function

Public Sub LoadImage(ByVal ImagePath As String, ByVal Index As Long, Optional ByVal Key As String = "")
    Call GImageList.ListImages.Add(Index, Key, LoadPicture(ImagePath))
End Sub

Public Sub SetImage(ByVal Picture As Picture, ByVal Index As Long, Optional ByVal Key As String = "")
    Call GImageList.ListImages.Add(Index, Key, Picture)
End Sub



'Load property values from storage
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)

    Set m_ImageList = PropBag.ReadProperty("ImageList", Nothing)
    m_bAllowDecomposition = PropBag.ReadProperty("Decomposition", False)
End Sub

'Write property values to storage
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    Call PropBag.WriteProperty("Decomposition", m_bAllowDecomposition, False)
End Sub


Public Function SaveProjectToString() As String
Dim xmlDoc As New DOMDocument
Dim xmlEl As IXMLDOMElement
Dim xmlEl2 As IXMLDOMElement
Dim xmlEl3 As IXMLDOMElement

xmlDoc.loadXML "<GRAPHS/>"

Dim n As Node
Dim e As Edge

On Error Resume Next
Dim gr As Graph
For Each gr In ProjectInfo
    Set xmlEl = xmlDoc.createElement("GRAPH")
    xmlDoc.documentElement.appendChild xmlEl
    
    Call xmlEl.setAttribute("ID", gr.id)
    Call xmlEl.setAttribute("NAME", gr.NAME)
    Call xmlEl.setAttribute("PARENTID", gr.Parentid)
    
    For Each n In gr.Nodes
        Set xmlEl2 = xmlDoc.createElement("NODE")
        xmlEl.appendChild xmlEl2
        Call xmlEl2.setAttribute("ID", n.id)
        Call xmlEl2.setAttribute("CAPTION", n.Caption)
        Call xmlEl2.setAttribute("X", n.x)
        Call xmlEl2.setAttribute("Y", n.y)
        Call xmlEl2.setAttribute("H", n.H)
        Call xmlEl2.setAttribute("W", n.W)
        Call xmlEl2.setAttribute("IMAGE", n.ImageIndex)
        If n.ImageKey = "" Then
          If n.ImageIndex > 0 And n.ImageIndex < ImageList.ListImages.Count Then
            Call xmlEl2.setAttribute("IMAGEKEY", ImageList.ListImages(n.ImageIndex).Key)
          End If
        Else
          Call xmlEl2.setAttribute("IMAGEKEY", n.ImageKey)
        End If
        Call xmlEl2.setAttribute("DECOMPOSEID", n.DecomposeID)
        Call xmlEl2.setAttribute("ALLOWDECOMPOSITION", n.AllowDecomposition)
        For Each e In n.Edges
            Set xmlEl3 = xmlDoc.createElement("EDGE")
            xmlEl2.appendChild xmlEl3
            Call xmlEl3.setAttribute("ID", e.id)
            Call xmlEl3.setAttribute("FROMNODEID", e.FromNode.id)
            Call xmlEl3.setAttribute("TONODEID", e.ToNode.id)
            Call xmlEl3.setAttribute("SELECTEDCOLOR", e.SelectedColor)
            Call xmlEl3.setAttribute("DEFAULTCOLOR", e.DefaultColor)
            Call xmlEl3.setAttribute("BORDERSTYLE", e.BorderStyle)
            Call xmlEl3.setAttribute("TOOLTIPTEXT", e.ToolTipText)
        Next
    Next

Next

SaveProjectToString = xmlDoc.xml

Set xmlEl = Nothing
Set xmlEl2 = Nothing
Set xmlEl3 = Nothing
Set xmlDoc = Nothing

End Function


Public Sub SaveProjectToFile(ByVal path As String)
Dim xmlDoc As New DOMDocument
Dim xmlEl As IXMLDOMElement
Dim xmlEl2 As IXMLDOMElement
Dim xmlEl3 As IXMLDOMElement

Set xmlDoc.documentElement = xmlDoc.createElement("GRAPHS")

Dim n As Node
Dim e As Edge

On Error Resume Next
Kill path
Dim gr As Graph
For Each gr In ProjectInfo
    Set xmlEl = xmlDoc.createElement("GRAPH")
    xmlDoc.documentElement.appendChild xmlEl
    
    Call xmlEl.setAttribute("ID", gr.id)
    Call xmlEl.setAttribute("NAME", gr.NAME)
    Call xmlEl.setAttribute("PARENTID", gr.Parentid)
    
    For Each n In gr.Nodes
        Set xmlEl2 = xmlDoc.createElement("NODE")
        xmlEl.appendChild xmlEl2
        Call xmlEl2.setAttribute("ID", n.id)
        Call xmlEl2.setAttribute("CAPTION", n.Caption)
        Call xmlEl2.setAttribute("X", n.x)
        Call xmlEl2.setAttribute("Y", n.y)
        Call xmlEl2.setAttribute("H", n.H)
        Call xmlEl2.setAttribute("W", n.W)
        Call xmlEl2.setAttribute("IMAGE", n.ImageIndex)
        If n.ImageKey = "" Then
          If n.ImageIndex > 0 And n.ImageIndex < ImageList.ListImages.Count Then
            Call xmlEl2.setAttribute("IMAGEKEY", ImageList.ListImages(n.ImageIndex).Key)
          End If
        Else
          Call xmlEl2.setAttribute("IMAGEKEY", n.ImageKey)
        End If
        Call xmlEl2.setAttribute("DECOMPOSEID", n.DecomposeID)
        Call xmlEl2.setAttribute("ALLOWDECOMPOSITION", n.AllowDecomposition)
        For Each e In n.Edges
            Set xmlEl3 = xmlDoc.createElement("EDGE")
            xmlEl2.appendChild xmlEl3
            Call xmlEl3.setAttribute("ID", e.id)
            Call xmlEl3.setAttribute("FROMNODEID", e.FromNode.id)
            Call xmlEl3.setAttribute("TONODEID", e.ToNode.id)
            Call xmlEl3.setAttribute("SELECTEDCOLOR", e.SelectedColor)
            Call xmlEl3.setAttribute("DEFAULTCOLOR", e.DefaultColor)
            Call xmlEl3.setAttribute("BORDERSTYLE", e.BorderStyle)
            Call xmlEl3.setAttribute("TOOLTIPTEXT", e.ToolTipText)
        Next
    Next

Next

xmlDoc.save path

Set xmlEl = Nothing
Set xmlEl2 = Nothing
Set xmlEl3 = Nothing
Set xmlDoc = Nothing

End Sub



Public Sub ReadProjectFromFile(ByVal path As String)
Dim xmlDoc As New DOMDocument
Dim xmlELs As IXMLDOMNodeList
Dim xmlNode As IXMLDOMNode
Dim xmlNode2 As IXMLDOMNode

Dim n As Node
Dim n2 As Node
Dim e As Edge
Dim gr As Graph

If Not xmlDoc.Load(path) Then Exit Sub

Set grs = Nothing
ClearAllEntity

Set xmlELs = xmlDoc.getElementsByTagName("GRAPH")

On Error Resume Next

For Each xmlNode In xmlELs
    Set gr = ProjectInfo.Add(xmlNode.Attributes.getNamedItem("ID").nodeValue)
    gr.NAME = xmlNode.Attributes.getNamedItem("NAME").nodeValue
    gr.Parentid = xmlNode.Attributes.getNamedItem("PARENTID").nodeValue
    For Each xmlNode2 In xmlNode.childNodes
        Set n = gr.Nodes.Add(xmlNode2.Attributes.getNamedItem("ID").nodeValue)
        n.Caption = xmlNode2.Attributes.getNamedItem("CAPTION").nodeValue
        n.x = xmlNode2.Attributes.getNamedItem("X").nodeValue
        n.y = xmlNode2.Attributes.getNamedItem("Y").nodeValue
        n.W = xmlNode2.Attributes.getNamedItem("W").nodeValue
        n.H = xmlNode2.Attributes.getNamedItem("H").nodeValue
        n.ImageIndex = xmlNode2.Attributes.getNamedItem("IMAGE").nodeValue
        n.ImageKey = xmlNode2.Attributes.getNamedItem("IMAGEKEY").nodeValue
        n.DecomposeID = xmlNode2.Attributes.getNamedItem("DECOMPOSEID").nodeValue
        n.AllowDecomposition = xmlNode2.Attributes.getNamedItem(UCase("AllowDecomposition")).nodeValue
    Next
Next


Set xmlELs = xmlDoc.getElementsByTagName("EDGE")

For Each xmlNode In xmlELs
    For Each gr In ProjectInfo
        Set n = gr.Nodes(xmlNode.Attributes.getNamedItem("FROMNODEID").nodeValue)
        If Not n Is Nothing Then
            Set n2 = gr.Nodes(xmlNode.Attributes.getNamedItem("TONODEID").nodeValue)
            With n.Edges.Add(xmlNode.Attributes.getNamedItem("ID").nodeValue, n, n2)
                .SelectedColor = xmlNode.Attributes.getNamedItem("SELECTEDCOLOR").nodeValue
                .DefaultColor = xmlNode.Attributes.getNamedItem("DEFAULTCOLOR").nodeValue
                .BorderStyle = xmlNode.Attributes.getNamedItem("BORDERSTYLE").nodeValue
                .ToolTipText = xmlNode.Attributes.getNamedItem("TOOLTIPTEXT").nodeValue
            End With
            Exit For
        End If
    Next
Next

If ProjectInfo.Count > 0 Then
    SelectGraph ProjectInfo.Item(1).id
End If

Repaint
Call RecalcScrolls
CenterGraph

Set xmlELs = Nothing
Set xmlNode = Nothing
Set xmlNode2 = Nothing
Set xmlDoc = Nothing
End Sub



Public Sub ReadProjectFromString(ByVal XMLString As String)
Dim xmlDoc As New DOMDocument
Dim xmlELs As IXMLDOMNodeList
Dim xmlNode As IXMLDOMNode
Dim xmlNode2 As IXMLDOMNode

Dim n As Node
Dim n2 As Node
Dim e As Edge
Dim gr As Graph

If Not xmlDoc.loadXML(XMLString) Then Exit Sub

Set grs = Nothing
ClearAllEntity

Set xmlELs = xmlDoc.getElementsByTagName("GRAPH")

On Error Resume Next

For Each xmlNode In xmlELs
    Set gr = ProjectInfo.Add(xmlNode.Attributes.getNamedItem("ID").nodeValue)
    gr.NAME = xmlNode.Attributes.getNamedItem("NAME").nodeValue
    gr.Parentid = xmlNode.Attributes.getNamedItem("PARENTID").nodeValue
    For Each xmlNode2 In xmlNode.childNodes
        Set n = gr.Nodes.Add(xmlNode2.Attributes.getNamedItem("ID").nodeValue)
        n.Caption = xmlNode2.Attributes.getNamedItem("CAPTION").nodeValue
        n.x = xmlNode2.Attributes.getNamedItem("X").nodeValue
        n.y = xmlNode2.Attributes.getNamedItem("Y").nodeValue
        n.W = xmlNode2.Attributes.getNamedItem("W").nodeValue
        n.H = xmlNode2.Attributes.getNamedItem("H").nodeValue
        n.ImageIndex = xmlNode2.Attributes.getNamedItem("IMAGE").nodeValue
        n.ImageKey = xmlNode2.Attributes.getNamedItem("IMAGEKEY").nodeValue
        n.DecomposeID = xmlNode2.Attributes.getNamedItem("DECOMPOSEID").nodeValue
        n.AllowDecomposition = xmlNode2.Attributes.getNamedItem(UCase("AllowDecomposition")).nodeValue
    Next
Next


Set xmlELs = xmlDoc.getElementsByTagName("EDGE")

For Each xmlNode In xmlELs
    For Each gr In ProjectInfo
        Set n = gr.Nodes(xmlNode.Attributes.getNamedItem("FROMNODEID").nodeValue)
        If Not n Is Nothing Then
            Set n2 = gr.Nodes(xmlNode.Attributes.getNamedItem("TONODEID").nodeValue)
            With n.Edges.Add(xmlNode.Attributes.getNamedItem("ID").nodeValue, n, n2)
                .SelectedColor = xmlNode.Attributes.getNamedItem("SELECTEDCOLOR").nodeValue
                .DefaultColor = xmlNode.Attributes.getNamedItem("DEFAULTCOLOR").nodeValue
                .BorderStyle = xmlNode.Attributes.getNamedItem("BORDERSTYLE").nodeValue
                .ToolTipText = xmlNode.Attributes.getNamedItem("TOOLTIPTEXT").nodeValue
            End With
            Exit For
        End If
    Next
Next

If ProjectInfo.Count > 0 Then
    SelectGraph ProjectInfo.Item(1).id
End If

Repaint
Call RecalcScrolls
CenterGraph

Set xmlELs = Nothing
Set xmlNode = Nothing
Set xmlNode2 = Nothing
Set xmlDoc = Nothing
End Sub


Private Sub CenterGraph()
  panel.Visible = False
  CenterX = CLng(HScroll1.Max + HScroll1.Min / 2) * 100
  CenterY = CLng(VScroll1.Max + VScroll1.Min / 2) * 100
  VScroll1.Value = VScroll1.Max + VScroll1.Min / 2
  HScroll1.Value = HScroll1.Max + HScroll1.Min / 2
  MoveObjects
  RepaintLines
  panel.Visible = True
End Sub



Public Sub SelectGraph(ByVal id As String)
Dim n As Node
Dim n2 As Node
Dim e As Edge
Dim ecnt As Long
Dim ncnt As Long
Dim i As Long
Dim FromNode As String, ToNode As String
 
On Error Resume Next

Set gr = ProjectInfo.Item(id)
ecnt = 0
On Error Resume Next
 For i = 1 To CntObj
   Unload Entity(i)
Next
FirstPoint = 0

WaitObject = False
VScroll1.Value = 0
HScroll1.Value = 0
CurScale = 1
CntObj = 1
For i = 1 To gr.Nodes.Count
    Set n = gr.Nodes.Item(i)
    Load Entity(CntObj)
    With n
      Set .Control = Entity(CntObj)
      .ControlIndex = CntObj
      Entity(CntObj).AllowDecomposition = .AllowDecomposition
      Entity(CntObj).Caption = n.Caption
    End With
    CntObj = CntObj + 1
Next
Repaint
End Sub



Public Sub Repaint()
 Dim n As Node
 For Each n In gr.Nodes
  On Error Resume Next
  If Not ImageList Is Nothing Then
    If n.ImageKey <> "" Then
      Set n.Picture = ImageList.ListImages(n.ImageKey).Picture
    ElseIf n.ImageIndex >= 1 And n.ImageIndex <= ImageList.ListImages.Count Then
        Set n.Picture = ImageList.ListImages(n.ImageIndex).Picture
    End If
  End If
 Next

 RecalcAllNodes
 MoveObjects
End Sub

Private Sub RepaintNode(n As Node)
  ClearNodeLines n
  RecalcNodeLines n
  RecalcToNodeLines n
  ClearLinesAfter
End Sub

Public Function NewEntity(ByVal NAME As String, ByVal ImageIndex As Integer, ByVal x As Double, ByVal y As Double, ByVal id As String, Optional ByVal AllowDecomposition As Boolean = False) As String
    CntObj = CntObj + 1
    Load Entity(CntObj)
    
    With gr.Nodes.Add(id)
      Set .Control = Entity(CntObj)
      .Caption = NAME
      Set .NodeObject = Nothing
      .IsSelected = False
      .x = NodePosX(x) 'Nodeposx(x)
      .y = NodePosY(y) 'cy - H / 2 / CurScale + Y * CurScale 'Nodeposy(y)
      .W = Entity(CntObj).Width
      .H = Entity(CntObj).Height
      .ControlIndex = CntObj
      .ImageIndex = ImageIndex
      .BackColor = vbWhite
      .AllowDecomposition = AllowDecomposition
    End With
    
    RaiseEvent NodeAdd(gr.Nodes(id))
    
    Call RecalcScrolls
    
    Set Entity(CntObj).Picture = ImageList.ListImages(ImageIndex).Picture
    RecalcAllNodes
    MoveObjects
    NewEntity = id
End Function


Public Function NewEntity2(ByVal NAME As String, ByVal ImageIndex As Integer, ByVal ImageKey As String, ByVal x As Double, ByVal y As Double, ByVal id As String, Optional ByVal AllowDecomposition As Boolean = False) As String
    CntObj = CntObj + 1
    Load Entity(CntObj)
    
    With gr.Nodes.Add(id)
      Set .Control = Entity(CntObj)
      .Caption = NAME
      Set .NodeObject = Nothing
      .IsSelected = False
      .x = NodePosX(x) 'Nodeposx(x)
      .y = NodePosY(y) 'cy - H / 2 / CurScale + Y * CurScale 'Nodeposy(y)
      .W = Entity(CntObj).Width
      .H = Entity(CntObj).Height
      .ControlIndex = CntObj
      .ImageIndex = ImageIndex
      .ImageKey = ImageKey
      .BackColor = vbWhite
      .AllowDecomposition = AllowDecomposition
    End With
    
    
    
    RaiseEvent NodeAdd(gr.Nodes(id))
    
    Call RecalcScrolls
    
    If ImageKey <> "" Then
      Set Entity(CntObj).Picture = ImageList.ListImages(ImageKey).Picture
    ElseIf ImageIndex <> 0 Then
      Set Entity(CntObj).Picture = ImageList.ListImages(ImageIndex).Picture
    End If
    RecalcAllNodes
    MoveObjects
    NewEntity2 = id
End Function


Private Sub RecalcScrolls()
'    Exit Sub
    Dim iw As Double
    Dim ih As Double

    iw = W / CurScale
    ih = H / CurScale
    

    HScroll1.Visible = False
    VScroll1.Visible = False
    On Error Resume Next
    Dim MaxX As Long, MinX As Long, MaxY As Long, MinY As Long
    Dim n As Node

    Dim firstnode As Boolean
    firstnode = True
    For Each n In gr.Nodes
        If n.x + n.W > MaxX Or firstnode Then
            MaxX = n.x + n.W
        End If
        
        If n.x < MinX Or firstnode Then
            MinX = n.x
        End If
        
        If n.y + n.H > MaxY Or firstnode Then
            MaxY = n.y + n.H
        End If
        
        If n.y < MinY Or firstnode Then
            MinY = n.y
        End If
        firstnode = False
    Next
            
    If gr.Nodes.Count > 0 Then
        HScroll1.Min = Int(MinX / 100)
        HScroll1.Max = Int(MaxX / 100)
        VScroll1.Min = Int(MinY / 100)
        VScroll1.Max = Int(MaxY / 100)
        
        If ih / 100 > VScroll1.Max - VScroll1.Min Then
            VScroll1.LargeChange = VScroll1.Max - VScroll1.Min
        Else
            VScroll1.LargeChange = ih / 100
        End If
      
        If VScroll1.LargeChange / 10 < 1 Then
            VScroll1.SmallChange = 1
        Else
            VScroll1.SmallChange = VScroll1.LargeChange / 10
        End If
        
        If iw / 100 > HScroll1.Max - HScroll1.Min Then
            HScroll1.LargeChange = HScroll1.Max - HScroll1.Min
        Else
            HScroll1.LargeChange = iw / 100
        End If
        
        If HScroll1.LargeChange / 10 < 1 Then
            HScroll1.SmallChange = 1
        Else
            HScroll1.SmallChange = HScroll1.LargeChange / 10
        End If
        
        If MinY <= CenterY And MaxY >= CenterY Then
          VScroll1.Value = CenterY / 100
        Else
          VScroll1.Value = (VScroll1.Max + VScroll1.Min) / 2
        End If
        
        If MinX <= CenterX And MaxX >= CenterX Then
          HScroll1.Value = CenterX / 100
        Else
          HScroll1.Value = (HScroll1.Max + HScroll1.Min) / 2
        End If
        
        
    Else
        HScroll1.Min = 0
        HScroll1.Max = 0
        VScroll1.Min = 0
        VScroll1.Max = 0
        VScroll1.Value = 0
        HScroll1.Value = 0
    End If
    

    VScroll1.Visible = True
    HScroll1.Visible = True
    
End Sub

Public Sub DecomposeNode(ByVal nodeid As String)
    Dim id As String, n As Node
    Set n = gr.Nodes.Item(nodeid)
    If n Is Nothing Then Exit Sub
    id = Util.CreateGUID2
    ProjectInfo.Add(id).Parentid = gr.id
    n.DecomposeID = id
End Sub

Public Sub RemoveDecomposition(ByVal nodeid As String)
    Dim id As String, n As Node
    Set n = gr.Nodes.Item(nodeid)
    If n Is Nothing Then Exit Sub
    If n.DecomposeID <> "" Then
        ProjectInfo.Item(n.DecomposeID).CloseClass
        ProjectInfo.Remove n.DecomposeID
        n.DecomposeID = ""
    End If
End Sub

Public Property Get AllowDecomposition() As Boolean
    AllowDecomposition = m_bAllowDecomposition
End Property

Public Property Let AllowDecomposition(ByVal bNewValue As Boolean)
    m_bAllowDecomposition = bNewValue
End Property


Public Property Get GraphEnabled() As Boolean
    GraphEnabled = panel.Enabled
End Property

Public Property Let GraphEnabled(ByVal vNewValue As Boolean)
    panel.Enabled = vNewValue
End Property

Public Sub ExportFormImage(ByVal filename As String)
    GetFormImage panel, filename
End Sub

Public Sub ExportImage(ByVal filename As String)
    MakeGraphPicture filename
End Sub



Private Sub MakeGraphPicture(ByVal filename As String)
 Dim f2 As Form2
    On Error Resume Next
    Set f2 = New Form2
    
    f2.Hide
    Dim wmin As Double, wmax As Double
    Dim hmin As Double, hmax As Double
    Dim i As Long, j As Long, k As Long
    Dim gn As Node
    For i = 1 To gr.Nodes.Count
      Set gn = gr.Nodes.Item(i)
      If i = 1 Then
        wmin = gn.x
        wmax = gn.x + gn.W
        hmin = gn.y
        hmax = gn.y + gn.H
      End If
      If wmin > gn.x Then wmin = gn.x
      If wmax < gn.x + gn.W Then wmax = gn.x + gn.W
      If hmin > gn.y Then hmin = gn.y
      If hmax < gn.y + gn.H Then hmax = gn.y + gn.H
    Next
    f2.Picture1.AutoRedraw = True
    
    ' Paint form into a bitmap
    f2.Picture1.Height = hmax - hmin + 240
    f2.Picture1.Width = wmax - wmin + 240
    f2.FillColor = vbWhite
    f2.Picture1.BackColor = vbWhite
    f2.Picture1.Cls
    
    Dim ge As Edge
    Dim gl As LineItem
    Dim res As Long
    For i = 1 To gr.Nodes.Count
      Set gn = gr.Nodes.Item(i)
      f2.Picture1.Line (gn.x - wmin + 60, gn.y - hmin + 60)-(gn.x + gn.W - wmin + 60, gn.y + gn.H - hmin + 60), 0, B
      For j = 1 To gn.Edges.Count
        Set ge = gn.Edges.Item(j)
        For k = 1 To ge.LineItems.Count
          Set gl = ge.LineItems.Item(k)
          f2.Picture1.Line (gl.FromX - wmin + 60, gl.FromY - hmin + 60)-(gl.ToX - wmin + 60, gl.ToY - hmin + 60), 0
        Next
      Next
      
      
      f2.Picture1.PaintPicture GImageList.ListImages.Item(gn.ImageKey).Picture, (gn.x - wmin + 60), (gn.y - hmin + 60)
      
      
'      r.Left = (gn.x - wmin + 60) / Screen.TwipsPerPixelX
'      r.Top = 45 + (gn.y - hmin + 60) / Screen.TwipsPerPixelY
'      r.Right = r.Left + gn.W / Screen.TwipsPerPixelX
'      r.Bottom = (gn.y - hmin + 60) / Screen.TwipsPerPixelY + gn.H / Screen.TwipsPerPixelY
      Dim r As RECT
      f2.Picture2.AutoRedraw = True
      f2.Picture2.FillColor = vbWhite
      f2.Picture2.BackColor = vbWhite
      f2.Picture2.Height = gn.H
      f2.Picture2.Width = gn.W
      f2.Picture2.Cls
      r.Left = 0
      r.Top = 0
      r.Right = gn.W / Screen.TwipsPerPixelX - 2
      r.Bottom = gn.H / Screen.TwipsPerPixelY - 47
      res = DrawText(f2.Picture2.hdc, gn.Caption & Chr(0), Len(gn.Caption) + 1, r, DT_WORDBREAK + DT_NOCLIP)
      BitBlt f2.Picture1.hdc, (gn.x - wmin + 60) / Screen.TwipsPerPixelX + 1, (gn.y - hmin + 60) / Screen.TwipsPerPixelX + 45 + 1, gn.W / Screen.TwipsPerPixelX - 2, gn.H / Screen.TwipsPerPixelY - 45 - 2, f2.Picture2.hdc, 0, 0, &HCC0020
      f2.Picture2.AutoRedraw = False
      'f2.Picture1.PaintPicture f2.Picture2.Picture, (gn.x - wmin + 60), (gn.y - hmin + 60) + 45 * Screen.TwipsPerPixelY
      
      'res = DrawText(f2.Picture1.hdc, gn.Caption & Chr(0), Len(gn.Caption) + 1, r, DT_WORDBREAK + DT_BOTTOM)
      
      'TextOut f2.Picture1.hdc, r.Left, r.Top, gn.Caption & Chr(0), Len(gn.Caption) + 1
      
'      If res = 0 Then
'        Stop
'      End If

      
    Next
    
    
    
    f2.Picture1.AutoRedraw = False
    SavePicture f2.Picture1.Image, filename
    Unload f2
    Set f2 = Nothing

End Sub
