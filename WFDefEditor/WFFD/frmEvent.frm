VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.0#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmEvent 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Название функции"
   ClientHeight    =   4755
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4890
   Icon            =   "frmEvent.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4755
   ScaleWidth      =   4890
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtProcessParameter 
      Height          =   300
      Index           =   2
      Left            =   105
      Locked          =   -1  'True
      TabIndex        =   13
      ToolTipText     =   "Параметр"
      Top             =   4230
      Width           =   2550
   End
   Begin VB.TextBox txtValue 
      Height          =   300
      Left            =   120
      MaxLength       =   255
      TabIndex        =   3
      ToolTipText     =   "Значение"
      Top             =   1410
      Width           =   3000
   End
   Begin VB.TextBox txtValue2 
      Height          =   300
      Left            =   120
      MaxLength       =   255
      TabIndex        =   5
      ToolTipText     =   "Значение2"
      Top             =   2190
      Width           =   3000
   End
   Begin VB.TextBox txtProcessParameter 
      Height          =   300
      Index           =   1
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   10
      ToolTipText     =   "Параметр"
      Top             =   3585
      Width           =   2550
   End
   Begin VB.TextBox txtProcessParameter 
      Height          =   300
      Index           =   0
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   7
      ToolTipText     =   "Параметр"
      Top             =   2880
      Width           =   2550
   End
   Begin VB.TextBox txtName 
      Height          =   300
      Left            =   120
      TabIndex        =   1
      Top             =   600
      Width           =   3000
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3360
      TabIndex        =   16
      Top             =   600
      Width           =   1455
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   3360
      TabIndex        =   15
      Top             =   120
      Width           =   1455
   End
   Begin MTZ_PANEL.DropButton cmdProcessParameter 
      Height          =   300
      Index           =   0
      Left            =   2670
      TabIndex        =   8
      Tag             =   "refopen.ico"
      ToolTipText     =   "Параметр"
      Top             =   2865
      Width           =   450
      _ExtentX        =   794
      _ExtentY        =   529
      Caption         =   ""
   End
   Begin MTZ_PANEL.DropButton cmdProcessParameter 
      Height          =   300
      Index           =   1
      Left            =   2670
      TabIndex        =   11
      Tag             =   "refopen.ico"
      ToolTipText     =   "Параметр"
      Top             =   3600
      Width           =   450
      _ExtentX        =   794
      _ExtentY        =   529
      Caption         =   ""
   End
   Begin MTZ_PANEL.DropButton cmdProcessParameter 
      Height          =   300
      Index           =   2
      Left            =   2670
      TabIndex        =   14
      Tag             =   "refopen.ico"
      ToolTipText     =   "Параметр"
      Top             =   4245
      Width           =   450
      _ExtentX        =   794
      _ExtentY        =   529
      Caption         =   ""
   End
   Begin VB.Label lblProcessParameter 
      BackStyle       =   0  'Transparent
      Caption         =   "Переменная - маркер журнала:"
      ForeColor       =   &H00000000&
      Height          =   300
      Index           =   2
      Left            =   105
      TabIndex        =   12
      Top             =   4005
      Width           =   3000
   End
   Begin VB.Label lblValue 
      BackStyle       =   0  'Transparent
      Caption         =   "Тип события:"
      ForeColor       =   &H00000000&
      Height          =   300
      Left            =   120
      TabIndex        =   2
      Top             =   1080
      Width           =   3000
   End
   Begin VB.Label lblValue2 
      BackStyle       =   0  'Transparent
      Caption         =   "Раздел:"
      ForeColor       =   &H00000000&
      Height          =   300
      Left            =   120
      TabIndex        =   4
      Top             =   1860
      Width           =   3000
   End
   Begin VB.Label lblProcessParameter 
      BackStyle       =   0  'Transparent
      Caption         =   "Переменная - раздел:"
      ForeColor       =   &H00000000&
      Height          =   300
      Index           =   1
      Left            =   120
      TabIndex        =   9
      Top             =   3345
      Width           =   3000
   End
   Begin VB.Label lblProcessParameter 
      BackStyle       =   0  'Transparent
      Caption         =   "Переменная -Ресурс:"
      ForeColor       =   &H00000000&
      Height          =   300
      Index           =   0
      Left            =   120
      TabIndex        =   6
      Top             =   2625
      Width           =   3000
   End
   Begin VB.Label Label1 
      Caption         =   "Название шага:"
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
      Top             =   1320
      Width           =   480
   End
