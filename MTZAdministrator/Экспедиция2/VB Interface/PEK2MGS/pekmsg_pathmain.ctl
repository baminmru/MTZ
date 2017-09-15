VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl pekmsg_pathmain 
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
      Begin MTZ_PANEL.DropButton cmdInfoSendType 
         Height          =   300
         Left            =   9150
         TabIndex        =   54
         Tag             =   "refopen.ico"
         ToolTipText     =   "Способ передачи информации"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtInfoSendType 
         Enabled         =   0   'False
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   53
         ToolTipText     =   "Способ передачи информации"
         Top             =   2520
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpInfoDate 
         Height          =   300
         Left            =   6600
         TabIndex        =   51
         ToolTipText     =   "Дата передачи информации"
         Top             =   1815
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   103743491
         CurrentDate     =   39500
      End
      Begin VB.TextBox txtInforRcvFIO 
         Enabled         =   0   'False
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   49
         ToolTipText     =   "Кому передана информация"
         Top             =   1110
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpRcvDate 
         Height          =   300
         Left            =   6600
         TabIndex        =   47
         ToolTipText     =   "Дата получения груза в ПО"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   103743491
         CurrentDate     =   39500
      End
      Begin VB.TextBox txtRcvFIO 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   45
         ToolTipText     =   "ФИО ВПН"
         Top             =   6045
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpPassDate 
         Height          =   300
         Left            =   3450
         TabIndex        =   43
         ToolTipText     =   "Дата передачи груза в вагон"
         Top             =   5340
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   103743491
         CurrentDate     =   39500
      End
      Begin VB.TextBox txtPassFIO 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         MaxLength       =   255
         TabIndex        =   41
         ToolTipText     =   "ФИО Кладовщика"
         Top             =   4635
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdValueEDIZM 
         Height          =   300
         Left            =   6000
         TabIndex        =   39
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ед.изм. объема"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtValueEDIZM 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   38
         ToolTipText     =   "Ед.изм. объема"
         Top             =   3930
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtPPOVol 
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         ToolTipText     =   "Объем ПО"
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
      Begin MTZ_PANEL.DropButton cmdWeightEDIZM 
         Height          =   300
         Left            =   6000
         TabIndex        =   34
         Tag             =   "refopen.ico"
         ToolTipText     =   "Ед. изм. веса"
         Top             =   2520
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtWeightEDIZM 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   33
         ToolTipText     =   "Ед. изм. веса"
         Top             =   2520
         Width           =   2550
      End
      Begin MSMask.MaskEdBox txtPPOWeight 
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         ToolTipText     =   "Вес ПО"
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
      Begin MTZ_PANEL.DropButton cmdReceiver 
         Height          =   300
         Left            =   6000
         TabIndex        =   29
         Tag             =   "refopen.ico"
         ToolTipText     =   "Получатель"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtReceiver 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   28
         ToolTipText     =   "Получатель"
         Top             =   1110
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdPPODescription 
         Height          =   300
         Left            =   6000
         TabIndex        =   26
         Tag             =   "refopen.ico"
         ToolTipText     =   "Характер груза"
         Top             =   405
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtPPODescription 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   25
         ToolTipText     =   "Характер груза"
         Top             =   405
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdDestStation 
         Height          =   300
         Left            =   2850
         TabIndex        =   23
         Tag             =   "refopen.ico"
         ToolTipText     =   "Станция назначения"
         Top             =   6045
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtDestStation 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   22
         ToolTipText     =   "Станция назначения"
         Top             =   6045
         Width           =   2550
      End
      Begin VB.TextBox txtPPONum 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   15
         TabIndex        =   20
         ToolTipText     =   "Кол-во ПО"
         Top             =   5340
         Width           =   1800
      End
      Begin MTZ_PANEL.DropButton cmdTheDirection 
         Height          =   300
         Left            =   2850
         TabIndex        =   18
         Tag             =   "refopen.ico"
         ToolTipText     =   "Направление"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtTheDirection 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   17
         ToolTipText     =   "Направление"
         Top             =   4635
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdTransSupplier 
         Height          =   300
         Left            =   2850
         TabIndex        =   15
         Tag             =   "refopen.ico"
         ToolTipText     =   "Поставщик"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtTransSupplier 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   14
         ToolTipText     =   "Поставщик"
         Top             =   3930
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdPathFilial 
         Height          =   300
         Left            =   2850
         TabIndex        =   12
         Tag             =   "refopen.ico"
         ToolTipText     =   "Филиал"
         Top             =   3225
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtPathFilial 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   11
         ToolTipText     =   "Филиал"
         Top             =   3225
         Width           =   2550
      End
      Begin VB.TextBox txtvagNo 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         MaxLength       =   8
         TabIndex        =   9
         ToolTipText     =   "Вагон №"
         Top             =   2520
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdtrainNo 
         Height          =   300
         Left            =   2850
         TabIndex        =   7
         Tag             =   "refopen.ico"
         ToolTipText     =   "Поезд"
         Top             =   1815
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txttrainNo 
         Enabled         =   0   'False
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   6
         ToolTipText     =   "Поезд"
         Top             =   1815
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpRcvWaitDate 
         Height          =   300
         Left            =   300
         TabIndex        =   4
         ToolTipText     =   "Ориентировочная дата получения"
         Top             =   1110
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   103743491
         CurrentDate     =   39500
      End
      Begin MSComCtl2.DTPicker dtpSendDate 
         Height          =   300
         Left            =   300
         TabIndex        =   2
         ToolTipText     =   "Дата отправки"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   103743491
         CurrentDate     =   39500
      End
      Begin VB.Label lblInfoSendType 
         BackStyle       =   0  'Transparent
         Caption         =   "Способ передачи информации:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   52
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblInfoDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата передачи информации:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   50
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblInforRcvFIO 
         BackStyle       =   0  'Transparent
         Caption         =   "Кому передана информация:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   48
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblRcvDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата получения груза в ПО:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   46
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblRcvFIO 
         BackStyle       =   0  'Transparent
         Caption         =   "ФИО ВПН:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   44
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblPassDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата передачи груза в вагон:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   42
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblPassFIO 
         BackStyle       =   0  'Transparent
         Caption         =   "ФИО Кладовщика:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   40
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblValueEDIZM 
         BackStyle       =   0  'Transparent
         Caption         =   "Ед.изм. объема:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   37
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblPPOVol 
         BackStyle       =   0  'Transparent
         Caption         =   "Объем ПО:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   35
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblWeightEDIZM 
         BackStyle       =   0  'Transparent
         Caption         =   "Ед. изм. веса:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   32
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblPPOWeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Вес ПО:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   3450
         TabIndex        =   30
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblReceiver 
         BackStyle       =   0  'Transparent
         Caption         =   "Получатель:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   27
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblPPODescription 
         BackStyle       =   0  'Transparent
         Caption         =   "Характер груза:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   24
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblDestStation 
         BackStyle       =   0  'Transparent
         Caption         =   "Станция назначения:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   21
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblPPONum 
         BackStyle       =   0  'Transparent
         Caption         =   "Кол-во ПО:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   19
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblTheDirection 
         BackStyle       =   0  'Transparent
         Caption         =   "Направление:"
         Enabled         =   0   'False
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   16
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblTransSupplier 
         BackStyle       =   0  'Transparent
         Caption         =   "Поставщик:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblPathFilial 
         BackStyle       =   0  'Transparent
         Caption         =   "Филиал:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblvagNo 
         BackStyle       =   0  'Transparent
         Caption         =   "Вагон №:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lbltrainNo 
         BackStyle       =   0  'Transparent
         Caption         =   "Поезд:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblRcvWaitDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Ориентировочная дата получения:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblSendDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата отправки:"
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
Attribute VB_Name = "pekmsg_pathmain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit



   Public Item As Object
   Private OnInit As Boolean
   Public Event Changed()
   Private mIsChanged As Boolean





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
Public Function IsChanged() As Boolean
  IsChanged = mIsChanged
