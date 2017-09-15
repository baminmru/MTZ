VERSION 5.00
Object = "{977E00DE-73F3-4EDE-9EA4-56BD3EA46E00}#4.1#0"; "MTZGraph.ocx"
Begin VB.Form frmDebug 
   Caption         =   "Отдадка процесса"
   ClientHeight    =   7215
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9555
   Icon            =   "frmDebug.frx":0000
   LinkTopic       =   "Form1"
   MinButton       =   0   'False
   ScaleHeight     =   7215
   ScaleWidth      =   9555
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdColors 
      Caption         =   "Цвета"
      Height          =   375
      Left            =   1320
      TabIndex        =   4
      Top             =   600
      Width           =   1095
   End
   Begin VB.CheckBox chkAuto 
      Caption         =   "Автоповтор"
      Height          =   375
      Left            =   120
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   600
      Width           =   1095
   End
   Begin VB.TextBox txtlog 
      BackColor       =   &H80000000&
      Height          =   855
      Left            =   2520
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   2
      Top             =   120
      Width           =   6975
   End
   Begin VB.Timer Timer1 
      Interval        =   8000
      Left            =   1560
      Top             =   960
   End
   Begin VB.CommandButton cmdStep 
      Caption         =   "Сделать шаг процесса"
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   2295
   End
   Begin MTZGraph.GraphPanel p 
      Height          =   6015
      Left            =   120
      TabIndex        =   0
      Top             =   1080
      Width           =   9375
      _ExtentX        =   16536
      _ExtentY        =   10610
   End
End
Attribute VB_Name = "frmDebug"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private rItem As WFDEf.Application
Private Dic As WFDic.Application
Public DbgProcess As WFRtm.Application
Private DefProcess As WFDEf.Application
Private CM As Collection
Private InTimer As Boolean





Public Sub Init()
If DbgProcess Is Nothing Then Exit Sub
If DbgProcess.WFRtm_main.count = 0 Then Exit Sub
Set DefProcess = DbgProcess.WFRtm_main.Item(1).BasedOn
If DefProcess Is Nothing Then Exit Sub

InitGraph DefProcess

Set CM = New Collection
Dim cmp As ColorMap
Set cmp = New ColorMap
cmp.color = RGB(255, 255, 255)
CM.Add cmp, "S" & WFFuncState_Initial
Set cmp = New ColorMap
cmp.color = RGB(192, 192, 192)
CM.Add cmp, "S" & WFFuncState_Prepare

Set cmp = New ColorMap
cmp.color = RGB(0, 255, 0) ' зеленый
CM.Add cmp, "S" & WFFuncState_Active

Set cmp = New ColorMap
cmp.color = RGB(255, 255, 0) ' желтый
CM.Add cmp, "S" & WFFuncState_InWork

Set cmp = New ColorMap
cmp.color = RGB(255, 0, 255)
CM.Add cmp, "S" & WFFuncState_InControl

Set cmp = New ColorMap
cmp.color = RGB(255, 0, 0)
CM.Add cmp, "S" & WFFuncState_Done
Set cmp = New ColorMap

cmp.color = RGB(128, 0, 0)
CM.Add cmp, "S" & WFFuncState_Ready

Set cmp = New ColorMap
cmp.color = RGB(0, 0, 255)
CM.Add cmp, "S" & WFFuncState_Pause
Set cmp = New ColorMap
cmp.color = RGB(128, 128, 128)
CM.Add cmp, "S" & WFFuncState_Processed
ShowState
Timer1.Enabled = True
p.GraphEnabled = False
End Sub

Private Sub InitGraph(ObjItem As Object)
 Set rItem = ObjItem
 Dim rs As ADODB.Recordset

 Set rs = rItem.Manager.ListInstances("", "WFDic")
 If rs.RecordCount = 0 Then
  MsgBox "Отсутствует словарь  подсистемы управления процессами"
  Exit Sub
 End If
 Set Dic = rItem.Manager.GetInstanceObject(rs!InstanceID)
 Set rs = Nothing
 Dim i As Long
 On Error Resume Next
 For i = 1 To Dic.WFDic_func.count
  With Dic.WFDic_func.Item(i)
   Call p.LoadImage(IconPath(.IconName), i, .ID)
  End With
 Next
 
 If rItem.WFDef_INFO.count > 0 Then
  If Len(rItem.WFDef_INFO.Item(1).Diagram) > 255 Then
    p.ReadProjectFromString rItem.WFDef_INFO.Item(1).Diagram
  End If
 End If
