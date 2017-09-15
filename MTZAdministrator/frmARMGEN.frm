VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Begin VB.Form frmARMGEN 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Генератор АРМ"
   ClientHeight    =   5835
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6540
   Icon            =   "frmARMGEN.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5835
   ScaleWidth      =   6540
   Begin VB.CommandButton cmdGen 
      Caption         =   "Генерация"
      Height          =   315
      Left            =   4575
      TabIndex        =   6
      Top             =   3750
      Width           =   1905
   End
   Begin VB.TextBox txtpath 
      Height          =   300
      Left            =   60
      TabIndex        =   5
      Top             =   315
      Width           =   6105
   End
   Begin VB.CommandButton cmdPAth 
      Caption         =   "..."
      Height          =   315
      Left            =   6180
      TabIndex        =   4
      Top             =   300
      Width           =   315
   End
   Begin MSComctlLib.ProgressBar pb 
      Height          =   300
      Left            =   60
      TabIndex        =   1
      Top             =   3390
      Width           =   6450
      _ExtentX        =   11377
      _ExtentY        =   529
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.ListBox lstARM 
      Height          =   2205
      IntegralHeight  =   0   'False
      Left            =   3150
      Style           =   1  'Checkbox
      TabIndex        =   0
      Top             =   1080
      Width           =   3315
   End
   Begin MSComctlLib.TreeView tvTarget 
      Height          =   2220
      Left            =   60
      TabIndex        =   7
      Top             =   1065
      Width           =   3030
      _ExtentX        =   5345
      _ExtentY        =   3916
      _Version        =   393217
      Indentation     =   176
      LabelEdit       =   1
      LineStyle       =   1
      Sorted          =   -1  'True
      Style           =   7
      Checkboxes      =   -1  'True
      Appearance      =   1
   End
   Begin RichTextLib.RichTextBox txtLog 
      Height          =   1455
      Left            =   60
      TabIndex        =   9
      Top             =   4305
      Width           =   6405
      _ExtentX        =   11298
      _ExtentY        =   2566
      _Version        =   393217
      BackColor       =   -2147483648
      ReadOnly        =   -1  'True
      ScrollBars      =   2
      TextRTF         =   $"frmARMGEN.frx":030A
   End
   Begin VB.Label Label3 
      Caption         =   "Генераторы"
      Height          =   255
      Left            =   60
      TabIndex        =   8
      Top             =   765
      Width           =   3030
   End
   Begin VB.Label Label2 
      Caption         =   "Путь для генерации АРМ"
      Height          =   285
      Left            =   60
      TabIndex        =   3
      Top             =   30
      Width           =   2985
   End
   Begin VB.Label Label1 
      Caption         =   "АРМ для генерации"
      Height          =   285
      Left            =   3150
      TabIndex        =   2
      Top             =   810
      Width           =   3270
   End
End
Attribute VB_Name = "frmARMGEN"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim col As SortableCollection
Public WithEvents gen As MTZGenerator.Response
Attribute gen.VB_VarHelpID = -1

Private Sub Log(s As String)
  If txtLog <> "" Then txtLog.Text = txtLog.Text & vbCrLf
  txtLog.Text = txtLog.Text & s
End Sub



