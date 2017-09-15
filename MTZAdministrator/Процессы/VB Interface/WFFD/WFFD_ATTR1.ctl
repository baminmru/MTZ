VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
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
      Begin VB.TextBox txtthe_Value 
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
      Begin VB.Label lblthe_Value 
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



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean





Public Function IsChanged() As Boolean
  IsChanged = mIsChanged
End Function
Private Sub Usercontrol_resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtObjectType_Change()
  Changing

End Sub
Private Sub cmdObjectType_CLick()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("OBJECTTYPE", id, brief) Then
          txtObjectType.Tag = Left(id, 38)
          txtObjectType = brief
        End If
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
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WFDef_Doc", id, brief) Then
          txtProcessDocument.Tag = Left(id, 38)
          txtProcessDocument = brief
        End If
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
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PART", id, brief) Then
          txtDocumentPart.Tag = Left(id, 38)
          txtDocumentPart = brief
        End If
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
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("FIELD", id, brief) Then
          txtPartField.Tag = Left(id, 38)
          txtPartField = brief
        End If
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
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("Folder", id, brief) Then
          txtFolder.Tag = Left(id, 38)
          txtFolder = brief
        End If
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
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WFDef_param", id, brief) Then
          txtProcessParameter.Tag = Left(id, 38)
          txtProcessParameter = brief
        End If
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
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WFDef_param", id, brief) Then
          txtProcessParameter2.Tag = Left(id, 38)
          txtProcessParameter2 = brief
        End If
End Sub
Private Sub cmdProcessParameter2_MenuClick(ByVal sCaption As String)
          txtProcessParameter2.Tag = ""
          txtProcessParameter2 = ""
End Sub
Private Sub txtthe_Value_Change()
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
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim id As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtSubProcessType.Tag = ""
          txtSubProcessType = ""
  End If
  If sCaption = "Открыть" Then
    If txtSubProcessType.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtSubProcessType.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtSubProcessType.Tag)
    obj.Show "", inst, True
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(id, brief, "", "WFDef")
        If OK Then
          txtSubProcessType.Tag = Left(id, 38)
          txtSubProcessType = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        id = CreateGUID2
        Item.Application.Manager.NewInstance id, "WFDef", "Определение процесса " & Now
        Set obj = Item.Application.Manager.GetInstanceObject(id)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.id)
          Gobj.Show "", obj, True
          Set obj = Item.Application.Manager.GetInstanceObject(obj.id)
          If (Not obj Is Nothing) Then
              txtSubProcessType.Tag = obj.id
              txtSubProcessType = obj.brief
          Else
              txtSubProcessType.Tag = ""
              txtSubProcessType = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtProcessParameter3_Change()
  Changing

End Sub
Private Sub cmdProcessParameter3_CLick()
  On Error Resume Next
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WFDef_param", id, brief) Then
          txtProcessParameter3.Tag = Left(id, 38)
          txtProcessParameter3 = brief
        End If
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
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("WFDef_param", id, brief) Then
          txtProcessParameter4.Tag = Left(id, 38)
          txtProcessParameter4 = brief
        End If
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
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("OBJSTATUS", id, brief) Then
          txtDocState1.Tag = Left(id, 38)
          txtDocState1 = brief
        End If
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
        Dim id As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("OBJSTATUS", id, brief) Then
          txtDocState2.Tag = Left(id, 38)
          txtDocState2 = brief
        End If
End Sub
Private Sub cmdDocState2_MenuClick(ByVal sCaption As String)
          txtDocState2.Tag = ""
          txtDocState2 = ""
End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
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
If Item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

If Not Item.ObjectType Is Nothing Then
  txtObjectType.Tag = Item.ObjectType.id
  txtObjectType = Item.ObjectType.brief
Else
  txtObjectType.Tag = ""
  txtObjectType = ""
End If
 LoadBtnPictures cmdObjectType, cmdObjectType.Tag
  cmdObjectType.RemoveAllMenu
  cmdObjectType.AddMenu "Очистить"
If Not Item.ProcessDocument Is Nothing Then
  txtProcessDocument.Tag = Item.ProcessDocument.id
  txtProcessDocument = Item.ProcessDocument.brief
