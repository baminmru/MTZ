VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl ITTOUT_PALETmain 
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
      Begin VB.ComboBox cmbIsCalibrated 
         Enabled         =   0   'False
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   51
         ToolTipText     =   "Калиброванный товар"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsBrak 
         Enabled         =   0   'False
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   49
         ToolTipText     =   "Брак"
         Top             =   2520
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtReorgPackageFullWeight 
         Height          =   300
         Left            =   6600
         TabIndex        =   47
         ToolTipText     =   "Суммарный вес оставшейся упаковки КГ."
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtReorgWeight 
         Height          =   300
         Left            =   6600
         TabIndex        =   45
         ToolTipText     =   "Вес оставшегося груза с поддоном КГ."
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtReorgCaliberQuantity 
         Enabled         =   0   'False
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   43
         ToolTipText     =   "Количество оставшихся коробов"
         Top             =   405
         Width           =   1800
      End
      Begin VB.TextBox txtStoreCell 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   20
         TabIndex        =   41
         ToolTipText     =   "Адрес основной ячейки"
         Top             =   6045
         Width           =   3000
      End
      Begin VB.TextBox txtBufferCell 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   20
         TabIndex        =   39
         ToolTipText     =   "Адрес буферной ячейки"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsEmpty 
         Enabled         =   0   'False
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   37
         ToolTipText     =   "Отгружена полностью"
         Top             =   4635
         Width           =   3000
      End
      Begin MSMask.MaskEdBox txtFullPackageWeight 
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         ToolTipText     =   "Суммарный вес упаковки КГ."
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtPackageWeight 
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         ToolTipText     =   "Вес одной упаковки КГ."
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtGoodWithPaletWeight 
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         ToolTipText     =   "Вес БРУТТО с палетой КГ."
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin VB.TextBox txtCaliberQuantity 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   29
         ToolTipText     =   "Количство коробов"
         Top             =   1815
         Width           =   1800
      End
      Begin MSComCtl2.DTPicker dtpexp_date 
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         ToolTipText     =   "Срок годности"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   92340227
         CurrentDate     =   39874
      End
      Begin VB.TextBox txtvetsved 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   50
         TabIndex        =   25
         ToolTipText     =   "Номер сертификата"
         Top             =   405
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpmade_date_to 
         Height          =   300
         Left            =   300
         TabIndex        =   23
         ToolTipText     =   "Дата производства По"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   92340227
         CurrentDate     =   39874
      End
      Begin MSComCtl2.DTPicker dtpMade_date 
         Height          =   300
         Left            =   300
         TabIndex        =   21
         ToolTipText     =   "Дата производства С"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   92340227
         CurrentDate     =   39874
      End
      Begin MTZ_PANEL.DropButton cmdPartRef 
         Height          =   300
         Left            =   2850
         TabIndex        =   19
         Tag             =   "refopen.ico"
         ToolTipText     =   "Партия"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtPartRef 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   18
         ToolTipText     =   "Партия"
         Top             =   4635
         Width           =   2550
      End
      Begin VB.TextBox txtVidOtruba 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   64
         TabIndex        =   16
         ToolTipText     =   "Вид отруба"
         Top             =   3930
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdKILL_NUMBER 
         Height          =   300
         Left            =   2850
         TabIndex        =   14
         Tag             =   "refopen.ico"
         ToolTipText     =   "№ бойни"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtKILL_NUMBER 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   13
         ToolTipText     =   "№ бойни"
         Top             =   3225
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdFactory 
         Height          =   300
         Left            =   2850
         TabIndex        =   11
         Tag             =   "refopen.ico"
         ToolTipText     =   "Завод"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtFactory 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   10
         ToolTipText     =   "Завод"
         Top             =   2520
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdmade_country 
         Height          =   300
         Left            =   2850
         TabIndex        =   8
         Tag             =   "refopen.ico"
         ToolTipText     =   "Страна производитель"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtmade_country 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   7
         ToolTipText     =   "Страна производитель"
         Top             =   1815
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTheNumber 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Палета"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtTheNumber 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Палета"
         Top             =   1110
         Width           =   2550
      End
      Begin VB.TextBox txtsequence 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   2
         ToolTipText     =   "№ П\П"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblIsCalibrated 
         BackStyle       =   0  'Transparent
         Caption         =   "Калиброванный товар:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   50
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblIsBrak 
         BackStyle       =   0  'Transparent
         Caption         =   "Брак:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   48
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblReorgPackageFullWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Суммарный вес оставшейся упаковки КГ.:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   46
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblReorgWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес оставшегося груза с поддоном КГ.:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   44
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblReorgCaliberQuantity 
         BackStyle       =   0  'Transparent
         Caption         =   "Количество оставшихся коробов:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   42
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblStoreCell 
         BackStyle       =   0  'Transparent
         Caption         =   "Адрес основной ячейки:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   40
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblBufferCell 
         BackStyle       =   0  'Transparent
         Caption         =   "Адрес буферной ячейки:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   38
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblIsEmpty 
         BackStyle       =   0  'Transparent
         Caption         =   "Отгружена полностью:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblFullPackageWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Суммарный вес упаковки КГ.:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblPackageWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес одной упаковки КГ.:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblGoodWithPaletWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес БРУТТО с палетой КГ.:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblCaliberQuantity 
         BackStyle       =   0  'Transparent
         Caption         =   "Количство коробов:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblexp_date 
         BackStyle       =   0  'Transparent
         Caption         =   "Срок годности:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   26
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblvetsved 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер сертификата:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblmade_date_to 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата производства По:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   22
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblMade_date 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата производства С:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   20
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblPartRef 
         BackStyle       =   0  'Transparent
         Caption         =   "Партия:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblVidOtruba 
         BackStyle       =   0  'Transparent
         Caption         =   "Вид отруба:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblKILL_NUMBER 
         BackStyle       =   0  'Transparent
         Caption         =   "№ бойни:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblFactory 
         BackStyle       =   0  'Transparent
         Caption         =   "Завод:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblmade_country 
         BackStyle       =   0  'Transparent
         Caption         =   "Страна производитель:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheNumber 
         BackStyle       =   0  'Transparent
         Caption         =   "Палета:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblsequence 
         BackStyle       =   0  'Transparent
         Caption         =   "№ П\П:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "ITTOUT_PALETmain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'панель редактирования раздела
   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean






