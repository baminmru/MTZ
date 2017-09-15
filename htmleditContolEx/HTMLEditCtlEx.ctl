VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "shdocvw.dll"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.UserControl HTMLEditCtlEx 
   ClientHeight    =   11025
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   11625
   ScaleHeight     =   11025
   ScaleWidth      =   11625
   Begin VB.Timer Timer1 
      Interval        =   300
      Left            =   8790
      Top             =   960
   End
   Begin VB.Frame FrameText 
      BorderStyle     =   0  'None
      Height          =   3495
      Left            =   -420
      TabIndex        =   3
      Top             =   780
      Width           =   1995
      Begin VB.TextBox txtHTML 
         Height          =   2775
         Left            =   210
         MultiLine       =   -1  'True
         TabIndex        =   4
         Top             =   300
         Width           =   1425
      End
   End
   Begin VB.Frame FrameBrowser 
      BorderStyle     =   0  'None
      Height          =   5085
      Left            =   1710
      TabIndex        =   1
      Top             =   1020
      Visible         =   0   'False
      Width           =   9555
      Begin VB.Frame FrameTool 
         Height          =   975
         Left            =   0
         TabIndex        =   5
         Top             =   0
         Width           =   9375
         Begin VB.ComboBox cmbSize 
            Height          =   315
            ItemData        =   "HTMLEditCtlEx.ctx":0000
            Left            =   3300
            List            =   "HTMLEditCtlEx.ctx":0019
            Style           =   2  'Dropdown List
            TabIndex        =   27
            Top             =   570
            Width           =   2055
         End
         Begin VB.ComboBox cmbFont 
            Height          =   315
            ItemData        =   "HTMLEditCtlEx.ctx":0032
            Left            =   660
            List            =   "HTMLEditCtlEx.ctx":0042
            Style           =   2  'Dropdown List
            TabIndex        =   26
            Top             =   540
            Width           =   2055
         End
         Begin VB.CommandButton Command1 
            Height          =   315
            Left            =   4590
            Picture         =   "HTMLEditCtlEx.ctx":0070
            Style           =   1  'Graphical
            TabIndex        =   24
            ToolTipText     =   "Цвет фона"
            Top             =   180
            Width           =   315
         End
         Begin VB.CommandButton cmdBold 
            Height          =   315
            Left            =   1170
            Picture         =   "HTMLEditCtlEx.ctx":0401
            Style           =   1  'Graphical
            TabIndex        =   21
            ToolTipText     =   "Жирный шрифт"
            Top             =   180
            Width           =   315
         End
         Begin VB.CommandButton cmdI 
            Height          =   315
            Left            =   1490
            Picture         =   "HTMLEditCtlEx.ctx":0503
            Style           =   1  'Graphical
            TabIndex        =   20
            ToolTipText     =   "Наклонный шрифт"
            Top             =   180
            Width           =   315
         End
         Begin VB.CommandButton cmdUnderline 
            Height          =   315
            Left            =   1810
            Picture         =   "HTMLEditCtlEx.ctx":0605
            Style           =   1  'Graphical
            TabIndex        =   19
            ToolTipText     =   "Подчёркнутый шрифт"
            Top             =   180
            Width           =   315
         End
         Begin VB.CommandButton cmdLeft 
            Height          =   315
            Left            =   3150
            Picture         =   "HTMLEditCtlEx.ctx":0707
            Style           =   1  'Graphical
            TabIndex        =   18
            ToolTipText     =   "Равнять слева"
            Top             =   180
            Width           =   315
         End
         Begin VB.CommandButton cmdCenter 
            Height          =   315
            Left            =   3480
            Picture         =   "HTMLEditCtlEx.ctx":0809
            Style           =   1  'Graphical
            TabIndex        =   17
            ToolTipText     =   "Равнять по центру"
            Top             =   180
            Width           =   315
         End
         Begin VB.CommandButton cmdRight 
            Height          =   315
            Left            =   3810
            Picture         =   "HTMLEditCtlEx.ctx":090B
            Style           =   1  'Graphical
            TabIndex        =   16
            ToolTipText     =   "Равнять справа"
            Top             =   180
            Width           =   315
         End
         Begin VB.CommandButton cmdHR 
            Height          =   315
            Left            =   5040
            Picture         =   "HTMLEditCtlEx.ctx":0A0D
            Style           =   1  'Graphical
            TabIndex        =   15
            ToolTipText     =   "Отчерк"
            Top             =   180
            Width           =   315
         End
         Begin VB.ComboBox cmbElType 
            Height          =   315
            ItemData        =   "HTMLEditCtlEx.ctx":0E4F
            Left            =   6990
            List            =   "HTMLEditCtlEx.ctx":0E59
            Style           =   2  'Dropdown List
            TabIndex        =   14
            Top             =   570
            Width           =   2145
         End
         Begin VB.ComboBox cmbLinks 
            Height          =   315
            ItemData        =   "HTMLEditCtlEx.ctx":0E6F
            Left            =   6990
            List            =   "HTMLEditCtlEx.ctx":0E79
            Style           =   2  'Dropdown List
            TabIndex        =   13
            Top             =   210
            Width           =   2145
         End
         Begin VB.CommandButton Command2 
            Height          =   315
            Left            =   90
            Picture         =   "HTMLEditCtlEx.ctx":0E9E
            Style           =   1  'Graphical
            TabIndex        =   12
            ToolTipText     =   "Вырезать"
            Top             =   180
            Width           =   315
         End
         Begin VB.CommandButton Command3 
            Height          =   315
            Left            =   420
            Picture         =   "HTMLEditCtlEx.ctx":122D
            Style           =   1  'Graphical
            TabIndex        =   11
            ToolTipText     =   "Скопировать"
            Top             =   180
            Width           =   315
         End
         Begin VB.CommandButton Command4 
            Height          =   315
            Left            =   750
            Picture         =   "HTMLEditCtlEx.ctx":15CA
            Style           =   1  'Graphical
            TabIndex        =   10
            ToolTipText     =   "Вставить"
            Top             =   180
            Width           =   315
         End
         Begin VB.CommandButton Command5 
            Height          =   315
            Left            =   2130
            Picture         =   "HTMLEditCtlEx.ctx":1682
            Style           =   1  'Graphical
            TabIndex        =   9
            ToolTipText     =   "Перечёркнутый шрифт"
            Top             =   180
            Width           =   315
         End
         Begin VB.CommandButton Command6 
            Height          =   315
            Left            =   2430
            Picture         =   "HTMLEditCtlEx.ctx":19F2
            Style           =   1  'Graphical
            TabIndex        =   8
            ToolTipText     =   "Выше"
            Top             =   180
            Width           =   315
         End
         Begin VB.CommandButton Command7 
            Height          =   315
            Left            =   2760
            Picture         =   "HTMLEditCtlEx.ctx":1A51
            Style           =   1  'Graphical
            TabIndex        =   7
            ToolTipText     =   "Ниже"
            Top             =   180
            Width           =   315
         End
         Begin VB.CommandButton Command8 
            Height          =   315
            Left            =   4260
            Picture         =   "HTMLEditCtlEx.ctx":1AB0
            Style           =   1  'Graphical
            TabIndex        =   6
            ToolTipText     =   "Цвет фонта"
            Top             =   180
            Width           =   315
         End
         Begin VB.Label Label4 
            Caption         =   "Фонт:"
            Height          =   255
            Left            =   2790
            TabIndex        =   28
            Top             =   630
            Width           =   735
         End
         Begin VB.Label Label3 
            Caption         =   "Фонт:"
            Height          =   255
            Left            =   150
            TabIndex        =   25
            Top             =   600
            Width           =   735
         End
         Begin VB.Label Label2 
            AutoSize        =   -1  'True
            Caption         =   "Ссылки:"
            Height          =   195
            Left            =   6270
            TabIndex        =   23
            Top             =   270
            Width           =   630
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            Caption         =   "Элементы:"
            Height          =   195
            Left            =   6150
            TabIndex        =   22
            Top             =   630
            Width           =   825
         End
      End
      Begin SHDocVwCtl.WebBrowser wb 
         CausesValidation=   0   'False
         Height          =   2415
         Left            =   2220
         TabIndex        =   2
         Top             =   1380
         Width           =   4785
         ExtentX         =   8440
         ExtentY         =   4260
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
   Begin MSComctlLib.TabStrip TabStrip1 
      Height          =   5025
      Left            =   930
      TabIndex        =   0
      Top             =   5040
      Width           =   7785
      _ExtentX        =   13732
      _ExtentY        =   8864
      MultiRow        =   -1  'True
      Placement       =   1
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   2
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "html страница"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "html текст"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin MSComDlg.CommonDialog CDialog 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
End
Attribute VB_Name = "HTMLEditCtlEx"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Public DloadsCollection As Dloads
Public LinksCollection As PageLinks
Dim WithEvents doc As MSHTML.HTMLDocument '  MSHTMLCtl.HTMLDocument
Attribute doc.VB_VarHelpID = -1
Private text_ As String

