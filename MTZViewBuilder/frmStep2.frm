VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmStep2 
   Caption         =   "Выбор полей представления"
   ClientHeight    =   4515
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   6345
   Icon            =   "frmStep2.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   4515
   ScaleWidth      =   6345
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   60000
      Left            =   3360
      Top             =   120
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   1215
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   1440
      TabIndex        =   1
      Top             =   120
      Width           =   1215
   End
   Begin MSComctlLib.ImageList TreeIcons 
      Left            =   2040
      Top             =   3960
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   7
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStep2.frx":030A
            Key             =   "part"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStep2.frx":0BE4
            Key             =   "ERR"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStep2.frx":14BE
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStep2.frx":1D98
            Key             =   "field"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStep2.frx":2672
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStep2.frx":2F4C
            Key             =   "type"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStep2.frx":3826
            Key             =   "SYS"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList imlToolbarIcons 
      Left            =   2760
      Top             =   3960
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   4
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStep2.frx":4100
            Key             =   "Back"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStep2.frx":4212
            Key             =   "Forward"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStep2.frx":4324
            Key             =   "lbrac"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStep2.frx":463E
            Key             =   "rbrac"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.TreeView struct 
      Height          =   3495
      Left            =   120
      TabIndex        =   0
      Top             =   600
      Width           =   5895
      _ExtentX        =   10398
      _ExtentY        =   6165
      _Version        =   393217
      HideSelection   =   0   'False
      Indentation     =   176
      LabelEdit       =   1
      LineStyle       =   1
      Style           =   7
      Checkboxes      =   -1  'True
      ImageList       =   "TreeIcons"
      Appearance      =   1
   End
End
Attribute VB_Name = "frmStep2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public OK As Boolean
Private Sub CancelButton_Click()
  OK = False
  Me.Hide
  Unload frmAgg
End Sub

Private Sub Form_Load()

  Dim i As Long, j As Long
  Dim o As OBJECTTYPE
  Dim obj As Object
  Load frmAgg
  
  Dim p As PART
  
  Set obj = BasePart.Parent.Parent
  While TypeName(obj) <> "OBJECTTYPE"
    Set obj = obj.Parent.Parent
  Wend
  
  Set BaseType = obj
  
  
  
  Screen.MousePointer = vbHourglass
  model.OBJECTTYPE.Sort = "Comment"
  struct.Nodes.Clear
  
  Set o = BaseType
  
  struct.Nodes.Add , , o.id, o.Comment, "type"
  For j = 1 To o.PART.Count
    LoadPart o.PART.Item(j), o.id
  Next
  
  Screen.MousePointer = vbDefault
  
  Me.Left = GetSetting(App.Title, "Settings", "MainLeft", 1000)
  Me.Top = GetSetting(App.Title, "Settings", "MainTop", 1000)
  Me.Width = GetSetting(App.Title, "Settings", "MainWidth", 6500)
  Me.Height = GetSetting(App.Title, "Settings", "MainHeight", 6500)
  
End Sub




Private Sub Form_Resize()
  On Error Resume Next
  If Me.Width < 3000 Then Me.Width = 3000
  struct.Width = Me.ScaleWidth
  struct.Left = Me.ScaleLeft
  'struct.Top = Me.ScaleTop
  struct.Height = Me.ScaleHeight - struct.Top

End Sub

