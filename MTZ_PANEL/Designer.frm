VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form Form1 
   Caption         =   "Edit Control position"
   ClientHeight    =   6795
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   8565
   Icon            =   "Designer.frx":0000
   LinkTopic       =   "Form1"
   MinButton       =   0   'False
   ScaleHeight     =   6795
   ScaleWidth      =   8565
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame FrameTool 
      BorderStyle     =   0  'None
      Height          =   495
      Left            =   0
      TabIndex        =   4
      Top             =   0
      Width           =   8565
      Begin VB.CommandButton cmdSameHeight 
         Height          =   315
         Left            =   4560
         Picture         =   "Designer.frx":1042
         Style           =   1  'Graphical
         TabIndex        =   17
         Top             =   60
         Width           =   315
      End
      Begin VB.CommandButton cmdSameWidth 
         Height          =   315
         Left            =   4230
         Picture         =   "Designer.frx":134C
         Style           =   1  'Graphical
         TabIndex        =   16
         Top             =   60
         Width           =   315
      End
      Begin VB.CommandButton cmdAlignWidth 
         Height          =   315
         Left            =   3810
         Picture         =   "Designer.frx":1656
         Style           =   1  'Graphical
         TabIndex        =   15
         Top             =   60
         Width           =   315
      End
      Begin VB.CommandButton cmdAlignHeight 
         Height          =   315
         Left            =   3480
         Picture         =   "Designer.frx":1960
         Style           =   1  'Graphical
         TabIndex        =   14
         Top             =   60
         Width           =   315
      End
      Begin VB.CommandButton cmdAlignHor 
         Height          =   315
         Left            =   3000
         Picture         =   "Designer.frx":1C6A
         Style           =   1  'Graphical
         TabIndex        =   13
         Top             =   60
         Width           =   315
      End
      Begin VB.CommandButton cmdAlignToBottom 
         Height          =   315
         Left            =   2640
         Picture         =   "Designer.frx":1F74
         Style           =   1  'Graphical
         TabIndex        =   12
         Top             =   60
         Width           =   315
      End
      Begin VB.CommandButton cmdAlignToTop 
         Height          =   315
         Left            =   2280
         Picture         =   "Designer.frx":227E
         Style           =   1  'Graphical
         TabIndex        =   11
         Top             =   60
         Width           =   315
      End
      Begin VB.CommandButton cmdAlignToRight 
         Height          =   315
         Left            =   1950
         Picture         =   "Designer.frx":2588
         Style           =   1  'Graphical
         TabIndex        =   10
         Top             =   60
         Width           =   315
      End
      Begin VB.CommandButton cmdAlignToCenter 
         Height          =   315
         Left            =   1620
         Picture         =   "Designer.frx":2892
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   60
         Width           =   315
      End
      Begin VB.CommandButton cmdAlignLeft 
         Height          =   315
         Left            =   1290
         Picture         =   "Designer.frx":2B9C
         Style           =   1  'Graphical
         TabIndex        =   8
         Top             =   60
         Width           =   315
      End
      Begin VB.CommandButton CommandAlignTogrid 
         Height          =   315
         Left            =   960
         Picture         =   "Designer.frx":2EA6
         Style           =   1  'Graphical
         TabIndex        =   7
         Top             =   60
         Width           =   315
      End
      Begin VB.CommandButton CommandUnSelect 
         Height          =   315
         Left            =   420
         Picture         =   "Designer.frx":31B0
         Style           =   1  'Graphical
         TabIndex        =   6
         Top             =   60
         Width           =   315
      End
      Begin VB.CommandButton CommandSelectAll 
         Height          =   315
         Left            =   60
         Picture         =   "Designer.frx":34BA
         Style           =   1  'Graphical
         TabIndex        =   5
         Top             =   60
         Width           =   315
      End
   End
   Begin MSComDlg.CommonDialog cdlg 
      Left            =   3240
      Top             =   6480
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Отмена"
      Height          =   315
      Left            =   7350
      TabIndex        =   2
      Top             =   6450
      Width           =   1185
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "Сохранить"
      Height          =   315
      Left            =   6120
      TabIndex        =   1
      Top             =   6450
      Width           =   1185
   End
   Begin VB.PictureBox pic 
      Height          =   3975
      Left            =   60
      ScaleHeight     =   3915
      ScaleWidth      =   8475
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   780
      Width           =   8535
      Begin MTZ_PANEL.CBorder Entity 
         Height          =   495
         Index           =   0
         Left            =   150
         TabIndex        =   3
         Top             =   360
         Visible         =   0   'False
         Width           =   855
         _ExtentX        =   1508
         _ExtentY        =   873
         Caption         =   "узел"
         FontSize        =   12
         BackColor       =   -2147483633
         Decomposition   =   0   'False
      End
   End
   Begin VB.Menu mnuEdit 
      Caption         =   "Исправить"
      Begin VB.Menu mnuSelectAll 
         Caption         =   "Выбрать всё"
      End
      Begin VB.Menu mnuUnSelectAll 
         Caption         =   "Отменить выбор всех"
      End
      Begin VB.Menu mnsep1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSnapPos 
         Caption         =   "Привязка к сетке"
      End
      Begin VB.Menu mnuSameLeft 
         Caption         =   "Выровнять влево"
      End
      Begin VB.Menu mnuSameCenterV 
         Caption         =   "Выровнять по вертикали"
      End
      Begin VB.Menu mnuSameRights 
         Caption         =   "Выровнять вправо"
      End
      Begin VB.Menu mnuSameTop 
         Caption         =   "Выровнять по верху"
      End
      Begin VB.Menu mnuSameBottom 
         Caption         =   "Выровнять по низу"
      End
      Begin VB.Menu mnuSameCenterH 
         Caption         =   "Выровнять по горизонтали"
      End
      Begin VB.Menu mnusep2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuAlignHeight 
         Caption         =   "Привязать по высоте к сетке"
      End
      Begin VB.Menu mnuAlignGrid 
         Caption         =   "Привязать по ширине к сетке"
      End
      Begin VB.Menu mnuSameWidth 
         Caption         =   "Та же ширина"
      End
      Begin VB.Menu mnuSameHeight 
         Caption         =   "Та же высота"
      End
   End
   Begin VB.Menu EntMenu 
      Caption         =   "Инструменты"
      Begin VB.Menu mnuLoadFromFile 
         Caption         =   "Загрузить..."
      End
      Begin VB.Menu mnuSave 
         Caption         =   "Сохранить..."
      End
      Begin VB.Menu mnuTI 
         Caption         =   "Настройка порядка обхода"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 265
