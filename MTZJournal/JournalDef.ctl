VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.UserControl JournalDef 
   ClientHeight    =   4980
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6210
   ScaleHeight     =   4980
   ScaleWidth      =   6210
   ToolboxBitmap   =   "JournalDef.ctx":0000
   Begin VB.CommandButton cndEditcolumn 
      Caption         =   "b"
      BeginProperty Font 
         Name            =   "Marlett"
         Size            =   8.25
         Charset         =   2
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   60
      TabIndex        =   5
      Top             =   810
      Width           =   315
   End
   Begin VB.CommandButton cmdDelColumn 
      Caption         =   "r"
      BeginProperty Font 
         Name            =   "Marlett"
         Size            =   8.25
         Charset         =   2
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   60
      TabIndex        =   4
      Top             =   1170
      Width           =   315
   End
   Begin VB.CommandButton cmdDelView 
      Caption         =   "r"
      BeginProperty Font 
         Name            =   "Marlett"
         Size            =   8.25
         Charset         =   2
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   2400
      TabIndex        =   3
      Top             =   90
      Width           =   315
   End
   Begin VB.CommandButton cmdAddColumn 
      Caption         =   "+"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   60
      TabIndex        =   2
      Top             =   450
      Width           =   315
   End
   Begin VB.CommandButton cmdAddView 
      Caption         =   "+"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   2040
      TabIndex        =   1
      Top             =   90
      Width           =   315
   End
   Begin GridEX20.GridEX gr 
      Height          =   3645
      Left            =   390
      TabIndex        =   0
      Top             =   420
      Width           =   5775
      _ExtentX        =   10186
      _ExtentY        =   6429
      Version         =   "2.0"
      BoundColumnIndex=   ""
      ReplaceColumnIndex=   ""
      HideSelection   =   2
      MethodHoldFields=   -1  'True
      SelectionStyle  =   1
      AllowColumnDrag =   0   'False
      GroupByBoxVisible=   0   'False
      DataMode        =   99
      ColumnHeaderHeight=   285
      IntProp1        =   0
      IntProp2        =   0
      IntProp7        =   0
      ColumnsCount    =   2
      Column(1)       =   "JournalDef.ctx":0312
      Column(2)       =   "JournalDef.ctx":046E
      FormatStylesCount=   6
      FormatStyle(1)  =   "JournalDef.ctx":0512
      FormatStyle(2)  =   "JournalDef.ctx":05F2
      FormatStyle(3)  =   "JournalDef.ctx":074E
      FormatStyle(4)  =   "JournalDef.ctx":07FE
      FormatStyle(5)  =   "JournalDef.ctx":08B2
      FormatStyle(6)  =   "JournalDef.ctx":098A
      ImageCount      =   0
      PrinterProperties=   "JournalDef.ctx":0A42
   End
End
Attribute VB_Name = "JournalDef"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private m_model As MTZMetaModel.Application
Private M_Journal As MTZJrnl.Application

Public Property Set Journal(v As MTZJrnl.Application)
  Set M_Journal = v
  Init
End Property

Public Property Get Journal() As MTZJrnl.Application
  Set Journal = M_Journal
End Property


Public Property Get model() As MTZMetaModel.Application
  Set model = m_model
End Property

Public Property Set model(m As MTZMetaModel.Application)
  Set m_model = m
End Property



Private Sub Init()
 On Error Resume Next
  Dim i As Integer, j As Long
  Dim col As JSColumn
  Dim v As MTZMetaModel.PARTVIEW
  If Journal Is Nothing Then Exit Sub
  gr.Columns.Clear
  Call gr.Columns.Add("Колонки\Источники", jgexText, jgexEditTextBox)
  'Add columns
  For i = 1 To Journal.JournalSrc.Count
    Set v = Journal.FindRowObject("PARTVIEW", Journal.JournalSrc.Item(i).PARTVIEW)
    If Not v Is Nothing Then
    Set col = gr.Columns.Add(v.Name, jgexText, jgexEditDropDown)
    col.HasValueList = True
    For j = 1 To v.ViewColumn.Count
      Call col.ValueList.Add(v.ViewColumn.Item(j).the_Alias, v.ViewColumn.Item(j).Name)
    Next
    End If
  Next

  Journal.JournalColumn.Sort = "sequence"
  
  ' Add rows
  gr.ItemCount = Journal.JournalColumn.Count
  
End Sub


Private Sub cmdAddColumn_Click()
On Error Resume Next
If Journal Is Nothing Then Exit Sub
Dim JC As MTZJrnl.JournalColumn
Set JC = Journal.JournalColumn.Add()
On Error Resume Next
JC.sequence = Journal.JournalColumn.Count

