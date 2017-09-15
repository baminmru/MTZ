VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl MTZ_Inst_Build 
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
      Begin VB.TextBox txtShortCutDir 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   17
         ToolTipText     =   "ShortCutDir"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.TextBox txtInstallDir 
         Height          =   300
         Left            =   300
         MaxLength       =   1024
         TabIndex        =   15
         ToolTipText     =   "InstallDir"
         Top             =   4635
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdMainFileRef 
         Height          =   300
         Left            =   2850
         TabIndex        =   13
         Tag             =   "refopen.ico"
         ToolTipText     =   "������� ����"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtMainFileRef 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   12
         ToolTipText     =   "������� ����"
         Top             =   3930
         Width           =   2550
      End
      Begin VB.TextBox txtLicensFilePath 
         Height          =   300
         Left            =   300
         MaxLength       =   2048
         TabIndex        =   10
         ToolTipText     =   "���� � ������������ �����������"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtPRODUCT_WEB_SITE 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   8
         ToolTipText     =   "PRODUCT_WEB_SITE"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtPRODUCT_PUBLISHER 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   6
         ToolTipText     =   "PRODUCT_PUBLISHER"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.TextBox txtPRODUCT_VERSION 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   4
         ToolTipText     =   "PRODUCT_VERSION"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtPRODUCT_NAME 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "PRODUCT_NAME"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblShortCutDir 
         BackStyle       =   0  'Transparent
         Caption         =   "ShortCutDir:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblInstallDir 
         BackStyle       =   0  'Transparent
         Caption         =   "InstallDir:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   14
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblMainFileRef 
         BackStyle       =   0  'Transparent
         Caption         =   "������� ����:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblLicensFilePath 
         BackStyle       =   0  'Transparent
         Caption         =   "���� � ������������ �����������:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblPRODUCT_WEB_SITE 
         BackStyle       =   0  'Transparent
         Caption         =   "PRODUCT_WEB_SITE:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblPRODUCT_PUBLISHER 
         BackStyle       =   0  'Transparent
         Caption         =   "PRODUCT_PUBLISHER:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblPRODUCT_VERSION 
         BackStyle       =   0  'Transparent
         Caption         =   "PRODUCT_VERSION:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblPRODUCT_NAME 
         BackStyle       =   0  'Transparent
         Caption         =   "PRODUCT_NAME:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "MTZ_Inst_Build"
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
Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef brief As String, ByRef Cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, brief, Cancel)
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

Private Sub txtPRODUCT_NAME_Change()
  Changing

End Sub
Private Sub txtPRODUCT_VERSION_Change()
  Changing

End Sub
Private Sub txtPRODUCT_PUBLISHER_Change()
  Changing

End Sub
Private Sub txtPRODUCT_WEB_SITE_Change()
  Changing

End Sub
Private Sub txtLicensFilePath_Change()
  Changing

End Sub
Private Sub txtMainFileRef_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdMainFileRef_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("MTZ_Inst_Sec_Files", ID, brief) Then
          txtMainFileRef.Tag = Left(ID, 38)
          txtMainFileRef = brief
        End If
End Sub
Private Sub cmdMainFileRef_MenuClick(ByVal sCaption As String)
          txtMainFileRef.Tag = ""
          txtMainFileRef = ""
End Sub
Private Sub txtInstallDir_Change()
  Changing

End Sub
Private Sub txtShortCutDir_Change()
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

If mIsOK Then mIsOK = IsSet(txtPRODUCT_NAME.Text)
If mIsOK Then mIsOK = IsSet(txtPRODUCT_VERSION.Text)
If mIsOK Then mIsOK = IsSet(txtPRODUCT_PUBLISHER.Text)
If mIsOK Then mIsOK = IsSet(txtPRODUCT_WEB_SITE.Text)
If mIsOK Then mIsOK = IsSet(txtLicensFilePath.Text)
If mIsOK Then mIsOK = IsSet(txtInstallDir.Text)
If mIsOK Then mIsOK = IsSet(txtShortCutDir.Text)
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

  On Error Resume Next
txtPRODUCT_NAME = Item.PRODUCT_NAME
  On Error Resume Next
txtPRODUCT_VERSION = Item.PRODUCT_VERSION
  On Error Resume Next
txtPRODUCT_PUBLISHER = Item.PRODUCT_PUBLISHER
  On Error Resume Next
txtPRODUCT_WEB_SITE = Item.PRODUCT_WEB_SITE
  On Error Resume Next
txtLicensFilePath = Item.LicensFilePath
If Not Item.MainFileRef Is Nothing Then
  txtMainFileRef.Tag = Item.MainFileRef.ID
  txtMainFileRef = Item.MainFileRef.brief
Else
  txtMainFileRef.Tag = ""
  txtMainFileRef = ""
End If
 LoadBtnPictures cmdMainFileRef, cmdMainFileRef.Tag
  cmdMainFileRef.RemoveAllMenu
  cmdMainFileRef.AddMenu "��������"
  On Error Resume Next
txtInstallDir = Item.InstallDir
  On Error Resume Next
txtShortCutDir = Item.ShortCutDir
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

Item.PRODUCT_NAME = txtPRODUCT_NAME
Item.PRODUCT_VERSION = txtPRODUCT_VERSION
Item.PRODUCT_PUBLISHER = txtPRODUCT_PUBLISHER
Item.PRODUCT_WEB_SITE = txtPRODUCT_WEB_SITE
Item.LicensFilePath = txtLicensFilePath
If txtMainFileRef.Tag <> "" Then
  Set Item.MainFileRef = Item.Application.FindRowObject("MTZ_Inst_Sec_Files", txtMainFileRef.Tag)
Else
  Set Item.MainFileRef = Nothing
End If
Item.InstallDir = txtInstallDir
Item.ShortCutDir = txtShortCutDir
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