End Function
Private Sub Usercontrol_resize()
  On Error Resume Next
  Panel.Width = UserControl.Width
  Panel.Height = UserControl.Height
End Sub

Private Sub dtpSendDate_Change()
  Changing

End Sub
Private Sub dtpRcvWaitDate_Change()
  Changing

End Sub
Private Sub txttrainNo_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdtrainNo_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdtrainNo_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtvagNo_Change()
  Changing

End Sub
Private Sub txtPathFilial_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPathFilial_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdPathFilial_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtTransSupplier_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTransSupplier_CLick()
  On Error Resume Next
     If txtTransSupplier.Tag = "" Then
     Else
       cmdTransSupplier_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdTransSupplier_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Открыть" Then
    If txtTransSupplier.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtTransSupplier.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtTransSupplier.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
End Sub
Private Sub txtTheDirection_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheDirection_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdTheDirection_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtPPONum_Change()
  Changing

End Sub
Private Sub txtDestStation_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdDestStation_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdDestStation_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtPPODescription_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPPODescription_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdPPODescription_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtReceiver_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdReceiver_CLick()
  On Error Resume Next
     If txtReceiver.Tag = "" Then
     Else
       cmdReceiver_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdReceiver_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Открыть" Then
    If txtReceiver.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtReceiver.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtReceiver.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
