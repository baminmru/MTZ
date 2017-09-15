VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.0#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WFFD_ATTR1 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin MTZ_PANEL.ScrolledWindow Panel 
      Height          =   1000
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1000
      _ExtentX        =   1773
      _ExtentY        =   1773
      Begin MTZ_PANEL.DropButton cmdDocState2 
         Height          =   300
         Left            =   9150
         TabIndex        =   50
         Tag             =   "refopen.ico"
         ToolTipText     =   "Состояние 2"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtDocState2 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   49
         ToolTipText     =   "Состояние 2"
         Top             =   1815
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdDocState1 
         Height          =   300
         Left            =   9150
         TabIndex        =   47
         Tag             =   "refopen.ico"
         ToolTipText     =   "Состояние 1"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtDocState1 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   46
         ToolTipText     =   "Состояние 1"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdProcessParameter4 
         Height          =   300
         Left            =   9150
         TabIndex        =   44
         Tag             =   "refopen.ico"
         ToolTipText     =   "Переменная 4"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtProcessParameter4 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   43
         ToolTipText     =   "Переменная 4"
         Top             =   405
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdProcessParameter3 
         Height          =   300
         Left            =   6000
         TabIndex        =   41
         Tag             =   "refopen.ico"
         ToolTipText     =   "Переменная 3"
         Top             =   6435
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtProcessParameter3 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   40
         ToolTipText     =   "Переменная 3"
         Top             =   6435
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdSubProcessType 
         Height          =   300
         Left            =   6000
         TabIndex        =   38
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип подпроцесса"
         Top             =   5730
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSubProcessType 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   37
         ToolTipText     =   "Тип подпроцесса"
         Top             =   5730
         Width           =   2550
      End
      Begin VB.ComboBox cmbFlag2 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   35
         ToolTipText     =   "Флаг 2"
         Top             =   5025
         Width           =   3000
      End
      Begin VB.ComboBox cmbFlag 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   33
         ToolTipText     =   "Флаг"
         Top             =   4320
         Width           =   3000
      End
      Begin VB.TextBox txtPath2 
         Height          =   1200
         Left            =   3450
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   31
         ToolTipText     =   "Директория для размещения"
         Top             =   2715
         Width           =   3000
      End
      Begin VB.TextBox txtPath 
         Height          =   1200
         Left            =   3450
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   29
         ToolTipText     =   "Директория"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtValue2 
         Height          =   300
         Left            =   3450
         MaxLength       =   255
         TabIndex        =   27
         ToolTipText     =   "Значение2"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtValue 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   25
         ToolTipText     =   "Значение"
         Top             =   6045
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdProcessParameter2 
         Height          =   300
         Left            =   2850
         TabIndex        =   23
         Tag             =   "refopen.ico"
         ToolTipText     =   "Переменная 2"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtProcessParameter2 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   22
         ToolTipText     =   "Переменная 2"
         Top             =   5340
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdProcessParameter 
         Height          =   300
         Left            =   2850
         TabIndex        =   20
         Tag             =   "refopen.ico"
         ToolTipText     =   "Переменная 1"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtProcessParameter 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   19
         ToolTipText     =   "Переменная 1"
         Top             =   4635
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdFolder 
         Height          =   300
         Left            =   2850
         TabIndex        =   17
         Tag             =   "refopen.ico"
         ToolTipText     =   "Папка в каталоге"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFolder 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   16
         ToolTipText     =   "Папка в каталоге"
         Top             =   3930
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdPartField 
         Height          =   300
         Left            =   2850
         TabIndex        =   14
         Tag             =   "refopen.ico"
         ToolTipText     =   "Поле в разделе"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPartField 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   13
         ToolTipText     =   "Поле в разделе"
         Top             =   3225
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdDocumentPart 
         Height          =   300
         Left            =   2850
         TabIndex        =   11
         Tag             =   "refopen.ico"
         ToolTipText     =   "Раздел документа"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtDocumentPart 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   10
         ToolTipText     =   "Раздел документа"
         Top             =   2520
         Width           =   2550
      End
      Begin VB.TextBox txtSubProcDocument 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   8
         ToolTipText     =   "Название документа в подпроцессе"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdProcessDocument 
         Height          =   300
         Left            =   2850
         TabIndex        =   6
         Tag             =   "refopen.ico"
         ToolTipText     =   "Документ процеса"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtProcessDocument 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   5
         ToolTipText     =   "Документ процеса"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdObjectType 
         Height          =   300
         Left            =   2850
         TabIndex        =   3
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тип документа"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtObjectType 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   2
         ToolTipText     =   "Тип документа"
         Top             =   405
         Width           =   2550
      End
      Begin VB.Label lblDocState2 
         BackStyle       =   0  'Transparent
         Caption         =   "Состояние 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   48
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblDocState1 
         BackStyle       =   0  'Transparent
         Caption         =   "Состояние 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   45
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblProcessParameter4 
         BackStyle       =   0  'Transparent
         Caption         =   "Переменная 4:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   42
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblProcessParameter3 
         BackStyle       =   0  'Transparent
         Caption         =   "Переменная 3:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   39
         Top             =   6105
         Width           =   3000
      End
      Begin VB.Label lblSubProcessType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип подпроцесса:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         Top             =   5400
         Width           =   3000
      End
      Begin VB.Label lblFlag2 
         BackStyle       =   0  'Transparent
         Caption         =   "Флаг 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         Top             =   4695
         Width           =   3000
      End
      Begin VB.Label lblFlag 
         BackStyle       =   0  'Transparent
         Caption         =   "Флаг:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         Top             =   3990
         Width           =   3000
      End
      Begin VB.Label lblPath2 
         BackStyle       =   0  'Transparent
         Caption         =   "Директория для размещения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         Top             =   2385
         Width           =   3000
      End
      Begin VB.Label lblPath 
         BackStyle       =   0  'Transparent
         Caption         =   "Директория:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblValue2 
         BackStyle       =   0  'Transparent
         Caption         =   "Значение2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblValue 
         BackStyle       =   0  'Transparent
         Caption         =   "Значение:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   24
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblProcessParameter2 
         BackStyle       =   0  'Transparent
         Caption         =   "Переменная 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   21
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblProcessParameter 
         BackStyle       =   0  'Transparent
         Caption         =   "Переменная 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblFolder 
         BackStyle       =   0  'Transparent
         Caption         =   "Папка в каталоге:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblPartField 
         BackStyle       =   0  'Transparent
         Caption         =   "Поле в разделе:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblDocumentPart 
         BackStyle       =   0  'Transparent
         Caption         =   "Раздел документа:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblSubProcDocument 
         BackStyle       =   0  'Transparent
         Caption         =   "Название документа в подпроцессе:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblProcessDocument 
         BackStyle       =   0  'Transparent
         Caption         =   "Документ процеса:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   4
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblObjectType 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип документа:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WFFD_ATTR1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public item As WFFD.WFFD_ATTR1
   Private OnInit As Boolean
   Public Event Changed()





