VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.0#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmMyOrg 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Текущие настройки"
   ClientHeight    =   1215
   ClientLeft      =   2760
   ClientTop       =   3750
   ClientWidth     =   5025
   Icon            =   "frmMyOrg.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1215
   ScaleWidth      =   5025
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtOrg 
      Height          =   300
      Left            =   360
      Locked          =   -1  'True
      TabIndex        =   3
      ToolTipText     =   "Наша организация"
      Top             =   450
      Width           =   2550
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3720
      TabIndex        =   1
      Top             =   600
      Width           =   1215
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Height          =   375
      Left            =   3720
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin MTZ_PANEL.DropButton cmdOrg 
      Height          =   300
      Left            =   2910
      TabIndex        =   2
      Tag             =   "refopen.ico"
      ToolTipText     =   "Наша организация"
      Top             =   450
      Width           =   450
      _ExtentX        =   794
      _ExtentY        =   529
      Caption         =   ""
   End
   Begin VB.Label lblOrg 
      BackStyle       =   0  'Transparent
      Caption         =   "Наша организация:"
      ForeColor       =   &H00000000&
      Height          =   300
      Left            =   360
      TabIndex        =   4
      Top             =   120
      Width           =   3000
   End
End
Attribute VB_Name = "frmMyOrg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit



Private Sub CancelButton_Click()
Unload Me
End Sub


Private Sub Form_Load()

If Not MyOrg Is Nothing Then
  txtOrg.Tag = MyOrg.ID
  txtOrg = MyOrg.brief
Else
  txtOrg.Tag = ""
  txtOrg = ""
End If
LoadBtnPictures cmdOrg, cmdOrg.Tag
cmdOrg.RemoveAllMenu
End Sub

Private Sub OKButton_Click()
If IsOK Then
  Save
  Unload Me
End If
End Sub

Private Sub cmdORG_CLick()
  On Error Resume Next
        
        Dim ID As String, brief As String
        If Manager.GetReferenceDialogEx2("dir_org", ID, brief) Then
          txtOrg.Tag = Left(ID, 38)
          txtOrg = brief
        End If
End Sub
Private Sub cmdORG_MenuClick(ByVal sCaption As String)
          txtOrg.Tag = ""
          txtOrg = ""
End Sub


Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True
  If mIsOK Then mIsOK = txtOrg.Tag <> ""

  IsOK = mIsOK
End Function

Public Sub Save()
  If txtOrg.Tag <> "" Then
    Set MyOrg = MyUser.Application.FindRowObject("dir_org", txtOrg.Tag)
    SaveSetting "V-REAL", "HSN", "CurrentORG", MyOrg.ID
  Else
    Set MyOrg = Nothing
    SaveSetting "V-REAL", "HSN", "CurrentORG", ""
  End If
  
  
  
  
End Sub


