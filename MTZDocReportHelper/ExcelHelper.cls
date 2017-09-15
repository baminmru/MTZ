VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ExcelHelper"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private Sub ExportXL(ByVal fname As String, Optional Header = "")
 If DoNotDisturb Then Exit Sub
 Dim fnStr As String
 Dim i As Long, j As Long, k As Long
 Dim xl As Object, xlA As Object, xlW As Object
 Dim ss()

On Error GoTo xelErr
  If fname = "" Then
     Exit Sub
  End If
  
  fnStr = Dir(fname)
  If fnStr <> "" Then
      On Error GoTo killerr
      Kill fname
  End If

On Error GoTo xlErr
  Set xlA = CreateObject("excel.application")
  Set xlW = xlA.Workbooks.Add
  Set xl = xlW.Sheets(1)
  'If Err.Number <> 0 Then
  '  MsgBox "Невозможно открыть приложение Excel. Проверьте, установлено ли оно на вашей машине."
  '  xlA.quit
  '  Exit Sub
  'End If

On Error GoTo xelErr
  xl.Cells(1, 1).Value = Header
  ReDim ss(1 To Grid.Cols)
  i = 0 'Отдельно обрабатываем ряд заголовка

  k = 1
  For j = 0 To Grid.Cols - 1
    If Grid.ColWidth(j) <> 0 Then
        ss(k) = ""
        ss(k) = "'" & CStr(Grid.TextMatrix(i, j))
        k = k + 1
    End If
  Next j
  xl.Range(xl.Cells(i + 2, 1), xl.Cells(i + 2, k - 1)).Value = ss
  
  For i = 1 To Grid.Rows - 1
  
    k = 1
    For j = 0 To Grid.Cols - 1
      If Grid.ColWidth(j) <> 0 Then
          ss(k) = ""
          ss(k) = "'" & CStr(Grid.TextMatrix(i, j))
          k = k + 1
      End If
    Next j
    xl.Range(xl.Cells(i + 2, 1), xl.Cells(i + 2, k - 1)).Value = ss
  Next i
On Error GoTo SaveErr
xl.SaveAs fname


On Error GoTo xlErr
xlW.Application.Windows(1).Visible = True
xlW.Application.Windows(1).Activate
xlW.Application.Visible = True
xlA.WindowState = -4137
xl.Visible = True
Set xl = Nothing
Set xlW = Nothing
'xlA.quit
Set xlA = Nothing
Exit Sub

openerr:
ResetMouse2
Exit Sub

xlErr:
  ResetMouse2

  MsgBox VBGetResString(609) & vbCrLf & Error$ & " (" & Err & ")", vbCritical, IIf(mGridCaptions = "", VBGetResString(603), mGridCaptions)
Exit Sub


SaveErr:
  MsgBox VBGetResString(610) + fname + VBGetResString(611), vbExclamation + vbOKOnly, IIf(mGridCaptions = "", VBGetResString(603), mGridCaptions)
  Resume ttt
ttt:

  On Error GoTo xlErr
  xlW.Application.Windows(1).Visible = True
  xlW.Application.Windows(1).Activate
  xlW.Application.Visible = True
  xlA.WindowState = -4137
  Exit Sub

killerr:
  MsgBox VBGetResString(610) + fname + VBGetResString(611), vbOKOnly + vbExclamation, IIf(mGridCaptions = "", VBGetResString(603), mGridCaptions)
  Exit Sub

xelErr:
  MsgBox VBGetResString(612) & i + 2 & "," & k & "): " & Error$ & " (" & Err & ")", vbOKOnly + vbExclamation, IIf(mGridCaptions = "", VBGetResString(603), mGridCaptions)
  Resume ttt2
ttt2:
 On Error GoTo xlErr
  xlW.Application.Windows(1).Visible = True
  xlW.Application.Windows(1).Activate
  xlW.Application.Visible = True
  xlA.WindowState = -4137
End Sub