Public Sub SetText(ByVal HTMLText As String)
  On Error Resume Next

  doc.body.innerHTML = HTMLText
  txtHTML.Text = HTMLText
End Sub

Public Function GetText() As String
  If (TabStrip1.SelectedItem.Index = 1) Then
    GetText = wb.Document.body.innerHTML
  ElseIf (TabStrip1.SelectedItem.Index = 2) Then
    GetText = text_
  End If
End Function


Public Sub Init()
  On Error Resume Next
End Sub


Private Sub cmbElType_Click()
 If (cmbElType.ListIndex = 0) Then
    Call InsertTable
  ElseIf (cmbElType.ListIndex = 1) Then
    Call InsertImage
  End If
  wb.SetFocus
End Sub

Private Sub cmbFont_Click()
  doc.execCommand "FontName", False, cmbFont.Text
End Sub

Private Sub cmbLinks_Click()
  If (cmbLinks.ListIndex = 0) Then
    Call InsertDload
  ElseIf (cmbLinks.ListIndex = 1) Then
    Call InsertLink
  End If
  wb.SetFocus
End Sub

Private Sub cmbSize_Change()
  doc.execCommand "FontSize", False, cmbSize.Text
End Sub

Private Sub cmdBold_Click()
  doc.execCommand "Bold"
  wb.SetFocus
