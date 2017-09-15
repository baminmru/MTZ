VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.0#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmNewPRC 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Название функции"
   ClientHeight    =   2460
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4890
   Icon            =   "frmNewPrc.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2460
   ScaleWidth      =   4890
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtSubProcessType 
      Height          =   300
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   5
      ToolTipText     =   "Тип подпроцесса"
      Top             =   2010
      Width           =   2550
   End
   Begin VB.TextBox txtValue 
      Height          =   300
      Left            =   120
      MaxLength       =   255
      TabIndex        =   3
      ToolTipText     =   "Значение"
      Top             =   1320
      Width           =   3000
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
      TabIndex        =   8
      Top             =   600
      Width           =   1455
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   3360
      TabIndex        =   7
      Top             =   120
      Width           =   1455
   End
   Begin MTZ_PANEL.DropButton cmdSubProcessType 
      Height          =   300
      Left            =   2670
      TabIndex        =   6
      Tag             =   "refopen.ico"
      ToolTipText     =   "Тип подпроцесса"
      Top             =   2010
      Width           =   450
      _ExtentX        =   794
      _ExtentY        =   529
      Caption         =   ""
   End
   Begin VB.Label lblSubProcessType 
      BackStyle       =   0  'Transparent
      Caption         =   "Тип подпроцесса:"
      ForeColor       =   &H00000000&
      Height          =   300
      Left            =   120
      TabIndex        =   4
      Top             =   1680
      Width           =   3000
   End
   Begin VB.Label lblValue 
      BackStyle       =   0  'Transparent
      Caption         =   "Название подпроцесса:"
      ForeColor       =   &H00000000&
      Height          =   300
      Left            =   120
      TabIndex        =   2
      Top             =   1080
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
      Height          =   465
      Left            =   3720
      Stretch         =   -1  'True
      Top             =   1200
      Width           =   600
   End
End
Attribute VB_Name = "frmNewPRC"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public item As WFFD.Application
Public Host As GUI
Public ModalMode As Boolean
Public CheckNumber As Boolean
Public ValName As String

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
 lblValue.Caption = ValName
End Sub

Public Sub InitPanel()
txtValue = item.WFFD_ATTR1.item(1).the_Value

If Not item.WFFD_ATTR1.item(1).SubProcessType Is Nothing Then
  txtSubProcessType.Tag = item.WFFD_ATTR1.item(1).SubProcessType.ID
  txtSubProcessType = item.WFFD_ATTR1.item(1).SubProcessType.Brief
Else
  txtSubProcessType.Tag = ""
  txtSubProcessType = ""
End If
 LoadBtnPictures cmdSubProcessType, cmdSubProcessType.Tag
  cmdSubProcessType.RemoveAllMenu
  cmdSubProcessType.AddMenu "Очистить"
  cmdSubProcessType.AddMenu "Открыть"
  cmdSubProcessType.AddMenu "Создать"
  cmdSubProcessType.AddMenu "Выбрать"


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
item.WFFD_ATTR1.item(1).the_Value = txtValue
If txtSubProcessType.Tag <> "" Then
  Set item.WFFD_ATTR1.item(1).SubProcessType = item.Application.Manager.GetInstanceObject(txtSubProcessType.Tag)
Else
  Set item.WFFD_ATTR1.item(1).SubProcessType = Nothing
End If

item.WFFD_ATTR1.item(1).Save
Unload Me
End Sub

Private Sub cmdSubProcessType_CLick()
  On Error Resume Next
     If txtSubProcessType.Tag = "" Then
       cmdSubProcessType_MenuClick "Выбрать"
     Else
       cmdSubProcessType_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdSubProcessType_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim Obj As Object
    Dim d As Form
    Dim ID As String
  If sCaption = "Очистить" Then
          txtSubProcessType.Tag = ""
          txtSubProcessType = ""
  End If
  If sCaption = "Открыть" Then
    If txtSubProcessType.Tag = "" Then Exit Sub
    Set inst = item.Application.Manager.GetInstanceObject(txtSubProcessType.Tag)
    If inst Is Nothing Then Exit Sub
    Set Obj = item.Application.Manager.GetInstanceGUI(txtSubProcessType.Tag)
    Obj.Show "", inst, True
    Set Obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        Set d = item.Application.Manager.GetObjectListDialog("", "WFDef")
        d.Show vbModal, Me
        If d.OK Then
          txtSubProcessType.Tag = Left(d.ID, 38)
          txtSubProcessType = d.Brief
        End If
        Set d = Nothing
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        ID = CreateGUID2
        item.Application.Manager.NewInstance ID, "WFDef", "Определение процесса " & Now
        Set Obj = item.Application.Manager.GetInstanceObject(ID)
        If Not Obj Is Nothing Then
          txtSubProcessType.Tag = Obj.ID
          txtSubProcessType = Obj.Brief
          Set Obj = Nothing
        End If
  End If
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

Private Sub txtMinPriority_Validate(Cancel As Boolean)
End Sub

Private Sub txtValue_Validate(Cancel As Boolean)
  If CheckNumber Then
    If txtValue.Text <> "" Then
     On Error Resume Next
      If Not IsNumeric(txtValue.Text) Then
         Cancel = True
         MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
      ElseIf Val(txtValue.Text) <> CLng(Val(txtValue.Text)) Then
         Cancel = True
         MsgBox "Ожидалось целое число", vbOKOnly + vbExclamation, "Внимание"
      End If
    End If
  End If
End Sub
