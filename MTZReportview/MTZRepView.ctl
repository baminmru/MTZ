VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Object = "{0E59F1D2-1FBE-11D0-8FF2-00A0D10038BC}#1.0#0"; "Msscript.ocx"
Begin VB.UserControl ReportView 
   ClientHeight    =   6450
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6960
   ScaleHeight     =   6450
   ScaleWidth      =   6960
   Begin MSScriptControlCtl.ScriptControl Scripter 
      Left            =   5685
      Top             =   195
      _ExtentX        =   1005
      _ExtentY        =   1005
   End
   Begin VB.CommandButton cmdPreview 
      Caption         =   "Предварительный просмотр"
      Height          =   285
      Left            =   1305
      TabIndex        =   2
      Top             =   105
      Width           =   2625
   End
   Begin VB.CommandButton cmdPrint 
      Caption         =   "Печать"
      Height          =   285
      Left            =   150
      TabIndex        =   1
      Top             =   120
      Width           =   1050
   End
   Begin SHDocVwCtl.WebBrowser wb 
      Height          =   5445
      Left            =   105
      TabIndex        =   0
      Top             =   465
      Width           =   6720
      ExtentX         =   11853
      ExtentY         =   9604
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   "http:///"
   End
   Begin SHDocVwCtl.WebBrowser PWB 
      Height          =   1410
      Left            =   135
      TabIndex        =   4
      Top             =   450
      Width           =   3210
      ExtentX         =   5662
      ExtentY         =   2487
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   "http:///"
   End
   Begin SHDocVwCtl.WebBrowser LWB 
      Height          =   1410
      Left            =   3465
      TabIndex        =   3
      Top             =   450
      Width           =   2925
      ExtentX         =   5159
      ExtentY         =   2487
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   "http:///"
   End
End
Attribute VB_Name = "ReportView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private pre As Preprocessor
Private wrt As Writer
Private Pwrt As Writer
Private Lwrt As Writer
Private s2 As Writer
Private LHTML As String
Private PHTML As String

