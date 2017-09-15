VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frmLoadFT 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Загрузить описание типов плей"
   ClientHeight    =   900
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   6795
   Icon            =   "frmLoadFT.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   900
   ScaleWidth      =   6795
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
      Left            =   5520
      TabIndex        =   3
      Top             =   540
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
Attribute VB_Name = "frmLoadFT"
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
  Dim xdom As MSXML2.DOMDocument
  Set xdom = New MSXML2.DOMDocument
  xdom.async = False
  xdom.Load txtPath.Text
  Dim e_list As IXMLDOMNodeList
  
  Set e_list = xdom.lastChild.firstChild.selectNodes("FIELDTYPE_COL")
  model.FIELDTYPE.XMLLoad e_list, 0
  model.BatchUpdate
  
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
  txtPath = cdlg.FileName
  

bye:
End Sub

