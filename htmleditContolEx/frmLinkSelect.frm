VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmLinkSelect 
   Caption         =   "Выберите ссылку на страницу"
   ClientHeight    =   6990
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10560
   Icon            =   "frmLinkSelect.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6990
   ScaleWidth      =   10560
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      Height          =   345
      Left            =   9090
      TabIndex        =   2
      Top             =   6540
      Width           =   1260
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   345
      Left            =   7740
      TabIndex        =   1
      Top             =   6540
      Width           =   1260
   End
   Begin VB.Frame Frame1 
      Height          =   6465
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10395
      Begin MSComctlLib.TreeView TreeView1 
         Height          =   2595
         Left            =   1050
         TabIndex        =   3
         Top             =   1860
         Width           =   4785
         _ExtentX        =   8440
         _ExtentY        =   4577
         _Version        =   393217
         Indentation     =   88
         LabelEdit       =   1
         LineStyle       =   1
         Style           =   6
         Appearance      =   1
      End
   End
End
Attribute VB_Name = "frmLinkSelect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public LinksCollection As PageLinks
Public Result As Long
Public Href As String

Private Sub cmdCancel_Click()
  Result = vbCancel
  Hide
End Sub

Private Sub cmdOK_Click()
  Result = vbOK
  If Not (TreeView1.SelectedItem Is Nothing) Then
    Href = TreeView1.SelectedItem.Tag.Href
  End If
  Hide
End Sub

Private Sub Form_Load()
  Call TreeView1.nodes.Clear
  Call LoadTree
End Sub


Private Sub LoadTree()
  If Not (LinksCollection Is Nothing) Then
    Dim i As Long
    Dim oneLink As PageLink
    For i = 1 To LinksCollection.Count
        Set oneLink = LinksCollection.Item(i)
        Dim onenode As Node
        Set onenode = TreeView1.nodes.Add(, tvwRootLines, oneLink.ID, oneLink.Name)
        Set onenode.Tag = oneLink
        Call LoadTreeLinks(oneLink.Pages, TreeView1.nodes, onenode)
    Next
  End If
End Sub

Private Sub LoadTreeLinks(lc As PageLinks, nodes As nodes, Parent As Node)
  If Not (lc Is Nothing) Then
    Dim i As Long
    Dim oneLink As PageLink
    For i = 1 To lc.Count
        Set oneLink = lc.Item(i)
        Dim onenode As Node
        If Not (nodes Is Nothing) Then
          Set onenode = nodes.Add(Parent, tvwChild, oneLink.ID, oneLink.Name)
          Set onenode.Tag = oneLink
          Call LoadTreeLinks(oneLink.Pages, onenode.Child, onenode)
        End If
    Next
  End If
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  Frame1.Top = 0
  Frame1.Left = 0
  Frame1.Width = Me.ScaleWidth
  Frame1.Height = Me.ScaleHeight - cmdCancel.Height - 40
  
  TreeView1.Top = 0
  TreeView1.Left = 0
  TreeView1.Width = Frame1.Width
  TreeView1.Height = Frame1.Height
  
  cmdCancel.Top = Frame1.Height + 20
  cmdCancel.Left = Me.ScaleWidth - cmdCancel.Width - 20
  cmdOK.Top = cmdCancel.Top
  cmdOK.Left = cmdCancel.Left - 20 - cmdOK.Width
End Sub

Private Sub TreeView1_DblClick()
 Call cmdOK_Click
End Sub
