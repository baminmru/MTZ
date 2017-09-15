VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl ctl_main 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Tag             =   "Card.ICO"
   Begin MSComctlLib.TabStrip ts 
      Height          =   1500
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   1
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin WMSDGUI.vpnWMSD_GTYPE_ pnlWMSD_GTYPE 
      Height          =   1500
      Left            =   1500
      TabIndex        =   1
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WMSDGUI.vpnWMSD_ZTYPE_ pnlWMSD_ZTYPE 
      Height          =   1500
      Left            =   3000
      TabIndex        =   2
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WMSDGUI.vpnWMSD_PLTYPE_ pnlWMSD_PLTYPE 
      Height          =   1500
      Left            =   4500
      TabIndex        =   3
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WMSDGUI.vpnWMSD_QTYPE_ pnlWMSD_QTYPE 
      Height          =   1500
      Left            =   6000
      TabIndex        =   4
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WMSDGUI.vpnWMSD_ATYPE_ pnlWMSD_ATYPE 
      Height          =   1500
      Left            =   0
      TabIndex        =   5
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WMSDGUI.vpnWMSD_SRV_ pnlWMSD_SRV 
      Height          =   1500
      Left            =   1500
      TabIndex        =   6
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WMSDGUI.vpnWMSD_PART_ pnlWMSD_PART 
      Height          =   1500
      Left            =   3000
      TabIndex        =   7
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WMSDGUI.vpnWMSD_FACTORY_ pnlWMSD_FACTORY 
      Height          =   1500
      Left            =   4500
      TabIndex        =   8
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WMSDGUI.vpnWMSD_KILLPLACE_ pnlWMSD_KILLPLACE 
      Height          =   1500
      Left            =   6000
      TabIndex        =   9
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WMSDGUI.vpnWMSD_COUNTRY_ pnlWMSD_COUNTRY 
      Height          =   1500
      Left            =   0
      TabIndex        =   10
      Top             =   3000
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WMSDGUI.vpnWMSD_CAMERA_ pnlWMSD_CAMERA 
      Height          =   1500
      Left            =   1500
      TabIndex        =   11
      Top             =   3000
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WMSDGUI.vpnWMSD_RULE_ pnlWMSD_RULE 
      Height          =   1500
      Left            =   3000
      TabIndex        =   12
      Top             =   3000
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WMSDGUI.vpnWMSD_OPTTYPE_ pnlWMSD_OPTTYPE 
      Height          =   1500
      Left            =   4500
      TabIndex        =   13
      Top             =   3000
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WMSDGUI.vpnWMSD_MOROZ_ pnlWMSD_MOROZ 
      Height          =   1500
      Left            =   6000
      TabIndex        =   14
      Top             =   3000
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WMSDGUI.vpnWMSD_WH_ pnlWMSD_WH 
      Height          =   1500
      Left            =   0
      TabIndex        =   15
      Top             =   4500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin WMSDGUI.vpnWMSD_EI_ pnlWMSD_EI 
      Height          =   1500
      Left            =   1500
      TabIndex        =   16
      Top             =   4500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin VB.Menu mnuCtl 
      Caption         =   "mnuCtl"
      Visible         =   0   'False
      Begin VB.Menu mnuSetup 
         Caption         =   "Настройка"
      End
   End
End
Attribute VB_Name = "ctl_main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


Public Item As Object
Public Host As GUI
Public ModalMode As Boolean
Public ParentForm As Object
Private TSCustom As MTZ_CUSTOMTAB.TabStripCustomizer





Public Property Get PrefferedWidth() As Long
    PrefferedWidth = 0
End Property

Public Property Get PrefferedHeight() As Long
    PrefferedHeight = 0
End Property

Private Sub mnuSetup_Click()
TSCustom.Setup ts
End Sub
Private Sub ts_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
    PopupMenu mnuCtl
  End If
