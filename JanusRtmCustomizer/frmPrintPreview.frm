VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmPrintPreview 
   Caption         =   "Предварительный просмотр при  печати"
   ClientHeight    =   7350
   ClientLeft      =   1875
   ClientTop       =   2430
   ClientWidth     =   8115
   Icon            =   "frmPrintPreview.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   490
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   541
   Begin MSComctlLib.StatusBar stbPreview 
      Align           =   2  'Align Bottom
      Height          =   345
      Left            =   0
      TabIndex        =   1
      Top             =   7005
      Width           =   8115
      _ExtentX        =   14314
      _ExtentY        =   609
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   13785
         EndProperty
      EndProperty
   End
   Begin GridEX20.GEXPreview Preview 
      Height          =   6885
      Left            =   75
      TabIndex        =   0
      ToolTipText     =   "Предварительный просмотр"
      Top             =   0
      Width           =   7980
      _ExtentX        =   14076
      _ExtentY        =   12144
      BeginProperty ToolbarFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      PageSetupText   =   "&Настройка ..."
      PrintText       =   "&Печать..."
      CloseButtonText =   "&Закрыть"
   End
End
Attribute VB_Name = "frmPrintPreview"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 80
Option Explicit

Private Sub Form_Resize()
On Error Resume Next
    Preview.Move 0, 0, ScaleWidth, ScaleHeight - stbPreview.Height
    
End Sub


Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next
    Hide
End Sub


Private Sub Preview_AfterPaginating()
  stbPreview.SimpleText = "Готов"
End Sub

Private Sub Preview_BeforePaginating()
    stbPreview.SimpleText = "Разбивка на страницы..."
    
End Sub

Private Sub Preview_OnCloseClick()

    Unload Me
 
End Sub

Private Sub Preview_OnPrintClick(ByVal UsePrintSetupDlg As GridEX20.JSRetBoolean)
  UsePrintSetupDlg = True
End Sub

Private Sub Preview_PageChanged()
Dim bTwoPages As Boolean
Dim strPage As String
    With Preview
        If .Zoom = jgexZoomTwoPages Then
            If .CurrentPage < .TotalPages Then
                bTwoPages = True
            End If
        End If
        If bTwoPages Then
            strPage = .CurrentPage & " - " & .CurrentPage + 1
        Else
            strPage = .CurrentPage
        End If
        stbPreview.SimpleText = "Page " & strPage & " of " & .TotalPages
    End With
        
End Sub