End Sub

Private Sub cmdCenter_Click()
  doc.execCommand "JustifyCenter"
  wb.SetFocus
End Sub

Private Sub cmdHR_Click()
  doc.execCommand "InsertHorizontalRule"
  wb.SetFocus
End Sub

Private Sub cmdI_Click()
  doc.execCommand "Italic"
  wb.SetFocus
End Sub

Private Sub cmdLeft_Click()
  doc.execCommand "JustifyLeft"
  wb.SetFocus
End Sub

Private Sub cmdRight_Click()
  doc.execCommand "JustifyRight"
  wb.SetFocus
End Sub

Private Sub cmdUnderline_Click()
  doc.execCommand "Underline"
  wb.SetFocus
End Sub

Private Sub Command1_Click()
  CDialog.CancelError = True
  On Error Resume Next
  CDialog.ShowColor
  If (Err.Number = 0) Then
    doc.execCommand "BackColor", False, CDialog.Color
  End If
  wb.SetFocus
End Sub

Private Sub Command2_Click()
  doc.execCommand "Cut"
  wb.SetFocus
End Sub

Private Sub Command3_Click()
  doc.execCommand "Copy"
  wb.SetFocus
End Sub

Private Sub Command4_Click()
  doc.execCommand "Paste"
  wb.SetFocus
End Sub

Private Sub Command5_Click()
  doc.execCommand "StrikeThrough"
  wb.SetFocus
End Sub

Private Sub Command6_Click()
  doc.execCommand "SuperScript"
  wb.SetFocus
End Sub

Private Sub Command7_Click()
  doc.execCommand "SubScript"
  wb.SetFocus
End Sub

Private Sub Command8_Click()
  CDialog.CancelError = True
  On Error Resume Next
  CDialog.ShowColor
  If (Err.Number = 0) Then
    doc.execCommand "ForeColor", False, CDialog.Color
  End If
  wb.SetFocus
End Sub


Private Sub Timer1_Timer()
  wb.Navigate "about:blank"
  While wb.ReadyState <> READYSTATE_COMPLETE
     DoEvents
  Wend
  Set doc = wb.Document
  Call doc.execCommand("2D-Position")
  Call doc.execCommand("LiveResize")
  Call doc.execCommand("MultipleSelection")
  doc.designMode = "On"
  While (doc Is Nothing Or doc.body Is Nothing)
    DoEvents
  Wend
  doc.body.innerHTML = text_
  While wb.ReadyState <> READYSTATE_COMPLETE
     DoEvents
  Wend
  Timer1.Enabled = False
End Sub

Private Sub txtHTML_Change()
  text_ = txtHTML.Text
End Sub

Private Sub UserControl_Initialize()
  On Error Resume Next
  Timer1.Enabled = True
End Sub

Private Sub TabStrip1_Click()
  If TabStrip1.SelectedItem.Index = 1 Then
    wb.Document.body.innerHTML = text_
  ElseIf TabStrip1.SelectedItem.Index = 2 Then
    text_ = wb.Document.body.innerHTML
    txtHTML.Text = text_
  End If

  Call UserControl_Resize
