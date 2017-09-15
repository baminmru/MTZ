VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl wpin_line 
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
      Begin VB.ComboBox cmbIsBrak 
         Height          =   315
         Left            =   6600
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   69
         ToolTipText     =   "Брак"
         Top             =   6045
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdD5 
         Height          =   300
         Left            =   9150
         TabIndex        =   67
         Tag             =   "refopen.ico"
         ToolTipText     =   "Д-Аналитика 5"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtD5 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   66
         ToolTipText     =   "Д-Аналитика 5"
         Top             =   5340
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdD4 
         Height          =   300
         Left            =   9150
         TabIndex        =   64
         Tag             =   "refopen.ico"
         ToolTipText     =   "Д-Аналитика 4"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtD4 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   63
         ToolTipText     =   "Д-Аналитика 4"
         Top             =   4635
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdD3 
         Height          =   300
         Left            =   9150
         TabIndex        =   61
         Tag             =   "refopen.ico"
         ToolTipText     =   "Д-Аналитика 3"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtD3 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   60
         ToolTipText     =   "Д-Аналитика 3"
         Top             =   3930
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdD2 
         Height          =   300
         Left            =   9150
         TabIndex        =   58
         Tag             =   "refopen.ico"
         ToolTipText     =   "Д-Аналитика 2"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtD2 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   57
         ToolTipText     =   "Д-Аналитика 2"
         Top             =   3225
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdD1 
         Height          =   300
         Left            =   9150
         TabIndex        =   55
         Tag             =   "refopen.ico"
         ToolTipText     =   "Д-Аналитика 1"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtD1 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   54
         ToolTipText     =   "Д-Аналитика 1"
         Top             =   2520
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdS5 
         Height          =   300
         Left            =   9150
         TabIndex        =   52
         Tag             =   "refopen.ico"
         ToolTipText     =   "С-Аналитика 5"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtS5 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   51
         ToolTipText     =   "С-Аналитика 5"
         Top             =   1815
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdS4 
         Height          =   300
         Left            =   9150
         TabIndex        =   49
         Tag             =   "refopen.ico"
         ToolTipText     =   "С-Аналитика 4"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtS4 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   48
         ToolTipText     =   "С-Аналитика 4"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdS3 
         Height          =   300
         Left            =   9150
         TabIndex        =   46
         Tag             =   "refopen.ico"
         ToolTipText     =   "С-Аналитика 3"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtS3 
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   45
         ToolTipText     =   "С-Аналитика 3"
         Top             =   405
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdS2 
         Height          =   300
         Left            =   6000
         TabIndex        =   43
         Tag             =   "refopen.ico"
         ToolTipText     =   "С-Аналитика 2"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtS2 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   42
         ToolTipText     =   "С-Аналитика 2"
         Top             =   6045
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdS1 
         Height          =   300
         Left            =   6000
         TabIndex        =   40
         Tag             =   "refopen.ico"
         ToolTipText     =   "С-Аналитика 1"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtS1 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   39
         ToolTipText     =   "С-Аналитика 1"
         Top             =   5340
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpstopdate 
         Height          =   300
         Left            =   3450
         TabIndex        =   37
         ToolTipText     =   "Дата окончания хранения"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   53280771
         CurrentDate     =   39926
      End
      Begin MSComCtl2.DTPicker dtpexpdate 
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         ToolTipText     =   "Окончание срока годности"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   53280771
         CurrentDate     =   39926
      End
      Begin MSComCtl2.DTPicker dtpmadedate_to 
         Height          =   300
         Left            =   3450
         TabIndex        =   33
         ToolTipText     =   "Дата производства по"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   53280771
         CurrentDate     =   39926
      End
      Begin MSComCtl2.DTPicker dtpmadeDate_from 
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         ToolTipText     =   "Дата производства с"
         Top             =   2520
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   53280771
         CurrentDate     =   39926
      End
      Begin VB.TextBox txtSertNum 
         Height          =   300
         Left            =   3450
         MaxLength       =   80
         TabIndex        =   29
         ToolTipText     =   "Сертификат"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheFactory 
         Height          =   300
         Left            =   6000
         TabIndex        =   27
         Tag             =   "refopen.ico"
         ToolTipText     =   "Завод"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheFactory 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   26
         ToolTipText     =   "Завод"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTheDeveloper 
         Height          =   300
         Left            =   6000
         TabIndex        =   24
         Tag             =   "refopen.ico"
         ToolTipText     =   "Производитель"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheDeveloper 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   23
         ToolTipText     =   "Производитель"
         Top             =   405
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTheCountry 
         Height          =   300
         Left            =   2850
         TabIndex        =   21
         Tag             =   "refopen.ico"
         ToolTipText     =   "Страна"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheCountry 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   20
         ToolTipText     =   "Страна"
         Top             =   6045
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtUintToQuantity 
         Height          =   300
         Left            =   300
         TabIndex        =   18
         ToolTipText     =   "Перевод в штуки"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtUnitToWeight 
         Height          =   300
         Left            =   300
         TabIndex        =   16
         ToolTipText     =   "Перевод в килограммы"
         Top             =   4635
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtPricePerUnit 
         Height          =   300
         Left            =   300
         TabIndex        =   14
         ToolTipText     =   "Цена за единицу"
         Top             =   3930
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtQatHand 
         Height          =   300
         Left            =   300
         TabIndex        =   12
         ToolTipText     =   "Кол-во по факту"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdedizm 
         Height          =   300
         Left            =   2850
         TabIndex        =   10
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ед. изм."
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtedizm 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   9
         ToolTipText     =   "Ед. изм."
         Top             =   2520
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtQinQry 
         Height          =   300
         Left            =   300
         TabIndex        =   7
         ToolTipText     =   "Кол-во по заказу"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdtheGood 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Товар"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txttheGood 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Товар"
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
         ToolTipText     =   "Номер по порядку"
         Top             =   405
         Width           =   1800
      End
      Begin VB.Label lblIsBrak 
         BackStyle       =   0  'Transparent
         Caption         =   "Брак:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   6600
         TabIndex        =   68
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblD5 
         BackStyle       =   0  'Transparent
         Caption         =   "Д-Аналитика 5:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   65
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblD4 
         BackStyle       =   0  'Transparent
         Caption         =   "Д-Аналитика 4:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   62
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblD3 
         BackStyle       =   0  'Transparent
         Caption         =   "Д-Аналитика 3:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   59
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblD2 
         BackStyle       =   0  'Transparent
         Caption         =   "Д-Аналитика 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   56
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblD1 
         BackStyle       =   0  'Transparent
         Caption         =   "Д-Аналитика 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   53
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblS5 
         BackStyle       =   0  'Transparent
         Caption         =   "С-Аналитика 5:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   50
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblS4 
         BackStyle       =   0  'Transparent
         Caption         =   "С-Аналитика 4:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   47
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblS3 
         BackStyle       =   0  'Transparent
         Caption         =   "С-Аналитика 3:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   44
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblS2 
         BackStyle       =   0  'Transparent
         Caption         =   "С-Аналитика 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   41
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblS1 
         BackStyle       =   0  'Transparent
         Caption         =   "С-Аналитика 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   38
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblstopdate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата окончания хранения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblexpdate 
         BackStyle       =   0  'Transparent
         Caption         =   "Окончание срока годности:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblmadedate_to 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата производства по:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblmadeDate_from 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата производства с:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblSertNum 
         BackStyle       =   0  'Transparent
         Caption         =   "Сертификат:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblTheFactory 
         BackStyle       =   0  'Transparent
         Caption         =   "Завод:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblTheDeveloper 
         BackStyle       =   0  'Transparent
         Caption         =   "Производитель:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   22
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblTheCountry 
         BackStyle       =   0  'Transparent
         Caption         =   "Страна:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblUintToQuantity 
         BackStyle       =   0  'Transparent
         Caption         =   "Перевод в штуки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   17
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblUnitToWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Перевод в килограммы:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblPricePerUnit 
         BackStyle       =   0  'Transparent
         Caption         =   "Цена за единицу:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblQatHand 
         BackStyle       =   0  'Transparent
         Caption         =   "Кол-во по факту:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lbledizm 
         BackStyle       =   0  'Transparent
         Caption         =   "Ед. изм.:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblQinQry 
         BackStyle       =   0  'Transparent
         Caption         =   "Кол-во по заказу:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lbltheGood 
         BackStyle       =   0  'Transparent
         Caption         =   "Товар:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblsequence 
         BackStyle       =   0  'Transparent
         Caption         =   "Номер по порядку:"
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
Attribute VB_Name = "wpin_line"
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
Private Function findObject(Runner As MTZManager.Main, ByVal TypeName As String, ByRef ID As String, ByRef brief As String, ByRef cancel As Boolean) As Boolean
Dim objFinder As Object
Dim result As Boolean
result = False
On Error GoTo bye
Set objFinder = CreateObject(TypeName & "_FIND.Find")
result = objFinder.Run(Runner, ID, brief, cancel)
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
Private Sub txttheGood_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdtheGood_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpg_def", ID, brief) Then
          txttheGood.Tag = Left(ID, 38)
          txttheGood = brief
        End If
