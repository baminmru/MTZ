VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
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
   Begin TP_SprGUI.vpnTP_Spr_VrVisInst_ pnlTP_Spr_VrVisInst 
      Height          =   1500
      Left            =   1500
      TabIndex        =   1
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin TP_SprGUI.vpnTP_Spr_Oper_ pnlTP_Spr_Oper 
      Height          =   1500
      Left            =   3000
      TabIndex        =   2
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin TP_SprGUI.vpnTP_Spr_Ing_ pnlTP_Spr_Ing 
      Height          =   1500
      Left            =   4500
      TabIndex        =   3
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin TP_SprGUI.vpnTP_Spr_Metro_ pnlTP_Spr_Metro 
      Height          =   1500
      Left            =   6000
      TabIndex        =   4
      Top             =   0
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin TP_SprGUI.vpnTP_Spr_SrochDog_ pnlTP_Spr_SrochDog 
      Height          =   1500
      Left            =   0
      TabIndex        =   5
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin TP_SprGUI.vpnTP_Spr_Koor_ pnlTP_Spr_Koor 
      Height          =   1500
      Left            =   1500
      TabIndex        =   6
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin TP_SprGUI.vpnRayon_ pnlRayon 
      Height          =   1500
      Left            =   3000
      TabIndex        =   7
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin TP_SprGUI.vpnTP_Spr_Tar_ pnlTP_Spr_Tar 
      Height          =   1500
      Left            =   4500
      TabIndex        =   8
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin TP_SprGUI.vpnTP_SPR_Port_ pnlTP_SPR_Port 
      Height          =   1500
      Left            =   6000
      TabIndex        =   9
      Top             =   1500
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin TP_SprGUI.vpnTP_SPR_MT_ pnlTP_SPR_MT 
      Height          =   1500
      Left            =   0
      TabIndex        =   10
      Top             =   3000
      Visible         =   0   'False
      Width           =   1500
      _ExtentX        =   2646
      _ExtentY        =   2646
   End
   Begin TP_SprGUI.vpnTP_SPR_ZTYPE_ pnlTP_SPR_ZTYPE 
      Height          =   1500
      Left            =   1500
      TabIndex        =   11
      Top             =   3000
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


' Главный контрольный элемент для редактирования документа режим
Public Item As Object
Public Host As GUI
Public ModalMode As Boolean
Public ParentForm As Object
Private TSCustom As MTZ_CUSTOMTAB.TabStripCustomizer






'Получить нужную ширину контрола
'Parameters:
' параметров нет
'Returns:
'  значение типа Long
'See Also:
'Example:
' dim variable as Long
' variable = me. PrefferedWidth
Public Property Get PrefferedWidth() As Long
    PrefferedWidth = 0
End Property


'Задать нужную ширину контрола
'Parameters:
' параметров нет
'Returns:
'  значение типа Long
'See Also:
'Example:
' dim variable as Long
' variable = me. PrefferedHeight
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