Option Explicit
'Окно настройки позиции контролов на панели


Dim arr() As ctlDef
Dim CurItem As Long

Public sw As ScrolledWindow
Attribute sw.VB_VarHelpID = 270



Private Sub cmdAlignHeight_Click()
  Call mnuAlignHeight_Click
End Sub

Private Sub cmdAlignHor_Click()
  Call mnuSameCenterH_Click
End Sub

Private Sub cmdAlignLeft_Click()
  Call mnuSameLeft_Click
End Sub

Private Sub cmdAlignToBottom_Click()
  Call mnuSameBottom_Click
End Sub

Private Sub cmdAlignToCenter_Click()
  Call mnuSameCenterV_Click
End Sub

Private Sub cmdAlignToRight_Click()
  Call mnuSameRights_Click
End Sub

Private Sub cmdAlignToTop_Click()
  Call mnuSameTop_Click
End Sub

Private Sub cmdAlignWidth_Click()
  Call mnuAlignGrid_Click
End Sub

Private Sub cmdCancel_Click()
  Set sw = Nothing
  Unload Me
End Sub

Private Sub cmdSameHeight_Click()
Call mnuSameHeight_Click
End Sub

Private Sub cmdSameWidth_Click()
  Call mnuSameWidth_Click
End Sub

Private Sub cmdUpdate_Click()
  LoadFromArray arr, sw
  
  Dim ctl As Object, i As Long
  On Error Resume Next
  i = 0
  If sw.PanelControls.Count = 0 Then Exit Sub
  For Each ctl In sw.PanelControls
    i = i + 1
    ctl.Left = Entity(i).Left + 5 * Screen.TwipsPerPixelX
    ctl.Top = Entity(i).Top + 5 * Screen.TwipsPerPixelY
    ctl.Width = Entity(i).Width - 10 * Screen.TwipsPerPixelX
    ctl.Height = Entity(i).Height - 10 * Screen.TwipsPerPixelX
  Next

  
  Set sw = Nothing
  Unload Me
End Sub

Private Sub Command1_Click()
  Call mnuSelectAll_Click
End Sub

