VERSION 5.00
Begin VB.Form frmLogin 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Регистрация"
   ClientHeight    =   1935
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3750
   Icon            =   "frmLogin.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1935
   ScaleWidth      =   3750
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Tag             =   "Login"
   Begin VB.ComboBox txtSite 
      Height          =   315
      Left            =   1320
      TabIndex        =   7
      Text            =   "Combo1"
      Top             =   960
      Width           =   2325
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Отменить"
      Height          =   360
      Left            =   2100
      TabIndex        =   6
      Tag             =   "Cancel"
      Top             =   1440
      Width           =   1140
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "Войти"
      Default         =   -1  'True
      Height          =   360
      Left            =   480
      TabIndex        =   5
      Tag             =   "OK"
      Top             =   1440
      Width           =   1140
   End
   Begin VB.TextBox txtPassword 
      Height          =   285
      IMEMode         =   3  'DISABLE
      Left            =   1320
      PasswordChar    =   "*"
      TabIndex        =   3
      Top             =   525
      Width           =   2325
   End
   Begin VB.TextBox txtUserName 
      Height          =   285
      Left            =   1320
      TabIndex        =   1
      Text            =   "supervisor"
      Top             =   120
      Width           =   2325
   End
   Begin VB.Label Label1 
      Caption         =   "Узел:"
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   960
      Width           =   1095
   End
   Begin VB.Label lblLabels 
      Caption         =   "Пароль:"
      Height          =   248
      Index           =   1
      Left            =   120
      TabIndex        =   2
      Tag             =   "&Password:"
      Top             =   540
      Width           =   1080
   End
   Begin VB.Label lblLabels 
      Caption         =   "Пользователь:"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Tag             =   "&User Name:"
      Top             =   120
      Width           =   1200
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpbuffer As String, nSize As Long) As Long
Const HWND_TOPMOST = -1
Const SWP_NOSIZE = &H1
Const HWND_TOP = 0
Const SWP_NOMOVE = &H2
Const SWP_SHOWWINDOW = &H40
Public ok As Boolean

Public Function GetUser() As String
  Dim sBuffer As String
  Dim lSize As Long
  Dim mUserName  As String
  sBuffer = Space$(255)
  lSize = Len(sBuffer)
  Call GetUserName(sBuffer, lSize)
  GetUser = Left$(sBuffer, lSize)
End Function

Private Sub cmdCancel_Click()
  ok = False
  Me.Hide
End Sub

Private Sub cmdOK_Click()
    ok = True
    SaveSetting "MTZ", "CONFIG", "LASTUSER", txtUserName.Text
    Me.Hide
End Sub

Private Sub Form_Activate()
  Call SetWindowPos(Me.hWnd, HWND_TOPMOST, -1, -1, -1, -1, SWP_NOSIZE + SWP_NOMOVE + SWP_SHOWWINDOW)
End Sub

Private Sub Form_Load()
  Dim xdom As MSXML2.DOMDocument, i As Long
  Dim n As String
  
  txtUserName.Text = GetSetting("MTZ", "CONFIG", "LASTUSER", GetUser())
  
  Set xdom = New MSXML2.DOMDocument
  xdom.async = False
  xdom.Load MTZGetSetting("MTZ", "CONFIG", "XMLPATH", App.Path & "\CFG\MTZ.XML")
  On Error Resume Next
  
  txtSite.Clear
  For i = 0 To xdom.lastChild.childNodes.length - 1
    n = xdom.lastChild.childNodes.Item(i).Attributes.getNamedItem("Name").nodeValue
    If n <> "" Then
      txtSite.AddItem n
    End If
  Next
  If txtSite.ListCount > 0 Then
    txtSite.ListIndex = 0
  End If
End Sub
