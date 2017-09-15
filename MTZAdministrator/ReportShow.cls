VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ReportShow"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit
Public Caption As String
Public ReportPath As String
Public ReportSource As String
Public ReportFilter As String

Private m_Formulas As Formulas
Private frm As frmReport


Public Function Formulas() As Formulas
  Set Formulas = m_Formulas
End Function

Private Sub Class_Initialize()
  Set m_Formulas = New Formulas
  Set frm = New frmReport
End Sub

Private Sub Class_Terminate()
  On Error Resume Next
  Unload frm
  Set m_Formulas = Nothing
  Set frm = Nothing
End Sub


Public Sub Run()
  Dim crX As CRAXDRT.Application
  Dim adoRs As ADODB.Recordset
  On Error GoTo bye
  Set crX = New CRAXDRT.Application
  Dim rpt As CRAXDRT.Report
  Set rpt = crX.OpenReport(ReportPath, 1)
  rpt.DiscardSavedData
  Dim mconnectString As String

  Set adoRs = Session.GetRows(ReportSource, "", "", ReportFilter)
  Dim rep As ReportSupport
  Dim rid As String
  rid = CreateGUID2
  Set rep = New ReportSupport
  rep.Init
  rep.FillReport rid, adoRs, ReportSource
  Set adoRs = rep.GetReport(rid, ReportSource)
  rpt.Database.SetDataSource adoRs
  

  Dim ff As FormulaFieldDefinition
  Dim fd As FormulaData
  For Each fd In Formulas
    Set ff = rpt.FormulaFields.GetItemByName(fd.name)
    ff.Text = fd.Expression
  Next

  'rpt.VerifyOnEveryPrint = True
  
  rpt.Database.Verify
  frm.Caption = Caption
  frm.Show
  frm.CRViewer1.ReportSource = rpt
  frm.CRViewer1.ViewReport
  
  frm.WindowState = 0
  rep.ClearReptort rid, ReportSource
  Set rep = Nothing
  Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly + vbCritical, "Отчет"
End Sub

