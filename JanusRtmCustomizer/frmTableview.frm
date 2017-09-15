VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frmTableview 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Настройки табличного режима"
   ClientHeight    =   2700
   ClientLeft      =   2115
   ClientTop       =   2595
   ClientWidth     =   6795
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   204
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmTableview.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2700
   ScaleWidth      =   6795
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin MSComDlg.CommonDialog cdlFont 
      Left            =   6240
      Top             =   1440
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      Height          =   315
      Left            =   5565
      TabIndex        =   11
      Top             =   450
      Width           =   1175
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   5565
      TabIndex        =   10
      Top             =   90
      Width           =   1175
   End
   Begin VB.Frame fraSet 
      Caption         =   "Разделительные линии"
      Height          =   885
      Index           =   2
      Left            =   0
      TabIndex        =   2
      Top             =   1800
      Width           =   5520
      Begin VB.ComboBox cboGridlines 
         Height          =   315
         ItemData        =   "frmTableview.frx":000C
         Left            =   1470
         List            =   "frmTableview.frx":001D
         Style           =   2  'Dropdown List
         TabIndex        =   9
         Top             =   210
         Width           =   1830
      End
      Begin VB.CheckBox chkgrouphead 
         Caption         =   "Названия групп - серым цветом"
         Height          =   450
         Left            =   3480
         TabIndex        =   8
         Top             =   150
         Value           =   1  'Checked
         Width           =   1845
      End
      Begin VB.Label lblGridlines 
         Caption         =   "Стиль линий:"
         Height          =   285
         Index           =   0
         Left            =   180
         TabIndex        =   7
         Top             =   315
         Width           =   2325
      End
   End
   Begin VB.Frame fraSet 
      Caption         =   "Строки"
      Height          =   885
      Index           =   1
      Left            =   0
      TabIndex        =   1
      Top             =   915
      Width           =   5520
      Begin VB.CommandButton cmdfont 
         Caption         =   "Шрифт"
         Height          =   345
         Index           =   1
         Left            =   225
         TabIndex        =   4
         Top             =   330
         Width           =   1080
      End
      Begin VB.Label lblcurrfont 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Current font"
         Height          =   285
         Index           =   1
         Left            =   1470
         TabIndex        =   6
         Top             =   345
         Width           =   1845
      End
   End
   Begin VB.Frame fraSet 
      Caption         =   "Заголовки колонок"
      Height          =   885
      Index           =   0
      Left            =   0
      TabIndex        =   0
      Top             =   30
      Width           =   5520
      Begin VB.CheckBox chkAutoColSize 
         Caption         =   "Автоматический подбор размера"
         Height          =   570
         Left            =   3555
         TabIndex        =   12
         Top             =   255
         Value           =   1  'Checked
         Width           =   1710
      End
      Begin VB.CommandButton cmdfont 
         Caption         =   "Шрифт"
         Height          =   345
         Index           =   0
         Left            =   210
         TabIndex        =   3
         Top             =   345
         Width           =   1080
      End
      Begin VB.Label lblcurrfont 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Current font"
         Height          =   285
         Index           =   0
         Left            =   1455
         TabIndex        =   5
         Top             =   360
         Width           =   1845
      End
   End
End
Attribute VB_Name = "frmTableview"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 115
Option Explicit

Dim m_OK As Boolean
Dim f(0 To 1) As Font
Dim m_Changed As Boolean
Dim m_Colors(0 To 1) As Long

'Parameters:
'[IN][OUT]  gr , тип параметра: Object  - ...
'Example:
'  call me.FormatGrid(...параметры...)
Public Sub FormatGrid(gr As Object)
Attribute FormatGrid.VB_HelpID = 120
Dim i As Long

    m_OK = False
    Set f(0) = gr.ColumnHeaderFont
    Set f(1) = gr.Font
    m_Colors(0) = gr.ForeColorHeader
    m_Colors(1) = gr.ForeColor
    SetFontCaptions
    If gr.GridLines = jgexGLNone Then
        cboGridlines.ListIndex = 0
    Else
        For i = 1 To cboGridlines.ListCount - 1
            If cboGridlines.ItemData(i) = gr.GridLineStyle Then
                cboGridlines.ListIndex = i
                Exit For
            End If
        Next
    End If
    If gr.BackColorRowGroup = vbButtonFace Then
        chkgrouphead.Value = vbChecked
    Else
        chkgrouphead.Value = vbUnchecked
    End If
    chkAutoColSize.Value = -gr.ColumnAutoResize
    Show 1
    If m_OK Then
        Set gr.ColumnHeaderFont = f(0)
        Set gr.Font = f(1)
        gr.ForeColorHeader = m_Colors(0)
        gr.ForeColor = m_Colors(1)
        If cboGridlines.ListIndex = 0 Then
            gr.GridLines = jgexGLNone
        Else
            If Not IsNull(gr.PreviewColumn) And gr.PreviewRowLines > 0 Then
                gr.GridLines = jgexGLHorizontal
            Else
                gr.GridLines = jgexGLBoth
            End If
            gr.GridLineStyle = cboGridlines.ItemData(cboGridlines.ListIndex)
        End If
        gr.BackColorRowGroup = IIf(chkgrouphead.Value = vbChecked, vbButtonFace, vbWindowBackground)
        gr.ColumnAutoResize = (chkAutoColSize.Value = vbChecked)
    End If
    Unload Me
End Sub

Private Sub SetFontCaptions()
Dim i As Integer

    For i = 0 To 1
        With f(i)
            lblcurrfont(i).FontBold = .Bold
            lblcurrfont(i).FontItalic = .Italic
            lblcurrfont(i).FontName = .name
            lblcurrfont(i).FontStrikethru = .Strikethrough
            lblcurrfont(i).FontUnderline = .Underline
            lblcurrfont(i).Caption = CInt(f(i).Size) & " pt. " & f(i).name
        End With
        lblcurrfont(i).ForeColor = m_Colors(i)
    Next
End Sub

Private Sub cmdCancel_Click()
    Hide
    
End Sub

Private Sub cmdfont_Click(Index As Integer)

    cdlFont.CancelError = True
    On Error GoTo cmdFont_exit
    With cdlFont
        .FontBold = f(Index).Bold
        .FontItalic = f(Index).Italic
        .FontName = f(Index).name
        .FontSize = f(Index).Size
        .FontStrikethru = f(Index).Strikethrough
        .FontUnderline = f(Index).Underline
        .Color = m_Colors(Index)
        .Flags = cdlCFEffects Or cdlCFForceFontExist Or cdlCFScreenFonts
        .ShowFont
        f(Index).Bold = .FontBold
        f(Index).Italic = .FontItalic
        f(Index).name = .FontName
        f(Index).Size = .FontSize
        f(Index).Strikethrough = .FontStrikethru
        f(Index).Underline = .FontUnderline
        m_Colors(Index) = .Color
        SetFontCaptions
        m_Changed = True
    End With
    
    
cmdFont_exit:
    Exit Sub
End Sub


Private Sub cmdOK_Click()

    m_OK = True
    Hide
    
End Sub