End Sub
Private Sub cmdtheGood_MenuClick(ByVal sCaption As String)
          txttheGood.Tag = ""
          txttheGood = ""
End Sub
Private Sub txtQinQry_Validate(cancel As Boolean)
If txtQinQry.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQinQry.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQinQry.SetFocus
  ElseIf Val(txtQinQry.Text) < -922337203685478# Or Val(txtQinQry.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtQinQry.SetFocus
  End If
End If
End Sub
Private Sub txtQinQry_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQinQry_Change()
  Changing

End Sub
Private Sub txtedizm_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdedizm_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpDic_EDIZM", ID, brief) Then
          txtedizm.Tag = Left(ID, 38)
          txtedizm = brief
        End If
End Sub
Private Sub cmdedizm_MenuClick(ByVal sCaption As String)
          txtedizm.Tag = ""
          txtedizm = ""
End Sub
Private Sub txtQatHand_Validate(cancel As Boolean)
If txtQatHand.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtQatHand.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtQatHand.SetFocus
  ElseIf Val(txtQatHand.Text) < -922337203685478# Or Val(txtQatHand.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtQatHand.SetFocus
  End If
End If
End Sub
Private Sub txtQatHand_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtQatHand_Change()
  Changing

End Sub
Private Sub txtPricePerUnit_Validate(cancel As Boolean)
If txtPricePerUnit.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtPricePerUnit.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtPricePerUnit.SetFocus
  ElseIf Val(txtPricePerUnit.Text) < -922337203685478# Or Val(txtPricePerUnit.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtPricePerUnit.SetFocus
  End If
