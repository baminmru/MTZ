VERSION 5.00
Begin VB.Form frmTypeList 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Тип объекта"
   ClientHeight    =   3300
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   5970
   Icon            =   "frmTypeList.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3300
   ScaleWidth      =   5970
   ShowInTaskbar   =   0   'False
   Begin VB.ListBox cmbType 
      Height          =   3180
      Left            =   30
      TabIndex        =   2
      Top             =   30
      Width           =   4575
   End
   Begin VB.CommandButton CancelButton 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      Height          =   315
      Left            =   4680
      TabIndex        =   1
      Top             =   510
      Width           =   1175
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   4680
      TabIndex        =   0
      Top             =   120
      Width           =   1175
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

Public OK As Boolean
Private ID  As String
Public NewObject  As Object
Private types As Collection



Private Sub CancelButton_Click()
OK = False
Set types = Nothing
Me.Hide
End Sub


Private Sub cmbType_DblClick()
OKButton_Click
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
      o.Name = rs!the_comment
      o.ObjType = rs!Name
      o.IsSingle = rs!IsSingleInstance
      o.ID = rs!objecttypeid
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
  ID = types.item(cmbType.ItemData(cmbType.ListIndex)).ID
  OK = True
  Set types = Nothing
  Me.Hide

bye:
End Sub