End Sub
Public Function IsOK() As Boolean
Dim IsItOk As Boolean
IsItOk = True
On Error Resume Next
If IsItOk Then IsItOk = pnlWMSD_GTYPE.IsOK
If IsItOk Then IsItOk = pnlWMSD_ZTYPE.IsOK
If IsItOk Then IsItOk = pnlWMSD_PLTYPE.IsOK
If IsItOk Then IsItOk = pnlWMSD_QTYPE.IsOK
If IsItOk Then IsItOk = pnlWMSD_ATYPE.IsOK
If IsItOk Then IsItOk = pnlWMSD_SRV.IsOK
If IsItOk Then IsItOk = pnlWMSD_PART.IsOK
If IsItOk Then IsItOk = pnlWMSD_FACTORY.IsOK
If IsItOk Then IsItOk = pnlWMSD_KILLPLACE.IsOK
If IsItOk Then IsItOk = pnlWMSD_COUNTRY.IsOK
If IsItOk Then IsItOk = pnlWMSD_CAMERA.IsOK
If IsItOk Then IsItOk = pnlWMSD_RULE.IsOK
If IsItOk Then IsItOk = pnlWMSD_OPTTYPE.IsOK
If IsItOk Then IsItOk = pnlWMSD_MOROZ.IsOK
If IsItOk Then IsItOk = pnlWMSD_WH.IsOK
If IsItOk Then IsItOk = pnlWMSD_EI.IsOK
IsOK = IsItOk
End Function
Private Sub ts_click()
  On Error Resume Next
  pnlWMSD_EI.Visible = False
  pnlWMSD_WH.Visible = False
  pnlWMSD_MOROZ.Visible = False
  pnlWMSD_OPTTYPE.Visible = False
  pnlWMSD_RULE.Visible = False
  pnlWMSD_CAMERA.Visible = False
  pnlWMSD_COUNTRY.Visible = False
  pnlWMSD_KILLPLACE.Visible = False
  pnlWMSD_FACTORY.Visible = False
  pnlWMSD_PART.Visible = False
  pnlWMSD_SRV.Visible = False
  pnlWMSD_ATYPE.Visible = False
  pnlWMSD_QTYPE.Visible = False
  pnlWMSD_PLTYPE.Visible = False
  pnlWMSD_ZTYPE.Visible = False
  pnlWMSD_GTYPE.Visible = False

   Select Case ts.SelectedItem.Key
   Case "WMSD_GTYPE"
     With pnlWMSD_GTYPE
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWMSD_GTYPE.OnClick Item, ParentForm
     End With
   Case "WMSD_ZTYPE"
     With pnlWMSD_ZTYPE
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWMSD_ZTYPE.OnClick Item, ParentForm
     End With
   Case "WMSD_PLTYPE"
     With pnlWMSD_PLTYPE
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWMSD_PLTYPE.OnClick Item, ParentForm
     End With
   Case "WMSD_QTYPE"
     With pnlWMSD_QTYPE
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWMSD_QTYPE.OnClick Item, ParentForm
     End With
   Case "WMSD_ATYPE"
     With pnlWMSD_ATYPE
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWMSD_ATYPE.OnClick Item, ParentForm
     End With
   Case "WMSD_SRV"
     With pnlWMSD_SRV
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWMSD_SRV.OnClick Item, ParentForm
     End With
   Case "WMSD_PART"
     With pnlWMSD_PART
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWMSD_PART.OnClick Item, ParentForm
     End With
   Case "WMSD_FACTORY"
     With pnlWMSD_FACTORY
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWMSD_FACTORY.OnClick Item, ParentForm
     End With
   Case "WMSD_KILLPLACE"
     With pnlWMSD_KILLPLACE
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWMSD_KILLPLACE.OnClick Item, ParentForm
     End With
   Case "WMSD_COUNTRY"
     With pnlWMSD_COUNTRY
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWMSD_COUNTRY.OnClick Item, ParentForm
     End With
   Case "WMSD_CAMERA"
     With pnlWMSD_CAMERA
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWMSD_CAMERA.OnClick Item, ParentForm
     End With
   Case "WMSD_RULE"
     With pnlWMSD_RULE
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWMSD_RULE.OnClick Item, ParentForm
     End With
   Case "WMSD_OPTTYPE"
     With pnlWMSD_OPTTYPE
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWMSD_OPTTYPE.OnClick Item, ParentForm
     End With
   Case "WMSD_MOROZ"
     With pnlWMSD_MOROZ
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWMSD_MOROZ.OnClick Item, ParentForm
     End With
   Case "WMSD_WH"
     With pnlWMSD_WH
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWMSD_WH.OnClick Item, ParentForm
     End With
   Case "WMSD_EI"
     With pnlWMSD_EI
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlWMSD_EI.OnClick Item, ParentForm
     End With
     End Select
