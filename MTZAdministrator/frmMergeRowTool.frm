VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmMergeRowTool 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Объединение и удаление строк раздла"
   ClientHeight    =   4425
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4470
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4425
   ScaleWidth      =   4470
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      Height          =   315
      Left            =   3210
      TabIndex        =   13
      Top             =   4020
      Width           =   1175
   End
   Begin VB.CommandButton cmdPart 
      Caption         =   "..."
      Height          =   315
      Left            =   4080
      TabIndex        =   2
      Top             =   420
      Width           =   315
   End
   Begin VB.TextBox txtPart 
      Height          =   300
      Left            =   30
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   405
      Width           =   4005
   End
   Begin RichTextLib.RichTextBox txtOut 
      Height          =   1575
      Left            =   30
      TabIndex        =   10
      Top             =   2370
      Visible         =   0   'False
      Width           =   4350
      _ExtentX        =   7673
      _ExtentY        =   2778
      _Version        =   393217
      ScrollBars      =   2
      TextRTF         =   $"frmMergeRowTool.frx":0000
   End
   Begin VB.CommandButton cmdGo 
      Caption         =   "Пуск"
      Height          =   315
      Left            =   60
      TabIndex        =   11
      Top             =   4020
      Width           =   1175
   End
   Begin MSComctlLib.ProgressBar pb 
      Height          =   300
      Left            =   1260
      TabIndex        =   12
      Top             =   4020
      Visible         =   0   'False
      Width           =   3135
      _ExtentX        =   5530
      _ExtentY        =   529
      _Version        =   393216
      Appearance      =   1
   End
   Begin VB.CommandButton cmdNewDoc 
      Caption         =   "..."
      Height          =   315
      Left            =   4080
      TabIndex        =   8
      Top             =   1710
      Width           =   315
   End
   Begin VB.TextBox txtNewDoc 
      Height          =   300
      Left            =   30
      Locked          =   -1  'True
      TabIndex        =   7
      Top             =   1695
      Width           =   4005
   End
   Begin VB.CheckBox chkDel 
      Caption         =   "Удалить после замены"
      Height          =   285
      Left            =   60
      TabIndex        =   9
      Top             =   2040
      Width           =   2685
   End
   Begin VB.CommandButton cmdDocToDel 
      Caption         =   "..."
      Height          =   315
      Left            =   4050
      TabIndex        =   5
      Top             =   1050
      Width           =   315
   End
   Begin VB.TextBox txtDocToDel 
      Height          =   300
      Left            =   30
      Locked          =   -1  'True
      TabIndex        =   4
      Top             =   1050
      Width           =   4005
   End
   Begin VB.Label Label3 
      Caption         =   "Раздел для выбора строки"
      Height          =   300
      Left            =   30
      TabIndex        =   0
      Top             =   45
      Width           =   3180
   End
   Begin VB.Label Label2 
      Caption         =   "Заменяющая строка"
      Height          =   300
      Left            =   30
      TabIndex        =   6
      Top             =   1380
      Width           =   4005
   End
   Begin VB.Label Label1 
      Caption         =   "Строка, которую надо заменить (и удалить)"
      Height          =   300
      Left            =   30
      TabIndex        =   3
      Top             =   735
      Width           =   3690
   End
End
Attribute VB_Name = "frmMergeRowTool"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdDocToDel_Click()
  Dim ID As String
  Dim Brief As String
  Dim P As PART
  If txtPart.Tag = "" Then
    MsgBox "Необходимо выбрать раздел"
    Exit Sub
  End If
  Set P = model.FindRowObject("PART", txtPart.Tag)
  
  If Manager.GetReferenceDialogEx3(P.Name, ID, Brief) Then
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
  
  Dim P As PART
  
  If txtPart.Tag = "" Then
    MsgBox "Необходимо выбрать раздел"
    Exit Sub
  End If
  
  
  
  If txtDocToDel.Tag = "" Then
    MsgBox "Необходимо выбрать объект для замены"
    Exit Sub
  End If
  
  If txtNewDoc.Tag = "" Then
    MsgBox "Необходимо выбрать объект на который будут заменены ссылки"
    Exit Sub
  End If
  
  Set P = model.FindRowObject("PART", txtPart.Tag)
  
  Set objToDel = model.FindRowObject(P.Name, txtDocToDel.Tag)
  Set objNewDoc = model.FindRowObject(P.Name, txtNewDoc.Tag)
  
  pb.min = 0
  pb.Value = 0
  pb.max = model.ObjectType.Count
  pb.Visible = True
  
  For i = 1 To model.ObjectType.Count
    MergeRow model.ObjectType.item(i).PART, objToDel, objNewDoc, P
    pb.Value = i
  Next
  
  If chkDel.Value = vbChecked Then
    On Error GoTo bye
    objToDel.Delete
  End If
  pb.Visible = False
  txtOut.Visible = True
  Command1.Enabled = True
  Command1.Visible = True

  MsgBox "Замена ссылки завершена"
  Exit Sub
bye:
  MsgBox Err.Description
  pb.Visible = False
  Command1.Enabled = True
  Command1.Visible = True
End Sub

Private Sub cmdNewDoc_Click()
  Dim ID As String
  Dim Brief As String
  Dim P As PART
  
  If txtPart.Tag = "" Then
    MsgBox "Необходимо выбрать раздел"
    Exit Sub
  End If
  
  Set P = model.FindRowObject("PART", txtPart.Tag)
  
  If Manager.GetReferenceDialogEx3(P.Name, ID, Brief) Then
      txtNewDoc.Tag = ID
      txtNewDoc.Text = Brief
  End If
End Sub


Private Sub MergeRow(pcol As PART_COL, DelObj As Object, NewObj As Object, DocPart As PART)
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
          If fld.ReferenceType = ReferenceType_Na_stroku_razdela Then
            If fld.RefToPart Is DocPart Then
              ChangeIt = True
            End If
          End If
       End If
       
       If UCase(ft.Name) = "ID" Then
        ChangeIt = True
       End If
       If ChangeIt Then
         s = "update " & pcol.item(i).Name & " set " & fld.Name & "='" & NewObj.ID & "' where " & fld.Name & "='" & DelObj.ID & "'"
         On Error Resume Next
         Session.GetData (s)
         txtOut.Text = txtOut.Text & vbCrLf & s
         If Err.Number > 0 Then
           txtOut.Text = txtOut.Text & vbCrLf & "--ERROR>>" & Err.Description
           Err.Clear
         End If
       End If
    Next
    MergeRow pcol.item(i).PART, DelObj, NewObj, DocPart
  Next
End Sub

Private Sub cmdPart_Click()
  Dim ID As String
  Dim Brief As String
  If Manager.GetReferenceDialogEx3("PART", ID, Brief) Then
      txtPart.Tag = ID
      txtPart.Text = Brief
  End If
End Sub