End If
End Sub
Private Sub txtPricePerUnit_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtPricePerUnit_Change()
  Changing

End Sub
Private Sub txtUnitToWeight_Validate(cancel As Boolean)
If txtUnitToWeight.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtUnitToWeight.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtUnitToWeight.SetFocus
  ElseIf Val(txtUnitToWeight.Text) < -922337203685478# Or Val(txtUnitToWeight.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtUnitToWeight.SetFocus
  End If
End If
End Sub
Private Sub txtUnitToWeight_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtUnitToWeight_Change()
  Changing

End Sub
Private Sub txtUintToQuantity_Validate(cancel As Boolean)
If txtUintToQuantity.Text <> "" Then
 On Error Resume Next
  If Not IsNumeric(txtUintToQuantity.Text) Then
     cancel = True
     MsgBox "Ожидалось число", vbOKOnly + vbExclamation, "Внимание"
     txtUintToQuantity.SetFocus
  ElseIf Val(txtUintToQuantity.Text) < -922337203685478# Or Val(txtUintToQuantity.Text) > 922337203685478# Then
     cancel = True
     MsgBox "Значение вне допустимого диапазона", vbOKOnly + vbExclamation, "Внимание"
     txtUintToQuantity.SetFocus
  End If
End If
End Sub
Private Sub txtUintToQuantity_KeyPess(KeyAscii As Integer)
Dim s As String
s = "0123456789.,-" & Chr(8)
If InStr(s, Chr(KeyAscii)) > 0 Then Exit Sub
KeyAscii = 0

End Sub
Private Sub txtUintToQuantity_Change()
  Changing

End Sub
Private Sub txtTheCountry_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheCountry_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpDic_Country", ID, brief) Then
          txtTheCountry.Tag = Left(ID, 38)
          txtTheCountry = brief
        End If
