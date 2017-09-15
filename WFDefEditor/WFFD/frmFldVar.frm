VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.0#0"; "MTZ_PANEL.ocx"
Begin VB.Form frmFldVar 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Поле - переменная"
   ClientHeight    =   4620
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5010
   Icon            =   "frmFldVar.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4620
   ScaleWidth      =   5010
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtProcessParameter2 
      Height          =   300
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   12
      ToolTipText     =   "Параметр 2"
      Top             =   3450
      Width           =   2550
   End
   Begin VB.TextBox txtValue 
      Height          =   300
      Left            =   120
      MaxLength       =   255
      TabIndex        =   15
      ToolTipText     =   "Значение"
      Top             =   4155
      Width           =   3000
   End
   Begin VB.TextBox txtProcessParameter 
      Height          =   300
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   9
      ToolTipText     =   "Параметр"
      Top             =   2760
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
   Begin VB.TextBox txtDocumentPart 
      Height          =   300
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   6
      ToolTipText     =   "Раздел документа"
      Top             =   2100
      Width           =   2550
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   3360
      TabIndex        =   16
      Top             =   0
      Width           =   1455
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3360
      TabIndex        =   17
      Top             =   480
      Width           =   1455
   End
   Begin VB.TextBox txtName 
      Height          =   300
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   3000
   End
   Begin MTZ_PANEL.DropButton cmdDocumentPart 
      Height          =   300
      Left            =   2670
      TabIndex        =   7
      Tag             =   "refopen.ico"
      ToolTipText     =   "Раздел документа"
      Top             =   2100
      Width           =   450
      _ExtentX        =   794
      _ExtentY        =   529
      Caption         =   ""
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
      TabIndex        =   10
      Tag             =   "refopen.ico"
      ToolTipText     =   "Параметр"
      Top             =   2760
      Width           =   450
      _ExtentX        =   794
      _ExtentY        =   529
      Caption         =   ""
   End
   Begin MTZ_PANEL.DropButton cmdProcessParameter2 
      Height          =   300
      Left            =   2670
      TabIndex        =   13
      Tag             =   "refopen.ico"
      ToolTipText     =   "Параметр 2"
      Top             =   3450
      Width           =   450
      _ExtentX        =   794
      _ExtentY        =   529
      Caption         =   ""
   End
   Begin VB.Label lblProcessParameter2 
      BackStyle       =   0  'Transparent
      Caption         =   "Переменная:"
      ForeColor       =   &H00000000&
      Height          =   300
      Left            =   120
      TabIndex        =   11
      Top             =   3120
      Width           =   3000
   End
   Begin VB.Label lblValue 
      BackStyle       =   0  'Transparent
      Caption         =   "Имя поля:"
      ForeColor       =   &H00000000&
      Height          =   300
      Left            =   120
      TabIndex        =   14
      Top             =   3825
      Width           =   3000
   End
   Begin VB.Label lblProcessParameter 
      BackStyle       =   0  'Transparent
      Caption         =   "Переменная -номер строки:"
      ForeColor       =   &H00000000&
      Height          =   300
      Left            =   120
      TabIndex        =   8
      Top             =   2520
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
   Begin VB.Label lblDocumentPart 
      BackStyle       =   0  'Transparent
      Caption         =   "Раздел документа:"
      ForeColor       =   &H00000000&
      Height          =   300
      Left            =   120
      TabIndex        =   5
      Top             =   1800
      Width           =   3000
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   3840
      Stretch         =   -1  'True
      Top             =   1200
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
Attribute VB_Name = "frmFldVar"
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

If Not item.WFFD_ATTR1.item(1).DocumentPart Is Nothing Then
  txtDocumentPart.Tag = item.WFFD_ATTR1.item(1).DocumentPart.ID
  txtDocumentPart = item.WFFD_ATTR1.item(1).DocumentPart.Brief
Else
  txtDocumentPart.Tag = ""
  txtDocumentPart = ""
End If
 LoadBtnPictures cmdDocumentPart, cmdDocumentPart.Tag
  cmdDocumentPart.RemoveAllMenu
  cmdDocumentPart.AddMenu "Очистить"

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

If Not item.WFFD_ATTR1.item(1).ProcessParameter2 Is Nothing Then
  txtProcessParameter2.Tag = item.WFFD_ATTR1.item(1).ProcessParameter2.ID
  txtProcessParameter2 = item.WFFD_ATTR1.item(1).ProcessParameter2.Brief
Else
  txtProcessParameter2.Tag = ""
  txtProcessParameter2 = ""
End If
LoadBtnPictures cmdProcessParameter2, cmdProcessParameter2.Tag
cmdProcessParameter2.RemoveAllMenu
cmdProcessParameter2.AddMenu "Очистить"


txtValue = item.WFFD_ATTR1.item(1).the_Value
  
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
  
  If txtDocumentPart.Tag <> "" Then
    Set item.WFFD_ATTR1.item(1).DocumentPart = item.Application.FindRowObject("PART", txtDocumentPart.Tag)
  Else
    Set item.WFFD_ATTR1.item(1).DocumentPart = Nothing
  End If
  
  If txtProcessParameter.Tag <> "" Then
    Set item.WFFD_ATTR1.item(1).ProcessParameter = item.Application.FindRowObject("WFDef_param", txtProcessParameter.Tag)
  Else
    Set item.WFFD_ATTR1.item(1).ProcessParameter = Nothing
  End If
  item.WFFD_ATTR1.item(1).the_Value = txtValue

  If txtProcessParameter2.Tag <> "" Then
    Set item.WFFD_ATTR1.item(1).ProcessParameter2 = item.Application.FindRowObject("WFDef_param", txtProcessParameter2.Tag)
  Else
    Set item.WFFD_ATTR1.item(1).ProcessParameter2 = Nothing
  End If
  
  item.WFFD_ATTR1.item(1).Save
  Unload Me
End Sub


Private Sub cmdDocumentPart_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = item.Application.Manager.GetReferenceDialogEx("PART")
        d.Show vbModal, Me
        If d.OK Then
          txtDocumentPart.Tag = Left(d.ID, 38)
          txtDocumentPart = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdDocumentPart_MenuClick(ByVal sCaption As String)
          txtDocumentPart.Tag = ""
          txtDocumentPart = ""
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


Private Sub cmdProcessParameter2_CLick()
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
          txtProcessParameter2.Tag = Left(d.ID, 38)
          txtProcessParameter2 = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdProcessParameter2_MenuClick(ByVal sCaption As String)
          txtProcessParameter2.Tag = ""
          txtProcessParameter2 = ""
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



