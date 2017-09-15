VERSION 5.00
Object = "{977E00DE-73F3-4EDE-9EA4-56BD3EA46E00}#4.1#0"; "MTZGraph.ocx"
Begin VB.Form frmGraph 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Преобразование процесса"
   ClientHeight    =   5085
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7185
   Icon            =   "frmGraph.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5085
   ScaleWidth      =   7185
   StartUpPosition =   2  'CenterScreen
   Begin MTZGraph.GraphPanel p 
      Height          =   4575
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   6855
      _ExtentX        =   12091
      _ExtentY        =   8070
   End
End
Attribute VB_Name = "frmGraph"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
Dim rs As ADODB.Recordset
Dim dic As Object
 Set rs = m.ListInstances("", "WFDic")
 If rs.RecordCount = 0 Then
  MsgBox "Отсутствует словарь  подсистемы управления процессами"
  Exit Sub
 End If
 Set dic = m.GetInstanceObject(rs!InstanceID)
 Set rs = Nothing
 Dim i As Long
 On Error Resume Next

 dic.WFDic_func.Sort = "IconName"
 
 For i = 1 To dic.WFDic_func.Count
  With dic.WFDic_func.Item(i)
   'Call p.LoadImage(IconPath(.IconName), i, .ID)
   Call p.LoadImage("D:\BAMI\MTZ\IMAGES\" & .IconName & ".ICO", i, .id)
  End With
 Next
 
End Sub