End Sub
Private Sub cmdTheCountry_MenuClick(ByVal sCaption As String)
          txtTheCountry.Tag = ""
          txtTheCountry = ""
End Sub
Private Sub txtTheDeveloper_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheDeveloper_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpDic_firm", ID, brief, , , "wpDic_firm_theCountry_ID='" & txtTheCountry.Tag & "'") Then
          txtTheDeveloper.Tag = Left(ID, 38)
          txtTheDeveloper = brief
        End If
End Sub
Private Sub cmdTheDeveloper_MenuClick(ByVal sCaption As String)
          txtTheDeveloper.Tag = ""
          txtTheDeveloper = ""
End Sub
Private Sub txtTheFactory_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheFactory_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpDic_factory", ID, brief, , , "wpDic_factory_theDeveloper_ID='" & txtTheDeveloper.Tag & "'") Then
          txtTheFactory.Tag = Left(ID, 38)
          txtTheFactory = brief
        End If
End Sub
Private Sub cmdTheFactory_MenuClick(ByVal sCaption As String)
          txtTheFactory.Tag = ""
          txtTheFactory = ""
End Sub
Private Sub txtSertNum_Change()
  Changing

End Sub
Private Sub dtpmadeDate_from_Change()
  Changing

End Sub
Private Sub dtpmadedate_to_Change()
  Changing

End Sub
Private Sub dtpexpdate_Change()
  Changing

End Sub
Private Sub dtpstopdate_Change()
  Changing

End Sub
Private Sub txtS1_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdS1_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpg_S1", ID, brief, , , "wpg_S1_TheGood_ID='" & txttheGood.Tag & "'") Then
          txtS1.Tag = Left(ID, 38)
          txtS1 = brief
        End If
End Sub
Private Sub cmdS1_MenuClick(ByVal sCaption As String)
          txtS1.Tag = ""
          txtS1 = ""
End Sub
Private Sub txtS2_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdS2_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpg_S2", ID, brief, , , "wpg_S2_TheGood_ID='" & txttheGood.Tag & "'") Then
          txtS2.Tag = Left(ID, 38)
          txtS2 = brief
        End If
End Sub
Private Sub cmdS2_MenuClick(ByVal sCaption As String)
          txtS2.Tag = ""
          txtS2 = ""
End Sub
Private Sub txtS3_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdS3_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpG_S3", ID, brief, , , "wpg_S3_TheGood_ID='" & txttheGood.Tag & "'") Then
          txtS3.Tag = Left(ID, 38)
          txtS3 = brief
        End If
End Sub
Private Sub cmdS3_MenuClick(ByVal sCaption As String)
          txtS3.Tag = ""
          txtS3 = ""
End Sub
Private Sub txtS4_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdS4_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpg_s4", ID, brief, , , "wpg_S4_TheGood_ID='" & txttheGood.Tag & "'") Then
          txtS4.Tag = Left(ID, 38)
          txtS4 = brief
        End If
End Sub
Private Sub cmdS4_MenuClick(ByVal sCaption As String)
          txtS4.Tag = ""
          txtS4 = ""
End Sub
Private Sub txtS5_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdS5_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpg_s5", ID, brief, , , "wpg_S5_TheGood_ID='" & txttheGood.Tag & "'") Then
          txtS5.Tag = Left(ID, 38)
          txtS5 = brief
        End If
End Sub
Private Sub cmdS5_MenuClick(ByVal sCaption As String)
          txtS5.Tag = ""
          txtS5 = ""
End Sub
Private Sub txtD1_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdD1_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpg_D1", ID, brief, , , "wpg_D1_TheGood_ID='" & txttheGood.Tag & "'") Then
          txtD1.Tag = Left(ID, 38)
          txtD1 = brief
        End If
End Sub
Private Sub cmdD1_MenuClick(ByVal sCaption As String)
          txtD1.Tag = ""
          txtD1 = ""
End Sub
Private Sub txtD2_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdD2_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpg_d2", ID, brief, , , "wpg_D2_TheGood_ID='" & txttheGood.Tag & "'") Then
          txtD2.Tag = Left(ID, 38)
          txtD2 = brief
        End If
End Sub
Private Sub cmdD2_MenuClick(ByVal sCaption As String)
          txtD2.Tag = ""
          txtD2 = ""
