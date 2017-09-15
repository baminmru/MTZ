VERSION 5.00
Begin VB.UserControl DDDropButton 
   ClientHeight    =   1035
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2865
   ScaleHeight     =   1035
   ScaleWidth      =   2865
   Begin VB.CommandButton btnSecond 
      Caption         =   "6"
      BeginProperty Font 
         Name            =   "Marlett"
         Size            =   8.25
         Charset         =   2
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   765
      Left            =   1575
      Picture         =   "DDDropButton.ctx":0000
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   0
      Width           =   165
   End
   Begin VB.CommandButton btnMain 
      Caption         =   "Command1"
      Height          =   765
      Left            =   0
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   0
      Width           =   1590
   End
   Begin VB.Menu mnuRoot 
      Caption         =   "Root"
      Begin VB.Menu m 
         Caption         =   "m"
         Index           =   0
      End
   End
End
Attribute VB_Name = "DDDropButton"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Private nMenuItemsCount As Long
Public Event Click()
Public Event MenuClick(ByVal sCaption As String)

Private Sub btnMain_Click()
    RaiseEvent Click
End Sub

Private Sub btnSecond_Click()
    btnMain.SetFocus
    If nMenuItemsCount > 0 Then
        PopupMenu mnuRoot, , btnMain.Left, btnMain.Top + btnMain.Height
    End If
End Sub

Private Sub m_Click(Index As Integer)
    RaiseEvent MenuClick(m(Index).Caption)
End Sub

Private Sub UserControl_Initialize()
    nMenuItemsCount = 0
End Sub

Private Sub UserControl_InitProperties()
    Caption = Extender.Name
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    btnMain.Caption = PropBag.ReadProperty("Caption", Extender.Name)
End Sub

Private Sub UserControl_Resize()
    Dim nWidth As Long
    If UserControl.Width < btnSecond.Width * 2 Then
        Extender.Width = btnSecond.Width * 2
    End If
    If UserControl.Height < Screen.TwipsPerPixelY * 15 Then
        Extender.Height = Screen.TwipsPerPixelY * 15
    End If
    If nMenuItemsCount = 0 Then
        nWidth = 0
        btnSecond.Value = False
    Else
        nWidth = btnSecond.Width
    End If
    btnMain.Width = UserControl.Width - nWidth
    btnSecond.Left = btnMain.Left + btnMain.Width
    btnMain.Height = UserControl.Height
    btnSecond.Height = UserControl.Height
End Sub


Public Property Let Caption(sCaption As String)
    btnMain.Caption = sCaption
End Property

Public Property Get Caption() As String
    Caption = btnMain.Caption
End Property

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    PropBag.WriteProperty "Caption", btnMain.Caption
End Sub

Public Sub AddMenu(ByVal sCaption As String, Optional ByVal bEnabled As Boolean = True)
    nMenuItemsCount = nMenuItemsCount + 1
    Load m(nMenuItemsCount)
    m(nMenuItemsCount).Caption = sCaption
    m(nMenuItemsCount).Visible = True
    m(nMenuItemsCount).Enabled = bEnabled
    
    If nMenuItemsCount = 1 Then
        m(0).Visible = False
        UserControl_Resize
    End If
    
End Sub

Public Function RemoveMenu(ByVal sCaption As String) As Boolean
    RemoveMenu = False
    Dim mnu As Menu
    For Each mnu In m
        If mnu.Caption = sCaption Then
            nMenuItemsCount = nMenuItemsCount - 1
            If nMenuItemsCount = 0 Then
                m(0).Visible = True
                UserControl_Resize
            End If
            Unload mnu
            RemoveMenu = True
            Exit For
        End If
    Next mnu
End Function

Public Function GetMenuItem(ByVal sCaption As String) As Object
    Dim mnu As Menu
    Set GetMenuItem = Nothing
    For Each mnu In m
        If mnu.Caption = sCaption Then
            Set GetMenuItem = mnu
            Exit For
        End If
    Next mnu
End Function

