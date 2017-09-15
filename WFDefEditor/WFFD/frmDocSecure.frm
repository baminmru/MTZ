VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.0#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmDocSecure 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Удалить строку раздела"
   ClientHeight    =   3450
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5010
   Icon            =   "frmDocSecure.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3450
   ScaleWidth      =   5010
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox cmbFlag 
      Height          =   315
      Left            =   105
      Sorted          =   -1  'True
      Style           =   2  'Dropdown List
      TabIndex        =   9
      ToolTipText     =   "Флаг"
      Top             =   2895
      Width           =   3000
   End
   Begin VB.TextBox txtProcessParameter 
      Height          =   300
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   6
      ToolTipText     =   "Параметр"
      Top             =   2160
      Width           =   2550
   End
   Begin VB.TextBox txtProcessDocument 
      Height          =   300
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   3
      ToolTipText     =   "Документ процеса"
      Top             =   1410
      Width           =   2550
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   3360
      TabIndex        =   10
      Top             =   0
      Width           =   1455
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3360
      TabIndex        =   11
      Top             =   480
      Width           =   1455
   End
   Begin VB.TextBox txtName 
      Height          =   300
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   3015
   End
   Begin MTZ_PANEL.DropButton cmdProcessDocument 
      Height          =   300
      Left            =   2640
      TabIndex        =   4
      Tag             =   "refopen.ico"
      ToolTipText     =   "Документ процеса"
      Top             =   1410
      Width           =   450
      _ExtentX        =   794
      _ExtentY        =   529
      Caption         =   ""
   End
   Begin MTZ_PANEL.DropButton cmdProcessParameter 
      Height          =   300
      Left            =   2640
      TabIndex        =   7
      Tag             =   "refopen.ico"
      ToolTipText     =   "Параметр"
      Top             =   2160
      Width           =   450
      _ExtentX        =   794
      _ExtentY        =   529
      Caption         =   ""
   End
   Begin VB.Label lblFlag 
      BackStyle       =   0  'Transparent
      Caption         =   "Распространить права:"
      ForeColor       =   &H00000000&
      Height          =   300
      Left            =   105
      TabIndex        =   8
      Top             =   2565
      Width           =   3000
   End
   Begin VB.Label lblProcessParameter 
      BackStyle       =   0  'Transparent
      Caption         =   "Источник стиля защиты:"
      ForeColor       =   &H00000000&
      Height          =   300
      Left            =   120
      TabIndex        =   5
      Top             =   1920
      Width           =   3000
   End
   Begin VB.Label lblProcessDocument 
      BackStyle       =   0  'Transparent
      Caption         =   "Документ процеса:"
      ForeColor       =   &H00000000&
      Height          =   300
      Left            =   120
      TabIndex        =   2
      Top             =   1080
      Width           =   3000
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   1080
      Width           =   480
   End
   Begin VB.Label Label1 
      Caption         =   "Название шага:"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3015
   End
End
Attribute VB_Name = "frmDocSecure"
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

If Not item.WFFD_ATTR1.item(1).ProcessDocument Is Nothing Then
  txtProcessDocument.Tag = item.WFFD_ATTR1.item(1).ProcessDocument.ID
  txtProcessDocument = item.WFFD_ATTR1.item(1).ProcessDocument.Brief
Else
  txtProcessDocument.Tag = ""
  txtProcessDocument = ""
End If
 LoadBtnPictures cmdProcessDocument, cmdProcessDocument.Tag
 cmdProcessDocument.RemoveAllMenu
 cmdProcessDocument.AddMenu "Очистить"


If Not item.WFFD_ATTR1.item(1).ProcessParameter Is Nothing Then
  txtProcessParameter.Tag = item.WFFD_ATTR1.item(1).ProcessParameter.ID
  txtProcessParameter = item.WFFD_ATTR1.item(1).ProcessParameter.Brief
Else
  txtProcessParameter.Tag = ""
  txtProcessParameter = ""
End If
LoadBtnPictures cmdProcessParameter, cmdProcessParameter.Tag
cmdProcessParameter.RemoveAllMenu
cmdProcessParameter.AddMenu "Очистить"
  
Dim iii As Long
cmbFlag.Clear
cmbFlag.AddItem "Да"
cmbFlag.ItemData(cmbFlag.NewIndex) = -1
cmbFlag.AddItem "Нет"
cmbFlag.ItemData(cmbFlag.NewIndex) = 0
 For iii = 0 To cmbFlag.ListCount - 1
  If item.WFFD_ATTR1.item(1).Flag = cmbFlag.ItemData(iii) Then
   cmbFlag.ListIndex = iii
   Exit For
  End If
 Next
  
  
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
  
  If txtProcessDocument.Tag <> "" Then
    Set item.WFFD_ATTR1.item(1).ProcessDocument = item.Application.FindRowObject("WFDef_Doc", txtProcessDocument.Tag)
  Else
    Set item.WFFD_ATTR1.item(1).ProcessDocument = Nothing
  End If
  
  If txtProcessParameter.Tag <> "" Then
    Set item.WFFD_ATTR1.item(1).ProcessParameter = item.Application.FindRowObject("WFDef_param", txtProcessParameter.Tag)
  Else
    Set item.WFFD_ATTR1.item(1).ProcessParameter = Nothing
  End If
  item.WFFD_ATTR1.item(1).Flag = cmbFlag.ItemData(cmbFlag.ListIndex)
  item.WFFD_ATTR1.item(1).Save
  Unload Me
End Sub



Private Sub cmdProcessDocument_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = item.Application.Manager.GetReferenceDialogEx("WFDef_Doc")
        
        Dim rs As ADODB.Recordset
        Set rs = item.Application.MTZSession.GetRow("INSTANCE", item.ID)
        Dim Obj As Object
        Set Obj = item.Application.FindRowObject(rs!OwnerPartName, rs!ownerRowID)
        If Not Obj Is Nothing Then
          d.InstanceID = Obj.Application.ID
        End If
        
        
        d.Show vbModal, Me
        If d.OK Then
          txtProcessDocument.Tag = Left(d.ID, 38)
          txtProcessDocument = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdProcessDocument_MenuClick(ByVal sCaption As String)
          txtProcessDocument.Tag = ""
          txtProcessDocument = ""
End Sub


Private Sub cmdProcessParameter_CLick()
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
          txtProcessParameter.Tag = Left(d.ID, 38)
          txtProcessParameter = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdProcessParameter_MenuClick(ByVal sCaption As String)
          txtProcessParameter.Tag = ""
          txtProcessParameter = ""
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



