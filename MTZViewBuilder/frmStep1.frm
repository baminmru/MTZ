VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmStep1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Âûáîð áàçîâîãî ðàçäåëà"
   ClientHeight    =   5520
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6210
   Icon            =   "frmStep1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5520
   ScaleWidth      =   6210
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   60000
      Left            =   3480
      Top             =   120
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   1440
      TabIndex        =   1
      Top             =   120
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin MSComctlLib.ImageList TreeIcons 
      Left            =   4920
      Top             =   1920
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
            Picture         =   "frmStep1.frx":030A
            Key             =   "part"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStep1.frx":0BE4
            Key             =   "ERR"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStep1.frx":14BE
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStep1.frx":1D98
            Key             =   "field"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStep1.frx":2672
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStep1.frx":2F4C
            Key             =   "type"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmStep1.frx":3826
            Key             =   "SYS"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.TreeView struct 
      Height          =   4815
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   6015
      _ExtentX        =   10610
      _ExtentY        =   8493
      _Version        =   393217
      HideSelection   =   0   'False
      Indentation     =   176
      LabelEdit       =   1
      LineStyle       =   1
      Style           =   7
      ImageList       =   "TreeIcons"
      Appearance      =   1
   End
End
Attribute VB_Name = "frmStep1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit
Public OK As Boolean

Private Sub CancelButton_Click()
OK = False
Me.Hide
End Sub


Private Sub Form_Load()
  Dim i As Long, j As Long
  Dim o As OBJECTTYPE
  Dim p As PART
 
  Screen.MousePointer = vbHourglass
  model.OBJECTTYPE.Sort = "Comment"
  struct.Nodes.Clear
  For i = 1 To model.OBJECTTYPE.Count
    Set o = model.OBJECTTYPE.Item(i)
    
    struct.Nodes.Add , , o.id, o.Comment, "type"
    For j = 1 To o.PART.Count
      LoadPart o.PART.Item(j), o.id
    Next
    Debug.Print o.Name
  Next
  Screen.MousePointer = vbDefault
End Sub

Private Sub LoadPart(ByVal p As PART, ByVal parentID As String)
  Dim id As String
  Dim id2 As String
  Screen.MousePointer = vbHourglass
  id = p.id & CreateGUID2()
  
  If CountOfID(p.id, struct.Nodes.Item(parentID)) > 2 Then
    struct.Nodes.Add(parentID, tvwChild, , "<<< ÖÈÊËÈ×ÅÑÊÀß ÑÑÛËÊÀ >>> (" & p.Caption & ")", "ERR").ForeColor = RGB(255, 0, 0)
  Else
    With struct.Nodes.Add(parentID, tvwChild, id, p.Caption, "part")
      .Bold = True
      .Tag = "part"
    End With
    With struct.Nodes.Add(id, tvwChild, , "To expand")
         .Tag = "ToExpand"
    End With
    
    
  End If
  Screen.MousePointer = vbDefault
End Sub




Private Sub OKButton_Click()
If struct.SelectedItem.Tag = "part" Then
  Dim id As String
  Dim l As String
  ExractLevel struct.SelectedItem.Key, id, l
  BasePartID = id
  OK = True
  Me.Hide
End If
End Sub

Private Sub struct_Expand(ByVal Node As MSComctlLib.Node)
  Dim n As Node
  If Node.children = 1 Then
    If Node.Child.Tag = "ToExpand" Then
      struct.Nodes.Remove Node.Child.Index
      Dim id As String
      Dim l As String, j As Long
      ExractLevel Node.Key, id, l
      Dim p As PART, p2 As PART
      Set p = model.FindObject("PART", id)
      For j = 1 To p.PART.Count
        Set p2 = p.PART.Item(j)
        LoadPart p2, Node.Key
      Next
    End If
  End If
End Sub




Private Sub Timer1_Timer()
On Error Resume Next: session.Exec "SessionTouch", Nothing
End Sub
