VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmMergeObjTool 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Объединение и удаление объектов"
   ClientHeight    =   4455
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4800
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4455
   ScaleWidth      =   4800
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "Отмена"
      Height          =   315
      Left            =   3450
      TabIndex        =   10
      Top             =   4080
      Width           =   1175
   End
   Begin RichTextLib.RichTextBox txtOut 
      Height          =   2445
      Left            =   30
      TabIndex        =   7
      Top             =   1560
      Visible         =   0   'False
      Width           =   4620
      _ExtentX        =   8149
      _ExtentY        =   4313
      _Version        =   393217
      Enabled         =   -1  'True
      ReadOnly        =   -1  'True
      ScrollBars      =   2
      TextRTF         =   $"frmMergeObjTool.frx":0000
   End
   Begin VB.CommandButton cmdGo 
      Caption         =   "Пуск"
      Height          =   315
      Left            =   60
      TabIndex        =   8
      Top             =   4050
      Width           =   1175
   End
   Begin MSComctlLib.ProgressBar pb 
      Height          =   300
      Left            =   1260
      TabIndex        =   9
      Top             =   4050
      Visible         =   0   'False
      Width           =   3315
      _ExtentX        =   5847
      _ExtentY        =   529
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.CommandButton cmdNewDoc 
      Caption         =   "..."
      Height          =   315
      Left            =   4380
      TabIndex        =   5
      Top             =   885
      Width           =   315
   End
   Begin VB.TextBox txtNewDoc 
      Height          =   300
      Left            =   75
      Locked          =   -1  'True
      TabIndex        =   4
      Top             =   885
      Width           =   4290
   End
   Begin VB.CheckBox chkDel 
      Caption         =   "Удалить после замены"
      Height          =   285
      Left            =   60
      TabIndex        =   6
      Top             =   1230
      Width           =   2685
   End
   Begin VB.CommandButton cmdDocToDel 
      Caption         =   "..."
      Height          =   315
      Left            =   4380
      TabIndex        =   2
      Top             =   315
      Width           =   315
   End
   Begin VB.TextBox txtDocToDel 
      Height          =   300
      Left            =   30
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   315
      Width           =   4335
   End
   Begin VB.Label Label2 
      Caption         =   "Заменяющий объект"
      Height          =   300
      Left            =   45
      TabIndex        =   3
      Top             =   645
      Width           =   4005
   End
   Begin VB.Label Label1 
      Caption         =   "Объект, который надо заменить (и удалить)"
      Height          =   300
      Left            =   60
      TabIndex        =   0
      Top             =   30
      Width           =   3990
   End
End
Attribute VB_Name = "frmMergeObjTool"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdDocToDel_Click()
  Dim ID As String
  Dim Brief As String
  
  If Manager.GetObjectListDialogEx(ID, Brief) Then
      txtDocToDel.Tag = ID
      txtDocToDel.Text = Brief
  End If
End Sub

Private Sub cmdGo_Click()
  Command1.Enabled = False
  Command1.Visible = False
  
  Dim i As Long
  Dim objToDel As Object
  Dim objNewDoc As Object
  Dim ot As ObjectType
  
  If txtDocToDel.Tag = "" Then
    MsgBox "Необходимо выбрать объект для замены"
    Exit Sub
  End If
  
  If txtNewDoc.Tag = "" Then
    MsgBox "Необходимо выбрать объект на который будут заменены ссылки"
    Exit Sub
  End If
  
  
  Set objToDel = Manager.GetInstanceObject(txtDocToDel.Tag)
  Set objNewDoc = Manager.GetInstanceObject(txtNewDoc.Tag)
  
  
  If objToDel.TypeName <> objNewDoc.TypeName Then
    If MsgBox("Объекты разного типа, продолжить ?", vbYesNo, "Внимание") = vbNo Then
      Exit Sub
    End If
  End If
  
  For i = 1 To model.ObjectType.Count
    If UCase(model.ObjectType.item(i).Name) = UCase(objToDel.TypeName) Then
      Set ot = model.ObjectType.item(i)
      Exit For
    End If
  Next
  
  pb.min = 0
  pb.Value = 0
  pb.max = model.ObjectType.Count
  pb.Visible = True
  For i = 1 To model.ObjectType.Count
    MergeObj model.ObjectType.item(i).PART, objToDel, objNewDoc, ot
    pb.Value = i
  Next
  
  If chkDel.Value = vbChecked Then
    On Error GoTo bye
    Manager.DeleteInstance objToDel.ID
  End If
  pb.Visible = False
  txtOut.Visible = True
  Command1.Enabled = True
  Command1.Visible = True
  Exit Sub
bye:
  MsgBox Err.Description
  pb.Visible = False
  Command1.Enabled = True
End Sub

Private Sub cmdNewDoc_Click()
  Dim ID As String
  Dim Brief As String
  
  If Manager.GetObjectListDialogEx(ID, Brief) Then
      txtNewDoc.Tag = ID
      txtNewDoc.Text = Brief
  End If
End Sub


Private Sub MergeObj(pcol As PART_COL, DelObj As Object, NewObj As Object, DocOT As ObjectType)
  Dim i As Long
  Dim j As Long
  Dim ft As FIELDTYPE
  Dim fld As MTZMetaModel.Field
  Dim s As String
  Dim ChangeIt As Boolean
  Dim UpdateToNull As Boolean
  For i = 1 To pcol.Count
    For j = 1 To pcol.item(i).Field.Count
      ChangeIt = False
      UpdateToNull = False
       Set fld = pcol.item(i).Field.item(j)
       Set ft = fld.FIELDTYPE
       If ft.TypeStyle = TypeStyle_Ssilka Then
          If fld.ReferenceType = ReferenceType_Na_ob_ekt_ Then
            If fld.RefToType Is Nothing Then
              ChangeIt = True
            ElseIf fld.RefToType Is DocOT Then
              If DelObj.TypeName <> NewObj.TypeName Then
                ChangeIt = True
                UpdateToNull = True
              Else
                ChangeIt = True
              End If
              
            End If
          End If
       End If
       
       If UCase(ft.Name) = "ID" Then
        ChangeIt = True
       End If
       If ChangeIt Then
        
        If UpdateToNull Then
          s = "update " & pcol.item(i).Name & " set " & fld.Name & "=null where " & fld.Name & "='" & DelObj.ID & "'"
        Else
          s = "update " & pcol.item(i).Name & " set " & fld.Name & "='" & NewObj.ID & "' where " & fld.Name & "='" & DelObj.ID & "'"
        End If
        
        On Error Resume Next
        Session.GetData (s)
        txtOut.Text = txtOut.Text & vbCrLf & s
        If Err.Number > 0 Then
          txtOut.Text = txtOut.Text & vbCrLf & "--ERROR>>" & Err.Description
          Err.Clear
        End If
        Debug.Print s
       End If
    Next
    MergeObj pcol.item(i).PART, DelObj, NewObj, DocOT
  Next
End Sub

Private Sub Command1_Click()
  Hide
End Sub
