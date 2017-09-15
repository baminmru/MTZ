VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#1.6#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmVar 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Название функции"
   ClientHeight    =   2415
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4890
   Icon            =   "frmVar.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2415
   ScaleWidth      =   4890
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtProcessParameter 
      Height          =   300
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   6
      ToolTipText     =   "Параметр"
      Top             =   1320
      Width           =   2550
   End
   Begin VB.TextBox txtValue 
      Height          =   300
      Left            =   120
      MaxLength       =   255
      TabIndex        =   4
      ToolTipText     =   "Значение"
      Top             =   1920
      Width           =   3000
   End
   Begin VB.TextBox txtName 
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   600
      Width           =   3015
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3360
      TabIndex        =   1
      Top             =   600
      Width           =   1455
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   3360
      TabIndex        =   0
      Top             =   120
      Width           =   1455
   End
   Begin MTZ_PANEL.DropButton cmdProcessParameter 
      Height          =   300
      Left            =   2640
      TabIndex        =   5
      Tag             =   "refopen.ico"
      ToolTipText     =   "Параметр"
      Top             =   1320
      Width           =   450
      _ExtentX        =   794
      _ExtentY        =   529
      Caption         =   ""
   End
   Begin VB.Label lblProcessParameter 
      BackStyle       =   0  'Transparent
      Caption         =   "Переменная:"
      ForeColor       =   &H00000000&
      Height          =   300
      Left            =   120
      TabIndex        =   8
      Top             =   1080
      Width           =   3000
   End
   Begin VB.Label lblValue 
      BackStyle       =   0  'Transparent
      Caption         =   "Значение:"
      ForeColor       =   &H00000000&
      Height          =   300
      Left            =   120
      TabIndex        =   7
      Top             =   1680
      Width           =   3000
   End
   Begin VB.Label Label1 
      Caption         =   "Название шага:"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   240
      Width           =   3015
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   1320
      Width           =   480
   End
End
Attribute VB_Name = "frmVar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public Item As Object
Public Host As GUI
Public ModalMode As Boolean

Public Sub Init(ObjItem As Object, MyHost As GUI, aModalMode As Boolean)
 Set Item = ObjItem
 Set Host = MyHost
 ModalMode = aModalMode
 
 txtName = Item.WFFD_common.Item(1).Name
 Image1.Picture = LoadPicture(IconPath(Item.WFFD_common.Item(1).StepType.Iconname))
 Image1.ToolTipText = Item.WFFD_common.Item(1).StepType.Name
 If Item.WFFD_ATTR1.Count = 0 Then
  Item.WFFD_ATTR1.Add.Save
 End If
 
 InitPanel
 
End Sub

Public Sub InitPanel()

If Not Item.WFFD_ATTR1.Item(1).ProcessParameter Is Nothing Then
  txtProcessParameter.Tag = Item.WFFD_ATTR1.Item(1).ProcessParameter.ID
  txtProcessParameter = Item.WFFD_ATTR1.Item(1).ProcessParameter.Brief
Else
  txtProcessParameter.Tag = ""
  txtProcessParameter = ""
End If
LoadBtnPictures cmdProcessParameter, cmdProcessParameter.Tag
cmdProcessParameter.RemoveAllMenu
cmdProcessParameter.AddMenu "Очистить"
txtValue = Item.WFFD_ATTR1.Item(1).Value

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
Item.WFFD_common.Item(1).Name = txtName.Text
Item.WFFD_common.Item(1).Save
Item.Name = Item.WFFD_common.Item(1).Name
Item.Save
Item.WFFD_ATTR1.Item(1).Value = txtValue
If txtProcessParameter.Tag <> "" Then
  Set Item.ProcessParameter = Item.Application.FindRowObject("WFDef_param", txtProcessParameter.Tag)
Else
  Set Item.ProcessParameter = Nothing
End If
Item.WFFD_ATTR1.Item(1).Save
Unload Me
End Sub

Private Sub cmdProcessParameter_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = Item.Application.Manager.GetReferenceDialogEx("WFDef_param")
        d.Show vbModal, Me
        If d.OK Then
          txtProcessParameter.Tag = Left(d.ID, 38)
          txtProcessParameter = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdProcessParameter_MenuClick(ByVal sCaption As String)
          txtProcessParameter.Tag = ""
          txtProcessParameter = ""
End Sub
Private Sub Form_Load()
  On Error Resume Next
  Me.Caption = Item.Brief
End Sub
Private Sub Form_Unload(Cancel As Integer)
  On Error Resume Next
  If Not Host Is Nothing Then
   Host.EraseForm Item.ID, "", ModalMode
  End If
  Set Item = Nothing
  Set Host = Nothing
  Exit Sub
bye:
  MsgBox Err.Description, vbOKOnly
End Sub