End Sub
Public Sub Init(ObjItem As Object, MyHost As GUI, aModalMode As Boolean, aParentForm As Object)
  On Error Resume Next
 Set Item = ObjItem
 Set Host = MyHost
 Set ParentForm = aParentForm
 ModalMode = aModalMode
  Dim ff As Long, buf As String

ts.Tabs.Item(1).Caption = "Тип товара"
ts.Tabs.Item(1).Key = "WMSD_GTYPE"
pnlWMSD_GTYPE.OnInit Item, ParentForm
Call ts.Tabs.Add(, "WMSD_ZTYPE", "Тип зоны")
pnlWMSD_ZTYPE.OnInit Item, ParentForm
Call ts.Tabs.Add(, "WMSD_PLTYPE", "Тип палеты")
pnlWMSD_PLTYPE.OnInit Item, ParentForm
Call ts.Tabs.Add(, "WMSD_QTYPE", "Тип заявки")
pnlWMSD_QTYPE.OnInit Item, ParentForm
Call ts.Tabs.Add(, "WMSD_ATYPE", "Тип операции")
pnlWMSD_ATYPE.OnInit Item, ParentForm
Call ts.Tabs.Add(, "WMSD_SRV", "Услуги")
pnlWMSD_SRV.OnInit Item, ParentForm
Call ts.Tabs.Add(, "WMSD_PART", "Партия товара")
pnlWMSD_PART.OnInit Item, ParentForm
Call ts.Tabs.Add(, "WMSD_FACTORY", "Завод")
pnlWMSD_FACTORY.OnInit Item, ParentForm
Call ts.Tabs.Add(, "WMSD_KILLPLACE", "Бойня")
pnlWMSD_KILLPLACE.OnInit Item, ParentForm
Call ts.Tabs.Add(, "WMSD_COUNTRY", "Страна")
pnlWMSD_COUNTRY.OnInit Item, ParentForm
Call ts.Tabs.Add(, "WMSD_CAMERA", "Камеры")
pnlWMSD_CAMERA.OnInit Item, ParentForm
Call ts.Tabs.Add(, "WMSD_RULE", "Правило формирования партии")
pnlWMSD_RULE.OnInit Item, ParentForm
Call ts.Tabs.Add(, "WMSD_OPTTYPE", "Тип оптимизации")
pnlWMSD_OPTTYPE.OnInit Item, ParentForm
Call ts.Tabs.Add(, "WMSD_MOROZ", "Параметры выморозки")
pnlWMSD_MOROZ.OnInit Item, ParentForm
Call ts.Tabs.Add(, "WMSD_WH", "Склад")
pnlWMSD_WH.OnInit Item, ParentForm
Call ts.Tabs.Add(, "WMSD_EI", "Единица измерения")
pnlWMSD_EI.OnInit Item, ParentForm
  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer
  TSCustom.Init ts, "WMSD", "ctl_main"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub
Private Sub UserControl_Terminate()
  On Error Resume Next
  Set Item = Nothing
  Set Host = Nothing
  Set ParentForm = Nothing
  Set TSCustom = Nothing
 pnlWMSD_GTYPE.CloseClass
 pnlWMSD_ZTYPE.CloseClass
 pnlWMSD_PLTYPE.CloseClass
 pnlWMSD_QTYPE.CloseClass
 pnlWMSD_ATYPE.CloseClass
 pnlWMSD_SRV.CloseClass
 pnlWMSD_PART.CloseClass
 pnlWMSD_FACTORY.CloseClass
 pnlWMSD_KILLPLACE.CloseClass
 pnlWMSD_COUNTRY.CloseClass
 pnlWMSD_CAMERA.CloseClass
 pnlWMSD_RULE.CloseClass
 pnlWMSD_OPTTYPE.CloseClass
 pnlWMSD_MOROZ.CloseClass
 pnlWMSD_WH.CloseClass
 pnlWMSD_EI.CloseClass
