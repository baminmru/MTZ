VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Begin VB.UserControl RTFEditor 
   ClientHeight    =   4875
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6435
   ScaleHeight     =   4875
   ScaleWidth      =   6435
   ToolboxBitmap   =   "RTFditor.ctx":0000
   Begin MSComDlg.CommonDialog Dlg 
      Left            =   4680
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin RichTextLib.RichTextBox txtInfo 
      Height          =   4275
      Left            =   120
      TabIndex        =   0
      Top             =   480
      Width           =   4935
      _ExtentX        =   8705
      _ExtentY        =   7541
      _Version        =   393217
      HideSelection   =   0   'False
      ScrollBars      =   3
      TextRTF         =   $"RTFditor.ctx":0312
   End
   Begin MSComctlLib.ImageList imlToolbarIcons 
      Left            =   5400
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   18
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RTFditor.ctx":0396
            Key             =   "New"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RTFditor.ctx":04A8
            Key             =   "Open"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RTFditor.ctx":05BA
            Key             =   "Save"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RTFditor.ctx":06CC
            Key             =   "Print"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RTFditor.ctx":07DE
            Key             =   "Cut"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RTFditor.ctx":08F0
            Key             =   "Copy"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RTFditor.ctx":0A02
            Key             =   "Paste"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RTFditor.ctx":0B14
            Key             =   "Bold"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RTFditor.ctx":0C26
            Key             =   "Italic"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RTFditor.ctx":0D38
            Key             =   "Underline"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RTFditor.ctx":0E4A
            Key             =   "Align Left"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RTFditor.ctx":0F5C
            Key             =   "Center"
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RTFditor.ctx":106E
            Key             =   "Align Right"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RTFditor.ctx":1180
            Key             =   "FONT02"
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RTFditor.ctx":149A
            Key             =   "Properties"
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RTFditor.ctx":15AC
            Key             =   "Find"
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RTFditor.ctx":16BE
            Key             =   "Redo"
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "RTFditor.ctx":17D0
            Key             =   "Undo"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar tbToolBar 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   6435
      _ExtentX        =   11351
      _ExtentY        =   741
      ButtonWidth     =   609
      ButtonHeight    =   582
      ToolTips        =   0   'False
      Appearance      =   1
      ImageList       =   "imlToolbarIcons"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   15
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Cut"
            Object.ToolTipText     =   "Вырезать"
            ImageKey        =   "Cut"
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Copy"
            Object.ToolTipText     =   "Копировать"
            ImageKey        =   "Copy"
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Paste"
            Object.ToolTipText     =   "Вставить"
            ImageKey        =   "Paste"
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Undo"
            Object.ToolTipText     =   "Undo"
            ImageKey        =   "Undo"
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Bold"
            Object.ToolTipText     =   "Полужирный"
            ImageKey        =   "Bold"
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Italic"
            Object.ToolTipText     =   "Курсив"
            ImageKey        =   "Italic"
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Underline"
            Object.ToolTipText     =   "Подчёркнутый"
            ImageKey        =   "Underline"
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Align Left"
            Object.ToolTipText     =   "По левому краю"
            ImageKey        =   "Align Left"
            Style           =   2
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Center"
            Object.ToolTipText     =   "По центру"
            ImageKey        =   "Center"
            Style           =   2
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Align Right"
            Object.ToolTipText     =   "По правому краю"
            ImageKey        =   "Align Right"
            Style           =   2
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Properties"
            Object.ToolTipText     =   "Изменение параметров шрифта"
            ImageKey        =   "Properties"
         EndProperty
      EndProperty
   End
   Begin VB.Menu mnupopup 
      Caption         =   "popup"
      Begin VB.Menu mnuEditUndo 
         Caption         =   "&Отменить ввод"
      End
      Begin VB.Menu mnuEditBar0 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSelect 
         Caption         =   "В&ыделить всё"
         Shortcut        =   ^A
      End
      Begin VB.Menu mnuEditCut 
         Caption         =   "&Вырезать"
         Shortcut        =   ^X
      End
      Begin VB.Menu mnuEditCopy 
         Caption         =   "&Копировать"
         Shortcut        =   ^C
      End
      Begin VB.Menu mnuEditPaste 
         Caption         =   "Вст&авить"
         Shortcut        =   ^V
      End
      Begin VB.Menu mnuEditPasteSpecial 
         Caption         =   "Paste &Special..."
         Visible         =   0   'False
      End
      Begin VB.Menu m3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuClearSelect 
         Caption         =   "О&чистить "
         Shortcut        =   {DEL}
      End
      Begin VB.Menu m1 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu mnuViewToolbar 
         Caption         =   "&Панель инструментов"
         Checked         =   -1  'True
      End
   End