Else
  txtProcessDocument.Tag = ""
  txtProcessDocument = ""
End If
 LoadBtnPictures cmdProcessDocument, cmdProcessDocument.Tag
  cmdProcessDocument.RemoveAllMenu
  cmdProcessDocument.AddMenu "Очистить"
txtSubProcDocument = Item.SubProcDocument
If Not Item.DocumentPart Is Nothing Then
  txtDocumentPart.Tag = Item.DocumentPart.id
  txtDocumentPart = Item.DocumentPart.brief
Else
  txtDocumentPart.Tag = ""
  txtDocumentPart = ""
End If
 LoadBtnPictures cmdDocumentPart, cmdDocumentPart.Tag
  cmdDocumentPart.RemoveAllMenu
  cmdDocumentPart.AddMenu "Очистить"
If Not Item.PartField Is Nothing Then
  txtPartField.Tag = Item.PartField.id
  txtPartField = Item.PartField.brief
Else
  txtPartField.Tag = ""
  txtPartField = ""
End If
 LoadBtnPictures cmdPartField, cmdPartField.Tag
  cmdPartField.RemoveAllMenu
  cmdPartField.AddMenu "Очистить"
If Not Item.Folder Is Nothing Then
  txtFolder.Tag = Item.Folder.id
  txtFolder = Item.Folder.brief
Else
  txtFolder.Tag = ""
  txtFolder = ""
End If
 LoadBtnPictures cmdFolder, cmdFolder.Tag
  cmdFolder.RemoveAllMenu
  cmdFolder.AddMenu "Очистить"
If Not Item.ProcessParameter Is Nothing Then
  txtProcessParameter.Tag = Item.ProcessParameter.id
  txtProcessParameter = Item.ProcessParameter.brief
Else
  txtProcessParameter.Tag = ""
  txtProcessParameter = ""
End If
 LoadBtnPictures cmdProcessParameter, cmdProcessParameter.Tag
  cmdProcessParameter.RemoveAllMenu
  cmdProcessParameter.AddMenu "Очистить"
If Not Item.ProcessParameter2 Is Nothing Then
  txtProcessParameter2.Tag = Item.ProcessParameter2.id
  txtProcessParameter2 = Item.ProcessParameter2.brief
Else
  txtProcessParameter2.Tag = ""
  txtProcessParameter2 = ""
End If
 LoadBtnPictures cmdProcessParameter2, cmdProcessParameter2.Tag
  cmdProcessParameter2.RemoveAllMenu
  cmdProcessParameter2.AddMenu "Очистить"
txtthe_Value = Item.the_Value
txtValue2 = Item.Value2
txtPath = Item.Path
txtPath2 = Item.Path2
cmbFlag.Clear
cmbFlag.AddItem "Да"
cmbFlag.ItemData(cmbFlag.NewIndex) = -1
cmbFlag.AddItem "Нет"
cmbFlag.ItemData(cmbFlag.NewIndex) = 0
 For iii = 0 To cmbFlag.ListCount - 1
  If Item.Flag = cmbFlag.ItemData(iii) Then
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
  If Item.Flag2 = cmbFlag2.ItemData(iii) Then
   cmbFlag2.ListIndex = iii
   Exit For
  End If
 Next
If Not Item.SubProcessType Is Nothing Then
  txtSubProcessType.Tag = Item.SubProcessType.id
  txtSubProcessType = Item.SubProcessType.brief
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
If Not Item.ProcessParameter3 Is Nothing Then
  txtProcessParameter3.Tag = Item.ProcessParameter3.id
  txtProcessParameter3 = Item.ProcessParameter3.brief
Else
  txtProcessParameter3.Tag = ""
  txtProcessParameter3 = ""
End If
 LoadBtnPictures cmdProcessParameter3, cmdProcessParameter3.Tag
  cmdProcessParameter3.RemoveAllMenu
  cmdProcessParameter3.AddMenu "Очистить"
If Not Item.ProcessParameter4 Is Nothing Then
  txtProcessParameter4.Tag = Item.ProcessParameter4.id
  txtProcessParameter4 = Item.ProcessParameter4.brief