Private Sub Command2_Click()

End Sub

Private Sub CommandAlignTogrid_Click()
  Call mnuSnapPos_Click
End Sub

Private Sub CommandSelectAll_Click()
  Call mnuSelectAll_Click
End Sub

Private Sub CommandUnSelect_Click()
  Call mnuUnselectAll_Click
End Sub

Private Sub Entity_DblClick(Index As Integer)
Dim d As Dialog
Set d = New Dialog
d.Caption = Entity(Index).Caption

d.lblName = arr(Index).Name
If arr(Index).HasIndex Then
  d.lblIndex = arr(Index).Index
Else
  d.lblIndex = "No Index"
End If
If arr(Index).HasTag Then
  d.txtTag = arr(Index).Tag
Else
  d.txtTag.Enabled = False
End If
  
If arr(Index).HasCaption Then
  d.txtCaption = arr(Index).Caption
Else
  d.txtCaption.Enabled = False
End If
  
If arr(Index).HasTS Then
 If arr(Index).ts Then
  d.chkTabStop.value = vbChecked
 Else
  d.chkTabStop.value = vbUnchecked
 End If
Else
  d.chkTabStop.value = vbUnchecked
  d.chkTabStop.Enabled = False
End If
  
If arr(Index).Visible Then
  d.chkVisible.value = vbChecked
End If
  
If arr(Index).Enabled Then
  d.chkEnabled.value = vbChecked
End If
  
d.txtTabIndex = arr(Index).ti
d.Show vbModal
If d.OK Then
  arr(Index).Caption = d.txtCaption
  arr(Index).Tag = d.txtTag
  'arr(Index).ti = Val(d.txtTabIndex)
  arr(Index).ts = (d.chkTabStop.value = vbChecked)
  Entity(Index).Caption = arr(Index).Name & "; " & arr(Index).Caption & "; TI=" & arr(Index).ti
  arr(Index).Visible = d.chkVisible = vbChecked
  arr(Index).Enabled = d.chkEnabled = vbChecked
  
  If Not arr(Index).Visible Then
     Entity(Index).Color = vbYellow
  ElseIf Not arr(Index).Enabled Then
     Entity(Index).Color = vbGreen
  ElseIf arr(Index).ts Then
      Entity(Index).Color = RGB(192, 192, 192)
  Else
      Entity(Index).Color = RGB(0, 192, 192)
  End If
  
End If
Unload d
Set d = Nothing
End Sub

