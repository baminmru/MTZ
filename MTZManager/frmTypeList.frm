VERSION 5.00
Begin VB.Form frmTypeList 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Тип объекта"
   ClientHeight    =   3015
   ClientLeft      =   2775
   ClientTop       =   3720
   ClientWidth     =   6030
   Icon            =   "frmTypeList.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3015
   ScaleWidth      =   6030
   ShowInTaskbar   =   0   'False
   Begin VB.ListBox cmbType 
      Height          =   2790
      Left            =   0
      Sorted          =   -1  'True
      TabIndex        =   0
      Top             =   30
      Width           =   4455
   End
   Begin VB.CommandButton CancelButton 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      Height          =   315
      Left            =   4740
      TabIndex        =   2
      Top             =   420
      Width           =   1175
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   4740
      TabIndex        =   1
      Top             =   60
      Width           =   1175
   End
End
Attribute VB_Name = "frmTypeList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 450
Option Explicit
Public TypeName As String
Attribute TypeName.VB_VarHelpID = 475
Public site As String
Attribute site.VB_VarHelpID = 470
Public Runner As Main
Attribute Runner.VB_VarHelpID = 465
Public ok As Boolean
Attribute ok.VB_VarHelpID = 460
Private ID  As String
Public NewObject  As Object
Attribute NewObject.VB_VarHelpID = 455
Private types As Collection






Private Sub CancelButton_Click()
ok = False
Set Runner = Nothing
Set types = Nothing
Me.Hide

End Sub


Private Sub cmbType_DblClick()
    OKButton_Click
End Sub

Private Sub Form_Load()
  Dim rs As ADODB.Recordset, i
  Dim n As String, tn As String
  
  Set rs = Runner.Sessions.Item(site).GetRows("OBJECTTYPE")
  
  Dim o As tmpInst
  Set types = New Collection
  i = 0
  While Not rs.EOF
      i = i + 1
      Set o = New tmpInst
      o.Name = rs!the_comment
      o.ObjType = rs!Name
      o.IsSingle = rs!IsSingleInstance
      types.Add o
      cmbType.AddItem o.Name
      cmbType.ItemData(cmbType.NewIndex) = i
      rs.MoveNext
  Wend
  Set rs = Nothing
  
  If cmbType.ListCount > 0 Then
    cmbType.ListIndex = 0
  End If
  
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  cmbType.top = 0
  cmbType.Left = 0
  cmbType.Width = Me.ScaleWidth - 60 - OKButton.Width
  
  OKButton.top = 30
  OKButton.Left = Me.ScaleWidth - OKButton.Width - 30
  
  CancelButton.Left = OKButton.Left - 30 - CancelButton.Width
  CancelButton.top = OKButton.top
  
  
End Sub

Private Sub OKButton_Click()
  On Error GoTo bye
  If cmbType.ListIndex = -1 Then Exit Sub
  ID = CreateGUID2()
  If Runner.NewInstance(ID, types.Item(cmbType.ItemData(cmbType.ListIndex)).ObjType, types.Item(cmbType.ItemData(cmbType.ListIndex)).ObjType & " " & Now, site) Then
    Set NewObject = Runner.GetInstanceObject(ID)
    If Not NewObject Is Nothing Then
      ok = True
      Set Runner = Nothing
      Set types = Nothing
      Me.Hide
    End If
  End If
bye:
End Sub
