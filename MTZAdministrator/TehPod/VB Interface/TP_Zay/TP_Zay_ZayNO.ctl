VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl TP_Zay_ZayNO 
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
      Begin VB.TextBox txtNumDogovor 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   20
         ToolTipText     =   "����� ��������"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.ComboBox cmbDopSogl 
         Enabled         =   0   'False
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   18
         ToolTipText     =   "�������������� ����������"
         Top             =   5340
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpDataOtpravVKEY 
         Height          =   300
         Left            =   300
         TabIndex        =   16
         ToolTipText     =   "���� �������� � ���"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   16515075
         CurrentDate     =   39853
      End
      Begin VB.ComboBox cmbOtprVKEY 
         Enabled         =   0   'False
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   14
         ToolTipText     =   "���������� � ���"
         Top             =   3930
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheOperator 
         Height          =   300
         Left            =   2850
         TabIndex        =   12
         Tag             =   "refopen.ico"
         ToolTipText     =   "��������"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtTheOperator 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   11
         ToolTipText     =   "��������"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.TextBox txtFIO 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   9
         ToolTipText     =   "���"
         Top             =   2520
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdZType 
         Height          =   300
         Left            =   2850
         TabIndex        =   7
         Tag             =   "refopen.ico"
         ToolTipText     =   "��� ������"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtZType 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   6
         ToolTipText     =   "��� ������"
         Top             =   1815
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpDataPriem 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "���� ������"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   16515075
         CurrentDate     =   39853
      End
      Begin VB.TextBox txtNum 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "����� ������ "
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblNumDogovor 
         BackStyle       =   0  'Transparent
         Caption         =   "����� ��������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblDopSogl 
         BackStyle       =   0  'Transparent
         Caption         =   "�������������� ����������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblDataOtpravVKEY 
         BackStyle       =   0  'Transparent
         Caption         =   "���� �������� � ���:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblOtprVKEY 
         BackStyle       =   0  'Transparent
         Caption         =   "���������� � ���:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblTheOperator 
         BackStyle       =   0  'Transparent
         Caption         =   "��������:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblFIO 
         BackStyle       =   0  'Transparent
         Caption         =   "���:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblZType 
         BackStyle       =   0  'Transparent
         Caption         =   "��� ������:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblDataPriem 
         BackStyle       =   0  'Transparent
         Caption         =   "���� ������:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblNum 
         BackStyle       =   0  'Transparent
         Caption         =   "����� ������ :"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "TP_Zay_ZayNO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'������ �������������� �������
   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean






'������� ������ ������
'Parameters:
'[IN][OUT]  Runner , ��� ���������: mtzmanager.main,
'[IN]   TypeName , ��� ���������: String,
'[IN][OUT]   ID , ��� ���������: string,
'[IN][OUT]   Brief , ��� ���������: string,
'[IN][OUT]   Cancel , ��� ���������: boolean  - ...
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as Boolean
' variable = me.findObject(...���������...)
Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef Brief As String, ByRef Cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, Brief, Cancel)
bye:
findObject = result
End Function

'������� ��������� ������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as Boolean
'  variable = me.IsChanged()
Public Function IsChanged() As Boolean
  IsChanged = mIsChanged
End Function
Private Sub Usercontrol_resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub txtNum_Change()
  Changing

End Sub
Private Sub dtpDataPriem_Change()
  Changing

End Sub
Private Sub txtZType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdZType_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdZType_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub txtFIO_Change()
  Changing

End Sub
Private Sub txtTheOperator_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheOperator_CLick()
  On Error Resume Next
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmdTheOperator_MenuClick(ByVal sCaption As String)
        MsgBox "����� �� ��������������� ��������������", vbInformation
End Sub
Private Sub cmbOtprVKEY_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub dtpDataOtpravVKEY_Change()
  Changing

End Sub
Private Sub cmbDopSogl_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtNumDogovor_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub

'�������� ������������ ���������� ������ �� ������ ��������������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
'  variable = me.IsOK()
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtNum.Text)
If mIsOK Then mIsOK = IsSet(dtpDataPriem.Value)
If mIsOK Then mIsOK = txtZType.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtFIO.Text)
  IsOK = mIsOK
End Function
Private Function AddSQLRefIds(ByVal strTo As String, ByVal fldName As String, ByVal strFrom As String) As String
  Dim XMLDocFrom As New DOMDocument
  Dim XMLDocTo As New DOMDocument
  AddSQLRefIds = strTo
  On Error GoTo err
  Call XMLDocTo.loadXML(strTo)
  Call XMLDocFrom.loadXML(strFrom)
  Dim Node As MSXML2.IXMLDOMNode
  Dim ID As String
  For Each Node In XMLDocFrom.childNodes.Item(0).childNodes
    If (Node.baseName = "ID") Then
      ID = Node.Text
      Dim NodeTO As MSXML2.IXMLDOMNode
      Dim bAdded As Boolean
      bAdded = False
      For Each NodeTO In XMLDocTo.childNodes.Item(0).childNodes
       If (NodeTO.baseName = fldName & "ID") Then
         NodeTO.Text = ID
         bAdded = True
         Exit For
       End If
      Next
      If (Not bAdded) Then
       Dim newNode As MSXML2.IXMLDOMNode
       Set newNode = XMLDocTo.createNode(MSXML2.NODE_ELEMENT, fldName & "ID", XMLDocTo.namespaceURI)
        newNode.Text = ID
       Call XMLDocTo.childNodes.Item(0).appendChild(newNode)
      End If
      AddSQLRefIds = XMLDocTo.xml
      Exit For
    End If
  Next
