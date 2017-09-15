VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.0#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmDocState 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Удалить строку раздела"
   ClientHeight    =   3630
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5010
   Icon            =   "frmDocState.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3630
   ScaleWidth      =   5010
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtDocState1 
      Height          =   300
      Left            =   75
      Locked          =   -1  'True
      TabIndex        =   10
      ToolTipText     =   "Состояние 1"
      Top             =   2205
      Width           =   2550
   End
   Begin VB.TextBox txtDocState2 
      Height          =   300
      Left            =   75
      Locked          =   -1  'True
      TabIndex        =   8
      ToolTipText     =   "Состояние 2"
      Top             =   2910
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
      TabIndex        =   5
      Top             =   0
      Width           =   1455
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3360
      TabIndex        =   6
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
   Begin MTZ_PANEL.DropButton cmdDocState2 
      Height          =   300
      Left            =   2625
      TabIndex        =   7
      Tag             =   "refopen.ico"
      ToolTipText     =   "Состояние 2"
      Top             =   2910
      Width           =   450
      _ExtentX        =   794
      _ExtentY        =   529
      Caption         =   ""
   End
   Begin MTZ_PANEL.DropButton cmdDocState1 
      Height          =   300
      Left            =   2625
      TabIndex        =   9
      Tag             =   "refopen.ico"
      ToolTipText     =   "Состояние 1"
      Top             =   2205
      Width           =   450
      _ExtentX        =   794
      _ExtentY        =   529
      Caption         =   ""
   End
   Begin VB.Label lblDocState1 
      BackStyle       =   0  'Transparent
      Caption         =   "Состояние 1:"
      ForeColor       =   &H00000000&
      Height          =   300
      Left            =   90
      TabIndex        =   12
      Top             =   1875
      Width           =   3000
   End
   Begin VB.Label lblDocState2 
      BackStyle       =   0  'Transparent
      Caption         =   "Состояние 2:"
      ForeColor       =   &H00FF0000&
      Height          =   300
      Left            =   75
      TabIndex        =   11
      Top             =   2580
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
Attribute VB_Name = "frmDocState"
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

If Not item.WFFD_ATTR1.item(1).DocState1 Is Nothing Then
  txtDocState1.Tag = item.WFFD_ATTR1.item(1).DocState1.ID
  txtDocState1 = item.WFFD_ATTR1.item(1).DocState1.Brief
Else
  txtDocState1.Tag = ""
  txtDocState1 = ""
End If
 LoadBtnPictures cmdDocState1, cmdDocState1.Tag
  cmdDocState1.RemoveAllMenu
  cmdDocState1.AddMenu "Очистить"
If Not item.WFFD_ATTR1.item(1).DocState2 Is Nothing Then
  txtDocState2.Tag = item.WFFD_ATTR1.item(1).DocState2.ID
  txtDocState2 = item.WFFD_ATTR1.item(1).DocState2.Brief
Else
  txtDocState2.Tag = ""
  txtDocState2 = ""
End If
 LoadBtnPictures cmdDocState2, cmdDocState2.Tag
  
  
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
  
  If txtDocState1.Tag <> "" Then
    Set item.WFFD_ATTR1.item(1).DocState1 = item.Application.FindRowObject("OBJSTATUS", txtDocState1.Tag)
  Else
    Set item.WFFD_ATTR1.item(1).DocState1 = Nothing
  End If
  If txtDocState2.Tag <> "" Then
    Set item.WFFD_ATTR1.item(1).DocState2 = item.Application.FindRowObject("OBJSTATUS", txtDocState2.Tag)
  Else
    Set item.WFFD_ATTR1.item(1).DocState2 = Nothing
  End If

  
  
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


Private Sub cmdDocState1_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = item.Application.Manager.GetReferenceDialogEx("OBJSTATUS")
        d.Show vbModal, Me
        If d.OK Then
          txtDocState1.Tag = Left(d.ID, 38)
          txtDocState1 = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdDocState1_MenuClick(ByVal sCaption As String)
          txtDocState1.Tag = ""
          txtDocState1 = ""
End Sub
Private Sub cmdDocState2_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = item.Application.Manager.GetReferenceDialogEx("OBJSTATUS")
        d.Show vbModal, Me
        If d.OK Then
          txtDocState2.Tag = Left(d.ID, 38)
          txtDocState2 = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdDocState2_MenuClick(ByVal sCaption As String)
          txtDocState2.Tag = ""
          txtDocState2 = ""
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