End Sub
Private Sub txtPPOWeight_Change()
  Changing

End Sub
Private Sub txtWeightEDIZM_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdWeightEDIZM_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdWeightEDIZM_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtPPOVol_Change()
  Changing

End Sub
Private Sub txtValueEDIZM_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdValueEDIZM_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdValueEDIZM_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtPassFIO_Change()
  Changing

End Sub
Private Sub dtpPassDate_Change()
  Changing

End Sub
Private Sub txtRcvFIO_Change()
  Changing

End Sub
Private Sub dtpRcvDate_Change()
  Changing

End Sub
Private Sub txtInforRcvFIO_Change()
  Changing

End Sub
Private Sub dtpInfoDate_Change()
  Changing

End Sub
Private Sub txtInfoSendType_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdInfoSendType_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdInfoSendType_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = txtTheDirection.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtPPONum.Text)
If mIsOK Then mIsOK = txtDestStation.Tag <> ""
If mIsOK Then mIsOK = IsSet(txtPPOWeight.Text)
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
Public Sub InitPanel()
OnInit = True
Dim iii As Long ' for combo only
If Item.CanChange Then
  Panel.Enabled = True
Else
  Panel.Enabled = False
End If

dtpSendDate = Date
If Item.SendDate <> 0 Then
 dtpSendDate = Item.SendDate
Else
 dtpSendDate.Value = Null
End If
dtpRcvWaitDate = Date
If Item.RcvWaitDate <> 0 Then
 dtpRcvWaitDate = Item.RcvWaitDate
Else
 dtpRcvWaitDate.Value = Null
End If
If Not Item.trainNo Is Nothing Then
  txttrainNo.Tag = Item.trainNo.ID
  txttrainNo = Item.trainNo.brief
Else
  txttrainNo.Tag = ""
  txttrainNo = ""
End If
 LoadBtnPictures cmdtrainNo, cmdtrainNo.Tag
  cmdtrainNo.RemoveAllMenu
  cmdtrainNo.AddMenu "Очистить"
  On Error Resume Next
txtvagNo = Item.vagNo
If Not Item.PathFilial Is Nothing Then
  txtPathFilial.Tag = Item.PathFilial.ID
  txtPathFilial = Item.PathFilial.brief
Else
  txtPathFilial.Tag = ""
  txtPathFilial = ""
End If
 LoadBtnPictures cmdPathFilial, cmdPathFilial.Tag
  cmdPathFilial.RemoveAllMenu
  cmdPathFilial.AddMenu "Очистить"
If Not Item.TransSupplier Is Nothing Then
  txtTransSupplier.Tag = Item.TransSupplier.ID
  txtTransSupplier = Item.TransSupplier.brief
Else
  txtTransSupplier.Tag = ""
  txtTransSupplier = ""
End If
 LoadBtnPictures cmdTransSupplier, cmdTransSupplier.Tag
  cmdTransSupplier.RemoveAllMenu
  cmdTransSupplier.AddMenu "Очистить"
  cmdTransSupplier.AddMenu "Открыть"
