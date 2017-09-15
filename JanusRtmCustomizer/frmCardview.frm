VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frmCardView 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "��������� ������ ��������"
   ClientHeight    =   2580
   ClientLeft      =   2850
   ClientTop       =   4755
   ClientWidth     =   5985
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   204
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmCardview.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2580
   ScaleWidth      =   5985
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin MSComDlg.CommonDialog cdlFont 
      Left            =   5850
      Top             =   1590
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "������"
      Height          =   315
      Left            =   4710
      TabIndex        =   12
      Top             =   420
      Width           =   1175
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   4710
      TabIndex        =   11
      Top             =   60
      Width           =   1175
   End
   Begin VB.Frame fraSet 
      Caption         =   "������"
      Height          =   675
      Index           =   2
      Left            =   0
      TabIndex        =   7
      Top             =   1845
      Width           =   4650
      Begin VB.TextBox txtCardWidth 
         Height          =   330
         Left            =   2280
         TabIndex        =   9
         Top             =   240
         Width           =   1020
      End
      Begin VB.Label lblGridlines 
         Caption         =   "� ������"
         Height          =   285
         Index           =   1
         Left            =   3480
         TabIndex        =   10
         Top             =   285
         Width           =   1080
      End
      Begin VB.Label lblGridlines 
         Caption         =   "������ ��������:"
         Height          =   285
         Index           =   0
         Left            =   150
         TabIndex        =   8
         Top             =   300
         Width           =   2145
      End
   End
   Begin VB.Frame fraSet 
      Caption         =   "���������� ��������"
      Height          =   885
      Index           =   1
      Left            =   0
      TabIndex        =   3
      Top             =   945
      Width           =   4650
      Begin VB.CheckBox chkAllowed 
         Caption         =   "�������������� �����"
         Height          =   210
         Left            =   3465
         TabIndex        =   6
         Top             =   345
         Value           =   1  'Checked
         Visible         =   0   'False
         Width           =   2160
      End
      Begin VB.CommandButton cmdfont 
         Caption         =   "�����"
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
         TabIndex        =   5
         Top             =   345
         Width           =   1845
      End
   End
   Begin VB.Frame fraSet 
      Caption         =   "��������� ��������"
      Height          =   885
      Index           =   0
      Left            =   0
      TabIndex        =   0
      Top             =   30
      Width           =   4650
      Begin VB.CommandButton cmdfont 
         Caption         =   "�����"
         Height          =   345
         Index           =   0
         Left            =   210
         TabIndex        =   1
         Top             =   345
         Width           =   1080
      End
      Begin VB.Label lblcurrfont 
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Current font"
         Height          =   285
         Index           =   0
         Left            =   1455
         TabIndex        =   2
         Top             =   360
         Width           =   1845
      End
   End
End
Attribute VB_Name = "frmCardView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 40
Option Explicit

Dim m_OK As Boolean
Dim f(0 To 1) As Font
Dim m_Changed As Boolean
Dim m_Colors(0 To 1) As Long
Const AllChars = "abcdefghijklmnopqrstuvwxyz"

'Parameters:
'[IN][OUT]  gr , ��� ���������: Object  - ...
'Example:
'  call me.FormatGrid(...���������...)
Public Sub FormatGrid(gr As Object)
Attribute FormatGrid.VB_HelpID = 45

    m_OK = False
    Set f(0) = gr.ColumnHeaderFont
    Set f(1) = gr.Font
    m_Colors(0) = gr.ForeColorHeader
    m_Colors(1) = gr.ForeColor
    SetFontCaptions
    chkAllowed.Value = IIf(gr.AllowEdit, vbChecked, vbUnchecked)
    Set Font = f(1)
    Me.ScaleMode = vbTwips
    txtCardWidth.Text = ScaleX(gr.CardWidth, vbTwips, vbPixels)
    Show 1
    If m_OK Then
        Set gr.ColumnHeaderFont = f(0)
        Set gr.Font = f(1)
        gr.ForeColorHeader = m_Colors(0)
        gr.ForeColor = m_Colors(1)
        gr.AllowEdit = (chkAllowed.Value = vbChecked)
        On Error Resume Next
        gr.CardWidth = ScaleX(txtCardWidth.Text, vbPixels, vbTwips)
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