'Все панели заполнены правильно
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as BooLEAN
'  variable = me.IsOK()
Public Function IsOK() As Boolean
Dim IsItOk As Boolean
IsItOk = True
On Error Resume Next
If IsItOk Then IsItOk = pnlTP_Spr_VrVisInst.IsOK
If IsItOk Then IsItOk = pnlTP_Spr_Oper.IsOK
If IsItOk Then IsItOk = pnlTP_Spr_Ing.IsOK
If IsItOk Then IsItOk = pnlTP_Spr_Metro.IsOK
If IsItOk Then IsItOk = pnlTP_Spr_SrochDog.IsOK
If IsItOk Then IsItOk = pnlTP_Spr_Koor.IsOK
If IsItOk Then IsItOk = pnlRayon.IsOK
If IsItOk Then IsItOk = pnlTP_Spr_Tar.IsOK
If IsItOk Then IsItOk = pnlTP_SPR_Port.IsOK
If IsItOk Then IsItOk = pnlTP_SPR_MT.IsOK
If IsItOk Then IsItOk = pnlTP_SPR_ZTYPE.IsOK
IsOK = IsItOk
End Function
Private Sub ts_click()
  On Error Resume Next
  pnlTP_SPR_ZTYPE.Visible = False
  pnlTP_SPR_MT.Visible = False
  pnlTP_SPR_Port.Visible = False
  pnlTP_Spr_Tar.Visible = False
  pnlRayon.Visible = False
  pnlTP_Spr_Koor.Visible = False
  pnlTP_Spr_SrochDog.Visible = False
  pnlTP_Spr_Metro.Visible = False
  pnlTP_Spr_Ing.Visible = False
  pnlTP_Spr_Oper.Visible = False
  pnlTP_Spr_VrVisInst.Visible = False

   Select Case ts.SelectedItem.Key
   Case "TP_Spr_VrVisInst"
     With pnlTP_Spr_VrVisInst
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlTP_Spr_VrVisInst.OnClick Item, ParentForm
     End With
   Case "TP_Spr_Oper"
     With pnlTP_Spr_Oper
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlTP_Spr_Oper.OnClick Item, ParentForm
     End With
   Case "TP_Spr_Ing"
     With pnlTP_Spr_Ing
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlTP_Spr_Ing.OnClick Item, ParentForm
     End With
   Case "TP_Spr_Metro"
     With pnlTP_Spr_Metro
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlTP_Spr_Metro.OnClick Item, ParentForm
     End With
   Case "TP_Spr_SrochDog"
     With pnlTP_Spr_SrochDog
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlTP_Spr_SrochDog.OnClick Item, ParentForm
     End With
   Case "TP_Spr_Koor"
     With pnlTP_Spr_Koor
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlTP_Spr_Koor.OnClick Item, ParentForm
     End With
   Case "Rayon"
     With pnlRayon
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlRayon.OnClick Item, ParentForm
     End With
   Case "TP_Spr_Tar"
     With pnlTP_Spr_Tar
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlTP_Spr_Tar.OnClick Item, ParentForm
     End With
   Case "TP_SPR_Port"
     With pnlTP_SPR_Port
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlTP_SPR_Port.OnClick Item, ParentForm
     End With
   Case "TP_SPR_MT"
     With pnlTP_SPR_MT
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlTP_SPR_MT.OnClick Item, ParentForm
     End With
   Case "TP_SPR_ZTYPE"
     With pnlTP_SPR_ZTYPE
     .Top = ts.ClientTop
     .Left = ts.ClientLeft
     .Width = ts.ClientWidth
     .Height = ts.ClientHeight
     .Visible = True
     .ZOrder 0
     pnlTP_SPR_ZTYPE.OnClick Item, ParentForm
     End With
     End Select
End Sub

'Инициализация контрола
'Parameters:
'[IN][OUT]   ObjItem , тип параметра: object,
'[IN][OUT]   MyHost , тип параметра: GUI,
'[IN][OUT]  aModalMode , тип параметра: boolean ,
'[IN][OUT]   aParentForm , тип параметра: object  - ...
'See Also:
'Example:
'  call me.Init({параметры})
Public Sub Init(ObjItem As Object, MyHost As GUI, aModalMode As Boolean, aParentForm As Object)
  On Error Resume Next
 Set Item = ObjItem
 Set Host = MyHost
 Set ParentForm = aParentForm
 ModalMode = aModalMode
  Dim ff As Long, buf As String

ts.Tabs.Item(1).Caption = "Время визита инсталятора"
ts.Tabs.Item(1).Key = "TP_Spr_VrVisInst"
pnlTP_Spr_VrVisInst.OnInit Item, ParentForm
Call ts.Tabs.Add(, "TP_Spr_Oper", "Оператор")
pnlTP_Spr_Oper.OnInit Item, ParentForm
Call ts.Tabs.Add(, "TP_Spr_Ing", "Инженеры")
pnlTP_Spr_Ing.OnInit Item, ParentForm
Call ts.Tabs.Add(, "TP_Spr_Metro", "Метро")
pnlTP_Spr_Metro.OnInit Item, ParentForm
Call ts.Tabs.Add(, "TP_Spr_SrochDog", "Срок договора")
pnlTP_Spr_SrochDog.OnInit Item, ParentForm
Call ts.Tabs.Add(, "TP_Spr_Koor", "Координатор")
pnlTP_Spr_Koor.OnInit Item, ParentForm
Call ts.Tabs.Add(, "Rayon", "Район")
pnlRayon.OnInit Item, ParentForm
Call ts.Tabs.Add(, "TP_Spr_Tar", "Тариф")
pnlTP_Spr_Tar.OnInit Item, ParentForm
Call ts.Tabs.Add(, "TP_SPR_Port", "Порты")
pnlTP_SPR_Port.OnInit Item, ParentForm
Call ts.Tabs.Add(, "TP_SPR_MT", "Тип модема")
pnlTP_SPR_MT.OnInit Item, ParentForm
Call ts.Tabs.Add(, "TP_SPR_ZTYPE", "Тип заявки")
pnlTP_SPR_ZTYPE.OnInit Item, ParentForm
  Set TSCustom = New MTZ_CUSTOMTAB.TabStripCustomizer
  TSCustom.Init ts, "TP_Spr", "ctl_main"
  TSCustom.SetupFromRegistry ts
 ts_click