End
Attribute VB_Name = "frmEvent"
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
 If item.WFFD_ATTR1.Count = 0 Then
  item.WFFD_ATTR1.Add.Save
 End If
 
 InitPanel
 
End Sub

Public Sub InitPanel()

txtValue.Text = item.WFFD_ATTR1.item(1).the_Value
txtValue2.Text = item.WFFD_ATTR1.item(1).Value2


If Not item.WFFD_ATTR1.item(1).ProcessParameter Is Nothing Then
  txtProcessParameter(0).Tag = item.WFFD_ATTR1.item(1).ProcessParameter.ID
  txtProcessParameter(0) = item.WFFD_ATTR1.item(1).ProcessParameter.Brief
Else
  txtProcessParameter(0).Tag = ""
  txtProcessParameter(0) = ""
End If
LoadBtnPictures cmdProcessParameter(0), cmdProcessParameter(0).Tag
cmdProcessParameter(0).RemoveAllMenu
cmdProcessParameter(0).AddMenu "Очистить"

If Not item.WFFD_ATTR1.item(1).ProcessParameter2 Is Nothing Then
  txtProcessParameter(1).Tag = item.WFFD_ATTR1.item(1).ProcessParameter2.ID
  txtProcessParameter(1) = item.WFFD_ATTR1.item(1).ProcessParameter2.Brief
Else
  txtProcessParameter(1).Tag = ""
  txtProcessParameter(1) = ""
End If
LoadBtnPictures cmdProcessParameter(1), cmdProcessParameter(1).Tag
cmdProcessParameter(1).RemoveAllMenu
cmdProcessParameter(1).AddMenu "Очистить"

If Not item.WFFD_ATTR1.item(1).ProcessParameter3 Is Nothing Then
  txtProcessParameter(2).Tag = item.WFFD_ATTR1.item(1).ProcessParameter3.ID
  txtProcessParameter(2) = item.WFFD_ATTR1.item(1).ProcessParameter3.Brief
Else
  txtProcessParameter(2).Tag = ""
  txtProcessParameter(2) = ""
End If
LoadBtnPictures cmdProcessParameter(2), cmdProcessParameter(2).Tag
cmdProcessParameter(2).RemoveAllMenu
cmdProcessParameter(2).AddMenu "Очистить"

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
If txtProcessParameter(0).Tag <> "" Then
  Set item.WFFD_ATTR1.item(1).ProcessParameter = item.Application.FindRowObject("WFDef_param", txtProcessParameter(0).Tag)
Else
  Set item.WFFD_ATTR1.item(1).ProcessParameter = Nothing
End If
If txtProcessParameter(1).Tag <> "" Then
  Set item.WFFD_ATTR1.item(1).ProcessParameter2 = item.Application.FindRowObject("WFDef_param", txtProcessParameter(1).Tag)
Else
  Set item.WFFD_ATTR1.item(1).ProcessParameter2 = Nothing
End If

If txtProcessParameter(2).Tag <> "" Then
  Set item.WFFD_ATTR1.item(1).ProcessParameter3 = item.Application.FindRowObject("WFDef_param", txtProcessParameter(2).Tag)
Else
  Set item.WFFD_ATTR1.item(1).ProcessParameter3 = Nothing
End If
item.WFFD_ATTR1.item(1).the_Value = txtValue.Text
item.WFFD_ATTR1.item(1).Value2 = txtValue2.Text


item.WFFD_ATTR1.item(1).Save
Unload Me
End Sub

Private Sub cmdProcessParameter_CLick(index As Integer)
  On Error Resume Next
        Dim d As Form
        Set d = item.Application.Manager.GetReferenceDialogEx("WFDef_param")
        Dim rs As ADODB.Recordset
        Set rs = item.Application.MTZSession.GetRow("INSTANCE", item.ID)
        Dim Obj As Object
        Set Obj = item.Application.FindRowObject(rs!OwnerPartName, rs!ownerRowID)
        If Not Obj Is Nothing Then
          d.InstanceID = Obj.Application.ID
        End If
        d.Show vbModal, Me
        If d.OK Then
          txtProcessParameter(index).Tag = Left(d.ID, 38)
          txtProcessParameter(index) = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdProcessParameter_MenuClick(index As Integer, ByVal sCaption As String)
          txtProcessParameter(index).Tag = ""
          txtProcessParameter(index) = ""
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