End Sub

Private Function IconPath(ByVal ID As String) As String
  Dim s As String
  s = ""
  s = GetSetting("MTZ", "CONFIG", "IMAGEPATH", "")
  If s = "" Then
    IconPath = App.Path & "\" & ID & ".ico"
  Else
    IconPath = s & "\" & ID & ".ico"
  End If
End Function

Private Sub cmdColors_Click()
  Dim f As Dialog
  Set f = New Dialog
  f.Label1(0).BackColor = CM.Item("S" & WFFuncState_Initial).color
  f.Label1(1).BackColor = CM.Item("S" & WFFuncState_Prepare).color
  f.Label1(2).BackColor = CM.Item("S" & WFFuncState_Active).color
  f.Label1(3).BackColor = CM.Item("S" & WFFuncState_InWork).color
  f.Label1(4).BackColor = CM.Item("S" & WFFuncState_Ready).color
  f.Label1(5).BackColor = CM.Item("S" & WFFuncState_InControl).color
  f.Label1(6).BackColor = CM.Item("S" & WFFuncState_Done).color
  f.Label1(7).BackColor = CM.Item("S" & WFFuncState_Processed).color
  f.Label1(8).BackColor = CM.Item("S" & WFFuncState_Pause).color
  f.Show vbModal, Me
  Set f = Nothing

End Sub

Private Sub cmdStep_Click()
If Server Is Nothing Then
  Set Server = New WFServer.Server
  Server.Attach Manager, Session
End If
Server.ClearLog
txtlog.Text = Server.ProcessStep(DbgProcess.ID)
ShowState
End Sub

Private Sub Form_Resize()
  On Error Resume Next
  p.Left = 0
  p.Width = Me.ScaleWidth
  p.Height = Me.ScaleHeight - p.Top
  txtlog.Width = Me.ScaleWidth - txtlog.Left
End Sub

Private Sub Timer1_Timer()
  On Error Resume Next
  If InTimer Then Exit Sub
  InTimer = True
  If chkAuto.Value = vbChecked Then
    cmdStep_Click
  Else
    ShowState
  End If
  InTimer = False
End Sub



Private Sub ShowState()
  On Error GoTo BYE
  Dim i As Long
  Dim fcol As Collection
  Dim idx As ColorMap
  Dim wffr As wffr.Application
  Dim wffd As wffd.Application
  Set fcol = New Collection
  
  
  For i = 1 To DefProcess.WFDef_func.count
   Set idx = New ColorMap
   idx.color = 0
   idx.LastID = "S" & WFFuncState_Initial
   fcol.Add idx, DefProcess.WFDef_func.Item(i).ID
  Next
  
  DbgProcess.WFRtm_func.Refresh
  For i = 1 To DbgProcess.WFRtm_func.count
   Set wffr = DbgProcess.WFRtm_func.Item(i).Func
   wffr.WFFR_func.Refresh
   Set idx = fcol.Item(wffr.WFFR_func.Item(1).BasedOn.ID)
   If idx.color < wffr.WFFR_func.Item(1).PassNo Then
    idx.color = wffr.WFFR_func.Item(1).PassNo
    idx.LastID = "S" & wffr.WFFR_func.Item(1).State
   End If
  Next
  
  On Error Resume Next
  For i = 1 To DefProcess.WFDef_func.count
   Set idx = fcol.Item(DefProcess.WFDef_func.Item(i).ID)
   Set wffd = DefProcess.WFDef_func.Item(i).Func
   With p.GraphInfo.Nodes.Item(DefProcess.WFDef_func.Item(i).ID)
   
    If Not CM.Item(idx.LastID) Is Nothing Then
    .BackColor = CM.Item(idx.LastID).color
    
    Else
    .BackColor = RGB(255, 255, 255)
    End If
    
    .Caption = "#" & idx.color & "#" & vbCrLf & wffd.WFFD_common.Item(1).Name
   End With
  Next
BYE:
End Sub