Else
  txtProcessParameter4.Tag = ""
  txtProcessParameter4 = ""
End If
 LoadBtnPictures cmdProcessParameter4, cmdProcessParameter4.Tag
  cmdProcessParameter4.RemoveAllMenu
  cmdProcessParameter4.AddMenu "Очистить"
If Not Item.DocState1 Is Nothing Then
  txtDocState1.Tag = Item.DocState1.id
  txtDocState1 = Item.DocState1.brief
Else
  txtDocState1.Tag = ""
  txtDocState1 = ""
End If
 LoadBtnPictures cmdDocState1, cmdDocState1.Tag
  cmdDocState1.RemoveAllMenu
  cmdDocState1.AddMenu "Очистить"
If Not Item.DocState2 Is Nothing Then
  txtDocState2.Tag = Item.DocState2.id
  txtDocState2 = Item.DocState2.brief
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

 mIsChanged = True
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

If txtObjectType.Tag <> "" Then
  Set Item.ObjectType = Item.Application.FindRowObject("OBJECTTYPE", txtObjectType.Tag)
Else
  Set Item.ObjectType = Nothing
End If
If txtProcessDocument.Tag <> "" Then
  Set Item.ProcessDocument = Item.Application.FindRowObject("WFDef_Doc", txtProcessDocument.Tag)
Else
  Set Item.ProcessDocument = Nothing
End If
Item.SubProcDocument = txtSubProcDocument
If txtDocumentPart.Tag <> "" Then
  Set Item.DocumentPart = Item.Application.FindRowObject("PART", txtDocumentPart.Tag)
Else
  Set Item.DocumentPart = Nothing
End If
If txtPartField.Tag <> "" Then
  Set Item.PartField = Item.Application.FindRowObject("FIELD", txtPartField.Tag)
Else
  Set Item.PartField = Nothing
End If
If txtFolder.Tag <> "" Then
  Set Item.Folder = Item.Application.FindRowObject("Folder", txtFolder.Tag)
Else
  Set Item.Folder = Nothing
End If
If txtProcessParameter.Tag <> "" Then
  Set Item.ProcessParameter = Item.Application.FindRowObject("WFDef_param", txtProcessParameter.Tag)
Else
  Set Item.ProcessParameter = Nothing
End If
If txtProcessParameter2.Tag <> "" Then
  Set Item.ProcessParameter2 = Item.Application.FindRowObject("WFDef_param", txtProcessParameter2.Tag)
Else
  Set Item.ProcessParameter2 = Nothing
End If
Item.the_Value = txtthe_Value
Item.Value2 = txtValue2
Item.Path = txtPath
Item.Path2 = txtPath2
 If cmbFlag.ListIndex >= 0 Then
   Item.Flag = cmbFlag.ItemData(cmbFlag.ListIndex)
 End If
 If cmbFlag2.ListIndex >= 0 Then
   Item.Flag2 = cmbFlag2.ItemData(cmbFlag2.ListIndex)
 End If
If txtSubProcessType.Tag <> "" Then
  Set Item.SubProcessType = Item.Application.Manager.GetInstanceObject(txtSubProcessType.Tag)
Else
  Set Item.SubProcessType = Nothing
End If
If txtProcessParameter3.Tag <> "" Then
  Set Item.ProcessParameter3 = Item.Application.FindRowObject("WFDef_param", txtProcessParameter3.Tag)
Else
  Set Item.ProcessParameter3 = Nothing
End If
If txtProcessParameter4.Tag <> "" Then
  Set Item.ProcessParameter4 = Item.Application.FindRowObject("WFDef_param", txtProcessParameter4.Tag)
Else
  Set Item.ProcessParameter4 = Nothing
End If
If txtDocState1.Tag <> "" Then
  Set Item.DocState1 = Item.Application.FindRowObject("OBJSTATUS", txtDocState1.Tag)
Else
  Set Item.DocState1 = Nothing
End If
If txtDocState2.Tag <> "" Then
  Set Item.DocState2 = Item.Application.FindRowObject("OBJSTATUS", txtDocState2.Tag)
Else
  Set Item.DocState2 = Nothing
End If
 mIsChanged = False
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