Private Sub UserControl_Resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtObjectType_Change()
  Changing
End Sub
Private Sub cmdObjectType_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = item.Application.Manager.GetReferenceDialogEx("OBJECTTYPE")
        d.Show vbModal, Me
        If d.OK Then
          txtObjectType.Tag = Left(d.ID, 38)
          txtObjectType = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdObjectType_MenuClick(ByVal sCaption As String)
          txtObjectType.Tag = ""
          txtObjectType = ""
End Sub
Private Sub txtProcessDocument_Change()
  Changing
End Sub
Private Sub cmdProcessDocument_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = item.Application.Manager.GetReferenceDialogEx("WFDef_Doc")
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
Private Sub txtSubProcDocument_Change()
  Changing
End Sub
Private Sub txtDocumentPart_Change()
  Changing
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
Private Sub txtPartField_Change()
  Changing
End Sub
Private Sub cmdPartField_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = item.Application.Manager.GetReferenceDialogEx("FIELD")
        d.Show vbModal, Me
        If d.OK Then
          txtPartField.Tag = Left(d.ID, 38)
          txtPartField = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdPartField_MenuClick(ByVal sCaption As String)
          txtPartField.Tag = ""
          txtPartField = ""
End Sub
Private Sub txtFolder_Change()
  Changing