End Sub
Public Sub OnSave()
 pnlWMSD_GTYPE.OnSave
 pnlWMSD_ZTYPE.OnSave
 pnlWMSD_PLTYPE.OnSave
 pnlWMSD_QTYPE.OnSave
 pnlWMSD_ATYPE.OnSave
 pnlWMSD_SRV.OnSave
 pnlWMSD_PART.OnSave
 pnlWMSD_FACTORY.OnSave
 pnlWMSD_KILLPLACE.OnSave
 pnlWMSD_COUNTRY.OnSave
 pnlWMSD_CAMERA.OnSave
 pnlWMSD_RULE.OnSave
 pnlWMSD_OPTTYPE.OnSave
 pnlWMSD_MOROZ.OnSave
 pnlWMSD_WH.OnSave
 pnlWMSD_EI.OnSave
End Sub
Public Function IsChanged() As Boolean
  Dim m_IsChanged As Boolean
  On Error Resume Next
m_IsChanged = m_IsChanged Or pnlWMSD_GTYPE.IsChanged
m_IsChanged = m_IsChanged Or pnlWMSD_ZTYPE.IsChanged
m_IsChanged = m_IsChanged Or pnlWMSD_PLTYPE.IsChanged
m_IsChanged = m_IsChanged Or pnlWMSD_QTYPE.IsChanged
m_IsChanged = m_IsChanged Or pnlWMSD_ATYPE.IsChanged
m_IsChanged = m_IsChanged Or pnlWMSD_SRV.IsChanged
m_IsChanged = m_IsChanged Or pnlWMSD_PART.IsChanged
m_IsChanged = m_IsChanged Or pnlWMSD_FACTORY.IsChanged
m_IsChanged = m_IsChanged Or pnlWMSD_KILLPLACE.IsChanged
m_IsChanged = m_IsChanged Or pnlWMSD_COUNTRY.IsChanged
m_IsChanged = m_IsChanged Or pnlWMSD_CAMERA.IsChanged
m_IsChanged = m_IsChanged Or pnlWMSD_RULE.IsChanged
m_IsChanged = m_IsChanged Or pnlWMSD_OPTTYPE.IsChanged
m_IsChanged = m_IsChanged Or pnlWMSD_MOROZ.IsChanged
m_IsChanged = m_IsChanged Or pnlWMSD_WH.IsChanged
m_IsChanged = m_IsChanged Or pnlWMSD_EI.IsChanged
  IsChanged = m_IsChanged
End Function
Private Sub UserControl_Resize()
 On Error Resume Next
ts.Top = 0
ts.Left = 0
ts.Width = UserControl.Width
ts.Height = UserControl.Height
ts_click
End Sub

'переместить клиента в каталоге
'{5CB1388C-1623-4B36-A775-00B70BEE27AF}
Private Sub Run_VBMoveVRC(VRCATFolder As Variant, Optional RowItem As Object)
On Error Resume Next

'do nothing
End Sub