err:
End Function

'������������� ��������� ������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.InitPanel()
Public Sub InitPanel()
OnInit = True
Dim iii As Long ' for combo only
If Item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

txtNum = Item.Num
dtpDataPriem = Date
If Item.DataPriem <> 0 Then
 dtpDataPriem = Item.DataPriem
End If
If Not Item.ZType Is Nothing Then
  txtZType.Tag = Item.ZType.ID
  txtZType = Item.ZType.Brief
Else
  txtZType.Tag = ""
  txtZType = ""
End If
 LoadBtnPictures cmdZType, cmdZType.Tag
  cmdZType.RemoveAllMenu
  cmdZType.AddMenu "��������"
  On Error Resume Next
txtFIO = Item.FIO
If Not Item.TheOperator Is Nothing Then
  txtTheOperator.Tag = Item.TheOperator.ID
  txtTheOperator = Item.TheOperator.Brief
Else
  txtTheOperator.Tag = ""
  txtTheOperator = ""
End If
 LoadBtnPictures cmdTheOperator, cmdTheOperator.Tag
  cmdTheOperator.RemoveAllMenu
  cmdTheOperator.AddMenu "��������"
cmbOtprVKEY.Clear
cmbOtprVKEY.AddItem "��"
cmbOtprVKEY.ItemData(cmbOtprVKEY.NewIndex) = -1
cmbOtprVKEY.AddItem "���"
cmbOtprVKEY.ItemData(cmbOtprVKEY.NewIndex) = 0
 For iii = 0 To cmbOtprVKEY.ListCount - 1
  If Item.OtprVKEY = cmbOtprVKEY.ItemData(iii) Then
   cmbOtprVKEY.ListIndex = iii
   Exit For
  End If
 Next
dtpDataOtpravVKEY = Date
If Item.DataOtpravVKEY <> 0 Then
 dtpDataOtpravVKEY = Item.DataOtpravVKEY
Else
 dtpDataOtpravVKEY.Value = Null
End If
cmbDopSogl.Clear
cmbDopSogl.AddItem "��"
cmbDopSogl.ItemData(cmbDopSogl.NewIndex) = -1
cmbDopSogl.AddItem "���"
cmbDopSogl.ItemData(cmbDopSogl.NewIndex) = 0
 For iii = 0 To cmbDopSogl.ListCount - 1
  If Item.DopSogl = cmbDopSogl.ItemData(iii) Then
   cmbDopSogl.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtNumDogovor = Item.NumDogovor
' ������� �������� ID �� ���� SQLReference
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub

'����������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Save({���������})
Public Sub Save()
If OnInit Then Exit Sub

 mIsChanged = False
 RaiseEvent Changed
End Sub

'������ ������� ������ �� ������� ���������
'Parameters:
'[IN][OUT]  x , ��� ���������: Single,
'[IN][OUT]   y , ��� ���������: single  - ...
'See Also:
'Example:
'  call me.OptimalSize({���������})
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

'�������� ���� ��������� ������
'Parameters:
' ���������� ���
'See Also:
'Example:
'  call me.Customize()
 Public Sub Customize()
   Panel.Customize
 End Sub

'������ ��������� ��������� �� ������ ��� ���������� �������
'Parameters:
' ���������� ���
'Returns:
'  �������� ���� string
'See Also:
'Example:
' dim variable as string
' variable = me. PanelCustomisationString
 Public Property Get PanelCustomisationString() As String
   PanelCustomisationString = Panel.PanelCustomisationString
 End Property

'��������������  ������� ��������� �� ������
'Parameters:
'[IN][OUT]  s , ��� ���������: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...��������...
' me. PanelCustomisationString = value
 Public Property Let PanelCustomisationString(s As String)
   Panel.PanelCustomisationString = s
 End Property

'���������� ��������� ���������
'Parameters:
' ���������� ���
'Returns:
' Boolean, ��������� ����������:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. Enabled
 Public Property Get Enabled() As Boolean
   Enabled = Panel.Enabled
 End Property

'������ \ ���������� ��������� ���������
'Parameters:
'[IN]   v , ��� ���������: boolean  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...��������...
' me. Enabled = value
 Public Property Let Enabled(ByVal v As Boolean)
   Panel.Enabled = v
 End Property



