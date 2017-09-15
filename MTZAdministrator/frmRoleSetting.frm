VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frmRoleSetting 
   Caption         =   "Экспорт структуры документов в Excel"
   ClientHeight    =   6405
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7470
   LinkTopic       =   "Form1"
   ScaleHeight     =   6405
   ScaleWidth      =   7470
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog CD 
      Left            =   6900
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Frame Frame1 
      Height          =   615
      Left            =   0
      TabIndex        =   3
      Top             =   240
      Width           =   7335
      Begin VB.OptionButton optType 
         Caption         =   "Список типов объектов"
         Height          =   255
         Left            =   3840
         TabIndex        =   5
         Top             =   240
         Width           =   3255
      End
      Begin VB.OptionButton optApp 
         Caption         =   "Список приложений"
         Height          =   255
         Left            =   240
         TabIndex        =   4
         Top             =   240
         Value           =   -1  'True
         Width           =   3255
      End
   End
   Begin VB.CommandButton cmdRun 
      Caption         =   "Экспорт метамодели в Excel"
      Height          =   375
      Left            =   0
      TabIndex        =   2
      Top             =   6000
      Width           =   7455
   End
   Begin VB.ListBox lstTypes 
      Height          =   4965
      IntegralHeight  =   0   'False
      Left            =   2880
      Sorted          =   -1  'True
      Style           =   1  'Checkbox
      TabIndex        =   1
      Top             =   960
      Width           =   4545
   End
   Begin VB.ListBox lstApps 
      Height          =   4965
      IntegralHeight  =   0   'False
      Left            =   0
      Sorted          =   -1  'True
      Style           =   1  'Checkbox
      TabIndex        =   0
      Top             =   960
      Width           =   2865
   End
   Begin VB.Label Label1 
      Caption         =   "Использовать ->"
      Height          =   255
      Left            =   0
      TabIndex        =   6
      Top             =   0
      Width           =   1455
   End
End
Attribute VB_Name = "frmRoleSetting"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private excel As Object 'excel.Application
Private wb As Object 'Workbook
Private ws As Object 'Worksheet
Private trace As Object


Private Sub cmdRun_Click()
 Dim i As Long
  'trace.Clear
  ' проверка указаны ли типы объектов ИЛИ приложения
  Dim b As Boolean
  b = True
  If optApp.Value Then
    For i = 0 To lstApps.ListCount - 1
      If lstApps.Selected(i) Then b = False
    Next
    If b Then
      MsgBox "Не выбраны приолжения!!!", vbCritical + vbOKOnly, "Администратор"
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
  
  Dim nameF As String
  CD.ShowSave
  nameF = CD.FileName
  If nameF = "" Then Exit Sub
  
  Set excel = CreateObject("excel.Application")
  Set wb = excel.Workbooks.Add
  Set ws = wb.Worksheets.item(1)
  
  If optApp.Value Then APPS
  If optType.Value Then types
  wb.SaveAs nameF
  wb.Close
  Set excel = Nothing
  
  MsgBox "Файл успешно создан", vbInformation + vbOKOnly, "Администратор"
  Exit Sub
bye:
  MsgBox "Ошибка обработки информации", vbInformation + vbOKOnly, "Администратор"
End Sub

Private Sub APPS()
  Dim i, j As Long, n As Long, nameApp As String
  For i = 0 To lstApps.ListCount - 1
    If lstApps.Selected(i) Then
      n = lstApps.ItemData(i)
      nameApp = model.mtzApp.item(n).Name
      For j = 1 To model.objectType.Count
        If model.objectType.item(j).package.Name = nameApp Then
          addM model.objectType.item(j)
        End If
      Next
    End If
  Next
End Sub
Private Sub types()
  Dim i As Long, n As Long
  For i = 0 To lstTypes.ListCount - 1
    If lstTypes.Selected(i) Then
      n = lstTypes.ItemData(i)
      addM model.objectType.item(n)
    End If
  Next
End Sub

Private Sub addM(ot As objectType)
  'trace.AddItem "найден тип объекта ---> " & ot.Name
  
  Dim i, j As Long
  For i = 1 To ot.PART.Count
    If ot.PART.item(i).PartType = PartType_Stroka Then
      'trace.AddItem "   найден строковый раздел ---> " & ot.PART.item(i).Name
      
      ' проверка на существование метода с таким именем, если есть, то не добавляем
      Dim n As String
      n = ot.Name & "_SetName"
      With ot.PART.item(i).PARTMENU
        For j = 1 To .Count
          If .item(j).Name = n Then
            'trace.AddItem "   метод с данным именем уже существует ---> " & n
            Exit Sub
          End If
        Next
      End With
      
      ' добавление нового метода
      Dim SHM As SHAREDMETHOD
      Set SHM = usr.FindRowObject("SHAREDMETHOD", "{4FB59D1A-0123-47D3-9F4F-E12085C5D074}")
      
      Dim PRTM As PARTMENU
      Set PRTM = ot.PART.item(i).PARTMENU.Add
        PRTM.Name = n
        Set PRTM.the_Action = SHM
        PRTM.Save
      
      PRTM.PARTPARAMMAP.Add
      With PRTM.PARTPARAMMAP.item(1)
        .fieldName = ".brief"
        .ParamName = "Name"
        .Save
      End With
        
      'trace.AddItem "   добавлен метод ---> " & n
      
      If ot.PART.item(i).OnCreate Is Nothing Then
        Set ot.PART.item(i).OnCreate = PRTM
      End If
      If ot.PART.item(i).OnSave Is Nothing Then
        Set ot.PART.item(i).OnSave = PRTM
      End If
      ot.PART.item(i).Save
      'trace.AddItem "   Созданы ссылки (при создании и сохранении) на метод ---> " & n
      Exit Sub
    End If
  Next
End Sub







Private Sub Form_Load()
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
  For i = 1 To model.mtzApp.Count
    With model.mtzApp.item(i)
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