End Sub
Private Sub cmdFolder_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = item.Application.Manager.GetReferenceDialogEx("Folder")
        d.Show vbModal, Me
        If d.OK Then
          txtFolder.Tag = Left(d.ID, 38)
          txtFolder = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdFolder_MenuClick(ByVal sCaption As String)
          txtFolder.Tag = ""
          txtFolder = ""
End Sub
Private Sub txtProcessParameter_Change()
  Changing
End Sub
Private Sub cmdProcessParameter_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = item.Application.Manager.GetReferenceDialogEx("WFDef_param")
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
Private Sub txtProcessParameter2_Change()
  Changing
End Sub
Private Sub cmdProcessParameter2_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = item.Application.Manager.GetReferenceDialogEx("WFDef_param")
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
Private Sub txtValue_Change()
  Changing
End Sub
Private Sub txtValue2_Change()
  Changing
End Sub
Private Sub txtPath_Change()
  Changing
End Sub
Private Sub txtPath2_Change()
  Changing
End Sub
Private Sub cmbFlag_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub cmbFlag2_Click()
  On Error Resume Next
  Changing
End Sub
Private Sub txtSubProcessType_Change()
  Changing
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
Private Sub txtProcessParameter3_Change()
  Changing
End Sub
Private Sub cmdProcessParameter3_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = item.Application.Manager.GetReferenceDialogEx("WFDef_param")
        d.Show vbModal, Me
        If d.OK Then
          txtProcessParameter3.Tag = Left(d.ID, 38)
          txtProcessParameter3 = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdProcessParameter3_MenuClick(ByVal sCaption As String)
          txtProcessParameter3.Tag = ""
          txtProcessParameter3 = ""
End Sub
Private Sub txtProcessParameter4_Change()
  Changing
End Sub
Private Sub cmdProcessParameter4_CLick()
  On Error Resume Next
        Dim d As Form
        Set d = item.Application.Manager.GetReferenceDialogEx("WFDef_param")
        d.Show vbModal, Me
        If d.OK Then
          txtProcessParameter4.Tag = Left(d.ID, 38)
          txtProcessParameter4 = d.Brief
        End If
        Set d = Nothing
End Sub
Private Sub cmdProcessParameter4_MenuClick(ByVal sCaption As String)
          txtProcessParameter4.Tag = ""
          txtProcessParameter4 = ""
End Sub
Private Sub txtDocState1_Change()
  Changing
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
Private Sub txtDocState2_Change()
  Changing
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
Private Sub UserControl_Terminate()
  Set item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

  IsOK = mIsOK
End Function
Public Sub InitPanel()
OnInit = True
Dim iii As Long ' for combo only
If item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

If Not item.ObjectType Is Nothing Then
  txtObjectType.Tag = item.ObjectType.ID
  txtObjectType = item.ObjectType.Brief
Else
  txtObjectType.Tag = ""
  txtObjectType = ""
End If
 LoadBtnPictures cmdObjectType, cmdObjectType.Tag
  cmdObjectType.RemoveAllMenu
  cmdObjectType.AddMenu "Очистить"
If Not item.ProcessDocument Is Nothing Then
  txtProcessDocument.Tag = item.ProcessDocument.ID
  txtProcessDocument = item.ProcessDocument.Brief
Else
  txtProcessDocument.Tag = ""
  txtProcessDocument = ""
End If
 LoadBtnPictures cmdProcessDocument, cmdProcessDocument.Tag
  cmdProcessDocument.RemoveAllMenu
  cmdProcessDocument.AddMenu "Очистить"
txtSubProcDocument = item.SubProcDocument
If Not item.DocumentPart Is Nothing Then
  txtDocumentPart.Tag = item.DocumentPart.ID
  txtDocumentPart = item.DocumentPart.Brief
Else
  txtDocumentPart.Tag = ""
  txtDocumentPart = ""
End If
 LoadBtnPictures cmdDocumentPart, cmdDocumentPart.Tag
  cmdDocumentPart.RemoveAllMenu
  cmdDocumentPart.AddMenu "Очистить"
If Not item.PartField Is Nothing Then
  txtPartField.Tag = item.PartField.ID
  txtPartField = item.PartField.Brief
Else
  txtPartField.Tag = ""
  txtPartField = ""
