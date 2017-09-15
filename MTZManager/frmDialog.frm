VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmDialog 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Выбор строки"
   ClientHeight    =   4815
   ClientLeft      =   60
   ClientTop       =   300
   ClientWidth     =   5310
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4815
   ScaleWidth      =   5310
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.TreeView tv 
      Height          =   4125
      Left            =   150
      TabIndex        =   2
      Top             =   120
      Width           =   5025
      _ExtentX        =   8864
      _ExtentY        =   7276
      _Version        =   393217
      Style           =   7
      Appearance      =   1
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      Height          =   315
      Left            =   4080
      TabIndex        =   1
      Top             =   4440
      Width           =   1175
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   2850
      TabIndex        =   0
      Top             =   4440
      Width           =   1175
   End
End
Attribute VB_Name = "frmDialog"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 105
Option Explicit
Public TableName As String
Attribute TableName.VB_VarHelpID = 160
Public Runner As Main
Attribute Runner.VB_VarHelpID = 150
Public ok As Boolean
Attribute ok.VB_VarHelpID = 140
Public ID As String
Attribute ID.VB_VarHelpID = 120
Public site As String
Attribute site.VB_VarHelpID = 155
Public Brief As String
Attribute Brief.VB_VarHelpID = 110
Private firstobj As Object
Public InstanceiD As String
Attribute InstanceiD.VB_VarHelpID = 125
Public Filter As String
Attribute Filter.VB_VarHelpID = 115

Public IsHide_Add As Boolean
Attribute IsHide_Add.VB_VarHelpID = 130
Public IsHide_Setup As Boolean
Attribute IsHide_Setup.VB_VarHelpID = 135

'Parameters:
' параметров нет
'See Also:
'  Brief
'  Filter
'  ID
'  InstanceiD
'  IsHide_Add
'  IsHide_Setup
'  ok
'  Runner
'  site
'  TableName
'Example:
'  call me.Prepare()
Public Sub Prepare()
Attribute Prepare.VB_HelpID = 145

End Sub

Private Sub cmdCancel_Click()
ok = False
Set firstobj = Nothing
Set Runner = Nothing
Me.Hide
End Sub

Private Sub cmdOK_Click()
  On Error GoTo bye
  If tv.SelectedItem Is Nothing Then Exit Sub
  Dim f As Object
  
  Dim sID As String, struct As String, child As String
  sID = Mid(tv.SelectedItem.Key, 39, 38)
  struct = tv.SelectedItem.Parent.Tag
  If struct = TableName Then
    ok = True
    ID = sID & struct
    Brief = tv.SelectedItem.Text
    Set firstobj = Nothing
    Set Runner = Nothing
    Me.Hide
  End If
  Set f = Nothing
  Set firstobj = Nothing
  Set Runner = Nothing
bye:
End Sub

Private Sub Form_Load()
  tv.Nodes.Clear
  Dim rs As ADODB.Recordset, i
  Dim obj As Object
  Dim tn As String
  tn = Runner.TableToType(site, TableName)
  If InstanceiD = "" Then
    Set rs = Runner.ListInstances(site, tn)
    While Not rs.EOF
      Set obj = Runner.GetInstanceObject(rs!InstanceiD)
      Set firstobj = obj
      obj.FillTree tv, "", "", TableName
      rs.MoveNext
    Wend
    Set rs = Nothing
  Else
    Set obj = Runner.GetInstanceObject(InstanceiD)
    Set firstobj = obj
    obj.FillTree tv, "", "", TableName
  End If
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  tv.top = 0
  tv.Left = 0
  tv.Height = Me.ScaleHeight - 60 - cmdOK.Height
  cmdOK.top = Me.ScaleHeight - 30 - cmdOK.Height
  cmdCancel.top = cmdOK.top
  cmdCancel.Left = Me.ScaleWidth - 30 - cmdCancel.Width
  cmdOK.Left = cmdCancel.Left - 30 - cmdCancel.Width
End Sub

Private Sub tv_DblClick()
  cmdOK_Click
End Sub

Private Sub tv_Expand(ByVal Node As MSComctlLib.Node)
  If Node.child.Tag = "ToDelete" Then
   Me.MousePointer = vbHourglass
   tv.Nodes.Remove Node.child.Index
   Dim f As Object
   firstobj.Expand tv, Node.Key, "", TableName
   Me.MousePointer = vbNormal
  End If
End Sub
