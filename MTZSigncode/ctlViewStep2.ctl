VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl ctlViewStep2 
   ClientHeight    =   5880
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7230
   ScaleHeight     =   5880
   ScaleWidth      =   7230
   Begin MSComctlLib.TreeView struct 
      Height          =   3495
      Left            =   480
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
   Begin MSComctlLib.ImageList TreeIcons 
      Left            =   4560
      Top             =   4320
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
            Picture         =   "ctlViewStep2.ctx":0000
            Key             =   "part"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ctlViewStep2.ctx":08DA
            Key             =   "ERR"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ctlViewStep2.ctx":11B4
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ctlViewStep2.ctx":1A8E
            Key             =   "field"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ctlViewStep2.ctx":2368
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ctlViewStep2.ctx":2C42
            Key             =   "type"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ctlViewStep2.ctx":351C
            Key             =   "SYS"
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "ctlViewStep2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Public Sub OnInit()
  Dim i As Long, j As Long
  Dim o As OBJECTTYPE
  Dim obj As Object
  Load frmAgg
  On Error Resume Next
  Dim P As PART
  
  Set obj = BasePart.Parent.Parent
  If obj Is Nothing Then Exit Sub
  While TypeName(obj) <> "OBJECTTYPE"
    Set obj = obj.Parent.Parent
  Wend
  
  Set BaseType = obj
  
  
  
  Screen.MousePointer = vbHourglass
  model.OBJECTTYPE.Sort = "Comment"
  struct.Nodes.Clear
  
  Set o = BaseType
  
  struct.Nodes.Add , , o.ID, o.the_comment, "type"
  For j = 1 To o.PART.Count
    LoadPart o.PART.item(j), o.ID
  Next
  
  Screen.MousePointer = vbDefault
  
End Sub








Private Sub LoadPart(ByVal P As PART, ByVal parentID As String)
  Dim ID As String
  Dim id2 As String
  Screen.MousePointer = vbHourglass
  If ExpandStyle(P) <> 3 Then
    ID = P.ID & CreateGUID2()
    If CountOfID(P.ID, struct.Nodes.item(parentID)) > 2 Then
      struct.Nodes.Add(parentID, tvwChild, , "<<< ЦИКЛИЧЕСКАЯ ССЫЛКА >>> (" & P.Caption & ")", "ERR").ForeColor = RGB(255, 0, 0)
    Else
      With struct.Nodes.Add(parentID, tvwChild, ID, P.Caption, "part")
        .Bold = True
        .Tag = "part"
      End With
      With struct.Nodes.Add(ID, tvwChild, , "To expand")
           .Tag = "ToExpand"
      End With
    End If
  End If
  Screen.MousePointer = vbDefault
End Sub




Public Function OnNext() As Boolean
  If viCol.Count = 0 Then
    MsgBox "Надо выбрать хотя бы одно поле", vbInformation + vbOKOnly, "Посторение сложного запроса"
  Else
    OnNext = True
  End If
  
End Function

Private Sub struct_Expand(ByVal Node As MSComctlLib.Node)
  Dim n As Node
  If Node.children = 1 Then
    If Node.Child.Tag = "ToExpand" Then
      struct.Nodes.Remove Node.Child.Index
      Dim ID As String
      Dim l As String
      
      
      ExractLevel Node.Key, ID, l
      Dim f As MTZMetaModel.Field, P As PART, p2 As PART, ft As MTZMetaModel.FieldType, id2 As String
      
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
      Set P = model.FindObject("PART", ID)
      et = ExpandStyle(P)
      If et <> 3 Then
        For i = 1 To P.Field.Count
           Set f = P.Field.item(i)
           id2 = f.ID & CreateGUID2()
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

        For j = 1 To P.PART.Count
          Set p2 = P.PART.item(j)
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

Private Function ExpandStyle(P As PART) As Integer
  If P.ID = BasePartID Then
      ExpandStyle = 0
      Exit Function
  End If
  If IsParent(BasePart, P.ID) Then
      ExpandStyle = 0
      Exit Function
  End If
  If P.Parent.Parent.ID = BasePartID Then
      'ExpandStyle = 1 - использование агрегации резко снижает список типов полей
      ' которые можно использовать в запросе
      ExpandStyle = 3
      Exit Function
  End If
  
  If TypeName(P.Parent.Parent) = "OBJECTTYPE" Then
    If P.PartType = PartType_Stroka Then
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

Private Function IsParent(P As PART, Parent As String) As Boolean
  Dim o  As Object
  Set o = P
  While TypeName(o) <> "OBJECTTYPE"
    Set o = o.Parent.Parent
    If o.ID = Parent Then
      IsParent = True
      Exit Function
    End If
  Wend
  IsParent = False

End Function

Private Sub struct_NodeCheck(ByVal Node As MSComctlLib.Node)
  Dim s As String, i As Long, l As Boolean
  Dim ID As String
  Dim ll As String
  Dim f As MTZMetaModel.Field
  Dim vi As ViewItems
  Dim cval As Boolean
  Dim cn As Node
  cval = Not Node.Checked
  If Node.Tag = "type" Or Node.Tag = "part" Then
    Node.Checked = cval
    struct_Expand Node

    Set cn = Node.Child
    While Not cn Is Nothing
      If cn.Tag <> "part" Then
        cn.Checked = Not cval
      End If
      struct_NodeCheck cn
      Set cn = cn.Next
    Wend
    Exit Sub
  End If
  
  If Node.Checked Then
    ExractLevel Node.Key, ID, ll
    On Error Resume Next
    Set vi = Nothing
    Set vi = viCol.item(ID)
    
    If Node.Tag = "field" Then
      If vi Is Nothing Then
        Set vi = New ViewItems
        vi.FieldID = ID
        vi.Aggregation = ""
        viCol.Add vi, ID
      End If
    End If
    
    If Node.Tag = "aggparent" Or Node.Tag = "agginst" Then
      frmAgg.Show vbModal
      If frmAgg.ok Then
      If vi Is Nothing Then
        Set vi = New ViewItems
        vi.FieldID = ID
        vi.Aggregation = frmAgg.lstAgg.Text
        viCol.Add vi, ID
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
    ExractLevel Node.Key, ID, ll
    If Node.Tag = "aggparent" Or Node.Tag = "agginst" Then
      l = False
      s = ""
      For i = 1 To Len(Node.Text)
        If Mid(Node.Text, i, 1) = "(" Then l = True
        If l Then s = s & Mid(Node.Text, i, 1)
      Next
      Node.Text = "AGGREGATION" & s
          On Error Resume Next
    viCol.Remove ID

    End If
    If Node.Tag = "field" Then
      On Error Resume Next
      viCol.Remove ID
    End If
  End If
End Sub



Private Sub UserControl_Resize()
  On Error Resume Next
  struct.Top = 0
  struct.Left = 0
  struct.Width = UserControl.Width
  struct.Height = UserControl.Height
End Sub


Private Sub UserControl_Terminate()
  Unload frmAgg
End Sub