'Private Sub Grid_DblClick()
'Dim s As String
'If Grid.Row > 0 Then
'  If Grid.TextMatrix(Grid.Row, Grid.Col) <> "" Then
'    If Grid.Col = 1 Then
'
'      If Grid.TextMatrix(Grid.Row, Grid.Col) = "И" Then
'         Grid.TextMatrix(Grid.Row, Grid.Col) = "ИЛИ"
'      Else
'        Grid.TextMatrix(Grid.Row, Grid.Col) = "И"
'      End If
'    End If
'    If Grid.Col = 3 Then
'      Dialog.sync = Grid.TextMatrix(Grid.Row, Grid.Col)
'      Dialog.Show vbModal
'      If Dialog.Result >= 0 Then
'        Grid.TextMatrix(Grid.Row, Grid.Col) = Dialog.lstOP
'        If IsUnary(Op2Code(Grid.TextMatrix(Grid.Row, 3))) Then
'          Grid.TextMatrix(Grid.Row, 4) = ""
'        Else
'          Grid.TextMatrix(Grid.Row, 4) = "???"
'        End If
'      End If
'      Unload Dialog
'    End If
'    If Grid.Col = 4 Then
'      If IsUnary(Op2Code(Grid.TextMatrix(Grid.Row, 3))) Then
'        Grid.TextMatrix(Grid.Row, 4) = ""
'      Else
'        If IsArgArray(Op2Code(Grid.TextMatrix(Grid.Row, 3))) Then
'            Dim f As ArrDialog
'            Set f = New ArrDialog
'            f.Result = Grid.TextMatrix(Grid.Row, 4)
'            f.Show vbModal
'            If f.OK Then
'              Grid.TextMatrix(Grid.Row, 4) = f.Result
'            End If
'        Else
'          If Grid.TextMatrix(Grid.Row, 4) <> "" Then
'            s = InputBox("Задайте значение", "Значение", Grid.TextMatrix(Grid.Row, 4))
'            If s = "" Then Exit Sub
'            Grid.TextMatrix(Grid.Row, 4) = s
'          End If
'        End If
'      End If
'    End If
'
'  End If
'End If
'End Sub









Private Sub LoadPart(ByVal p As PART, ByVal parentID As String)
  Dim id As String
  Dim id2 As String
  Screen.MousePointer = vbHourglass
  If ExpandStyle(p) <> 3 Then
    id = p.id & CreateGUID2()
    If CountOfID(p.id, struct.Nodes.Item(parentID)) > 2 Then
      struct.Nodes.Add(parentID, tvwChild, , "<<< ЦИКЛИЧЕСКАЯ ССЫЛКА >>> (" & p.Caption & ")", "ERR").ForeColor = RGB(255, 0, 0)
    Else
      With struct.Nodes.Add(parentID, tvwChild, id, p.Caption, "part")
        .Bold = True
        .Tag = "part"
      End With
      With struct.Nodes.Add(id, tvwChild, , "To expand")
           .Tag = "ToExpand"
      End With
    End If
  End If
  Screen.MousePointer = vbDefault
End Sub




Private Sub OKButton_Click()
OK = True
Me.Hide
Unload frmAgg
End Sub

Private Sub struct_Expand(ByVal Node As MSComctlLib.Node)
  Dim n As Node
  If Node.children = 1 Then
    If Node.Child.Tag = "ToExpand" Then
      struct.Nodes.Remove Node.Child.Index
      Dim id As String
      Dim l As String
      
      
      ExractLevel Node.Key, id, l
      Dim f As FIELD, p As PART, p2 As PART, ft As FIELDTYPE, id2 As String
      
      If Node.Tag = "field" Then
'        Set f = model.FindRowObject("FIELD", id)
'        If f.ReferenceType = ReferenceType_Na_ob_ekt_ Then
'            Set n = struct.Nodes.Add(Node.Key, tvwChild, CreateGUID2, "ИМЯ", "SYS")
'            n.ForeColor = RGB(0, 0, 192)
'            n.Tag = "NAME"
'            Set n = struct.Nodes.Add(Node.Key, tvwChild, CreateGUID2, "ТИП ОБЪЕКТА", "SYS")
'            n.ForeColor = RGB(0, 0, 192)
'            n.Tag = "OBJTYPE"
'            Exit Sub
'        End If
'        If f.ReferenceType = ReferenceType_Na_stroku_razdela Then
'            Set p = f.RefToPart
'            If Not p Is Nothing Then
'                LoadPart p, Node.Key
'            End If
'        End If
    End If
    If Node.Tag = "part" Then
      Dim i As Long, j As Long, et As Integer
      
      Set p = model.FindObject("PART", id)
      et = ExpandStyle(p)
      If et <> 3 Then
        For i = 1 To p.FIELD.Count
           
           Set f = p.FIELD.Item(i)
           id2 = f.id & CreateGUID2()
           If et = 0 Then
           struct.Nodes.Add(Node.Key, tvwChild, id2, f.Caption, "field").Tag = "field"
           End If
           If et = 1 Then
            struct.Nodes.Add(Node.Key, tvwChild, id2, "AGGREGATION( " & f.Caption & ")", "field").Tag = "aggparent"
           End If
           If et = 2 Then
            struct.Nodes.Add(Node.Key, tvwChild, id2, "AGGREGATION(" & f.Caption & ")", "field").Tag = "agginst"
           End If
        Next

        For j = 1 To p.PART.Count
          Set p2 = p.PART.Item(j)
          LoadPart p2, Node.Key
        Next
      End If
    End If
    End If
  End If