'Так же проверяет Square >0
'{53371FFA-B514-447A-A1F9-26EE4FD409C9}
Private Sub Run_VBUpdateObjNamePEO(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
RowItem.Application.Name = Name
RowItem.Application.Save

End Sub



'Передать права объекту контактное лицо от объекта клиент
'{79DED4FD-045C-45F8-AC79-2E5A3D956D97}
Private Sub Run_VBMigrateRight(Optional RowItem As Object)
On Error Resume Next

'Migrate security
On Error GoTo bye
  If RowItem.Person Is Nothing Then Exit Sub

  RowItem.Person.Secure Item.SecureStyleid
  RowItem.Person.Propagate
bye:
  Exit Sub
  MsgBox err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Проверка наличия коллекции характеристик
'{79E6BDEB-91D5-4B2E-81F7-3E091FB65E3A}
Private Sub Run_VBCheckDescrs(DesPartName As Variant, Optional RowItem As Object)
On Error Resume Next

    On Error Resume Next

    Dim part_col As Variant
    Dim part_item As Object
    Set part_col = CallByName(RowItem.Parent.Parent, DesPartName, VbGet, False)
    Set part_item = part_col.Item(1)
    If RowItem.Parent.Count = 1 Then
        If part_item.HasDescrs = -1 Then
            part_item.HasDescrs = 0
        Else
            part_item.HasDescrs = -1
        End If
    End If
    part_item.Save

End Sub



'Применить стиль защиты для объекта Предназначен для каталога клиентов
'{31EC6CF7-8DBD-4EFE-BF12-4D168F653D34}
Private Sub Run_VBApplySecurity(Optional RowItem As Object)
On Error Resume Next

'Apply security
On Error GoTo bye
  If RowItem.Client Is Nothing Then Exit Sub
  If RowItem.Parent.Parent.AccessLevel Is Nothing Then Exit Sub
  RowItem.Client.Secure RowItem.Parent.Parent.AccessLevel.ID
  RowItem.Client.Propagate
  Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Усановка стиля защиты"
End Sub



'Создание отчета из разных карточек
'{5B8FB7B9-D8B1-4CA0-90AF-55F83D1A6E5D}
Private Sub Run_VBMakeReport(ReportType As Variant, Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 'ID = CreateGUID2
 'Call RowItem.Application.Manager.NewInstance(ID, "VRRPT", "Отчет " & Date)
 'Set RowItem.Report = RowItem.Application.Manager.GetInstanceObject(ID)
 If RowItem.Report.VRRPT_MAIN.Count = 0 Then
  Set Obj = RowItem.Report.VRRPT_MAIN.Add
 Else
  Set Obj = RowItem.Report.VRRPT_MAIN.Item(1)
 End If
 
 Set Obj.Author = RowItem.Application.FindRowObject("Users", Item.Application.MTZSession.GetSessionUserID())
 Obj.TheDate = Date
 
 If ReportType = "CLNT" Then
   Set Obj.Client = RowItem.Application
 End If
 If ReportType = "PRJ" Then
   Set Obj.Project = RowItem.Application
 End If
 If ReportType = "CONT" Then
   Set Obj.Contract = RowItem.Application
 End If
 If ReportType = "PERS" Then
   Set Obj.Person = RowItem.Application
 End If
 
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание отчета"
End Sub



'
'{AA4085E6-745B-4A37-8EC4-65D99A653966}
Private Sub Run_VBRemoveSymmetricObjRef(ForwardFieldName As Variant, ObjTypeName As Variant, SymmetricPartName As Variant, SymmetricFieldName As Variant, Optional RowItem As Object)
On Error Resume Next

    Dim OK As Boolean
    Dim ID As String
    Dim brief As String

    On Error Resume Next
'     On Error GoTo bye

    Dim Obj As Object
    Dim part_col As Variant
    Dim part_item As Object
    Set Obj = CallByName(RowItem, ForwardFieldName, VbGet)
    Set part_col = CallByName(Obj, SymmetricPartName, VbGet, False)
    part_col.Filter = SymmetricFieldName + "='" + RowItem.Application.ID + "'"
'    RowItem.Parent.Remove RowItem.ID
    Set part_item = part_col.Item(1)
    part_col.Delete part_item.ID
    Exit Sub
bye:
Resume

End Sub



'Создать новую оплату из клиента
'{42A1A436-8AA2-4F1F-999B-6680DFF514DE}
Private Sub Run_VBNewPayIn(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKP", "Платеж " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKP_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.PEKP_DEF.Add
 Else
  Set Obj = RowItem.TheDocument.PEKP_DEF.Item(1)
 End If
 
 Set Obj.FromClient = RowItem.Application
 Obj.PLPDate = Date
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Платежа"
End Sub



'Для раздела, в котором есть поле - ссылка, создает/выбирает объект без открытия окна редактирования ссылки
'{A2EEE876-54D8-4AED-B124-775F5DA2D911}
Private Sub Run_VBAddObjByRef(ObjTypeName As Variant, ForwardFieldName As Variant, SymmetricPartName As Variant, SymmetricFieldName As Variant, Optional RowItem As Object)
On Error Resume Next

    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
    Dim Mode As String
    Dim ResObject As Object
    On Error Resume Next
    Mode = Mid(TypeName(Me), InStr(TypeName(Me), "_") + 1)
    
'     On Error GoTo bye
    If Len(Mode) = 0 Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", ObjTypeName)
    Else
        ID = CreateGUID2
        If Len(ObjTypeName) = 0 Then
            Dim newObj As Object
            Set newObj = Item.Application.Manager.GetNewObject
            If Not (newObj Is Nothing) Then
                OK = True
                ID = newObj.ID
            End If
        Else
            OK = Item.Application.Manager.NewInstance(ID, ObjTypeName, "")
        End If
        Dim ref As Object, objGui As Object
        Set ref = Item.Application.Manager.GetInstanceObject(ID)
        If Not ref Is Nothing Then
          Set objGui = Item.Application.Manager.GetInstanceGUI(ID)
          If objGui Is Nothing Then Set ref = Nothing: Exit Sub
          objGui.Show "", ref, False
          Set objGui = Nothing
        Else
          OK = False
        End If
    End If
    Dim Obj As Object
    Set Obj = Item.Application.Manager.GetInstanceObject(ID)
    If Obj Is Nothing Then
        OK = False
    End If
    If OK Then
  Dim Coll As New Collection
        Dim part_col As Variant
        Dim part_item As Object
        CallByName RowItem, ForwardFieldName, VbSet, Obj
        Coll.Add TypeName(RowItem) + ":" + RowItem.ID
        RowItem.Save
        If Len(SymmetricPartName) > 0 And Len(SymmetricFieldName) > 0 Then
          Set part_col = CallByName(Obj, SymmetricPartName, VbGet, True)
          Set part_item = part_col.Add
          CallByName part_item, SymmetricFieldName, VbSet, RowItem.Application
          part_item.Save
          Coll.Add SymmetricPartName + ":" + part_item.ID
        End If
        Call Item.Application.Manager.AddCustomObjects(Coll, Obj.ID)
    Else
        RowItem.Parent.Remove RowItem.ID
    End If
    Exit Sub
bye:
Resume
End Sub



'
'{5B376AF5-339B-4365-BA80-785E28BCF4DA}
Private Sub Run_VBUpdateSymmetricObjRef(SymmetricFieldName As Variant, ForwardFieldName As Variant, SymmetricPartName As Variant, ObjTypeName As Variant, Optional RowItem As Object)
On Error Resume Next

 
End Sub



'Создать новый платеж из клиента
'{2BB30818-90ED-4627-8ABB-85B3FBA46750}
Private Sub Run_VBNewPayOut(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKO", "Оплата " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKO_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.PEKO_DEF.Add
 Else
  Set Obj = RowItem.TheDocument.PEKO_DEF.Item(1)
 End If
 
 Set Obj.ToClient = RowItem.Application
 Obj.PLPDate = Date
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Платежа"
End Sub



'открытие карточки по идентификатору
'{94E8F6DB-106A-44DC-9483-86C801798FF0}
Private Sub Run_VBOpenRef(StartMode As Variant, ID As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
If ID <> "" Then
    Dim Obj As Object
    Set Obj = Item.Manager.GetInstanceObject(ID)
    If Not Obj Is Nothing Then
      Dim objGui As Object
      Set objGui = Item.Manager.GetInstanceGUI(Obj.ID)
      If objGui Is Nothing Then Exit Sub

       If StartMode = "AUTO" Then
        StartMode = ""
        Dim i As Long
        For i = 100 To 0 Step -10
          If Obj.MTZSession.CheckRight(Obj.SecureStyleid, Obj.TypeName & ":" & "M" & i) Then
            StartMode = "M" & i
            Exit For
          End If
        Next
       End If
      
      objGui.Show StartMode & "", Obj
      Set objGui = Nothing
    End If
  End If
  
End Sub



'
'{069956DC-3305-45EF-9331-91CE323B5942}
Private Sub Run_WFDefName(Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
Item.Name = RowItem.Description
ParentForm.Caption = Item.Name
Item.Save
End Sub



'
'{D8914FB4-6B5D-491A-A72F-985617727583}
Private Sub Run_WFFuncName(Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
Item.Name = RowItem.Name
ParentForm.Caption = Item.Name
Item.Save
End Sub



'Обновление Имени объекта
'{61393545-ABF7-46F7-82F3-9B7E610DD9C0}
Private Sub Run_VBUpdateObjName(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
RowItem.Application.Name = Name
RowItem.Application.Save
End Sub



'Метод создает новый элемент в иерархии Имущественных Комплексов (приложение RealEstate) при создании нового элемента к нему линкуется объект ИК, форма которого и вызывается на редактирование
'{477B8D25-4FF7-491A-A0B0-D3437EC16957}
Private Sub Run_MakeNewFolderEC(FolderID As Variant, Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
 Dim ID As String
 Dim Obj As Object ' EstComplex.Application ' Object
 Dim GObj As Object
 Dim fold As Object 'EstCatalog.Application ' Object
 
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "EstComplex", RowItem.TheName & " " & Date)
 Set Obj = RowItem.Application.Manager.GetInstanceObject(ID)
 If Obj.EC_Def.Count = 0 Then
    With Obj.EC_Def.Add
        .TheName = RowItem.TheName
    End With
 Else
    Obj.EC_Def.Item(1).TheName = RowItem.TheName
 End If
 Obj.Save
 Set RowItem.LinkedEC = Obj
 RowItem.Save
 Set GObj = RowItem.Application.Manager.GetInstanceGUI(Obj.ID)
 GObj.Show "", Obj, True 'False
 Set Obj = RowItem.Application.Manager.GetInstanceObject(ID)
 RowItem.TheName = Obj.EC_Def.Item(1).TheName
 RowItem.Save
 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание ИК"

End Sub



'Изменить название объекта
'{4FB59D1A-0123-47D3-9F4F-E12085C5D074}
Private Sub Run_VBUpdateItemName(Name As Variant, Optional RowItem As Object)
On Error Resume Next

On Error Resume Next
Item.Name = Name
' может не быть формы, если используем просто ActiveX
ParentForm.Caption = Item.Name
Item.Save
End Sub



'Создать заявку из клиента
'{49EA5CBF-93CF-41A8-B1F1-E37FE4D59EA5}
Private Sub Run_VBNewZayavka(Optional RowItem As Object)
On Error Resume Next

On Error GoTo bye
Dim ID As String
 Dim Obj As Object
 ID = CreateGUID2
 Call RowItem.Application.Manager.NewInstance(ID, "PEKZ", "Заявка " & Date)
 Set RowItem.TheDocument = RowItem.Application.Manager.GetInstanceObject(ID)

 If RowItem.TheDocument.PEKO_DEF.Count = 0 Then
  Set Obj = RowItem.TheDocument.PEKZ_DEF.Add
 Else
  Set Obj = RowItem.TheDocument.PEKZ_DEF.Item(1)
 End If
 
 Set Obj.ClientFrom = RowItem.Application
 Obj.QueryDate = Date
 Obj.Save
 RowItem.Save

 Exit Sub
bye:
  MsgBox err.Description, vbOKOnly + vbCritical, "Создание Заявки"
End Sub


Public Function StatusMenuCount() As Integer
  StatusMenuCount = 0
End Function
Public Function SetupStatusMenu(m() As Object)
    Dim i As Long
    On Error Resume Next
    i = 0
End Function
Public Sub CheckStatusMenu(m() As Object)
    Dim i As Long
    On Error Resume Next
    For i = 1 To StatusMenuCount
        m(i).Checked = False
        m(i).Enabled = False
        If Not Item Is Nothing Then
          If m(i).Tag = Item.Statusid Then
            m(i).Checked = True
          End If
        End If
    Next
    If Not Item Is Nothing Then
   End If
End Sub



