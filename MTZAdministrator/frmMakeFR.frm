VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frmMakeFR 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Автогенератор отчетов"
   ClientHeight    =   3900
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4485
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3900
   ScaleWidth      =   4485
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdEdit 
      Caption         =   "Редактировать"
      Height          =   615
      Left            =   120
      TabIndex        =   7
      Top             =   2880
      Width           =   3975
   End
   Begin VB.CommandButton cmdReport 
      Caption         =   "..."
      Height          =   375
      Left            =   3360
      TabIndex        =   6
      Top             =   1560
      Width           =   735
   End
   Begin VB.TextBox txtRpt 
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   1560
      Width           =   3135
   End
   Begin VB.CommandButton cmdMake 
      Caption         =   "Создать отчет"
      Height          =   615
      Left            =   120
      TabIndex        =   3
      Top             =   2160
      Width           =   3975
   End
   Begin VB.CommandButton cmdPV 
      Caption         =   "..."
      Height          =   375
      Left            =   3360
      TabIndex        =   2
      Top             =   600
      Width           =   735
   End
   Begin VB.TextBox txtPV 
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   600
      Width           =   3135
   End
   Begin MSComDlg.CommonDialog cdlg 
      Left            =   360
      Top             =   3600
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Label Label2 
      Caption         =   "Файл отчета"
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   1200
      Width           =   3255
   End
   Begin VB.Label Label1 
      Caption         =   "Представление"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3135
   End
End
Attribute VB_Name = "frmMakeFR"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit




Private Sub cmdEdit_Click()
    Dim designer As TfrxDesigner
    Dim report As TfrxReport
    Set report = CreateObject("FastReport.TfrxReport")
    report.LoadReportFromFile (txtRpt)
    Set designer = CreateObject("FastReport.TfrxDesigner")
    designer.standalone = True
    report.DesignReport
    Set designer = Nothing
    Set report = Nothing
End Sub

Private Sub cmdMake_Click()
    On Error Resume Next
    Dim Page As IfrxReportPage
    Dim Title As IfrxBand
    Dim DataBand As IfrxDataBand
    Dim memo1 As IfrxMemoView
    Dim memo2 As IfrxMemoView
    Dim report As TfrxReport
    Dim pv As PARTVIEW
    Dim vc As ViewColumn
    Dim i As Long
    Set pv = MyUser.Application.FindRowObject("PARTVIEW", left(txtPV.Tag, 38))
    If pv Is Nothing Then
      MsgBox "Не удалось получить объект - описание запроса"
      Exit Sub
    End If
    
    Set report = CreateObject("FastReport.TfrxReport")
    
    Dim query_obj As TfrxADOQuery
    Dim database_obj As TfrxADODatabase
    Dim frConn As MTZFRConnector
    Set frConn = New MTZFRConnector
    Dim cn As String, prv As String
    
    frConn.GetFRConnectString Session.site, cn, prv
    
    report.ClearReport
    
    Set database_obj = report.CreateReportObjectEx(report, "TfrxADODatabase", "database")
    database_obj.Connected = False
    database_obj.ConnectionString = cn
    database_obj.LoginPrompt = False
    database_obj.Connected = False
    
    
    Set query_obj = report.CreateReportObjectEx(report, "TfrxADOQuery", "query")
    query_obj.Query = "select * from V_" & pv.the_Alias
    query_obj.DataBase = database_obj

    Set Page = report.CreateReportObjectEx(report, "TfrxPage", "report_page")
    Set Title = report.CreateReportObjectEx(Page, "TfrxReportTitle", "report_title")
    Set DataBand = report.CreateReportObjectEx(Page, "TfrxDataBand", "data_band")
    DataBand.DataSet = query_obj
    
    Page.TopMargin = 10
    Page.BottomMargin = 10
    Page.LeftMargin = 10
    Page.RightMargin = 10
    Page.PaperHeight = 297
    Page.PaperWidth = 210
    SetBounds Title, 0, 0, 0, 50
    SetBounds DataBand, 0, 101, 0, 50
    
    
   
    Dim dw As Double
    dw = (Page.PaperWidth - Page.LeftMargin - Page.RightMargin) / pv.ViewColumn.Count * 2.56
    For i = 1 To pv.ViewColumn.Count
      Set vc = pv.ViewColumn.item(i)
      Set memo1 = report.CreateReportObjectEx(Title, "TfrxMemoView", "ttl_" & vc.the_Alias)
      Set memo2 = report.CreateReportObjectEx(DataBand, "TfrxMemoView", "dat_" & vc.the_Alias)
      
      SetBounds memo1, (i - 1) * dw, 10, CLng(dw), 20
      memo1.Memo = vc.Name
      memo1.HAlign = hAlignCenter
      'memo1.Frame.FrameType = 8
      'memo1.Font.Bold = True
      
      SetBounds memo2, (i - 1) * dw, 10, CLng(dw), 20
      memo2.Memo = ""
      memo2.HAlign = hAlignCenter
      memo2.DataSet = query_obj
      memo2.DataField = vc.the_Alias
      
    
      Set memo1 = Nothing
      Set memo2 = Nothing
    Next
    
    report.SaveReportToFile txtRpt
    Set database_obj = Nothing
    Set query_obj = Nothing
    Set memo1 = Nothing
    Set memo2 = Nothing
    Set DataBand = Nothing
    Set Title = Nothing
    
    Set report = Nothing
    MsgBox "Отчет сформирован"
    
End Sub

Public Sub SetBounds(Component As IfrxComponent, left As Integer, top As Integer, width As Integer, height As Integer)
Component.left = left
Component.top = top
Component.width = width
Component.height = height
End Sub


Private Sub cmdPV_Click()
Dim ID As String
  Dim brief As String
  If Manager.GetReferenceDialogEx3("PARTVIEW", ID, brief) Then
      txtPV.Tag = ID
      txtPV.Text = brief
  End If
End Sub

Private Sub cmdReport_Click()
 On Error Resume Next
  
  On Error GoTo bye
  Dim fn As String
  cdlg.CancelError = True
  cdlg.Filter = "Отчет *.FR3 |*.FR3"
  cdlg.DefaultExt = "FR3"
  cdlg.Flags = cdlOFNPathMustExist + cdlOFNHideReadOnly
  cdlg.ShowOpen
  txtRpt = cdlg.FileName
  

bye:
End Sub