End Sub

'
' 0  - поля безагрегации
' 1 - поля  с агреацийей к BasePart
' 2 - поля с агрегацией к Instance
' 3 - не могут входить в запрос

Private Function ExpandStyle(p As PART) As Integer
  If p.id = BasePartID Then
      ExpandStyle = 0
      Exit Function
  End If
  If IsParent(BasePart, p.id) Then
      ExpandStyle = 0
      Exit Function
  End If
  If p.Parent.Parent.id = BasePartID Then
      'ExpandStyle = 1 - использование агрегации резко снижает список типов полей
      ' которые можно использовать в запросе
      ExpandStyle = 3
      Exit Function
  End If
  
  If TypeName(p.Parent.Parent) = "OBJECTTYPE" Then
    If p.PartType = PartType_Stroka Then
      ExpandStyle = 0
      Exit Function
    Else
      'ExpandStyle = 2 -полная бессмыслица
      ExpandStyle = 3
      Exit Function
    End If
  End If
  ExpandStyle = 3
End Function

Private Function IsParent(p As PART, Parent As String) As Boolean
  Dim o  As Object
  Set o = p
  While TypeName(o) <> "OBJECTTYPE"
    Set o = o.Parent.Parent
    If o.id = Parent Then
      IsParent = True
      Exit Function
    End If
  Wend
  IsParent = False

End Function

Private Sub struct_NodeCheck(ByVal Node As MSComctlLib.Node)
      Dim s As String, i As Long, l As Boolean
    Dim id As String
    Dim ll As String
    Dim f As FIELD
    Dim vi As ViewItems

  If Node.Checked Then
  
    If Node.Tag = "type" Then Node.Checked = False: Exit Sub
    If Node.Tag = "part" Then Node.Checked = False: Exit Sub
    
    ExractLevel Node.Key, id, ll
    On Error Resume Next
    Set vi = Nothing
    Set vi = viCol.Item(id)
    
    If Node.Tag = "field" Then
      If vi Is Nothing Then
        Set vi = New ViewItems
        vi.FieldID = id
        vi.Aggregation = ""
        viCol.Add vi, id
      End If
    End If
    
    If Node.Tag = "aggparent" Or Node.Tag = "agginst" Then
      frmAgg.Show vbModal
      If frmAgg.OK Then
      If vi Is Nothing Then
        Set vi = New ViewItems
        vi.FieldID = id
        vi.Aggregation = frmAgg.lstAgg.Text
        viCol.Add vi, id
      Else
        vi.Aggregation = frmAgg.lstAgg.Text
      End If
      l = False
      s = ""
      For i = 1 To Len(Node.Text)
        If Mid(Node.Text, i, 1) = "(" Then l = True
        If l Then s = s & Mid(Node.Text, i, 1)
      Next
      Node.Text = frmAgg.lstAgg.Text & s
      Else
        Node.Checked = False
      End If
      Exit Sub
    End If
    
  Else
    ExractLevel Node.Key, id, ll
    If Node.Tag = "aggparent" Or Node.Tag = "agginst" Then
      l = False
      s = ""
      For i = 1 To Len(Node.Text)
        If Mid(Node.Text, i, 1) = "(" Then l = True
        If l Then s = s & Mid(Node.Text, i, 1)
      Next
      Node.Text = "AGGREGATION" & s
          On Error Resume Next
    viCol.Remove id

    End If
    If Node.Tag = "field" Then
      On Error Resume Next
      viCol.Remove id
    End If
  End If
End Sub

Private Sub Timer1_Timer()
On Error Resume Next: session.Exec "SessionTouch", Nothing
End Sub
