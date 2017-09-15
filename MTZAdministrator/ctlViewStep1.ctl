VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl ctlViewStep1 
   ClientHeight    =   4950
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6390
   ScaleHeight     =   4950
   ScaleWidth      =   6390
   Begin MSComctlLib.ImageList TreeIcons 
      Left            =   4560
      Top             =   600
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
            Picture         =   "ctlViewStep1.ctx":0000
            Key             =   "part"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ctlViewStep1.ctx":08DA
            Key             =   "ERR"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ctlViewStep1.ctx":11B4
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ctlViewStep1.ctx":1A8E
            Key             =   "field"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ctlViewStep1.ctx":2368
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ctlViewStep1.ctx":2C42
            Key             =   "type"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ctlViewStep1.ctx":351C
            Key             =   "SYS"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.TreeView struct 
      Height          =   2295
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   3255
      _ExtentX        =   5741
      _ExtentY        =   4048
      _Version        =   393217
      HideSelection   =   0   'False
      Indentation     =   53
      LabelEdit       =   1
      LineStyle       =   1
      Sorted          =   -1  'True
      Style           =   6
      ImageList       =   "TreeIcons"
      Appearance      =   1
   End
End
Attribute VB_Name = "ctlViewStep1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False

Option Explicit


Private Sub loadPart(ByVal p As PART, ByVal parentID As String)
  Dim ID As String
  Dim id2 As String
  Screen.MousePointer = vbHourglass
  ID = p.ID & CreateGUID2()
  
  If CountOfID(p.ID, struct.Nodes.item(parentID)) > 2 Then
    struct.Nodes.Add(parentID, tvwChild, , "<<< ЦИКЛИЧЕСКАЯ ССЫЛКА >>> (" & p.Caption & ")", "ERR").ForeColor = RGB(255, 0, 0)
  Else
    With struct.Nodes.Add(parentID, tvwChild, ID, p.Caption, "part")
      .Bold = True
      .Tag = "part"
    End With
    With struct.Nodes.Add(ID, tvwChild, , "To expand")
         .Tag = "ToExpand"
    End With
    
    
  End If
  Screen.MousePointer = vbDefault
End Sub

Public Sub OnInit()
  Dim i As Long, j As Long
  Dim o As objectType
  Dim p As PART
  On Error Resume Next
  Screen.MousePointer = vbHourglass
  model.objectType.Sort = "Comment"
  struct.Nodes.Clear
  For i = 1 To model.objectType.Count
    Set o = model.objectType.item(i)
    
    struct.Nodes.Add , , o.ID, o.the_comment, "type"
    For j = 1 To o.PART.Count
      loadPart o.PART.item(j), o.ID
    Next
    'Debug.Print o.Name
  Next
  Screen.MousePointer = vbDefault
End Sub


Public Function OnNext() As Boolean
On Error Resume Next
If struct.SelectedItem Is Nothing Then
  MsgBox "Надо выбрать базовый раздел", vbInformation + vbOKOnly, "Посторение сложного запроса"
  Exit Function
End If
If struct.SelectedItem.Tag = "part" Then
  Dim ID As String
  Dim l As String
  ExractLevel struct.SelectedItem.Key, ID, l
  BasePartID = ID
  Set viCol = New Collection
  Set BasePart = model.FindObject("PART", BasePartID)
  OnNext = True
Else
  MsgBox "Надо выбрать базовый раздел", vbInformation + vbOKOnly, "Посторение сложного запроса"
End If
End Function

Private Sub struct_Expand(ByVal Node As MSComctlLib.Node)
  Dim n As Node
  If Node.Children = 1 Then
    If Node.Child.Tag = "ToExpand" Then
      struct.Nodes.Remove Node.Child.Index
      Dim ID As String
      Dim l As String, j As Long
      ExractLevel Node.Key, ID, l
      Dim p As PART, p2 As PART
      Set p = model.FindObject("PART", ID)
      For j = 1 To p.PART.Count
        Set p2 = p.PART.item(j)
        loadPart p2, Node.Key
      Next
    End If
  End If
End Sub






Private Sub Usercontrol_resize()
  On Error Resume Next
  struct.Top = 0
  struct.Left = 0
  struct.Width = UserControl.Extender.Width
  struct.Height = UserControl.Extender.Height
End Sub