End If
 LoadBtnPictures cmdPartField, cmdPartField.Tag
  cmdPartField.RemoveAllMenu
  cmdPartField.AddMenu "Очистить"
If Not item.Folder Is Nothing Then
  txtFolder.Tag = item.Folder.ID
  txtFolder = item.Folder.Brief
Else
  txtFolder.Tag = ""
  txtFolder = ""
End If
 LoadBtnPictures cmdFolder, cmdFolder.Tag
  cmdFolder.RemoveAllMenu
  cmdFolder.AddMenu "Очистить"
If Not item.ProcessParameter Is Nothing Then
  txtProcessParameter.Tag = item.ProcessParameter.ID
  txtProcessParameter = item.ProcessParameter.Brief
Else
  txtProcessParameter.Tag = ""
  txtProcessParameter = ""
End If
 LoadBtnPictures cmdProcessParameter, cmdProcessParameter.Tag
  cmdProcessParameter.RemoveAllMenu
  cmdProcessParameter.AddMenu "Очистить"
If Not item.ProcessParameter2 Is Nothing Then
  txtProcessParameter2.Tag = item.ProcessParameter2.ID
  txtProcessParameter2 = item.ProcessParameter2.Brief
Else
  txtProcessParameter2.Tag = ""
  txtProcessParameter2 = ""
End If
 LoadBtnPictures cmdProcessParameter2, cmdProcessParameter2.Tag
  cmdProcessParameter2.RemoveAllMenu
  cmdProcessParameter2.AddMenu "Очистить"
txtValue = item.the_Value
txtValue2 = item.Value2
txtPath = item.Path
txtPath2 = item.Path2
cmbFlag.Clear
cmbFlag.AddItem "Да"
cmbFlag.ItemData(cmbFlag.NewIndex) = -1
cmbFlag.AddItem "Нет"
cmbFlag.ItemData(cmbFlag.NewIndex) = 0
 For iii = 0 To cmbFlag.ListCount - 1
  If item.Flag = cmbFlag.ItemData(iii) Then
   cmbFlag.ListIndex = iii
   Exit For
  End If
 Next
cmbFlag2.Clear
cmbFlag2.AddItem "Да"
cmbFlag2.ItemData(cmbFlag2.NewIndex) = -1
cmbFlag2.AddItem "Нет"
cmbFlag2.ItemData(cmbFlag2.NewIndex) = 0
 For iii = 0 To cmbFlag2.ListCount - 1
  If item.Flag2 = cmbFlag2.ItemData(iii) Then
   cmbFlag2.ListIndex = iii
   Exit For
  End If
 Next
If Not item.SubProcessType Is Nothing Then
  txtSubProcessType.Tag = item.SubProcessType.ID
  txtSubProcessType = item.SubProcessType.Brief
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
If Not item.ProcessParameter3 Is Nothing Then
  txtProcessParameter3.Tag = item.ProcessParameter3.ID
  txtProcessParameter3 = item.ProcessParameter3.Brief
Else
  txtProcessParameter3.Tag = ""
  txtProcessParameter3 = ""
End If
 LoadBtnPictures cmdProcessParameter3, cmdProcessParameter3.Tag
  cmdProcessParameter3.RemoveAllMenu
  cmdProcessParameter3.AddMenu "Очистить"
If Not item.ProcessParameter4 Is Nothing Then
  txtProcessParameter4.Tag = item.ProcessParameter4.ID
  txtProcessParameter4 = item.ProcessParameter4.Brief
Else
  txtProcessParameter4.Tag = ""
  txtProcessParameter4 = ""
End If
 LoadBtnPictures cmdProcessParameter4, cmdProcessParameter4.Tag
  cmdProcessParameter4.RemoveAllMenu
  cmdProcessParameter4.AddMenu "Очистить"
If Not item.DocState1 Is Nothing Then
  txtDocState1.Tag = item.DocState1.ID
  txtDocState1 = item.DocState1.Brief
Else
  txtDocState1.Tag = ""
  txtDocState1 = ""
End If
 LoadBtnPictures cmdDocState1, cmdDocState1.Tag
  cmdDocState1.RemoveAllMenu
  cmdDocState1.AddMenu "Очистить"
