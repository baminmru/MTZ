VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmLoadDesc 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Загрузить описание типа"
   ClientHeight    =   870
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   6855
   Icon            =   "frmLoadDesc.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   870
   ScaleWidth      =   6855
   ShowInTaskbar   =   0   'False
   Begin MSComDlg.CommonDialog cdlg 
      Left            =   240
      Top             =   600
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdPath 
      Caption         =   "..."
      Height          =   315
      Left            =   6405
      TabIndex        =   2
      Top             =   120
      Width           =   315
   End
   Begin VB.TextBox txtPath 
      Height          =   285
      Left            =   1320
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   120
      Width           =   5040
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "Загрузить"
      Height          =   315
      Left            =   5550
      TabIndex        =   3
      Top             =   510
      Width           =   1175
   End
   Begin VB.Label Label8 
      Caption         =   "Путь к файлу:"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1785
   End
End
Attribute VB_Name = "frmLoadDesc"
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



Private Sub OKButton_Click()
  On Error GoTo bye
  Dim item As ObjectType
  Dim xdom As MSXML2.DOMDocument
  Dim ID As String
  Dim package As String
  Dim packageName As String
  Set xdom = New MSXML2.DOMDocument
  xdom.Load txtpath.Text
  package = xdom.lastChild.Attributes.getNamedItem("PACKAGE").nodeValue
  packageName = xdom.lastChild.Attributes.getNamedItem("PACKAGE_BRIEF").nodeValue
  
  ' add package name if not exists
  If model.MTZAPP.item(package) Is Nothing Then
    With model.MTZAPP.Add(package)
    .Name = packageName
    .Save
    End With
  End If
  
  ID = xdom.lastChild.Attributes.getNamedItem("ID").nodeValue
  If model.ObjectType.item(ID) Is Nothing Then
    model.ObjectType.Add ID
  End If
  Set item = model.ObjectType.item(ID)
  item.XMLLoad xdom.lastChild, 1
  item.BatchUpdate
  Set xdom = Nothing
  MsgBox "Загрузка завершена", , "Загрузка описания типа"
  Exit Sub
bye:
  MsgBox "Ошибка загрузки" & vbCrLf & Err.Description, , "Загрузка описания типа"
End Sub

Private Sub cmdPath_Click()
  On Error Resume Next
  
  On Error GoTo bye
  Dim fn As String
  cdlg.CancelError = True
  cdlg.Filter = "Документ XML |*.XML"
  cdlg.DefaultExt = "XML"
  'cdlg.FileName = App.path & "\" & item.ID & ".xml"
  cdlg.Flags = cdlOFNPathMustExist + cdlOFNHideReadOnly + cdlOFNFileMustExist
  cdlg.ShowOpen
  txtpath = cdlg.FileName
  

bye:
End Sub