End Sub
Private Sub UserControl_Terminate()
  On Error Resume Next
  Set Item = Nothing
  Set Host = Nothing
  Set ParentForm = Nothing
  Set TSCustom = Nothing
 pnlTP_Spr_VrVisInst.CloseClass
 pnlTP_Spr_Oper.CloseClass
 pnlTP_Spr_Ing.CloseClass
 pnlTP_Spr_Metro.CloseClass
 pnlTP_Spr_SrochDog.CloseClass
 pnlTP_Spr_Koor.CloseClass
 pnlRayon.CloseClass
 pnlTP_Spr_Tar.CloseClass
 pnlTP_SPR_Port.CloseClass
 pnlTP_SPR_MT.CloseClass
 pnlTP_SPR_ZTYPE.CloseClass
End Sub

'Действие при сохранении
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.OnSave()
Public Sub OnSave()
 pnlTP_Spr_VrVisInst.OnSave
 pnlTP_Spr_Oper.OnSave
 pnlTP_Spr_Ing.OnSave
 pnlTP_Spr_Metro.OnSave
 pnlTP_Spr_SrochDog.OnSave
 pnlTP_Spr_Koor.OnSave
 pnlRayon.OnSave
 pnlTP_Spr_Tar.OnSave
 pnlTP_SPR_Port.OnSave
 pnlTP_SPR_MT.OnSave
 pnlTP_SPR_ZTYPE.OnSave
End Sub

'Был ли изменен после открытия
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
'  variable = me.IsChanged()
Public Function IsChanged() As Boolean
  Dim m_IsChanged As Boolean
  On Error Resume Next
m_IsChanged = m_IsChanged Or pnlTP_Spr_VrVisInst.IsChanged
m_IsChanged = m_IsChanged Or pnlTP_Spr_Oper.IsChanged
m_IsChanged = m_IsChanged Or pnlTP_Spr_Ing.IsChanged
m_IsChanged = m_IsChanged Or pnlTP_Spr_Metro.IsChanged
m_IsChanged = m_IsChanged Or pnlTP_Spr_SrochDog.IsChanged
m_IsChanged = m_IsChanged Or pnlTP_Spr_Koor.IsChanged
m_IsChanged = m_IsChanged Or pnlRayon.IsChanged
m_IsChanged = m_IsChanged Or pnlTP_Spr_Tar.IsChanged
m_IsChanged = m_IsChanged Or pnlTP_SPR_Port.IsChanged
m_IsChanged = m_IsChanged Or pnlTP_SPR_MT.IsChanged
m_IsChanged = m_IsChanged Or pnlTP_SPR_ZTYPE.IsChanged
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



'Количество пунктов меню состояний (строк в комбобоксе)
'Parameters:
' параметров нет
'Returns:
'  значение типа Integer
'See Also:
'Example:
' dim variable as Integer
'  variable = me.StatusMenuCount()
Public Function StatusMenuCount() As Integer
  StatusMenuCount = 0
End Function

'Заполнить меню состояний
'Parameters:
' параметров нет
'Returns:
'  объект класса Object)
'  ,или Nothing
'See Also:
'Example:
' dim variable as Object)
' Set variable = me.SetupStatusMenu()
Public Function SetupStatusMenu(m() As Object)
    Dim i As Long
    On Error Resume Next
    i = 0
End Function

'Отметить текущее состояние и разрешить переходные состояния
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CheckStatusMenu()
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



