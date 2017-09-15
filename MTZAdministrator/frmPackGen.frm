VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frmPackGen 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Генерация файла пакетной компиляции"
   ClientHeight    =   6555
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6555
   ScaleWidth      =   9000
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Height          =   615
      Left            =   1560
      TabIndex        =   6
      Top             =   360
      Width           =   7335
      Begin VB.OptionButton optType 
         Caption         =   "Список типов объектов"
         Height          =   255
         Left            =   3840
         TabIndex        =   8
         Top             =   240
         Width           =   3255
      End
      Begin VB.OptionButton optApp 
         Caption         =   "Список приложений"
         Height          =   255
         Left            =   240
         TabIndex        =   7
         Top             =   240
         Value           =   -1  'True
         Width           =   3255
      End
   End
   Begin VB.TextBox txtpath 
      Height          =   285
      Left            =   0
      TabIndex        =   5
      Top             =   0
      Width           =   9015
   End
   Begin VB.CheckBox chbInterface 
      Caption         =   "VB Interface"
      Height          =   375
      Left            =   0
      TabIndex        =   4
      Top             =   3240
      Value           =   1  'Checked
      Width           =   1455
   End
   Begin VB.CheckBox chbModel 
      Caption         =   "VB Model"
      Height          =   375
      Left            =   0
      TabIndex        =   3
      Top             =   2880
      Value           =   1  'Checked
      Width           =   1455
   End
   Begin VB.CommandButton cmdCreate 
      Caption         =   "Создать файл пакетной компиляции"
      Height          =   375
      Left            =   0
      TabIndex        =   2
      Top             =   6120
      Width           =   9015
   End
   Begin VB.ListBox lstTypes 
      Height          =   4965
      IntegralHeight  =   0   'False
      Left            =   4440
      Sorted          =   -1  'True
      Style           =   1  'Checkbox
      TabIndex        =   1
      Top             =   1080
      Width           =   4545
   End
   Begin VB.ListBox lstApps 
      Height          =   4965
      IntegralHeight  =   0   'False
      Left            =   1560
      Sorted          =   -1  'True
      Style           =   1  'Checkbox
      TabIndex        =   0
      Top             =   1080
      Width           =   2865
   End
   Begin MSComDlg.CommonDialog cdlg 
      Left            =   360
      Top             =   1920
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Label Label1 
      Caption         =   "Использовать ->"
      Height          =   255
      Left            =   120
      TabIndex        =   9
      Top             =   600
      Width           =   1455
   End
End
Attribute VB_Name = "frmPackGen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private sComp As String, ss As String

Private Declare Function CharToOem Lib "user32" Alias "CharToOemA" (ByVal lpszSrc As String, ByVal lpszDst As String) As Long
Private Function W2OEM(ByVal s As String) As String
  Dim es As String
  es = Space(Len(s))
  Call CharToOem(s, es)
  W2OEM = es
End Function

Private Sub cmdCreate_Click()
  Dim i, j As Long
  
  ' проверка указаны ли генераторы
  If chbInterface.Value = 0 And chbModel.Value = 0 Then
    MsgBox "Не выбраны генераторы", vbInformation + vbOKOnly, "Администратор"
    Exit Sub
  End If
  ' проверка указаны ли типы объектов ИЛИ приложения
  Dim b As Boolean
  b = True
  If optApp.Value Then
    For i = 0 To lstApps.ListCount - 1
      If lstApps.Selected(i) Then b = False
    Next
    If b Then
      MsgBox "Не выбраны приложения!!!", vbCritical + vbOKOnly, "Администратор"
      Exit Sub
    End If
  End If
  If optType.Value Then
    For i = 0 To lstTypes.ListCount - 1
      If lstTypes.Selected(i) Then b = False
    Next
    If b Then
      MsgBox "Не выбраны типы объектов!!!", vbCritical + vbOKOnly, "Администратор"
      Exit Sub
    End If
  End If

  ' генерация файла пакетной компиляции
  sComp = "del err.txt " & vbCrLf
  ss = "call makevbp.cmd """ & txtpath
  
  If optApp.Value Then genApp
  If optType.Value Then genType
  
  ' сохранение файла пакетной компиляции
  On Error GoTo bye
  Dim intFile As Integer
  intFile = FreeFile

  Dim fn As String
  cdlg.CancelError = True
  cdlg.Filter = "Файл пакета|*.cmd"
  cdlg.DefaultExt = "cmd"
  cdlg.FileName = ""
  cdlg.ShowSave
  fn = cdlg.FileName

  Open fn For Output As #intFile
  Print #intFile, sComp
  Close #intFile
  
  MsgBox "Генерация файла пакетной компиляции закончена", vbInformation + vbOKOnly, "Администратор"
  Exit Sub