Private Sub cmdGen_Click()
On Error GoTo bye
  Dim t As GENERATOR_TARGET
  Dim i As Long, j As Long
  Dim o As Object
  Dim cnt As Long
  Dim xmlFile As String, prjPath As String, DONE As Boolean
  
  cnt = 0
  For i = 1 To tvTarget.Nodes.Count
    If tvTarget.Nodes.item(i).Tag = "TARGET" And tvTarget.Nodes.item(i).Checked Then
      Set t = model.FindRowObject("GENERATOR_TARGET", tvTarget.Nodes.item(i).Key)
      cnt = cnt + lstARM.SelCount
    End If
  Next
  If cnt = 0 Then cnt = 1
  pb.min = 0
  pb.max = cnt
  pb.Value = 0
  pb.Visible = True
  Label1.Visible = True
  DoEvents
  
  For i = 1 To tvTarget.Nodes.Count
    If tvTarget.Nodes.item(i).Tag = "TARGET" And tvTarget.Nodes.item(i).Checked Then
      Set t = model.FindRowObject("GENERATOR_TARGET", tvTarget.Nodes.item(i).Key)
      If t.GeneratorProgID <> "" Then
          For j = 0 To lstARM.ListCount - 1
            If lstARM.Selected(j) Then
              On Error GoTo next_one
              Set gen = New MTZGenerator.Response
              Log "Create object " & t.GeneratorProgID
              Set o = CreateObject(t.GeneratorProgID)
              Log "call Run method"
              Log o.Run(model, Manager, Session, gen, col.item(lstARM.ItemData(j)).ID, t.ID)
              Set o = Nothing
              Log "Save file"
              txtLog.SelStart = 0
              On Error Resume Next
              MkDir txtPath & t.Name
              gen.Save txtPath & t.Name & "\" & col.item(lstARM.ItemData(j)).ID & ".xml"
              MkDir txtPath & t.Name & "\" & col.item(lstARM.ItemData(j)).ID
              pb.Value = pb.Value + 1
              DoEvents
              
              If t.QueueName <> "" Then
                  Log "Add project to queque"
                  cnt = GetSetting(t.QueueName, "ToDo", "Count", 0)
                  cnt = cnt + 1
                  Call SaveSetting(t.QueueName, "ToDo", "Count", cnt)
                  SaveSetting t.QueueName, "ToDo", "DONE" & cnt, False
                  Call SaveSetting(t.QueueName, "ToDo", "XML" & cnt, txtPath & t.Name & "\" & col.item(lstARM.ItemData(j)).ID & ".xml")
                  On Error GoTo bye
                  Call SaveSetting(t.QueueName, "ToDo", "PATH" & cnt, txtPath & t.Name & "\" & col.item(lstARM.ItemData(j)).ID)
                  
              End If
            End If
            GoTo continue
next_one:
            'Log Err.Description
            Resume continue
            
continue:
          Set gen = Nothing
          Next
      End If ' progid <>""
    End If ' target
  Next
  pb.Visible = False
  Label1.Visible = False
  
  Set t = Nothing
  MsgBox "Создание метакода завершено!", vbExclamation
  Set gen = Nothing
  Exit Sub
  
bye:
  MsgBox Err.Description, vbCritical
  pb.Visible = False
  Label1.Visible = False
  Log Err.Description
  Set gen = Nothing
End Sub

Private Sub cmdPath_Click()
Dim path As String
  path = GetPath("Корневой каталог для генерации метакода", Me.hwnd)
  
  If (path <> vbNullString) Then
    txtPath.Text = path
    SaveSetting App.EXEName, "config", "rootpath", path
  End If
End Sub

Private Sub Form_Load()
  

  Dim t As GENERATOR_TARGET, i, j
  txtPath.Text = GetSetting(App.EXEName, "config", "rootpath", App.path)
  If Right(txtPath.Text, 1) <> "\" Then
    txtPath.Text = txtPath.Text & "\"
  End If
  Dim n As Node
  tvTarget.Nodes.Clear
  For i = 1 To model.GENPACKAGE.Count    '
    Set n = tvTarget.Nodes.Add(, , model.GENPACKAGE.item(i).ID, model.GENPACKAGE.item(i).Name)
    n.Tag = "PACKAGE"
    For j = 1 To model.GENPACKAGE.item(i).GENERATOR_TARGET.Count
        If model.GENPACKAGE.item(i).GENERATOR_TARGET.item(j).TargetType = TargetType_ARM Then
          tvTarget.Nodes.Add(n.Key, tvwChild, model.GENPACKAGE.item(i).GENERATOR_TARGET.item(j).ID, model.GENPACKAGE.item(i).GENERATOR_TARGET.item(j).Name).Tag = "TARGET"
        End If
    Next
  Next
  lstARM.Clear
  
  Dim rs As ADODB.Recordset
  Set rs = Manager.ListInstances("", "MTZwp")
  Set col = New SortableCollection
  
  While Not rs.EOF
    col.AddItem Manager.GetInstanceObject(rs!InstanceID), rs!InstanceID
    rs.MoveNext
  Wend
  Set rs = Nothing
  
  col.Sort "Caption"
  For i = 1 To col.Count
    lstARM.AddItem col.item(i).Name & "  (" & col.item(i).WorkPlace.item(1).Caption & ")"
    lstARM.ItemData(lstARM.NewIndex) = i
  Next
  
End Sub