'Функция поиска строки
'Parameters:
'[IN][OUT]  Runner , тип параметра: mtzmanager.main,
'[IN]   TypeName , тип параметра: String,
'[IN][OUT]   ID , тип параметра: string,
'[IN][OUT]   Brief , тип параметра: string,
'[IN][OUT]   Cancel , тип параметра: boolean  - ...
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as Boolean
' variable = me.findObject(...параметры...)
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

'Признак изменения строки
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
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

Private Sub txtsequence_Change()
  Changing

End Sub
Private Sub txtTheNumber_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheNumber_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdTheNumber_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtmade_country_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdmade_country_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdmade_country_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtFactory_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdFactory_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdFactory_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtKILL_NUMBER_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdKILL_NUMBER_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdKILL_NUMBER_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtVidOtruba_Change()
  Changing

End Sub
Private Sub txtPartRef_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPartRef_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdPartRef_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub dtpMade_date_Change()
  Changing

End Sub
Private Sub dtpmade_date_to_Change()
  Changing

End Sub
Private Sub txtvetsved_Change()
  Changing

End Sub
Private Sub dtpexp_date_Change()
  Changing

End Sub
Private Sub txtCaliberQuantity_Change()
  Changing

End Sub
Private Sub txtGoodWithPaletWeight_Change()
  Changing

End Sub
Private Sub txtPackageWeight_Change()
  Changing

End Sub
Private Sub txtFullPackageWeight_Change()
  Changing

End Sub
Private Sub cmbIsEmpty_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtBufferCell_Change()
  Changing

End Sub
Private Sub txtStoreCell_Change()
  Changing

End Sub
Private Sub txtReorgCaliberQuantity_Change()
  Changing

End Sub
Private Sub txtReorgWeight_Change()
  Changing

End Sub
Private Sub txtReorgPackageFullWeight_Change()
  Changing

End Sub
Private Sub cmbIsBrak_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub cmbIsCalibrated_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub

'Контроль правильности заполнения данных на панели редактирования
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
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

'Инициализация контролов панели
'Parameters:
' параметров нет
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

txtsequence = Item.sequence
If Not Item.TheNumber Is Nothing Then
  txtTheNumber.Tag = Item.TheNumber.ID
  txtTheNumber = Item.TheNumber.Brief
Else
  txtTheNumber.Tag = ""
  txtTheNumber = ""
End If
 LoadBtnPictures cmdTheNumber, cmdTheNumber.Tag
  cmdTheNumber.RemoveAllMenu
  cmdTheNumber.AddMenu "Очистить"
If Not Item.made_country Is Nothing Then
  txtmade_country.Tag = Item.made_country.ID
  txtmade_country = Item.made_country.Brief
Else
  txtmade_country.Tag = ""
  txtmade_country = ""
End If
 LoadBtnPictures cmdmade_country, cmdmade_country.Tag
  cmdmade_country.RemoveAllMenu
  cmdmade_country.AddMenu "Очистить"
If Not Item.Factory Is Nothing Then
  txtFactory.Tag = Item.Factory.ID
  txtFactory = Item.Factory.Brief
Else
  txtFactory.Tag = ""
  txtFactory = ""
End If
 LoadBtnPictures cmdFactory, cmdFactory.Tag
  cmdFactory.RemoveAllMenu
  cmdFactory.AddMenu "Очистить"
If Not Item.KILL_NUMBER Is Nothing Then
  txtKILL_NUMBER.Tag = Item.KILL_NUMBER.ID
  txtKILL_NUMBER = Item.KILL_NUMBER.Brief