bye:
  MsgBox "Генерация прервана", vbInformation + vbOKOnly, "Администратор"
End Sub

Private Sub genApp()
  Dim i, j As Long, s As String, n As Long, nameApp As String
  For i = 0 To lstApps.ListCount - 1
    If lstApps.Selected(i) Then
      n = lstApps.ItemData(i)
      nameApp = model.MTZAPP.item(n).Name
      For j = 1 To model.objectType.Count
        If model.objectType.item(j).package.Name = nameApp Then
          s = model.objectType.item(j).Name
          If chbModel.Value = 1 Then sComp = sComp & vbCrLf & ss & W2OEM(nameApp) & "\" & chbModel.Caption & "\" & s & "\" & s & ".vbp"""
          If chbInterface.Value = 1 Then sComp = sComp & vbCrLf & ss & W2OEM(nameApp) & "\" & chbInterface.Caption & "\" & s & "\" & s & "GUI.vbp"""
        End If
      Next
    End If
  Next
End Sub

Private Sub genType()
  Dim i As Long, s1, s As String, n As Long
  For i = 0 To lstTypes.ListCount - 1
    If lstTypes.Selected(i) Then
      n = lstTypes.ItemData(i)
      s = model.objectType.item(n).Name
      s1 = W2OEM(model.objectType.item(n).package.Name)
      If chbModel.Value = 1 Then sComp = sComp & vbCrLf & ss & s1 & "\" & chbModel.Caption & "\" & s & "\" & s & ".vbp"""
      If chbInterface.Value = 1 Then sComp = sComp & vbCrLf & ss & s1 & "\" & chbInterface.Caption & "\" & s & "\" & s & "GUI.vbp"""
    End If
  Next
End Sub

Private Sub Form_Load()
  txtpath.Text = GetSetting(App.EXEName, "config", "rootpath", App.path)
  If Right(txtpath.Text, 1) <> "\" Then txtpath.Text = txtpath.Text & "\"
  
  Call loadApps
  Call loadTypes(False)
  ctrlOPT
End Sub

Private Sub loadTypes(ObjOnly As Boolean)
  lstTypes.Clear
  If (ObjOnly) Then
    model.objectType.Sort = "Name"
  Else
    model.objectType.Sort = "Comment"
  End If
  
  Dim i As Long
  For i = 1 To model.objectType.Count
    With model.objectType.item(i)
      If (ObjOnly) Then
        lstTypes.AddItem .Name & " (" & .package.Name & "->" & .the_comment & ")"
      Else
        lstTypes.AddItem .package.Name & "->" & .the_comment
      End If
      lstTypes.ItemData(lstTypes.NewIndex) = i
    End With
  Next
End Sub

Private Sub loadApps()
  Dim i As Long
  lstApps.Clear
  For i = 1 To model.MTZAPP.Count
    With model.MTZAPP.item(i)
      lstApps.AddItem .Name
      lstApps.ItemData(lstApps.NewIndex) = i
    End With
  Next
End Sub

Private Sub ctrlOPT()
  If optApp.Value Then
    lstApps.Enabled = True
    lstTypes.Enabled = False
  End If
  If optType.Value Then
    lstApps.Enabled = False
    lstTypes.Enabled = True
  End If
End Sub

Private Sub optApp_Click()
  ctrlOPT
End Sub

Private Sub optType_Click()
  ctrlOPT
End Sub