Dim f As frmJColumn
Set f = New frmJColumn
Set f.JournalColumn1.Item = JC
f.JournalColumn1.InitPanel
f.Show vbModal

If f.OK Then
  Set JC = f.JournalColumn1.Item
  JC.Save
Else
  Journal.JournalColumn.Refresh
End If
Init
End Sub

Private Sub cmdAddView_Click()
  If Journal Is Nothing Then Exit Sub
  Load frmViewList
  Set frmViewList.model = model
  frmViewList.Show vbModal
  If frmViewList.OK Then
    Dim pv As PARTVIEW
    Set pv = model.FindRowObject("PartView", frmViewList.Result)
    If pv Is Nothing Then
      Set pv = model.FindRowObject("PartView", frmViewList.Result)
    End If
    
    Dim js As JournalSrc
    Set js = Journal.JournalSrc.Add()
    js.PARTVIEW = pv.ID
    js.ViewAlias = pv.the_Alias
    js.Save
    Init
  End If
  Unload frmViewList
End Sub

Private Sub cmdDelColumn_Click()
If Journal Is Nothing Then Exit Sub
If gr.Row > 1 Then
  If MsgBox("Удалить колонку " & gr.GetRowData(gr.Row).DisplayValue(1), vbYesNo) = vbYes Then
    Journal.JournalColumn.Delete (gr.Row)
    Init
  End If
End If
End Sub

Private Sub cmdDelView_Click()
If Journal Is Nothing Then Exit Sub
If gr.col > 1 Then
  If MsgBox("Удалить источник данных " & gr.GetRowData(1).DisplayValue(gr.col), vbYesNo) = vbYes Then
    Journal.JournalSrc.Delete (gr.col - 1)
    Init
  End If
End If
End Sub

Private Sub cndEditcolumn_Click()
If Journal Is Nothing Then Exit Sub
Dim JC As MTZJrnl.JournalColumn
Set JC = Journal.JournalColumn.Item(gr.Row)
Dim f As frmJColumn
Set f = New frmJColumn
Set f.JournalColumn1.Item = JC
f.JournalColumn1.InitPanel
f.Show vbModal

If f.OK Then
  Set JC = f.JournalColumn1.Item
  JC.Save
Else
  Journal.JournalColumn.Refresh
End If
Init
End Sub





Private Sub gr_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
    Dim i As Long, j As Long
    Dim JC As MTZJrnl.JournalColumn
    If Journal Is Nothing Then Exit Sub
    If Journal.JournalColumn.Count < RowIndex Then Exit Sub
    Journal.JournalColumn.Sort = "sequence"
    Set JC = Journal.JournalColumn.Item(RowIndex)
    Values(1) = JC.Name
    For i = 1 To Journal.JournalSrc.Count
       Values(i + 1) = ""
       If Not Journal.JournalSrc.Item(i) Is Nothing Then
       For j = 1 To JC.JColumnSource.Count
       If Not JC.JColumnSource.Item(j).SrcPartView Is Nothing Then
          If Journal.JournalSrc.Item(i).ID = JC.JColumnSource.Item(j).SrcPartView.ID Then
            Debug.Print JC.JColumnSource.Item(j).SrcPartView.ID
            Values(i + 1) = JC.JColumnSource.Item(j).ViewField
            'jc.JColumnSource.Item(i).Save
            Exit For
          End If
        End If
       Next
       End If
    Next
End Sub

Private Sub gr_UnboundUpdate(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
  Dim i As Long, j As Long
  Dim JC As MTZJrnl.JournalColumn
  If Journal Is Nothing Then Exit Sub
  If Journal.JournalColumn.Count < RowIndex Then Exit Sub
  Set JC = Journal.JournalColumn.Item(RowIndex)
  JC.Name = Values(1)
  JC.Save
  
  ' delete all sources for this column
  While JC.JColumnSource.Count > 0
    JC.JColumnSource.Delete 1
  Wend
  For i = 1 To Journal.JournalSrc.Count
   If (Values(i + 1) <> "") Then
      With JC.JColumnSource.Add()
           Set .SrcPartView = Journal.JournalSrc.Item(i)
           .ViewField = Values(i + 1)
        .Save
      End With
   End If
  Next

  
End Sub

Private Sub UserControl_Initialize()
  gr.Columns.Clear
  gr.ItemCount = 0
End Sub

Private Sub Usercontrol_resize()
On Error Resume Next
gr.Width = UserControl.Width - gr.Left - 30
gr.Height = UserControl.Height - gr.Top - 30
End Sub
