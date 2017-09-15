VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmFastReportBuilder 
   Caption         =   "FastReportBuilder"
   ClientHeight    =   6165
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7095
   Icon            =   "frmFastReportBuilder.frx":0000
   LinkTopic       =   "FastReportBuilder"
   MDIChild        =   -1  'True
   ScaleHeight     =   6165
   ScaleWidth      =   7095
   Begin VB.CommandButton cmdRunReport 
      Caption         =   "Выполнить"
      Height          =   375
      Left            =   120
      TabIndex        =   21
      Top             =   5400
      Width           =   6855
   End
   Begin VB.CheckBox chkbAddToReports 
      Caption         =   "Автоматически добавлять в описание отчётов"
      Height          =   255
      Left            =   120
      TabIndex        =   20
      Top             =   5040
      Width           =   6375
   End
   Begin VB.CheckBox chkbIsDataTableOnly 
      Caption         =   "Для доп.вьюх только DataTable"
      Height          =   255
      Left            =   480
      TabIndex        =   19
      Top             =   4440
      Width           =   6015
   End
   Begin VB.CheckBox chkbGroup 
      Caption         =   "Обязательная группировка для датабанд"
      Height          =   255
      Left            =   120
      TabIndex        =   18
      Top             =   4800
      Width           =   6375
   End
   Begin VB.CommandButton cmdAddView 
      Caption         =   "..."
      Height          =   285
      Left            =   6600
      TabIndex        =   17
      Top             =   3360
      Width           =   375
   End
   Begin VB.ListBox List1 
      Height          =   1035
      Left            =   120
      TabIndex        =   15
      Top             =   3360
      Width           =   6495
   End
   Begin VB.CommandButton cmdGetFolder 
      Caption         =   "..."
      Height          =   285
      Left            =   6600
      TabIndex        =   13
      Top             =   2760
      Width           =   375
   End
   Begin VB.TextBox txtFolder 
      Height          =   285
      Left            =   480
      TabIndex        =   12
      Top             =   2760
      Width           =   6135
   End
   Begin VB.CommandButton cmdGetApp 
      Caption         =   "..."
      Height          =   285
      Left            =   6600
      TabIndex        =   10
      Top             =   2160
      Width           =   375
   End
   Begin VB.TextBox txtApp 
      Height          =   285
      Left            =   120
      TabIndex        =   9
      Top             =   2160
      Width           =   6495
   End
   Begin VB.CommandButton cmdChooseObject 
      Caption         =   "..."
      Height          =   285
      Left            =   6600
      TabIndex        =   7
      Top             =   960
      Width           =   375
   End
   Begin VB.TextBox txtObject 
      Height          =   285
      Left            =   120
      TabIndex        =   6
      Top             =   960
      Width           =   6495
   End
   Begin VB.CommandButton cmdChooseRTitle 
      Caption         =   "..."
      Height          =   285
      Left            =   6600
      TabIndex        =   4
      Top             =   360
      Width           =   375
   End
   Begin VB.TextBox txtTitle 
      Height          =   285
      Left            =   120
      TabIndex        =   3
      Top             =   360
      Width           =   6495
   End
   Begin VB.CommandButton cmdReport 
      Caption         =   "..."
      Height          =   285
      Left            =   6600
      TabIndex        =   1
      Top             =   1560
      Width           =   375
   End
   Begin VB.TextBox txtReportOutput 
      Height          =   285
      Left            =   480
      TabIndex        =   0
      Top             =   1560
      Width           =   6135
   End
   Begin MSComDlg.CommonDialog cdlg 
      Left            =   6600
      Top             =   3960
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Label Label6 
      Caption         =   "Дополнительные вьюхи:"
      Height          =   255
      Left            =   120
      TabIndex        =   16
      Top             =   3120
      Width           =   3735
   End
   Begin VB.Label Label5 
      Caption         =   "Папка вывода отчётов:"
      Height          =   255
      Left            =   480
      TabIndex        =   14
      Top             =   2520
      Width           =   3735
   End
   Begin VB.Label Label4 
      Caption         =   "Приложение системы:"
      Height          =   255
      Left            =   120
      TabIndex        =   11
      Top             =   1920
      Width           =   3735
   End
   Begin VB.Label Label3 
      Caption         =   "Объект системы:"
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   720
      Width           =   3735
   End
   Begin VB.Label Label2 
      Caption         =   "Шапка:"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   120
      Width           =   3735
   End
   Begin VB.Label Label1 
      Caption         =   "Файл отчёта:"
      Height          =   255
      Left            =   480
      TabIndex        =   2
      Top             =   1320
      Width           =   3735
   End
End
Attribute VB_Name = "frmFastReportBuilder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim objObject As Object
Dim mtzApp As mtzApp
Dim oPartViews As Collection