If Not item.DocState2 Is Nothing Then
  txtDocState2.Tag = item.DocState2.ID
  txtDocState2 = item.DocState2.Brief
Else
  txtDocState2.Tag = ""
  txtDocState2 = ""
End If
 LoadBtnPictures cmdDocState2, cmdDocState2.Tag
  cmdDocState2.RemoveAllMenu
  cmdDocState2.AddMenu "Очистить"
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

If txtObjectType.Tag <> "" Then
  Set item.ObjectType = item.Application.FindRowObject("OBJECTTYPE", txtObjectType.Tag)
Else
  Set item.ObjectType = Nothing
End If
If txtProcessDocument.Tag <> "" Then
  Set item.ProcessDocument = item.Application.FindRowObject("WFDef_Doc", txtProcessDocument.Tag)
Else
  Set item.ProcessDocument = Nothing
End If
item.SubProcDocument = txtSubProcDocument
If txtDocumentPart.Tag <> "" Then
  Set item.DocumentPart = item.Application.FindRowObject("PART", txtDocumentPart.Tag)
Else
  Set item.DocumentPart = Nothing
End If
If txtPartField.Tag <> "" Then
  Set item.PartField = item.Application.FindRowObject("FIELD", txtPartField.Tag)
Else
  Set item.PartField = Nothing
End If
If txtFolder.Tag <> "" Then
  Set item.Folder = item.Application.FindRowObject("Folder", txtFolder.Tag)
Else
  Set item.Folder = Nothing
End If
If txtProcessParameter.Tag <> "" Then
  Set item.ProcessParameter = item.Application.FindRowObject("WFDef_param", txtProcessParameter.Tag)
Else
  Set item.ProcessParameter = Nothing
End If
If txtProcessParameter2.Tag <> "" Then
  Set item.ProcessParameter2 = item.Application.FindRowObject("WFDef_param", txtProcessParameter2.Tag)
Else
  Set item.ProcessParameter2 = Nothing
End If
item.the_Value = txtValue
item.Value2 = txtValue2
item.Path = txtPath
item.Path2 = txtPath2
item.Flag = cmbFlag.ItemData(cmbFlag.ListIndex)
item.Flag2 = cmbFlag2.ItemData(cmbFlag2.ListIndex)
If txtSubProcessType.Tag <> "" Then
  Set item.SubProcessType = item.Application.Manager.GetInstanceObject(txtSubProcessType.Tag)
Else
  Set item.SubProcessType = Nothing
End If
If txtProcessParameter3.Tag <> "" Then
  Set item.ProcessParameter3 = item.Application.FindRowObject("WFDef_param", txtProcessParameter3.Tag)
Else
  Set item.ProcessParameter3 = Nothing
End If
If txtProcessParameter4.Tag <> "" Then
  Set item.ProcessParameter4 = item.Application.FindRowObject("WFDef_param", txtProcessParameter4.Tag)
Else
  Set item.ProcessParameter4 = Nothing
End If
If txtDocState1.Tag <> "" Then
  Set item.DocState1 = item.Application.FindRowObject("OBJSTATUS", txtDocState1.Tag)
Else
  Set item.DocState1 = Nothing
End If
If txtDocState2.Tag <> "" Then
  Set item.DocState2 = item.Application.FindRowObject("OBJSTATUS", txtDocState2.Tag)
Else
  Set item.DocState2 = Nothing
End If
 RaiseEvent Changed
End Sub
 Public Sub OptimalSize(x As Single, y As Single)
   Panel.OptimalSize x, y
   x = x + Panel.Left
   y = y + Panel.Top
 End Sub
 
 
 Public Function OptimalY() As Single
   Dim x As Single, y As Single
   Panel.OptimalSize x, y
   OptimalY = y
 End Function
 Public Sub Customize()
   Panel.Customize
 End Sub
 Public Property Get PanelCustomisationString() As String
   PanelCustomisationString = Panel.PanelCustomisationString
 End Property
 Public Property Let PanelCustomisationString(s As String)
   Panel.PanelCustomisationString = s
 End Property
 Public Property Get Enabled() As Boolean
   Enabled = Panel.Enabled
 End Property
 Public Property Let Enabled(ByVal v As Boolean)
   Panel.Enabled = v
 End Property



