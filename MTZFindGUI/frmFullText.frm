VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmFullText 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Поиск по тексту"
   ClientHeight    =   4770
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8220
   Icon            =   "frmFullText.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   4770
   ScaleWidth      =   8220
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.ProgressBar pb 
      Height          =   255
      Left            =   240
      TabIndex        =   8
      Top             =   4440
      Visible         =   0   'False
      Width           =   7815
      _ExtentX        =   13785
      _ExtentY        =   450
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.ListBox lstDoc 
      Height          =   4155
      Left            =   4320
      TabIndex        =   7
      Top             =   240
      Width           =   3735
   End
   Begin VB.TextBox txtQuery 
      Height          =   405
      Left            =   240
      TabIndex        =   4
      Top             =   3960
      Width           =   2775
   End
   Begin VB.CommandButton cmdStart 
      Caption         =   "Поиск"
      Height          =   735
      Left            =   3360
      TabIndex        =   3
      Top             =   1920
      Width           =   735
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Отменить все"
      Height          =   255
      Left            =   1680
      TabIndex        =   2
      Top             =   3240
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Выбрать все"
      Height          =   255
      Left            =   240
      TabIndex        =   1
      Top             =   3240
      Width           =   1335
   End
   Begin VB.ListBox lstTypes 
      Height          =   2760
      Left            =   240
      Style           =   1  'Checkbox
      TabIndex        =   0
      Top             =   360
      Width           =   2775
   End
   Begin VB.Label Label2 
      Caption         =   "Типы документов для поиска"
      Height          =   255
      Left            =   240
      TabIndex        =   6
      Top             =   120
      Width           =   2775
   End
   Begin VB.Label Label1 
      Caption         =   "Запрос"
      Height          =   255
      Left            =   240
      TabIndex        =   5
      Top             =   3720
      Width           =   1335
   End
End
Attribute VB_Name = "frmFullText"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public TypeName As String
Public Model As MTZMetaModel.Application
Public Application As GUI

Public id As String
Public Brief As String
Public OK As Boolean

Dim nv  As MTZUtil.NamedValues
Dim pos() As Long
Dim AndOr() As String
  
Dim mbMoving As Boolean

Dim rs As ADODB.Recordset
Dim mCol As Collection

Private Sub cmdOpenDoc_Click()
  On Error GoTo ErrOpen
  If lstDoc.ListIndex >= 0 Then
    Dim objGui As Object
    With mCol.Item(lstDoc.ListIndex + 1)
        Set objGui = Application.MetaModel.Application.Manager.GetInstanceGUI(mCol.Item(lstDoc.ListIndex + 1).id)
        Call objGui.Show("", mCol.Item(lstDoc.ListIndex + 1), True) ' Показываем карточку МОДАЛЬНО!
        Set objGui = Nothing
    End With
  End If
  Exit Sub
ErrOpen:
  Call MsgBox("Ошибка открытия карточки" & vbCrLf & Err.Description, vbOKOnly + vbCritical, App.Title)
End Sub



Private Sub lstDocuments_Click()

End Sub

Private Sub lstDoc_DblClick()
cmdOpenDoc_Click
End Sub

Private Sub cmdStart_Click()
  If txtQuery = "" Or lstTypes.SelCount = 0 Then Exit Sub
  Dim i As Long, id As String, bFinded As Boolean
  id = CreateGUID2
  lstDoc.Clear
  Set mCol = New Collection
  pb.Min = 0
  pb.Max = lstTypes.SelCount
  pb.value = 0
  pb.Visible = True
  
  For i = 0 To lstTypes.ListCount - 1
    If lstTypes.Selected(i) Then
      pb.value = pb.value + 1
      If Application.Session.TheFinder.FullTextSearch(txtQuery, Application.MetaModel.OBJECTTYPE.Item(lstTypes.ItemData(i)).name, id) Then
        Set rs = Application.MetaModel.MTZSession.TheFinder.GetResults(id)
        If Not rs Is Nothing Then
          If rs.RecordCount > 0 Then
            bFinded = True
            Call LoadResults
          End If
        End If
        Application.Session.TheFinder.DropResults (id)
        Set rs = Nothing
      End If
    End If
  Next
 pb.Visible = False
 If Not bFinded Then
   Call MsgBox("Ничего не найдено", vbOKOnly + vbInformation, App.Title)
 Else
   Call MsgBox("Поиск завершен", vbOKOnly + vbInformation, App.Title)
 End If
End Sub

Private Sub Command1_Click()
Dim i As Long
For i = 0 To lstTypes.ListCount - 1
  lstTypes.Selected(i) = True
Next
End Sub

Private Sub Command2_Click()
Dim i As Long
For i = 0 To lstTypes.ListCount - 1
  lstTypes.Selected(i) = False
Next
End Sub

Private Sub Form_Load()
  Dim i As Long, j As Long
  Dim o As OBJECTTYPE
  Dim p As part
  
  Screen.MousePointer = vbHourglass
  Application.MetaModel.OBJECTTYPE.Sort = "Comment"
  lstTypes.Clear
  For i = 1 To Application.MetaModel.OBJECTTYPE.Count
    If Application.MetaModel.OBJECTTYPE.Item(i).AllowSearch Then
    Set o = Application.MetaModel.OBJECTTYPE.Item(i)
    lstTypes.AddItem o.the_comment
    lstTypes.ItemData(lstTypes.NewIndex) = i
    End If
  Next
  Screen.MousePointer = vbDefault
End Sub

Private Sub LoadResults()
  Screen.MousePointer = vbHourglass
  Dim OBJ As Object
  While Not rs.EOF
    Set OBJ = Application.Manager.GetInstanceObject(rs!Result, Application.Site)
    mCol.Add OBJ, rs!Result
    lstDoc.AddItem OBJ.Brief
    rs.MoveNext
  Wend
  rs.Close
  Set rs = Nothing
  
  lstDoc.ListIndex = 0
  
  Screen.MousePointer = vbDefault
  DoEvents
End Sub