End Sub
Private Sub txtD3_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdD3_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpg_d3", ID, brief, , , "wpg_D3_TheGood_ID='" & txttheGood.Tag & "'") Then
          txtD3.Tag = Left(ID, 38)
          txtD3 = brief
        End If
End Sub
Private Sub cmdD3_MenuClick(ByVal sCaption As String)
          txtD3.Tag = ""
          txtD3 = ""
End Sub
Private Sub txtD4_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdD4_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpg_d4", ID, brief, , , "wpg_D4_TheGood_ID='" & txttheGood.Tag & "'") Then
          txtD4.Tag = Left(ID, 38)
          txtD4 = brief
        End If
End Sub
Private Sub cmdD4_MenuClick(ByVal sCaption As String)
          txtD4.Tag = ""
          txtD4 = ""
End Sub
Private Sub txtD5_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdD5_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("wpg_d5", ID, brief, , , "wpg_D5_TheGood_ID='" & txttheGood.Tag & "'") Then
          txtD5.Tag = Left(ID, 38)
          txtD5 = brief
        End If
End Sub
Private Sub cmdD5_MenuClick(ByVal sCaption As String)
          txtD5.Tag = ""
          txtD5 = ""
End Sub
Private Sub cmbIsBrak_Click()
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

If mIsOK Then mIsOK = IsSet(txtsequence.Text)
If mIsOK Then mIsOK = txttheGood.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtQinQry.Text)
If mIsOK Then mIsOK = txtedizm.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtQatHand.Text)
If mIsOK Then mIsOK = IsSet(txtPricePerUnit.Text)
If mIsOK Then mIsOK = (cmbIsBrak.ListIndex >= 0)
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
If Not Item.theGood Is Nothing Then
  txttheGood.Tag = Item.theGood.ID
  txttheGood = Item.theGood.brief
Else
  txttheGood.Tag = ""
  txttheGood = ""
End If
 LoadBtnPictures cmdtheGood, cmdtheGood.Tag
  cmdtheGood.RemoveAllMenu
  cmdtheGood.AddMenu "Очистить"
txtQinQry = Item.QinQry
If Not Item.edizm Is Nothing Then
  txtedizm.Tag = Item.edizm.ID
  txtedizm = Item.edizm.brief
Else
  txtedizm.Tag = ""
  txtedizm = ""
End If
 LoadBtnPictures cmdedizm, cmdedizm.Tag
  cmdedizm.RemoveAllMenu
  cmdedizm.AddMenu "Очистить"
txtQatHand = Item.QatHand
txtPricePerUnit = Item.PricePerUnit
txtUnitToWeight = Item.UnitToWeight
txtUintToQuantity = Item.UintToQuantity
If Not Item.TheCountry Is Nothing Then
  txtTheCountry.Tag = Item.TheCountry.ID
  txtTheCountry = Item.TheCountry.brief
Else
  txtTheCountry.Tag = ""
  txtTheCountry = ""
End If
 LoadBtnPictures cmdTheCountry, cmdTheCountry.Tag
  cmdTheCountry.RemoveAllMenu
  cmdTheCountry.AddMenu "Очистить"
If Not Item.TheDeveloper Is Nothing Then
  txtTheDeveloper.Tag = Item.TheDeveloper.ID
  txtTheDeveloper = Item.TheDeveloper.brief
Else
  txtTheDeveloper.Tag = ""
  txtTheDeveloper = ""
End If
 LoadBtnPictures cmdTheDeveloper, cmdTheDeveloper.Tag
  cmdTheDeveloper.RemoveAllMenu
  cmdTheDeveloper.AddMenu "Очистить"
If Not Item.TheFactory Is Nothing Then
  txtTheFactory.Tag = Item.TheFactory.ID
  txtTheFactory = Item.TheFactory.brief
Else
  txtTheFactory.Tag = ""
  txtTheFactory = ""
End If
 LoadBtnPictures cmdTheFactory, cmdTheFactory.Tag
  cmdTheFactory.RemoveAllMenu
  cmdTheFactory.AddMenu "Очистить"
  On Error Resume Next