End Sub

Private Sub UserControl_Resize()
  On Error Resume Next
  TabStrip1.Top = 0
  TabStrip1.Left = 0
  TabStrip1.Width = UserControl.ScaleWidth
  TabStrip1.Height = UserControl.ScaleHeight
  
  If (TabStrip1.SelectedItem.Index = 1) Then
    FrameText.Visible = False
    FrameBrowser.Visible = True
    FrameBrowser.Left = TabStrip1.ClientLeft
    FrameBrowser.Top = TabStrip1.ClientTop
    FrameBrowser.Width = TabStrip1.ClientWidth
    FrameBrowser.Height = TabStrip1.ClientHeight
    FrameTool.Left = 0
    FrameTool.Top = 0
    FrameTool.Width = FrameBrowser.Width
    wb.Left = 0
    wb.Top = FrameTool.Height
    wb.Height = FrameBrowser.Height - wb.Top
    wb.Width = FrameBrowser.Width
  End If
  If (TabStrip1.SelectedItem.Index = 2) Then
    FrameBrowser.Visible = False
    FrameText.Visible = True
    FrameText.Left = TabStrip1.ClientLeft
    FrameText.Top = TabStrip1.ClientTop
    FrameText.Width = TabStrip1.ClientWidth
    FrameText.Height = TabStrip1.ClientHeight
    FrameText.Visible = True
    txtHTML.Left = 0
    txtHTML.Top = 0
    txtHTML.Height = FrameText.Height
    txtHTML.Width = FrameText.Width
  End If
End Sub

Private Sub InsertImage()
        CDialog.CancelError = True
        On Error Resume Next
        CDialog.Filter = "Image Files|*.gif;*.jpg;*.png"
        CDialog.Flags = cdlOFNFileMustExist
        CDialog.ShowOpen
        If Err.Number = 0 Then
          doc.execCommand "InsertImage", , CDialog.FileName
        End If
End Sub

Private Sub InsertTable()
    ' Вставляем таблицу
    On Error GoTo Eexit
    Dim frmT As frmTableParameters
    Set frmT = New frmTableParameters
    Dim res As Long
    frmT.Show (vbModal)
    If frmT.Result = vbOK Then
      Dim range As IHTMLTxtRange
      Set range = doc.selection.createRange()
      
      Dim strO As String
      
      strO = "<table CellSpacing=0 CellPadding=0 border="
      If Not (frmT.NoBorder) Then
        strO = strO & "1>"
      Else
        strO = strO & "0>"
      End If
      
      Dim i As Long
      Dim j As Long
      For i = 1 To frmT.Row
        strO = strO & "<tr>"
        For j = 1 To frmT.Col
          strO = strO & "<td"
          If Not (frmT.NoBorder) Then
            strO = strO & " style=""BORDER-RIGHT: black 1px solid; BORDER-TOP: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-BOTTOM: black 1px solid"""
          End If
          ' strO = strO & ">" & str(i) & " " & str(j) & "</td>"
          strO = strO & ">&nbsp;</td>"
        Next
        strO = strO & "</tr>"
      Next
      Call range.pasteHTML(strO)
    End If
Eexit:
    Unload frmT
    Set frmT = Nothing
End Sub

Private Sub InsertDload()
  Dim frm As frmDloadSelect
  Set frm = New frmDloadSelect
  Set frm.DloadCollection = DloadsCollection
  frm.Show vbModal
  If (frm.Result = vbOK) Then
      Dim range As IHTMLTxtRange
      Set range = doc.selection.createRange()
      Dim HTMLSave As String
      HTMLSave = frm.Href
      HTMLSave = Replace(HTMLSave, "about:blank", "")
      Call range.pasteHTML(HTMLSave) ' "<a href=""download.doc"">Скачать документ</a>")
  End If
  Unload frm
  Set frm = Nothing
End Sub

Private Sub InsertLink()
  Dim frm As frmLinkSelect
  Set frm = New frmLinkSelect
  Set frm.LinksCollection = LinksCollection
  frm.Show vbModal
  If (frm.Result = vbOK) Then
      Dim range As IHTMLTxtRange
      Set range = doc.selection.createRange()
      Dim HTMLSave As String
      HTMLSave = frm.Href
      HTMLSave = Replace(HTMLSave, "about:blank", "")
      Call range.pasteHTML(HTMLSave) ' "<a href=""download.doc"">Скачать документ</a>")
  End If
  Unload frm
  Set frm = Nothing
End Sub