Public Function Prepare(ByVal reportfilename As String) As String
  Dim s As String
  Dim outs As String
  Dim ff As Long
  Dim script As String
  Close #ff
  ff = FreeFile
  Open reportfilename For Input As #ff
  s = Input(LOF(ff), #ff)
  Close #ff
  s = Replace(s, vbTab, " ")
  s = Replace(s, "  ", " ")
  
  script = pre.Convert(s)
  
  Set s2 = New Writer
  s2.OutNL "private sub MakeReport(Response as object)"
  s2.out script
  s2.OutNL ""
  s2.OutNL "end sub"
  s2.Flush
  outs = s2.getBuf
  Set s2 = Nothing
  Prepare = outs
  
  Dim mTempPath As String
  mTempPath = GetSetting("MTZ", "CONFIG", "TEMPPATH", "")
  'Dim ff As Long
  ff = FreeFile
  Open mTempPath & "prepare.bas" For Output As #ff
  Print #ff, outs
  Close #ff
  
  
  
End Function


Public Sub Show(w As Writer)
  On Error Resume Next
  LHTML = ""
  PHTML = w.getBuf
  Set wrt = New Writer
  wrt.out PHTML
  wrt.Flush
  wb.Navigate wrt.FileName

End Sub

Public Sub ShowPL(Portrite As Writer, Landscape As Writer)
  On Error Resume Next
  LHTML = Landscape.getBuf
  PHTML = Portrite.getBuf
  Set wrt = New Writer
  wrt.out PHTML
  wrt.OutNL "<HR style=""page-break-after:always"" >"
  wrt.out LHTML
  wrt.Flush
  wb.Navigate wrt.FileName
End Sub

Public Sub ProcessReport(ByVal reportfilename As String)
  Dim s As String
  Dim ff As Long
  Dim script As String
  Close #ff
  ff = FreeFile
  Open reportfilename For Input As #ff
  s = Input(LOF(ff), #ff)
  Close #ff
  s = Replace(s, vbTab, " ")
  s = Replace(s, "  ", " ")
  script = pre.Convert(s)
  Scripter.Timeout = -1
  'scripter.AddCode script
  'scripter.Run "Main"
  Set s2 = New Writer
  s2.out script
  s2.Flush
  
  On Error Resume Next
  Scripter.UseSafeSubset = False
  
  Scripter.ExecuteStatement script
  
  If Scripter.Error.Number > 0 Then
     Dim ef As frmErr
     Set ef = frmErr
     ef.SetErr Scripter.Error.Description & " at Line=" & Scripter.Error.Line & " Col=" & Scripter.Error.Column, script
     Exit Sub
  End If
  wrt.Flush
  LHTML = ""
  PHTML = wrt.getBuf
  wb.Navigate wrt.FileName
  Set s2 = Nothing
  
End Sub


Public Sub ProcessReportL(ByVal reportfilename As String)
  Dim s As String
  Dim ff As Long
  Dim script As String
  Close #ff
  ff = FreeFile
  Open reportfilename For Input As #ff
  s = Input(LOF(ff), #ff)
  Close #ff
  s = Replace(s, vbTab, " ")
  s = Replace(s, "  ", " ")
  script = pre.Convert(s)
  Scripter.Timeout = -1
  'scripter.AddCode script
  'scripter.Run "Main"
  Set s2 = New Writer
  s2.out script
  s2.Flush
  
  On Error Resume Next
  Scripter.UseSafeSubset = False
  
  Scripter.ExecuteStatement script
  
  If Scripter.Error.Number > 0 Then
     Dim ef As frmErr
     Set ef = frmErr
     ef.SetErr Scripter.Error.Description & " at Line=" & Scripter.Error.Line & " Col=" & Scripter.Error.Column, script
     Exit Sub
  End If
  wrt.Flush
  LHTML = wrt.getBuf
  PHTML = ""
  wb.Navigate wrt.FileName
  Set s2 = Nothing
 
End Sub

Public Sub AssignObject(ByVal ObjectName As String, ByVal NewObject As Object)
  Scripter.AddObject ObjectName, NewObject, True
End Sub

Public Sub Reset()
  wb.Navigate App.Path & "\empty.htm"
  Scripter.Reset
 
  Set wrt = Nothing
  Set wrt = New Writer
  Scripter.AddObject "Response", wrt
End Sub

Private Sub cmdPreview_Click()
  wb.ExecWB OLECMDID_PRINTPREVIEW, OLECMDEXECOPT_DODEFAULT
End Sub

Private Sub cmdPrint_Click()
  On Error Resume Next
  Dialog.Show vbModal
  If Dialog.OK Then
    PrintTo Dialog.cmbPrn.Text
  End If
  Unload Dialog
End Sub

Private Sub PrintTo(PrinterName As String)
    On Error Resume Next
    Dim Orientation As Integer
    Dim PaperSize As Integer
    GetPrinterInfo PrinterName, Orientation, PaperSize
    
    If PHTML <> "" Then
      Set Pwrt = New Writer
      
      Pwrt.out PHTML
      Pwrt.Flush
      PWB.Navigate Pwrt.FileName
      
      While Not PWB.ReadyState = READYSTATE_COMPLETE
        DoEvents
      Wend
      If Not SetPrinterInfo(PrinterName, DMORIENT_PORTRAIT, PaperSize) Then
        Exit Sub
      End If
      PWB.ExecWB OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER
      While PWB.Busy = True
        DoEvents
      Wend
      
      
    End If
    
    Dim t As Double
    t = Timer
    While t + 2 < Timer
      DoEvents
    Wend
    
    
    If LHTML <> "" Then
      Set Lwrt = New Writer
      Lwrt.out LHTML
      Lwrt.Flush
      LWB.Navigate Lwrt.FileName
      While Not LWB.ReadyState = READYSTATE_COMPLETE
        DoEvents
      Wend
      
      'SetPrinterInfo PrinterName, DMORIENT_LANDSCAPE, PaperSize
      If Not SetPrinterInfo(PrinterName, DMORIENT_LANDSCAPE, PaperSize) Then
        Exit Sub
      End If
      LWB.ExecWB OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER
      While LWB.Busy = True
        DoEvents
      Wend
    End If
    
    t = Timer
    While t + 2 < Timer
      DoEvents
    Wend
    
'    SetPrinterInfo PrinterName, Orientation, PaperSize
    
End Sub

Private Sub Command1_Click()
  On Error Resume Next
  Dialog.Show vbModal
  If Dialog.OK Then
  Dim p As Printer
    For Each p In Printers
      If p.DeviceName = Dialog.cmbPrn.Text Then
        p.Orientation = vbPRORLandscape
        Exit Sub
      End If
    Next
  End If
  Unload Dialog
End Sub

Private Sub Command2_Click()
On Error Resume Next
Dialog.Show vbModal
  If Dialog.OK Then
  Dim p As Printer
    For Each p In Printers
      If p.DeviceName = Dialog.cmbPrn.Text Then
        p.Orientation = vbPRORPortrait
        Exit Sub
      End If
    Next
  End If
  Unload Dialog
End Sub

Private Sub UserControl_Initialize()
    
  Set pre = New Preprocessor
  pre.OpenCode = "<%"
  pre.CloseCode = "%>"
  pre.OutFunc = "Out"
  pre.OutNLFunc = "OutNL"
  wb.Navigate App.Path & "\empty.htm"
  LWB.Navigate App.Path & "\empty.htm"
  PWB.Navigate App.Path & "\empty.htm"
  Reset
End Sub

Private Sub UserControl_Resize()
  On Error Resume Next
  wb.Left = 0
  wb.Height = UserControl.Height - wb.Top
  wb.Width = UserControl.Width
End Sub

Private Sub UserControl_Terminate()
  Set wrt = Nothing
  Set Lwrt = Nothing
  Set Pwrt = Nothing
  
End Sub