Else
  txtKILL_NUMBER.Tag = ""
  txtKILL_NUMBER = ""
End If
 LoadBtnPictures cmdKILL_NUMBER, cmdKILL_NUMBER.Tag
  cmdKILL_NUMBER.RemoveAllMenu
  cmdKILL_NUMBER.AddMenu "Очистить"
  On Error Resume Next
txtVidOtruba = Item.VidOtruba
If Not Item.PartRef Is Nothing Then
  txtPartRef.Tag = Item.PartRef.ID
  txtPartRef = Item.PartRef.Brief
Else
  txtPartRef.Tag = ""
  txtPartRef = ""
End If
 LoadBtnPictures cmdPartRef, cmdPartRef.Tag
  cmdPartRef.RemoveAllMenu
  cmdPartRef.AddMenu "Очистить"
dtpMade_date = Date
If Item.Made_date <> 0 Then
 dtpMade_date = Item.Made_date
Else
 dtpMade_date.Value = Null
End If
dtpmade_date_to = Date
If Item.made_date_to <> 0 Then
 dtpmade_date_to = Item.made_date_to
Else
 dtpmade_date_to.Value = Null
End If
  On Error Resume Next
txtvetsved = Item.vetsved
dtpexp_date = Date
If Item.exp_date <> 0 Then
 dtpexp_date = Item.exp_date
Else
 dtpexp_date.Value = Null
End If
txtCaliberQuantity = Item.CaliberQuantity
txtGoodWithPaletWeight = Item.GoodWithPaletWeight
txtPackageWeight = Item.PackageWeight
txtFullPackageWeight = Item.FullPackageWeight
cmbIsEmpty.Clear
cmbIsEmpty.AddItem "Да"
cmbIsEmpty.ItemData(cmbIsEmpty.NewIndex) = -1
cmbIsEmpty.AddItem "Нет"
cmbIsEmpty.ItemData(cmbIsEmpty.NewIndex) = 0
 For iii = 0 To cmbIsEmpty.ListCount - 1
  If Item.IsEmpty = cmbIsEmpty.ItemData(iii) Then
   cmbIsEmpty.ListIndex = iii
   Exit For
  End If
 Next
  On Error Resume Next
txtBufferCell = Item.BufferCell
  On Error Resume Next
txtStoreCell = Item.StoreCell
txtReorgCaliberQuantity = Item.ReorgCaliberQuantity
txtReorgWeight = Item.ReorgWeight
txtReorgPackageFullWeight = Item.ReorgPackageFullWeight
cmbIsBrak.Clear
cmbIsBrak.AddItem "Да"
cmbIsBrak.ItemData(cmbIsBrak.NewIndex) = -1
cmbIsBrak.AddItem "Нет"
cmbIsBrak.ItemData(cmbIsBrak.NewIndex) = 0
 For iii = 0 To cmbIsBrak.ListCount - 1
  If Item.IsBrak = cmbIsBrak.ItemData(iii) Then
   cmbIsBrak.ListIndex = iii
   Exit For
  End If
 Next
cmbIsCalibrated.Clear
cmbIsCalibrated.AddItem "Да"
cmbIsCalibrated.ItemData(cmbIsCalibrated.NewIndex) = -1
cmbIsCalibrated.AddItem "Нет"
cmbIsCalibrated.ItemData(cmbIsCalibrated.NewIndex) = 0
 For iii = 0 To cmbIsCalibrated.ListCount - 1
  If Item.IsCalibrated = cmbIsCalibrated.ItemData(iii) Then
   cmbIsCalibrated.ListIndex = iii
   Exit For
  End If
 Next
' Добавим значения ID ко всем SQLReference
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub

'Сохранение
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Save({параметры})
Public Sub Save()
If OnInit Then Exit Sub

 mIsChanged = False
 RaiseEvent Changed
End Sub

'Подбор размера панели по размеру контролов
'Parameters:
'[IN][OUT]  x , тип параметра: Single,
'[IN][OUT]   y , тип параметра: single  - ...
'See Also:
'Example:
'  call me.OptimalSize({параметры})
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

'Открытие окна настройки панели
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Customize()
 Public Sub Customize()
   Panel.Customize
 End Sub

'Строка положения контролов на панели для сохранения позиций
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. PanelCustomisationString
 Public Property Get PanelCustomisationString() As String
   PanelCustomisationString = Panel.PanelCustomisationString
 End Property

'Восстановление  позиций контролов из строки
'Parameters:
'[IN][OUT]  s , тип параметра: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. PanelCustomisationString = value
 Public Property Let PanelCustomisationString(s As String)
   Panel.PanelCustomisationString = s
 End Property

'Разрешения изменений контролов
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. Enabled
 Public Property Get Enabled() As Boolean
   Enabled = Panel.Enabled
 End Property

'Запрет \ Разрешение изменений контролов
'Parameters:
'[IN]   v , тип параметра: boolean  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. Enabled = value
 Public Property Let Enabled(ByVal v As Boolean)
   Panel.Enabled = v
 End Property