End
Attribute VB_Name = "RTFEditor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 375
Option Explicit
'редактор для RTF поля


Public RowId As String
Attribute RowId.VB_VarHelpID = 415
Public NewRow As Boolean
Attribute NewRow.VB_VarHelpID = 400
Public MainForm As Object
Attribute MainForm.VB_VarHelpID = 395
Public ReadOnly As Boolean
Attribute ReadOnly.VB_VarHelpID = 410
Public bInFind As Boolean
Attribute bInFind.VB_VarHelpID = 380

Dim bChanged As Boolean
Dim InRefresh As Boolean
Dim Buffer As String
Dim bBold As Boolean
Dim bItalic As Boolean
Dim bUnderline As Boolean
Dim bToolbar As Boolean
Dim bStatus As Boolean
Public Event OnChange()
Attribute OnChange.VB_HelpID = 405

Dim bSavedOk As Boolean

Public Property Get RTF() As String
Attribute RTF.VB_HelpID = 420
  RTF = txtInfo.TextRTF
End Property

Public Property Let RTF(v As String)
  On Error Resume Next
  txtInfo.TextRTF = ""
  txtInfo.SelBold = False
  txtInfo.SelBullet = False
  txtInfo.SelAlignment = rtfLeft
  txtInfo.SelColor = vbBlack
  txtInfo.SelItalic = False
  txtInfo.SelUnderline = False
  txtInfo.TextRTF = v
End Property

Public Property Get Text() As String
Attribute Text.VB_HelpID = 425
  Text = txtInfo.Text
End Property

Public Property Let Text(v As String)
  txtInfo.Text = v
End Property

Public Property Get Changed() As Boolean
Attribute Changed.VB_HelpID = 385
  Changed = bChanged
End Property

Private Sub txtInfo_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
If Button = 2 And Shift = 0 Then
  PopupMenu mnupopup
End If
End Sub

Private Sub UserControl_Initialize()
  bToolbar = True
End Sub

Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
If Button = 2 And Shift = 0 Then
  PopupMenu mnupopup
End If
End Sub

Private Sub usercontrol_Resize()
  On Error Resume Next
  If (bToolbar) Then
    txtInfo.Top = tbToolBar.Top + tbToolBar.Height + Screen.TwipsPerPixelY
  Else
    txtInfo.Top = 0
  End If
  txtInfo.Left = 0
  If (bStatus) Then
    txtInfo.Height = UserControl.Height - txtInfo.Top
  Else
    txtInfo.Height = UserControl.Height - txtInfo.Top
  End If
  txtInfo.Width = UserControl.Width
End Sub

Private Sub ChangeFont()
  On Error Resume Next
  Dlg.FontName = txtInfo.SelFontName
  Dlg.Color = txtInfo.SelColor
  Dlg.FontBold = txtInfo.SelBold
  Dlg.FontItalic = txtInfo.SelItalic
  Dlg.FontUnderline = txtInfo.SelUnderline
  Dlg.FontSize = txtInfo.SelFontSize
  Dlg.FontStrikethru = txtInfo.SelStrikeThru
  Dlg.Flags = cdlCFBoth + cdlCFEffects
  On Error GoTo ExitSelect
  Dlg.ShowFont
  txtInfo.SelColor = Dlg.Color
  txtInfo.SelFontName = Dlg.FontName
  txtInfo.SelBold = Dlg.FontBold
  txtInfo.SelItalic = Dlg.FontItalic
  txtInfo.SelUnderline = Dlg.FontUnderline
  txtInfo.SelFontSize = Dlg.FontSize
  txtInfo.SelStrikeThru = Dlg.FontStrikethru
  Exit Sub
ExitSelect:
End Sub


Private Sub mnuClearSelect_Click()
  txtInfo.SelRTF = ""
End Sub

Private Sub mnuSelect_Click()
  txtInfo.SelStart = 0
  txtInfo.SelLength = Len(txtInfo)
End Sub

Private Sub tbToolBar_ButtonClick(ByVal Button As MSComctlLib.Button)
  On Error Resume Next
  Select Case Button.Key
    Case "Undo"
      mnuEditUndo_Click
    Case "Properties"
      ChangeFont
    Case "Cut"
      mnuEditCut_Click
    Case "Copy"
      mnuEditCopy_Click
    Case "Paste"
      mnuEditPaste_Click
    Case "Bold"
      If (txtInfo.SelBold) Then
        txtInfo.SelBold = False
      Else
        txtInfo.SelBold = True
      End If
    Case "Italic"
      If (txtInfo.SelItalic) Then
        txtInfo.SelItalic = False
      Else
        txtInfo.SelItalic = True
      End If
    Case "Underline"
      If (txtInfo.SelUnderline) Then
        txtInfo.SelUnderline = False
      Else
        txtInfo.SelUnderline = True
      End If
    Case "Align Left"
      txtInfo.SelAlignment = rtfLeft
    Case "Center"
      txtInfo.SelAlignment = rtfCenter
    Case "Align Right"
      txtInfo.SelAlignment = rtfRight
  End Select