If Not Item.TheDirection Is Nothing Then
  txtTheDirection.Tag = Item.TheDirection.ID
  txtTheDirection = Item.TheDirection.brief
Else
  txtTheDirection.Tag = ""
  txtTheDirection = ""
End If
 LoadBtnPictures cmdTheDirection, cmdTheDirection.Tag
  cmdTheDirection.RemoveAllMenu
  cmdTheDirection.AddMenu "Очистить"
txtPPONum = Item.PPONum
If Not Item.DestStation Is Nothing Then
  txtDestStation.Tag = Item.DestStation.ID
  txtDestStation = Item.DestStation.brief
Else
  txtDestStation.Tag = ""
  txtDestStation = ""
End If
 LoadBtnPictures cmdDestStation, cmdDestStation.Tag
  cmdDestStation.RemoveAllMenu
  cmdDestStation.AddMenu "Очистить"
If Not Item.PPODescription Is Nothing Then
  txtPPODescription.Tag = Item.PPODescription.ID
  txtPPODescription = Item.PPODescription.brief
Else
  txtPPODescription.Tag = ""
  txtPPODescription = ""
End If
 LoadBtnPictures cmdPPODescription, cmdPPODescription.Tag
  cmdPPODescription.RemoveAllMenu
  cmdPPODescription.AddMenu "Очистить"
If Not Item.Receiver Is Nothing Then
  txtReceiver.Tag = Item.Receiver.ID
  txtReceiver = Item.Receiver.brief
Else
  txtReceiver.Tag = ""
  txtReceiver = ""
End If
 LoadBtnPictures cmdReceiver, cmdReceiver.Tag
  cmdReceiver.RemoveAllMenu
  cmdReceiver.AddMenu "Очистить"
  cmdReceiver.AddMenu "Открыть"
txtPPOWeight = Item.PPOWeight
If Not Item.WeightEDIZM Is Nothing Then
  txtWeightEDIZM.Tag = Item.WeightEDIZM.ID
  txtWeightEDIZM = Item.WeightEDIZM.brief
Else
  txtWeightEDIZM.Tag = ""
  txtWeightEDIZM = ""
End If
 LoadBtnPictures cmdWeightEDIZM, cmdWeightEDIZM.Tag
  cmdWeightEDIZM.RemoveAllMenu
  cmdWeightEDIZM.AddMenu "Очистить"
txtPPOVol = Item.PPOVol
If Not Item.ValueEDIZM Is Nothing Then
  txtValueEDIZM.Tag = Item.ValueEDIZM.ID
  txtValueEDIZM = Item.ValueEDIZM.brief
Else
  txtValueEDIZM.Tag = ""
  txtValueEDIZM = ""
End If
 LoadBtnPictures cmdValueEDIZM, cmdValueEDIZM.Tag
  cmdValueEDIZM.RemoveAllMenu
  cmdValueEDIZM.AddMenu "Очистить"
  On Error Resume Next
txtPassFIO = Item.PassFIO
dtpPassDate = Date
If Item.PassDate <> 0 Then
 dtpPassDate = Item.PassDate
Else
 dtpPassDate.Value = Null
End If
  On Error Resume Next
txtRcvFIO = Item.RcvFIO
dtpRcvDate = Date
If Item.RcvDate <> 0 Then
 dtpRcvDate = Item.RcvDate
Else
 dtpRcvDate.Value = Null
End If
  On Error Resume Next
txtInforRcvFIO = Item.InforRcvFIO
dtpInfoDate = Date
If Item.InfoDate <> 0 Then
 dtpInfoDate = Item.InfoDate
Else
 dtpInfoDate.Value = Null
End If
If Not Item.InfoSendType Is Nothing Then
  txtInfoSendType.Tag = Item.InfoSendType.ID
  txtInfoSendType = Item.InfoSendType.brief
Else
  txtInfoSendType.Tag = ""
  txtInfoSendType = ""
End If
 LoadBtnPictures cmdInfoSendType, cmdInfoSendType.Tag
  cmdInfoSendType.RemoveAllMenu
  cmdInfoSendType.AddMenu "Очистить"
' Добавим значения ID ко всем SQLReference
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

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