Private Sub Entity_MouseUp(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
'If Button = 2 Then
'  CurItem = Index
'  PopupMenu EntMenu
'End If
If Shift = 2 And Button = 1 Then
  Entity(Index).DrawMode = Not Entity(Index).DrawMode
End If

End Sub

Private Sub Entity_Moving(Index As Integer, ByVal XStart As Double, ByVal x As Single, ByVal YStart As Double, ByVal y As Single, UserDefault As Boolean)
If Entity(Index).DrawMode Then
  UserDefault = False
  Dim i As Long
  For i = 1 To sw.PanelControls.Count
    If Entity(i).DrawMode Then
      Entity(i).Top = Entity(i).Top + y - YStart
      Entity(i).Left = Entity(i).Left + x - XStart
    End If
  Next
End If
End Sub

Private Sub Entity_ResizeMe(Index As Integer, ByVal Coner As Long, ByVal OldX As Long, OldY As Long, ByVal x As Long, ByVal y As Long)
    
    On Error Resume Next
    Entity(Index).ZOrder 0
    Select Case Coner
    Case 0
      Entity(Index).Left = Entity(Index).Left + x - OldX
      Entity(Index).Top = Entity(Index).Top + y - OldY
      Entity(Index).Width = Entity(Index).Width + OldX - x
      Entity(Index).Height = Entity(Index).Height + OldY - y
    Case 1
      Entity(Index).Top = Entity(Index).Top + y - OldY
      Entity(Index).Height = Entity(Index).Height + OldY - y
    Case 2
      Entity(Index).Top = Entity(Index).Top - OldY + y
      Entity(Index).Width = Entity(Index).Width - OldX + x
      Entity(Index).Height = Entity(Index).Height - y + OldY
    Case 3
      Entity(Index).Width = Entity(Index).Width - OldX + x
    Case 4
      Entity(Index).Width = Entity(Index).Width - OldX + x
      Entity(Index).Height = Entity(Index).Height - OldY + y
    Case 5
      Entity(Index).Height = Entity(Index).Height - OldY + y
    Case 6
      Entity(Index).Left = Entity(Index).Left + x - OldX
      Entity(Index).Width = Entity(Index).Width + OldX - x
      Entity(Index).Height = Entity(Index).Height - OldY + y
    Case 7
      Entity(Index).Left = Entity(Index).Left + x - OldX
      Entity(Index).Width = Entity(Index).Width + OldX - x
    End Select
End Sub


Private Sub Entity_Resizing(Index As Integer, ByVal Coner As Long, ByVal OldX As Long, OldY As Long, ByVal x As Long, ByVal y As Long)
    Static InERM As Boolean
    If InERM Then Exit Sub
    InERM = True
    On Error Resume Next
    Me.AutoRedraw = False
    Entity(Index).DrawMode = True
    Entity(Index).ZOrder 0
    Select Case Coner
    Case 0
      Entity(Index).Left = Entity(Index).Left + x - OldX
      Entity(Index).Top = Entity(Index).Top + y - OldY
      Entity(Index).Width = Entity(Index).Width + OldX - x
      Entity(Index).Height = Entity(Index).Height + OldY - y
    Case 1
      Entity(Index).Top = Entity(Index).Top + y - OldY
      Entity(Index).Height = Entity(Index).Height + OldY - y
    Case 2
      Entity(Index).Top = Entity(Index).Top - OldY + y
      Entity(Index).Width = Entity(Index).Width - OldX + x
      Entity(Index).Height = Entity(Index).Height - y + OldY
    Case 3
      Entity(Index).Width = Entity(Index).Width - OldX + x
    Case 4
      Entity(Index).Width = Entity(Index).Width - OldX + x
      Entity(Index).Height = Entity(Index).Height - OldY + y
    Case 5
      Entity(Index).Height = Entity(Index).Height - OldY + y
    Case 6
      Entity(Index).Left = Entity(Index).Left + x - OldX
      Entity(Index).Width = Entity(Index).Width + OldX - x
      Entity(Index).Height = Entity(Index).Height - OldY + y
    Case 7
      Entity(Index).Left = Entity(Index).Left + x - OldX
      Entity(Index).Width = Entity(Index).Width + OldX - x
    End Select
    Me.AutoRedraw = True
    InERM = False
End Sub

Private Sub Entity_GotFocus(Index As Integer)
  Entity(Index).BSelect
End Sub

Private Sub Entity_LostFocus(Index As Integer)
  Entity(Index).BDeSelect
End Sub



Private Sub Form_Load()
Dim ctl As Object, i As Long
On Error Resume Next
pic.Cls

If sw.PanelControls.Count = 0 Then Exit Sub
Erase arr
ReDim arr(1 To sw.PanelControls.Count)

Dim x, y
pic.AutoRedraw = True
For x = 10 * Screen.TwipsPerPixelX To pic.Width Step 10 * Screen.TwipsPerPixelX
  For y = 10 * Screen.TwipsPerPixelX To pic.Height Step 10 * Screen.TwipsPerPixelY
    pic.PSet (x, y), vbBlack
  Next
Next
pic.AutoRedraw = False

ReadToArray arr, sw

i = 0
For Each ctl In sw.PanelControls
  i = i + 1
  With arr(i)
    Load Entity(i)
    Entity(i).TabIndex = .ti
    Entity(i).ToolTipText = .Caption
    Entity(i).Caption = .Name & "; " & .Caption & "; TI=" & .ti
    Entity(i).Top = .T
    Entity(i).Width = .W
    Entity(i).Left = .L
    Entity(i).Height = .H
    Entity(i).Visible = True
    
   If Not .Visible Then
     Entity(i).Color = vbYellow
    ElseIf Not .Enabled Then
       Entity(i).Color = vbGreen
    ElseIf .ts Then
        Entity(i).Color = RGB(192, 192, 192)
    Else
        Entity(i).Color = RGB(0, 192, 192)
    End If
  End With
Next

End Sub

Private Sub Form_Resize()
  On Error Resume Next
  FrameTool.Top = 0
  FrameTool.Left = 0
  FrameTool.Width = Me.ScaleWidth


  cmdUpdate.Top = Me.ScaleHeight - cmdUpdate.Height - 5 * Screen.TwipsPerPixelY
  cmdCancel.Top = Me.ScaleHeight - cmdUpdate.Height - 5 * Screen.TwipsPerPixelY
  cmdCancel.Left = Me.ScaleWidth - 30 - cmdCancel.Width
  cmdUpdate.Left = cmdCancel.Left - 50 - cmdUpdate.Width
  
  
  pic.Left = 0
  pic.Top = FrameTool.Height
  pic.Width = Me.ScaleWidth
  pic.Height = cmdUpdate.Top - 5 * Screen.TwipsPerPixelY
  Dim x, y
  
  pic.AutoRedraw = True
  pic.Cls
  For x = 10 * Screen.TwipsPerPixelX To pic.Width Step 10 * Screen.TwipsPerPixelX
    For y = 10 * Screen.TwipsPerPixelX To pic.Height Step 10 * Screen.TwipsPerPixelY
      pic.PSet (x, y), vbBlack
    Next
  Next
  pic.AutoRedraw = False

  
End Sub

Private Sub mnuAlignGrid_Click()
  Dim i As Long, p
  For i = 1 To sw.PanelControls.Count
  
    If Entity(i).DrawMode Then
      p = Entity(i).Width \ Screen.TwipsPerPixelX
      p = p - 10
      If (p \ 10) * 10 <> p Then
        Entity(i).Width = (p \ 10) * 10 * Screen.TwipsPerPixelX + 10 * Screen.TwipsPerPixelX
      End If
    End If
  Next
End Sub

Private Sub mnuAlignHeight_Click()
  Dim i As Long, p
  For i = 1 To sw.PanelControls.Count
  
    If Entity(i).DrawMode Then
    
      p = Entity(i).Height \ Screen.TwipsPerPixelY
      p = p - 10
      If (p \ 10) * 10 <> p Then
        Entity(i).Height = (p \ 10) * 10 * Screen.TwipsPerPixelY + 10 * Screen.TwipsPerPixelY
      End If
      
    End If
  Next
End Sub

Private Sub mnuLoadFromFile_Click()
cdlg.CancelError = True
On Error GoTo bye
cdlg.Flags = cdlOFNFileMustExist + cdlOFNPathMustExist + cdlOFNHideReadOnly
cdlg.DialogTitle = "Load layout from file"
cdlg.ShowOpen
Dim ff, s As String, i
ff = FreeFile
Open cdlg.FileName For Input As #ff
s = Input(LOF(ff), ff)
Close #ff
StringToArr s, arr
Dim ctl As Control
For Each ctl In Entity
  If ctl.Index > 0 Then Unload ctl
Next
i = 0
For Each ctl In sw.PanelControls
  i = i + 1
  With arr(i)
    Load Entity(i)
    Entity(i).TabIndex = .ti
    Entity(i).ToolTipText = .Caption
    Entity(i).Caption = .Name & "; " & .Caption & "; TI=" & .ti
    Entity(i).Top = .T
    Entity(i).Width = .W
    Entity(i).Left = .L
    Entity(i).Height = .H
    Entity(i).Visible = True
    
   If Not .Visible Then
     Entity(i).Color = vbYellow
    ElseIf Not .Enabled Then
       Entity(i).Color = vbGreen
    ElseIf .ts Then
        Entity(i).Color = RGB(192, 192, 192)
    Else
        Entity(i).Color = RGB(0, 192, 192)
    End If
  End With
Next

bye:

End Sub

Private Sub mnuSameBottom_Click()
Dim i As Long, Top As Double
Top = -1000
  For i = 1 To sw.PanelControls.Count
    If Entity(i).DrawMode Then
      If Top < 0 Then Top = Entity(i).Top + Entity(i).Height
      If Top < Entity(i).Top + Entity(i).Height Then Top = Entity(i).Top + Entity(i).Height
    End If
  Next
  For i = 1 To sw.PanelControls.Count
    If Entity(i).DrawMode Then
      Entity(i).Top = Top - Entity(i).Height
    End If
  Next
End Sub

Private Sub mnuSameCenterH_Click()
Dim i As Long, Top As Double
Top = -1000
  For i = 1 To sw.PanelControls.Count
    If Entity(i).DrawMode Then
      If Top < 0 Then Top = Entity(i).Top + Entity(i).Height / 2
      If Top < Entity(i).Top + Entity(i).Height / 2 Then Top = Entity(i).Top + Entity(i).Height / 2
    End If
  Next
  For i = 1 To sw.PanelControls.Count
    If Entity(i).DrawMode Then
      Entity(i).Top = Top - Entity(i).Height / 2
    End If
  Next
End Sub

Private Sub mnuSameCenterV_Click()
Dim i As Long, Left As Double
Left = -1000
  For i = 1 To sw.PanelControls.Count
    If Entity(i).DrawMode Then
      If Left < 0 Then Left = Entity(i).Left + Entity(i).Width / 2
      If Left < Entity(i).Left + Entity(i).Width / 2 Then Left = Entity(i).Left + Entity(i).Width / 2
    End If
  Next
  For i = 1 To sw.PanelControls.Count
    If Entity(i).DrawMode Then
      Entity(i).Left = Left - Entity(i).Width / 2
    End If
  Next
End Sub

Private Sub mnuSameHeight_Click()
Dim i As Long, Height As Double
Height = -1000
  For i = 1 To sw.PanelControls.Count
    If Entity(i).DrawMode Then
      If Height < 0 Then Height = Entity(i).Height
      If Height < Entity(i).Height Then Height = Entity(i).Height
    End If
  Next
  For i = 1 To sw.PanelControls.Count
    If Entity(i).DrawMode Then
      Entity(i).Height = Height
    End If
  Next
End Sub

Private Sub mnuSameLeft_Click()
Dim i As Long, Left As Double
Left = -1000
  For i = 1 To sw.PanelControls.Count
    If Entity(i).DrawMode Then
      If Left < 0 Then Left = Entity(i).Left
      If Left > Entity(i).Left Then Left = Entity(i).Left
    End If
  Next
  For i = 1 To sw.PanelControls.Count
    If Entity(i).DrawMode Then
      Entity(i).Left = Left
    End If
  Next
End Sub

Private Sub mnuSameRights_Click()
Dim i As Long, Left As Double
Left = -1000
  For i = 1 To sw.PanelControls.Count
    If Entity(i).DrawMode Then
      If Left < 0 Then Left = Entity(i).Left + Entity(i).Width
      If Left < Entity(i).Left + Entity(i).Width Then Left = Entity(i).Left + Entity(i).Width
    End If
  Next
  For i = 1 To sw.PanelControls.Count
    If Entity(i).DrawMode Then
      Entity(i).Left = Left - Entity(i).Width
    End If
  Next
End Sub

Private Sub mnuSameTop_Click()
Dim i As Long, Top As Double
Top = -1000
  For i = 1 To sw.PanelControls.Count
    If Entity(i).DrawMode Then
      If Top < 0 Then Top = Entity(i).Top
      If Top > Entity(i).Top Then Top = Entity(i).Top
    End If
  Next
  For i = 1 To sw.PanelControls.Count
    If Entity(i).DrawMode Then
      Entity(i).Top = Top
    End If
  Next
End Sub

Private Sub mnuSameWidth_Click()
Dim i As Long, Width As Double
Width = -1000
  For i = 1 To sw.PanelControls.Count
    If Entity(i).DrawMode Then
      If Width < 0 Then Width = Entity(i).Width
      If Width < Entity(i).Width Then Width = Entity(i).Width
    End If
  Next
  For i = 1 To sw.PanelControls.Count
    If Entity(i).DrawMode Then
      Entity(i).Width = Width
    End If
  Next
End Sub

Private Sub mnuSave_Click()
cdlg.CancelError = True
On Error GoTo bye

 Dim ctl As Object, i As Long
 On Error Resume Next
 i = 0
 If sw.PanelControls.Count = 0 Then Exit Sub
 For Each ctl In sw.PanelControls
    i = i + 1
    arr(i).L = Entity(i).Left
    arr(i).T = Entity(i).Top
    arr(i).W = Entity(i).Width
    arr(i).H = Entity(i).Height
  Next



cdlg.Flags = cdlOFNCreatePrompt + cdlOFNPathMustExist + cdlOFNHideReadOnly
cdlg.DialogTitle = "Save layout to file"
cdlg.ShowSave
Dim ff
ff = FreeFile
Open cdlg.FileName For Output As #ff
Print #ff, ArrToString(arr)
Close #ff

bye:
End Sub

Private Sub mnuSelectAll_Click()
  Dim i As Long
  For i = 1 To sw.PanelControls.Count
    Entity(i).DrawMode = True
  Next
End Sub

Private Sub mnuSnapPos_Click()
Dim i As Long, p
For i = 1 To sw.PanelControls.Count

  If Entity(i).DrawMode Then
    p = Entity(i).Left \ Screen.TwipsPerPixelX
    'p = p - 5
  
    If (p \ 10) * 10 <> p Then
      Entity(i).Left = (p \ 10) * 10 * Screen.TwipsPerPixelX + 5 * Screen.TwipsPerPixelX
    End If
    p = Entity(i).Top \ Screen.TwipsPerPixelY
    'p = p - 5
    If (p \ 10) * 10 <> p Then
      Entity(i).Top = (p \ 10) * 10 * Screen.TwipsPerPixelY + 5 * Screen.TwipsPerPixelY
    End If
    
  End If
Next
End Sub

Private Sub mnuTIDown_Click()
  Dim i As Long
  Dim pos As Long
  If Not arr(CurItem).HasTI Then Exit Sub
  pos = arr(CurItem).ti
  
  
  For i = 1 To UBound(arr)
    If arr(i).ti > 2 And arr(i).ti <= pos + 1 Then
      arr(i).ti = arr(i).ti - 1
      Entity(i).Caption = arr(i).Name & "; " & arr(i).Caption & "; TI=" & arr(i).ti
    End If
  Next
  arr(CurItem).ti = pos + 1
  i = CurItem
  Entity(i).Caption = arr(i).Name & "; " & arr(i).Caption & "; TI=" & arr(i).ti
End Sub

Private Sub mnuTIUp_Click()
  Dim i As Long
  Dim pos As Long
  If Not arr(CurItem).HasTI Then Exit Sub
  pos = arr(CurItem).ti
  If pos = 1 Then Exit Sub
  
  For i = 1 To UBound(arr)
    If arr(i).ti >= pos - 1 Then
      arr(i).ti = arr(i).ti + 1
      Entity(i).Caption = arr(i).Name & "; " & arr(i).Caption & "; TI=" & arr(i).ti
    End If
  Next
  arr(CurItem).ti = pos - 1
  i = CurItem
  Entity(i).Caption = arr(i).Name & "; " & arr(i).Caption & "; TI=" & arr(i).ti
End Sub

Private Sub mnuTI_Click()
  Dim i As Long, ti As TITune, ctl, minTI As Long, lastTI As Long, tiCol As Collection
  Set ti = New TITune
  Set tiCol = New Collection
  minTI = 65535
  lastTI = -1
  
  While (True)
   minTI = 65535
  For i = 1 To sw.PanelControls.Count
    If arr(i).HasTI Then
      If arr(i).ti < minTI And arr(i).ti > lastTI Then
        minTI = arr(i).ti
        
      End If
    End If
  Next
  
  If lastTI <> minTI Then
    lastTI = minTI
  Else
    GoTo done
  End If

  
  For i = 1 To sw.PanelControls.Count
    If arr(i).HasTI Then
      If arr(i).ti = minTI Then
        tiCol.Add (arr(i).Name & " (" & arr(i).Index & ")")
      End If
    End If
  Next
  Wend
done:
  
  For i = 1 To tiCol.Count
    With tiCol.Item(i)
        ti.lstSelected.AddItem tiCol.Item(i)
    End With
  Next
  ti.Show vbModal
  If ti.OK Then
   minTI = 65535
   For i = 1 To sw.PanelControls.Count
      If arr(i).HasTI Then
        If arr(i).ti < minTI Then
          minTI = arr(i).ti
        End If
      End If
    Next
    Dim j As Long
    For i = 1 To sw.PanelControls.Count
      If arr(i).HasTI Then
        For j = 0 To ti.lstSelected.ListCount - 1
          If arr(i).Name & " (" & arr(i).Index & ")" = ti.lstSelected.List(j) Then
            arr(i).ti = minTI + j
          End If
        Next
      End If
     Next
       
       
    i = 0
    For Each ctl In sw.PanelControls
      i = i + 1
      With arr(i)
        
        Entity(i).Caption = .Name & "; " & .Caption & "; TI=" & .ti
        If arr(i).HasTI Then
          Entity(i).TabIndex = .ti
        End If
      End With
    Next
       
  End If
  Set ti = Nothing
End Sub

Private Sub mnuUnselectAll_Click()
 Dim i As Long
  For i = 1 To sw.PanelControls.Count
    Entity(i).DrawMode = False
  Next
End Sub