txtSertNum = Item.SertNum
dtpmadeDate_from = Date
If Item.madeDate_from <> 0 Then
 dtpmadeDate_from = Item.madeDate_from
Else
 dtpmadeDate_from.Value = Null
End If
dtpmadedate_to = Date
If Item.madedate_to <> 0 Then
 dtpmadedate_to = Item.madedate_to
Else
 dtpmadedate_to.Value = Null
End If
dtpexpdate = Date
If Item.expdate <> 0 Then
 dtpexpdate = Item.expdate
Else
 dtpexpdate.Value = Null
End If
dtpstopdate = Date
If Item.stopdate <> 0 Then
 dtpstopdate = Item.stopdate
Else
 dtpstopdate.Value = Null
End If
If Not Item.S1 Is Nothing Then
  txtS1.Tag = Item.S1.ID
  txtS1 = Item.S1.brief
Else
  txtS1.Tag = ""
  txtS1 = ""
End If
 LoadBtnPictures cmdS1, cmdS1.Tag
  cmdS1.RemoveAllMenu
  cmdS1.AddMenu "Очистить"
If Not Item.S2 Is Nothing Then
  txtS2.Tag = Item.S2.ID
  txtS2 = Item.S2.brief
Else
  txtS2.Tag = ""
  txtS2 = ""
End If
 LoadBtnPictures cmdS2, cmdS2.Tag
  cmdS2.RemoveAllMenu
  cmdS2.AddMenu "Очистить"
If Not Item.S3 Is Nothing Then
  txtS3.Tag = Item.S3.ID
  txtS3 = Item.S3.brief
Else
  txtS3.Tag = ""
  txtS3 = ""
End If
 LoadBtnPictures cmdS3, cmdS3.Tag
  cmdS3.RemoveAllMenu
  cmdS3.AddMenu "Очистить"
If Not Item.S4 Is Nothing Then
  txtS4.Tag = Item.S4.ID
  txtS4 = Item.S4.brief
Else
  txtS4.Tag = ""
  txtS4 = ""
End If
 LoadBtnPictures cmdS4, cmdS4.Tag
  cmdS4.RemoveAllMenu
  cmdS4.AddMenu "Очистить"
If Not Item.S5 Is Nothing Then
  txtS5.Tag = Item.S5.ID
  txtS5 = Item.S5.brief
Else
  txtS5.Tag = ""
  txtS5 = ""
End If
 LoadBtnPictures cmdS5, cmdS5.Tag
  cmdS5.RemoveAllMenu
  cmdS5.AddMenu "Очистить"
If Not Item.D1 Is Nothing Then
  txtD1.Tag = Item.D1.ID
  txtD1 = Item.D1.brief
Else
  txtD1.Tag = ""
  txtD1 = ""
End If
 LoadBtnPictures cmdD1, cmdD1.Tag
  cmdD1.RemoveAllMenu
  cmdD1.AddMenu "Очистить"
If Not Item.D2 Is Nothing Then
  txtD2.Tag = Item.D2.ID
  txtD2 = Item.D2.brief
Else
  txtD2.Tag = ""
  txtD2 = ""
End If
 LoadBtnPictures cmdD2, cmdD2.Tag
  cmdD2.RemoveAllMenu
  cmdD2.AddMenu "Очистить"
If Not Item.D3 Is Nothing Then
  txtD3.Tag = Item.D3.ID
  txtD3 = Item.D3.brief
Else
  txtD3.Tag = ""
  txtD3 = ""
End If
 LoadBtnPictures cmdD3, cmdD3.Tag
  cmdD3.RemoveAllMenu
  cmdD3.AddMenu "Очистить"
If Not Item.D4 Is Nothing Then
  txtD4.Tag = Item.D4.ID
  txtD4 = Item.D4.brief
Else
  txtD4.Tag = ""
  txtD4 = ""
End If
 LoadBtnPictures cmdD4, cmdD4.Tag
  cmdD4.RemoveAllMenu
  cmdD4.AddMenu "Очистить"
If Not Item.D5 Is Nothing Then
  txtD5.Tag = Item.D5.ID
  txtD5 = Item.D5.brief
Else
  txtD5.Tag = ""
  txtD5 = ""
End If
 LoadBtnPictures cmdD5, cmdD5.Tag
  cmdD5.RemoveAllMenu
  cmdD5.AddMenu "Очистить"
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