Private Sub cmdAddView_Click()
Dim IID As String
Dim brief As String
Dim oPartView As Object
    If Manager.GetReferenceDialogEx2("PARTVIEW", IID, brief) Then
        Set oPartView = MyUser.Application.FindRowObject("PARTVIEW", IID)
        oPartViews.Add oPartView
        List1.AddItem oPartView.brief
    End If
End Sub

Private Sub cmdChooseObject_Click()
Dim IDv As String
Dim Briefv As String

    If Not Manager.GetReferenceDialogEx3("OBJECTTYPE", IDv, Briefv) Then
        Exit Sub
    End If
    IDv = Left(IDv, 38)
    txtObject.Text = Briefv
    txtObject.Tag = IDv
    Set objObject = MyUser.Application.FindRowObject("OBJECTTYPE", IDv)
End Sub

Private Sub cmdChooseRTitle_Click()
    cdlg.CancelError = False
    cdlg.Filter = "Кaстом шапка |*.txt"
    cdlg.DefaultExt = "txt"
    cdlg.Flags = cdlOFNPathMustExist + cdlOFNHideReadOnly + cdlOFNFileMustExist
    cdlg.ShowOpen
    txtTitle = cdlg.FileName
End Sub

Private Sub cmdGetApp_Click()
Dim IDv As String
Dim Briefv As String

    If Not Manager.GetReferenceDialogEx3("MTZAPP", IDv, Briefv) Then
        Exit Sub
    End If
    IDv = Left(IDv, 38)
    'Dim mtzApp As mtzApp
    Set mtzApp = MyUser.Application.FindRowObject("MTZAPP", IDv)
    txtApp.Text = mtzApp.brief
End Sub

Private Sub cmdGetFolder_Click()
    txtFolder.Text = GetPath("Путь для отчётов", Me.hwnd)
End Sub

Private Sub cmdReport_Click()
On Error GoTo Err_Det
    cdlg.CancelError = True
    cdlg.Filter = "Документ FastReport |*.fr3"
    cdlg.DefaultExt = "fr3"
    If Not objObject Is Nothing Then
        cdlg.FileName = objObject.Name
    End If
    'cdlg.FileName = App.path & "\" & item.ID & ".xml"
    cdlg.Flags = cdlOFNPathMustExist '+ cdlOFNHideReadOnly + cdlOFNFileMustExist
    cdlg.ShowSave
    txtReportOutput.Text = cdlg.FileName
    Exit Sub
Err_Det:

End Sub

Private Sub cmdRunReport_Click()
    If Not ( _
        (txtObject.Text <> "" And txtReportOutput.Text <> "") Or _
        (txtApp.Text <> "" And txtFolder.Text <> "")) Then
        Exit Sub
    End If
    If txtApp.Text <> "" Then
        Dim oMetaModel As MTZMetaModel.Application
    
        Set oMetaModel = mtzApp.Application
    
        Dim i As Long
        Dim fn As String
        
        For i = 1 To oMetaModel.objectType.Count
            If oMetaModel.objectType.item(i).package.ID = mtzApp.ID Then
                Set objObject = oMetaModel.objectType.item(i)
                fn = txtFolder.Text + objObject.Name + ".fr3"
                MakeSingleFRForView fn, objObject, IsFullAutoNode(), IsAddViews(), IsGroup(), IsDataTableOnly(), txtTitle.Text, Nothing
            End If
        Next
        MsgBox "Завершено!"
    End If
    
    If txtObject.Text <> "" Then
        Dim cOut As Collection
        If oPartViews.Count = 0 Then
            Set cOut = Nothing
        Else
            Set cOut = oPartViews
        End If
        MakeSingleFRForView txtReportOutput.Text, objObject, IsFullAutoNode(), IsAddViews(), IsGroup(), IsDataTableOnly(), txtTitle.Text, cOut
        Set cOut = Nothing
    End If
    
End Sub

Public Function IsAddViews() As Boolean
    If oPartViews.Count > 0 Then
        IsAddViews = True
    Else
        IsAddViews = False
    End If
End Function

Private Function IsDataTableOnly() As Boolean
    If chkbIsDataTableOnly.Value = vbChecked Then
        IsDataTableOnly = True
    Else
        IsDataTableOnly = False
    End If
End Function

Private Function IsGroup() As Boolean
    If chkbGroup.Value = vbChecked Then
        IsGroup = True
    Else
        IsGroup = False
    End If
End Function


Private Function IsFullAutoNode() As Boolean
    If chkbAddToReports.Value = vbChecked Then
        IsFullAutoNode = True
    Else
        IsFullAutoNode = False
    End If
End Function

Private Sub Form_Load()
    Set oPartViews = New Collection
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Set oPartViews = Nothing
    Set objObject = Nothing
    Set mtzApp = Nothing
End Sub
