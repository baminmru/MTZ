VERSION 5.00
Begin VB.Form frmNameOnly 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Название функции"
   ClientHeight    =   1800
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4920
   Icon            =   "frmNameOnly.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1800
   ScaleWidth      =   4920
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtName 
      Height          =   300
      Left            =   120
      TabIndex        =   1
      Top             =   600
      Width           =   3015
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3360
      TabIndex        =   3
      Top             =   600
      Width           =   1455
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   3360
      TabIndex        =   2
      Top             =   120
      Width           =   1455
   End
   Begin VB.Label Label1 
      Caption         =   "Название"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   3015
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   480
   End
End
Attribute VB_Name = "frmNameOnly"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public item As WFFD.Application
Public Host As GUI
Public ModalMode As Boolean

Public Sub Init(ObjItem As Object, MyHost As GUI, aModalMode As Boolean)
 Set item = ObjItem
 Set Host = MyHost
 ModalMode = aModalMode
 
 txtName = item.WFFD_common.item(1).Name
 Image1.Picture = LoadPicture(IconPath(item.WFFD_common.item(1).StepType.IconName))
 Image1.ToolTipText = item.WFFD_common.item(1).StepType.Name
End Sub

Private Sub cmdCancel_Click()
Unload Me
End Sub

Private Function IconPath(ByVal ID As String) As String
  Dim s As String
  s = ""
  s = GetSetting("MTZ", "CONFIG", "IMAGEPATH", "")
  If s = "" Then
    IconPath = App.Path & "\" & ID & ".ico"
  Else
    IconPath = s & "\" & ID & ".ico"
  End If
End Function



Private Sub cmdOK_Click()
item.WFFD_common.item(1).Name = txtName.Text
item.WFFD_common.item(1).Save
item.Name = item.WFFD_common.item(1).Name
item.Save
Unload Me
End Sub

Private Sub form_load()
  On Error Resume Next
  Me.Caption = item.Brief
End Sub
Private Sub Form_Unload(Cancel As Integer)
  On Error Resume Next
  If Not Host Is Nothing Then
   Host.EraseForm item.ID, "", ModalMode
  End If
  Set item = Nothing
  Set Host = Nothing
  Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly
End Sub