If txttheGood.Tag <> "" Then
  Set Item.theGood = Item.Application.FindRowObject("wpg_def", txttheGood.Tag)
Else
  Set Item.theGood = Nothing
End If
Item.QinQry = CDbl(txtQinQry)
If txtedizm.Tag <> "" Then
  Set Item.edizm = Item.Application.FindRowObject("wpDic_EDIZM", txtedizm.Tag)
Else
  Set Item.edizm = Nothing
End If
Item.QatHand = CDbl(txtQatHand)
Item.PricePerUnit = CDbl(txtPricePerUnit)
Item.UnitToWeight = CDbl(txtUnitToWeight)
Item.UintToQuantity = CDbl(txtUintToQuantity)
If txtTheCountry.Tag <> "" Then
  Set Item.TheCountry = Item.Application.FindRowObject("wpDic_Country", txtTheCountry.Tag)
Else
  Set Item.TheCountry = Nothing
End If
If txtTheDeveloper.Tag <> "" Then
  Set Item.TheDeveloper = Item.Application.FindRowObject("wpDic_firm", txtTheDeveloper.Tag)
Else
  Set Item.TheDeveloper = Nothing
End If
If txtTheFactory.Tag <> "" Then
  Set Item.TheFactory = Item.Application.FindRowObject("wpDic_factory", txtTheFactory.Tag)
Else
  Set Item.TheFactory = Nothing
End If
Item.SertNum = txtSertNum
  If IsNull(dtpmadeDate_from) Then
    Item.madeDate_from = 0
  Else
    Item.madeDate_from = dtpmadeDate_from.Value
  End If
  If IsNull(dtpmadedate_to) Then
    Item.madedate_to = 0
  Else
    Item.madedate_to = dtpmadedate_to.Value
  End If
  If IsNull(dtpexpdate) Then
    Item.expdate = 0
  Else
    Item.expdate = dtpexpdate.Value
  End If
  If IsNull(dtpstopdate) Then
    Item.stopdate = 0
  Else
    Item.stopdate = dtpstopdate.Value
  End If
If txtS1.Tag <> "" Then
  Set Item.S1 = Item.Application.FindRowObject("wpg_S1", txtS1.Tag)
Else
  Set Item.S1 = Nothing
End If
If txtS2.Tag <> "" Then
  Set Item.S2 = Item.Application.FindRowObject("wpg_S2", txtS2.Tag)
Else
  Set Item.S2 = Nothing
End If
If txtS3.Tag <> "" Then
  Set Item.S3 = Item.Application.FindRowObject("wpG_S3", txtS3.Tag)
Else
  Set Item.S3 = Nothing
End If
If txtS4.Tag <> "" Then
  Set Item.S4 = Item.Application.FindRowObject("wpg_s4", txtS4.Tag)
Else
  Set Item.S4 = Nothing
End If
If txtS5.Tag <> "" Then
  Set Item.S5 = Item.Application.FindRowObject("wpg_s5", txtS5.Tag)
Else
  Set Item.S5 = Nothing
End If
If txtD1.Tag <> "" Then
  Set Item.D1 = Item.Application.FindRowObject("wpg_D1", txtD1.Tag)
Else
  Set Item.D1 = Nothing
End If
If txtD2.Tag <> "" Then
  Set Item.D2 = Item.Application.FindRowObject("wpg_d2", txtD2.Tag)
Else
  Set Item.D2 = Nothing
End If
If txtD3.Tag <> "" Then
  Set Item.D3 = Item.Application.FindRowObject("wpg_d3", txtD3.Tag)
Else
  Set Item.D3 = Nothing
End If
If txtD4.Tag <> "" Then
  Set Item.D4 = Item.Application.FindRowObject("wpg_d4", txtD4.Tag)
Else
  Set Item.D4 = Nothing
End If
If txtD5.Tag <> "" Then
  Set Item.D5 = Item.Application.FindRowObject("wpg_d5", txtD5.Tag)
Else
  Set Item.D5 = Nothing
End If
 If cmbIsBrak.ListIndex >= 0 Then
   Item.IsBrak = cmbIsBrak.ItemData(cmbIsBrak.ListIndex)
 End If
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



