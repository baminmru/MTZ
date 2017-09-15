VERSION 5.00
Begin VB.Form frmTypeList 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Тип объекта"
   ClientHeight    =   3195
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   6030
   Icon            =   "frmTypeList.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   6030
   ShowInTaskbar   =   0   'False
   Begin VB.ListBox cmbType 
      Height          =   2790
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   4455
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4680
      TabIndex        =   1
      Top             =   600
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Height          =   375
      Left            =   4680
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "frmTypeList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public TypeName As String
Public site As String

Public ok As Boolean
Private ID  As String
Public NewObject  As Object
Private types As Collection






Private Sub CancelButton_Click()
ok = False
Set types = Nothing
Me.Hide
End Sub


Private Sub Form_Load()
  Dim rs As ADODB.Recordset, i
  Dim n As String, tn As String
  Set rs = Session.GetRows("OBJECTTYPE")
  Dim o As tmpInst
  Set types = New Collection
  i = 0
  While Not rs.EOF
      i = i + 1
      Set o = New tmpInst
      o.Name = rs!comment
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

Private Sub OKButton_Click()
  On Error GoTo bye
  If cmbType.ListIndex = -1 Then Exit Sub
  TypeName = types.item(cmbType.ItemData(cmbType.ListIndex)).ObjType
  ok = True
  Set types = Nothing
  Me.Hide

bye:
End Sub