End Sub

Private Sub mnuViewToolbar_Click()
  mnuViewToolbar.Checked = Not mnuViewToolbar.Checked
  tbToolBar.Visible = mnuViewToolbar.Checked
  bToolbar = tbToolBar.Visible
  usercontrol_Resize
End Sub


Private Sub mnuEditPaste_Click()
  Dim str As String
  Dim Length As Long
  Length = Len(txtInfo.Text) - txtInfo.SelLength
  str = Clipboard.GetText()
  If (Clipboard.GetFormat(vbCFText)) Then
    txtInfo.SelRTF = str
  ElseIf (Clipboard.GetFormat(vbCFRTF)) Then
    txtInfo.SelRTF = Clipboard.GetText(vbCFRTF)
  End If
  
End Sub

Private Sub mnuEditCopy_Click()
  Clipboard.Clear
  Call Clipboard.SetText(txtInfo.SelRTF, vbCFRTF)
End Sub

Private Sub mnuEditCut_Click()
  Call Clipboard.SetText(txtInfo.SelRTF, vbCFRTF)
  txtInfo.SelRTF = ""
End Sub

Private Sub mnuEditUndo_Click()
  SendKeys ("%{BS}")
End Sub



Private Sub txtInfo_Change()
  PrintStatus
  bChanged = True
  RaiseEvent OnChange
End Sub

Private Sub txtInfo_Click()
  PrintStatus
End Sub


Private Sub txtInfo_KeyDown(KeyCode As Integer, Shift As Integer)
  If (Shift = 1) Then
    If (KeyCode = 45) Then
      mnuEditPaste_Click
      KeyCode = 0
      Shift = 0
    End If
  End If
  If (Shift = 2) Then
    If (KeyCode = 86) Then
      mnuEditPaste_Click
      KeyCode = 0
      Shift = 0
    End If
  End If
End Sub


Private Sub txtInfo_SelChange()
  PrintStatus
End Sub


Private Sub PrintStatus()
 
  tbToolBar.Buttons.Item("Bold").MixedState = False
  tbToolBar.Buttons.Item("Italic").MixedState = False
  tbToolBar.Buttons.Item("Underline").MixedState = False
  
  If IsNull(txtInfo.SelBold) Then
    tbToolBar.Buttons.Item("Bold").value = tbrUnpressed
    tbToolBar.Buttons.Item("Bold").MixedState = True
  ElseIf (txtInfo.SelBold) Then
    tbToolBar.Buttons.Item("Bold").value = tbrPressed
  Else
    tbToolBar.Buttons.Item("Bold").value = tbrUnpressed
  End If
  If IsNull(txtInfo.SelItalic) Then
    tbToolBar.Buttons.Item("Italic").MixedState = True
  ElseIf (txtInfo.SelItalic) Then
    tbToolBar.Buttons.Item("Italic").value = tbrPressed
  Else
    tbToolBar.Buttons.Item("Italic").value = tbrUnpressed
  End If
  If IsNull(txtInfo.SelUnderline) Then
    tbToolBar.Buttons.Item("Underline").MixedState = True
  ElseIf (txtInfo.SelUnderline) Then
    tbToolBar.Buttons.Item("Underline").value = tbrPressed
  Else
    tbToolBar.Buttons.Item("Underline").value = tbrUnpressed
  End If
  tbToolBar.Buttons.Item("Align Left").value = tbrUnpressed
  tbToolBar.Buttons.Item("Align Right").value = tbrUnpressed
  tbToolBar.Buttons.Item("Center").value = tbrUnpressed
  Select Case txtInfo.SelAlignment
  Case rtfLeft
    tbToolBar.Buttons.Item("Align Left").value = tbrPressed
  Case rtfRight
    tbToolBar.Buttons.Item("Align Right").value = tbrPressed
  Case rtfCenter
    tbToolBar.Buttons.Item("Center").value = tbrPressed
  End Select
  
End Sub







'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=UserControl,UserControl,-1,Enabled
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Returns/sets a value that determines whether an object can respond to user-generated events."
Attribute Enabled.VB_HelpID = 390
  Enabled = UserControl.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
  UserControl.Enabled() = New_Enabled
  PropertyChanged "Enabled"
End Property

'Load property values from storage
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)

  UserControl.Enabled = PropBag.ReadProperty("Enabled", True)
End Sub

'Write property values to storage
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)

  Call PropBag.WriteProperty("Enabled", UserControl.Enabled, True)
End Sub

