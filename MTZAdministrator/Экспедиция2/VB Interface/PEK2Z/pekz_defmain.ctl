VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Object = "{C932BA88-4374-101B-A56C-00AA003668DC}#1.1#0"; "MSMASK32.OCX"
Begin VB.UserControl pekz_defmain 
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
      Begin MSMask.MaskEdBox txtSummDopNDS 
         Height          =   300
         Left            =   6600
         TabIndex        =   54
         ToolTipText     =   "Сумма доп. услуг с НДС"
         Top             =   5535
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtSummDop 
         Height          =   300
         Left            =   6600
         TabIndex        =   52
         ToolTipText     =   "Сумма доп. услуг без НДС"
         Top             =   4830
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtSumm 
         Height          =   300
         Left            =   6600
         TabIndex        =   50
         ToolTipText     =   "Сумма без НДС"
         Top             =   4125
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MSMask.MaskEdBox txtSummNDS 
         Height          =   300
         Left            =   6600
         TabIndex        =   48
         ToolTipText     =   "Сумма с НДС"
         Top             =   3420
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         MaxLength       =   27
         Format          =   "#,##0.00;(#,##0.00)"
         PromptChar      =   "_"
      End
      Begin MTZ_PANEL.DropButton cmdTRF 
         Height          =   300
         Left            =   9150
         TabIndex        =   46
         Tag             =   "refopen.ico"
         ToolTipText     =   "Тариф"
         Top             =   2715
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
         Enabled         =   0   'False
      End
      Begin VB.TextBox txtTRF 
         Enabled         =   0   'False
         Height          =   300
         Left            =   6600
         Locked          =   -1  'True
         TabIndex        =   45
         ToolTipText     =   "Тариф"
         Top             =   2715
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpLoadDate 
         Height          =   300
         Left            =   6600
         TabIndex        =   43
         ToolTipText     =   "Дата приема груза на склад"
         Top             =   2010
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   104333315
         CurrentDate     =   39567
      End
      Begin VB.TextBox txtTheComment 
         Height          =   1200
         Left            =   6600
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   41
         ToolTipText     =   "Примечания"
         Top             =   405
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsNal 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   39
         ToolTipText     =   "Наличная оплата"
         Top             =   6435
         Width           =   3000
      End
      Begin VB.TextBox txtRcvInfo 
         Enabled         =   0   'False
         Height          =   1200
         Left            =   3450
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   37
         ToolTipText     =   "Данные получателя"
         Top             =   4830
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsPayed 
         Height          =   315
         Left            =   3450
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   35
         ToolTipText     =   "Оплачена"
         Top             =   4125
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdTheDogovor 
         Height          =   300
         Left            =   6000
         TabIndex        =   33
         Tag             =   "refopen.ico"
         ToolTipText     =   "Договор"
         Top             =   3420
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtTheDogovor 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   32
         ToolTipText     =   "Договор"
         Top             =   3420
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdPayDept 
         Height          =   300
         Left            =   6000
         TabIndex        =   30
         Tag             =   "refopen.ico"
         ToolTipText     =   "Оплачивается в "
         Top             =   2715
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtPayDept 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   29
         ToolTipText     =   "Оплачивается в "
         Top             =   2715
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdSupplier 
         Height          =   300
         Left            =   6000
         TabIndex        =   27
         Tag             =   "refopen.ico"
         ToolTipText     =   "Поставщик"
         Top             =   2010
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtSupplier 
         Height          =   300
         Left            =   3450
         Locked          =   -1  'True
         TabIndex        =   26
         ToolTipText     =   "Поставщик"
         Top             =   2010
         Width           =   2550
      End
      Begin VB.TextBox txtVRCFinfo 
         Enabled         =   0   'False
         Height          =   1200
         Left            =   3450
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   24
         ToolTipText     =   "Данные отправителя"
         Top             =   405
         Width           =   3000
      End
      Begin MSComCtl2.DTPicker dtpAcceptDate 
         Height          =   300
         Left            =   300
         TabIndex        =   22
         ToolTipText     =   "Дата приема заявки"
         Top             =   6045
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   104333315
         CurrentDate     =   39567
      End
      Begin MTZ_PANEL.DropButton cmdClientPayed 
         Height          =   300
         Left            =   2850
         TabIndex        =   20
         Tag             =   "refopen.ico"
         ToolTipText     =   "Плательщик"
         Top             =   5340
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtClientPayed 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   19
         ToolTipText     =   "Плательщик"
         Top             =   5340
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdClientTo 
         Height          =   300
         Left            =   2850
         TabIndex        =   17
         Tag             =   "refopen.ico"
         ToolTipText     =   "Получатель"
         Top             =   4635
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtClientTo 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   16
         ToolTipText     =   "Получатель"
         Top             =   4635
         Width           =   2550
      End
      Begin MTZ_PANEL.DropButton cmdClientFrom 
         Height          =   300
         Left            =   2850
         TabIndex        =   14
         Tag             =   "refopen.ico"
         ToolTipText     =   "Отправитель"
         Top             =   3930
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtClientFrom 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   13
         ToolTipText     =   "Отправитель"
         Top             =   3930
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpPlanedDate 
         Height          =   300
         Left            =   300
         TabIndex        =   11
         ToolTipText     =   "Дата предполагаемой отправки"
         Top             =   3225
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CheckBox        =   -1  'True
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   104333315
         CurrentDate     =   39567
      End
      Begin VB.ComboBox cmbPlatType 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   9
         ToolTipText     =   "Платит"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtPEKCode 
         Height          =   300
         Left            =   300
         MaxLength       =   50
         TabIndex        =   7
         ToolTipText     =   "№ заявки"
         Top             =   1815
         Width           =   3000
      End
      Begin MTZ_PANEL.DropButton cmdFillial 
         Height          =   300
         Left            =   2850
         TabIndex        =   5
         Tag             =   "refopen.ico"
         ToolTipText     =   "Принята в"
         Top             =   1110
         Width           =   450
         _ExtentX        =   794
         _ExtentY        =   529
         Caption         =   ""
      End
      Begin VB.TextBox txtFillial 
         Height          =   300
         Left            =   300
         Locked          =   -1  'True
         TabIndex        =   4
         ToolTipText     =   "Принята в"
         Top             =   1110
         Width           =   2550
      End
      Begin MSComCtl2.DTPicker dtpQueryDate 
         Height          =   300
         Left            =   300
         TabIndex        =   2
         ToolTipText     =   "Дата запроса"
         Top             =   405
         Width           =   1800
         _ExtentX        =   3175
         _ExtentY        =   529
         _Version        =   393216
         CustomFormat    =   "dd.MM.yyyy"
         Format          =   104333315
         CurrentDate     =   39567
      End
      Begin VB.Label lblSummDopNDS 
         BackStyle       =   0  'Transparent
         Caption         =   "Сумма доп. услуг с НДС:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   53
         Top             =   5205
         Width           =   3000
      End
      Begin VB.Label lblSummDop 
         BackStyle       =   0  'Transparent
         Caption         =   "Сумма доп. услуг без НДС:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   51
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblSumm 
         BackStyle       =   0  'Transparent
         Caption         =   "Сумма без НДС:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   49
         Top             =   3795
         Width           =   3000
      End
      Begin VB.Label lblSummNDS 
         BackStyle       =   0  'Transparent
         Caption         =   "Сумма с НДС:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   47
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Label lblTRF 
         BackStyle       =   0  'Transparent
         Caption         =   "Тариф:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   44
         Top             =   2385
         Width           =   3000
      End
      Begin VB.Label lblLoadDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата приема груза на склад:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   42
         Top             =   1680
         Width           =   3000
      End
      Begin VB.Label lblTheComment 
         BackStyle       =   0  'Transparent
         Caption         =   "Примечания:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   6600
         TabIndex        =   40
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblIsNal 
         BackStyle       =   0  'Transparent
         Caption         =   "Наличная оплата:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   3450
         TabIndex        =   38
         Top             =   6105
         Width           =   3000
      End
      Begin VB.Label lblRcvInfo 
         BackStyle       =   0  'Transparent
         Caption         =   "Данные получателя:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   36
         Top             =   4500
         Width           =   3000
      End
      Begin VB.Label lblIsPayed 
         BackStyle       =   0  'Transparent
         Caption         =   "Оплачена:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   34
         Top             =   3795
         Width           =   3000
      End
      Begin VB.Label lblTheDogovor 
         BackStyle       =   0  'Transparent
         Caption         =   "Договор:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   31
         Top             =   3090
         Width           =   3000
      End
      Begin VB.Label lblPayDept 
         BackStyle       =   0  'Transparent
         Caption         =   "Оплачивается в :"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   3450
         TabIndex        =   28
         Top             =   2385
         Width           =   3000
      End
      Begin VB.Label lblSupplier 
         BackStyle       =   0  'Transparent
         Caption         =   "Поставщик:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   25
         Top             =   1680
         Width           =   3000
      End
      Begin VB.Label lblVRCFinfo 
         BackStyle       =   0  'Transparent
         Caption         =   "Данные отправителя:"
         Enabled         =   0   'False
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   23
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblAcceptDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата приема заявки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   21
         Top             =   5715
         Width           =   3000
      End
      Begin VB.Label lblClientPayed 
         BackStyle       =   0  'Transparent
         Caption         =   "Плательщик:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   18
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblClientTo 
         BackStyle       =   0  'Transparent
         Caption         =   "Получатель:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblClientFrom 
         BackStyle       =   0  'Transparent
         Caption         =   "Отправитель:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   12
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblPlanedDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата предполагаемой отправки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   10
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblPlatType 
         BackStyle       =   0  'Transparent
         Caption         =   "Платит:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   8
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblPEKCode 
         BackStyle       =   0  'Transparent
         Caption         =   "№ заявки:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   6
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblFillial 
         BackStyle       =   0  'Transparent
         Caption         =   "Принята в:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblQueryDate 
         BackStyle       =   0  'Transparent
         Caption         =   "Дата запроса:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "pekz_defmain"
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

Private Sub dtpQueryDate_Change()
  Changing

End Sub
Private Sub txtFillial_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdFillial_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_DEPT", ID, brief) Then
          txtFillial.Tag = Left(ID, 38)
          txtFillial = brief
        End If
End Sub
Private Sub cmdFillial_MenuClick(ByVal sCaption As String)
          txtFillial.Tag = ""
          txtFillial = ""
End Sub
Private Sub txtPEKCode_Change()
  Changing

End Sub
Private Sub cmbPlatType_Click()
  On Error Resume Next
  Changing
  If OnInit Then Exit Sub
  Save
  Set Item.TheDogovor = Nothing
  'Dim item As PEKZ.pekz_def
  Dim rs As ADODB.Recordset
  Dim dog As Object 'VRDG.Application
 
  If Item.PlatType = 0 Then ' PlatType_Otpravitel_
    If Not Item.ClientFrom Is Nothing Then
      Set Item.ClientPayed = Item.ClientFrom
  Set Item.TheDogovor = Nothing
      Set Item.TRF = Nothing
      If Item.TheDogovor Is Nothing Then
      Set rs = Item.Application.MTZSession.GetRowsEx("VRDGCommon", , , "Client = '" & Item.ClientFrom.ID & "'")
      While Not rs.EOF
        Set dog = Item.Application.Manager.GetInstanceObject(rs!InstanceID)
        If dog.StatusID = "{8B235B8F-AA9D-4B09-9FF1-D39D03B82F8C}" Or dog.StatusID = "{334E26DD-9135-49C4-8A28-095243B5AC74}" Then
         ' If Not dog.VRDGCommon.item(1).DogType Is Nothing Then
          '  If dog.VRDGCommon.item(1).DogType.TRType Is item.TRType Then
              Set Item.TheDogovor = dog
              Set rs = Nothing
              GoTo dogfound
           ' End If
          'End If
        End If
        rs.MoveNext
      Wend
      Set rs = Nothing
      End If
    End If
  End If
  
  If Item.PlatType = 1 Then
    If Not Item.ClientTo Is Nothing Then
      Set Item.ClientPayed = Item.ClientTo
      Set Item.TRF = Nothing
      If Item.TheDogovor Is Nothing Then
      Set rs = Item.Application.MTZSession.GetRowsEx("VRDGCommon", , , "Client = '" & Item.ClientTo.ID & "'")
      While Not rs.EOF
        Set dog = Item.Application.Manager.GetInstanceObject(rs!InstanceID)
        If dog.StatusID = "{8B235B8F-AA9D-4B09-9FF1-D39D03B82F8C}" Or dog.StatusID = "{334E26DD-9135-49C4-8A28-095243B5AC74}" Then
         ' If Not dog.VRDGCommon.item(1).DogType Is Nothing Then
          '  If dog.VRDGCommon.item(1).DogType.TRType Is item.TRType Then
              Set Item.TheDogovor = dog
              Set rs = Nothing
              GoTo dogfound
         '   End If
         ' End If
        End If
        rs.MoveNext
      Wend
      Set rs = Nothing
       End If
    End If
  End If
  
  If Item.PlatType = 2 Then ' PlatType_Drugoy
    If Not Item.ClientPayed Is Nothing Then
      Set Item.TRF = Nothing
      If Item.TheDogovor Is Nothing Then
    Set rs = Item.Application.MTZSession.GetRowsEx("VRDGCommon", , , "Client = '" & Item.ClientPayed.ID & "'")
      While Not rs.EOF
        Set dog = Item.Application.Manager.GetInstanceObject(rs!InstanceID)
        If dog.StatusID = "{8B235B8F-AA9D-4B09-9FF1-D39D03B82F8C}" Or dog.StatusID = "{334E26DD-9135-49C4-8A28-095243B5AC74}" Then
         ' If Not dog.VRDGCommon.item(1).DogType Is Nothing Then
          '  If dog.VRDGCommon.item(1).DogType.TRType Is item.TRType Then
              Set Item.TheDogovor = dog
              Set rs = Nothing
              GoTo dogfound
           ' End If
         ' End If
        End If
        rs.MoveNext
      Wend
      Set rs = Nothing
      End If
    End If
  End If
dogfound:
  InitPanel

End Sub
Private Sub dtpPlanedDate_Change()
  Changing

End Sub
Private Sub txtClientFrom_Change()
  If Not (OnInit) Then
  Changing
  If OnInit Then Exit Sub
  Save

  If Not Item.ClientFrom Is Nothing Then
    With Item.ClientFrom
      Item.VRCFinfo = "Тел.: " & .vrccommoninfo.Item(1).Phone & vbCrLf & "Факс: " & .vrccommoninfo.Item(1).Fax
    End With
  End If

  'Dim item As PEKZ.pekz_def
  Dim rs As ADODB.Recordset
  Dim dog As Object 'VRDG.Application
 
  If Item.PlatType = 0 Then ' PlatType_Otpravitel_
    If Not Item.ClientFrom Is Nothing Then
      Set Item.ClientPayed = Item.ClientFrom
      Set Item.TheDogovor = Nothing
      Set Item.TRF = Nothing
      If Item.TheDogovor Is Nothing Then
      Set rs = Item.Application.MTZSession.GetRowsEx("VRDGCommon", , , "Client = '" & Item.ClientFrom.ID & "'")
      While Not rs.EOF
        Set dog = Item.Application.Manager.GetInstanceObject(rs!InstanceID)
        If dog.StatusID = "{8B235B8F-AA9D-4B09-9FF1-D39D03B82F8C}" Or dog.StatusID = "{334E26DD-9135-49C4-8A28-095243B5AC74}" Then
         ' If Not dog.VRDGCommon.item(1).DogType Is Nothing Then
          '  If dog.VRDGCommon.item(1).DogType.TRType Is item.TRType Then
              Set Item.TheDogovor = dog
              Set rs = Nothing
              GoTo dogfound
           ' End If
         ' End If
        End If
        rs.MoveNext
      Wend
      Set rs = Nothing
      End If
    End If
  End If
  
  If Item.PlatType = 1 Then
    If Not Item.ClientTo Is Nothing Then
      Set Item.ClientPayed = Item.ClientTo
      Set Item.TRF = Nothing
      If Item.TheDogovor Is Nothing Then
      Set rs = Item.Application.MTZSession.GetRowsEx("VRDGCommon", , , "Client = '" & Item.ClientTo.ID & "'")
      While Not rs.EOF
        Set dog = Item.Application.Manager.GetInstanceObject(rs!InstanceID)
        If dog.StatusID = "{8B235B8F-AA9D-4B09-9FF1-D39D03B82F8C}" Or dog.StatusID = "{334E26DD-9135-49C4-8A28-095243B5AC74}" Then
          If Not dog.VRDGCommon.Item(1).DogType Is Nothing Then
            If dog.VRDGCommon.Item(1).DogType.TRType Is Item.TRType Then
              Set Item.TheDogovor = dog
              Set rs = Nothing
              GoTo dogfound
            End If
          End If
        End If
        rs.MoveNext
      Wend
      Set rs = Nothing
       End If
    End If
  End If
  
  If Item.PlatType = 2 Then ' PlatType_Drugoy
    If Not Item.ClientPayed Is Nothing Then
      Set Item.TRF = Nothing
      If Item.TheDogovor Is Nothing Then
    Set rs = Item.Application.MTZSession.GetRowsEx("VRDGCommon", , , "Client = '" & Item.ClientPayed.ID & "'")
      While Not rs.EOF
        Set dog = Item.Application.Manager.GetInstanceObject(rs!InstanceID)
        If dog.StatusID = "{8B235B8F-AA9D-4B09-9FF1-D39D03B82F8C}" Or dog.StatusID = "{334E26DD-9135-49C4-8A28-095243B5AC74}" Then
          If Not dog.VRDGCommon.Item(1).DogType Is Nothing Then
            If dog.VRDGCommon.Item(1).DogType.TRType Is Item.TRType Then
              Set Item.TheDogovor = dog
              Set rs = Nothing
              GoTo dogfound
            End If
          End If
        End If
        rs.MoveNext
      Wend
      Set rs = Nothing
      End If
    End If
  End If
dogfound:
  InitPanel



  End If
End Sub
Private Sub cmdClientFrom_CLick()
  On Error Resume Next
     If txtClientFrom.Tag = "" Then
       cmdClientFrom_MenuClick "Выбрать"
     Else
       cmdClientFrom_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdClientFrom_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtClientFrom.Tag = ""
          txtClientFrom = ""
  End If
  If sCaption = "Открыть" Then
    If txtClientFrom.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtClientFrom.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtClientFrom.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRC2", "STATUSNAME <>'В Архиве'  and VRCCommonInfo_MarkToDelete='Нет' ")
        If OK Then
          txtClientFrom.Tag = Left(ID, 38)
          txtClientFrom = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "VRC2" & Now
        ook = findObject(Item.Application.Manager, "VRC2", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtClientFrom.Tag = ID
              txtClientFrom = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "VRC2", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtClientFrom.Tag = obj.ID
              txtClientFrom = obj.brief
          Else
              txtClientFrom.Tag = ""
              txtClientFrom = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtClientTo_Change()
  If Not (OnInit) Then
  Changing
  If OnInit Then Exit Sub
  Save
  'Dim item As PEKZ.pekz_def
  Dim rs As ADODB.Recordset
  Dim dog As Object 'VRDG.Application
  
  If Not Item.ClientTo Is Nothing Then
    txtRcvInfo.Text = "Тел.: " & Item.ClientTo.vrccommoninfo.Item(1).Phone & vbCrLf & "Факс: " & Item.ClientTo.vrccommoninfo.Item(1).Fax
    Item.RcvInfo = txtRcvInfo.Text
  Else
    txtRcvInfo.Text = ""
    Item.RcvInfo = txtRcvInfo.Text
  End If

  If Item.PlatType = 0 Then ' PlatType_Otpravitel_
    If Not Item.ClientFrom Is Nothing Then
      Set Item.ClientPayed = Item.ClientFrom
      Set Item.TRF = Nothing
      If Item.TheDogovor Is Nothing Then
      Set rs = Item.Application.MTZSession.GetRowsEx("VRDGCommon", , , "Client = '" & Item.ClientFrom.ID & "'")
      While Not rs.EOF
        Set dog = Item.Application.Manager.GetInstanceObject(rs!InstanceID)
        If dog.StatusID = "{8B235B8F-AA9D-4B09-9FF1-D39D03B82F8C}" Or dog.StatusID = "{334E26DD-9135-49C4-8A28-095243B5AC74}" Then
          'If Not dog.VRDGCommon.item(1).DogType Is Nothing Then
          '  If dog.VRDGCommon.item(1).DogType.TRType Is item.TRType Then
              Set Item.TheDogovor = dog
              Set rs = Nothing
              GoTo dogfound
          '  End If
         ' End If
        End If
        rs.MoveNext
      Wend
      Set rs = Nothing
      End If
    End If
  End If
  
  If Item.PlatType = 1 Then
    If Not Item.ClientTo Is Nothing Then
      Set Item.ClientPayed = Item.ClientTo
      Set Item.TheDogovor = Nothing
      Set Item.TRF = Nothing
      If Item.TheDogovor Is Nothing Then
      Set rs = Item.Application.MTZSession.GetRowsEx("VRDGCommon", , , "Client = '" & Item.ClientTo.ID & "'")
      While Not rs.EOF
        Set dog = Item.Application.Manager.GetInstanceObject(rs!InstanceID)
        If dog.StatusID = "{8B235B8F-AA9D-4B09-9FF1-D39D03B82F8C}" Or dog.StatusID = "{334E26DD-9135-49C4-8A28-095243B5AC74}" Then
          'If Not dog.VRDGCommon.item(1).DogType Is Nothing Then
           ' If dog.VRDGCommon.item(1).DogType.TRType Is item.TRType Then
              Set Item.TheDogovor = dog
              Set rs = Nothing
              GoTo dogfound
           ' End If
         ' End If
        End If
        rs.MoveNext
      Wend
      Set rs = Nothing
       End If
    End If
  End If
  
  If Item.PlatType = 2 Then ' PlatType_Drugoy
    If Not Item.ClientPayed Is Nothing Then
      Set Item.TRF = Nothing
      If Item.TheDogovor Is Nothing Then
    Set rs = Item.Application.MTZSession.GetRowsEx("VRDGCommon", , , "Client = '" & Item.ClientPayed.ID & "'")
      While Not rs.EOF
        Set dog = Item.Application.Manager.GetInstanceObject(rs!InstanceID)
        If dog.StatusID = "{8B235B8F-AA9D-4B09-9FF1-D39D03B82F8C}" Or dog.StatusID = "{334E26DD-9135-49C4-8A28-095243B5AC74}" Then
         ' If Not dog.VRDGCommon.item(1).DogType Is Nothing Then
          '  If dog.VRDGCommon.item(1).DogType.TRType Is item.TRType Then
              Set Item.TheDogovor = dog
              Set rs = Nothing
              GoTo dogfound
         '   End If
         ' End If
        End If
        rs.MoveNext
      Wend
      Set rs = Nothing
      End If
    End If
  End If
dogfound:
  InitPanel

  End If
End Sub
Private Sub cmdClientTo_CLick()
  On Error Resume Next
     If txtClientTo.Tag = "" Then
       cmdClientTo_MenuClick "Выбрать"
     Else
       cmdClientTo_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdClientTo_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtClientTo.Tag = ""
          txtClientTo = ""
  End If
  If sCaption = "Открыть" Then
    If txtClientTo.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtClientTo.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtClientTo.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRC2", "STATUSNAME <>'В Архиве'  and VRCCommonInfo_MarkToDelete='Нет' ")
        If OK Then
          txtClientTo.Tag = Left(ID, 38)
          txtClientTo = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "VRC2" & Now
        ook = findObject(Item.Application.Manager, "VRC2", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtClientTo.Tag = ID
              txtClientTo = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "VRC2", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtClientTo.Tag = obj.ID
              txtClientTo = obj.brief
          Else
              txtClientTo.Tag = ""
              txtClientTo = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtClientPayed_Change()
  If Not (OnInit) Then
  Changing
  If OnInit Then Exit Sub
  Save
  Set Item.TheDogovor = Nothing

  'Dim item As PEKZ.pekz_def
  Dim rs As ADODB.Recordset
  Dim dog As Object 'VRDG.Application


  If Item.PlatType = 0 Then ' PlatType_Otpravitel_
    If Not Item.ClientFrom Is Nothing Then
      Set Item.ClientPayed = Item.ClientFrom
      Set Item.TRF = Nothing
      If Item.TheDogovor Is Nothing Then
      Set rs = Item.Application.MTZSession.GetRowsEx("VRDGCommon", , , "Client = '" & Item.ClientFrom.ID & "'")
      While Not rs.EOF
        Set dog = Item.Application.Manager.GetInstanceObject(rs!InstanceID)
        If dog.StatusID = "{8B235B8F-AA9D-4B09-9FF1-D39D03B82F8C}" Or dog.StatusID = "{334E26DD-9135-49C4-8A28-095243B5AC74}" Then
          'If Not dog.VRDGCommon.item(1).DogType Is Nothing Then
          '  If dog.VRDGCommon.item(1).DogType.TRType Is item.TRType Then
              Set Item.TheDogovor = dog
              Set rs = Nothing
              GoTo dogfound
           ' End If
          'End If
        End If
        rs.MoveNext
      Wend
      Set rs = Nothing
      End If
    End If
  End If
  
  If Item.PlatType = 1 Then
    If Not Item.ClientTo Is Nothing Then
      Set Item.ClientPayed = Item.ClientTo
      Set Item.TRF = Nothing
      If Item.TheDogovor Is Nothing Then
      Set rs = Item.Application.MTZSession.GetRowsEx("VRDGCommon", , , "Client = '" & Item.ClientTo.ID & "'")
      While Not rs.EOF
        Set dog = Item.Application.Manager.GetInstanceObject(rs!InstanceID)
        If dog.StatusID = "{8B235B8F-AA9D-4B09-9FF1-D39D03B82F8C}" Or dog.StatusID = "{334E26DD-9135-49C4-8A28-095243B5AC74}" Then
          If Not dog.VRDGCommon.Item(1).DogType Is Nothing Then
            If dog.VRDGCommon.Item(1).DogType.TRType Is Item.TRType Then
              Set Item.TheDogovor = dog
              Set rs = Nothing
              GoTo dogfound
            End If
          End If
        End If
        rs.MoveNext
      Wend
      Set rs = Nothing
       End If
    End If
  End If
  
  If Item.PlatType = 2 Then ' PlatType_Drugoy
    If Not Item.ClientPayed Is Nothing Then
      Set Item.TRF = Nothing
      If Item.TheDogovor Is Nothing Then
    Set rs = Item.Application.MTZSession.GetRowsEx("VRDGCommon", , , "Client = '" & Item.ClientPayed.ID & "'")
      While Not rs.EOF
        Set dog = Item.Application.Manager.GetInstanceObject(rs!InstanceID)
        If dog.StatusID = "{8B235B8F-AA9D-4B09-9FF1-D39D03B82F8C}" Or dog.StatusID = "{334E26DD-9135-49C4-8A28-095243B5AC74}" Then
          If Not dog.VRDGCommon.Item(1).DogType Is Nothing Then
            If dog.VRDGCommon.Item(1).DogType.TRType Is Item.TRType Then
              Set Item.TheDogovor = dog
              Set rs = Nothing
              GoTo dogfound
            End If
          End If
        End If
        rs.MoveNext
      Wend
      Set rs = Nothing
      End If
    End If
  End If
dogfound:
  InitPanel

  End If
End Sub
Private Sub cmdClientPayed_CLick()
  On Error Resume Next
     If txtClientPayed.Tag = "" Then
       cmdClientPayed_MenuClick "Выбрать"
     Else
       cmdClientPayed_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdClientPayed_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtClientPayed.Tag = ""
          txtClientPayed = ""
  End If
  If sCaption = "Открыть" Then
    If txtClientPayed.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtClientPayed.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtClientPayed.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRC2", "STATUSNAME <>'В Архиве'  and VRCCommonInfo_MarkToDelete='Нет' ")
        If OK Then
          txtClientPayed.Tag = Left(ID, 38)
          txtClientPayed = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "VRC2" & Now
        ook = findObject(Item.Application.Manager, "VRC2", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtClientPayed.Tag = ID
              txtClientPayed = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "VRC2", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtClientPayed.Tag = obj.ID
              txtClientPayed = obj.brief
          Else
              txtClientPayed.Tag = ""
              txtClientPayed = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub dtpAcceptDate_Change()
  Changing

End Sub
Private Sub txtVRCFinfo_Change()
  Changing

End Sub
Private Sub txtSupplier_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdSupplier_CLick()
  On Error Resume Next
     If txtSupplier.Tag = "" Then
       cmdSupplier_MenuClick "Выбрать"
     Else
       cmdSupplier_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdSupplier_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtSupplier.Tag = ""
          txtSupplier = ""
  End If
  If sCaption = "Открыть" Then
    If txtSupplier.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtSupplier.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtSupplier.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRC2", "VRCCommonInfo_Transporter_Val=-1")
        If OK Then
          txtSupplier.Tag = Left(ID, 38)
          txtSupplier = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "VRC2" & Now
        ook = findObject(Item.Application.Manager, "VRC2", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtSupplier.Tag = ID
              txtSupplier = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "VRC2", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtSupplier.Tag = obj.ID
              txtSupplier = obj.brief
          Else
              txtSupplier.Tag = ""
              txtSupplier = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub txtPayDept_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdPayDept_CLick()
  On Error Resume Next
        Dim ID As String, brief As String
        If Item.Application.Manager.GetReferenceDialogEx2("PEKD_DEPT", ID, brief) Then
          txtPayDept.Tag = Left(ID, 38)
          txtPayDept = brief
        End If
End Sub
Private Sub cmdPayDept_MenuClick(ByVal sCaption As String)
          txtPayDept.Tag = ""
          txtPayDept = ""
End Sub
Private Sub txtTheDogovor_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTheDogovor_CLick()
  On Error Resume Next
     If txtTheDogovor.Tag = "" Then
       cmdTheDogovor_MenuClick "Выбрать"
     Else
       cmdTheDogovor_MenuClick "Открыть"
     End If
End Sub
Private Sub cmdTheDogovor_MenuClick(ByVal sCaption As String)
  On Error Resume Next
    Dim inst As Object
    Dim obj As Object
    Dim Gobj As Object
    Dim OK As Boolean
    Dim ID As String
    Dim brief As String
  If sCaption = "Очистить" Then
          txtTheDogovor.Tag = ""
          txtTheDogovor = ""
  End If
  If sCaption = "Открыть" Then
    If txtTheDogovor.Tag = "" Then Exit Sub
    Set inst = Item.Application.Manager.GetInstanceObject(txtTheDogovor.Tag)
    If inst Is Nothing Then Exit Sub
    Set obj = Item.Application.Manager.GetInstanceGUI(txtTheDogovor.Tag)
    obj.Show "", inst, False
    Set obj = Nothing
    Set inst = Nothing
  End If
  If sCaption = "Выбрать" Then
        OK = Item.Application.Manager.GetObjectListDialogEx(ID, brief, "", "VRDG2", IIf(txtClientPayed.Tag = "", "VRDGCOMMON_CLIENT_ID is null", "VRDGCOMMON_CLIENT_ID='" & txtClientPayed.Tag & "'  and  VRDGCommon_PZDog_VAL=0  and STATUSNAME in ('Оформлен','Подписан')"))
        If OK Then
          txtTheDogovor.Tag = Left(ID, 38)
          txtTheDogovor = brief
        End If
  End If
  If sCaption = "Создать" Then
     On Error Resume Next
        Dim ook As Boolean
        Dim Cancel As Boolean
        brief = "VRDG2" & Now
        ook = findObject(Item.Application.Manager, "VRDG2", ID, brief, Cancel)
        If Cancel Then
          Exit Sub
        End If
        If ook Then
              txtTheDogovor.Tag = ID
              txtTheDogovor = brief
              Exit Sub
        End If
        If Not ook Then
          ID = CreateGUID2()
          ook = Item.Application.Manager.NewInstance(ID, "VRDG2", brief)
        End If
        Set obj = Item.Application.Manager.GetInstanceObject(ID)
        If Not obj Is Nothing Then
          Set Gobj = Item.Application.Manager.GetInstanceGUI(obj.ID)
          Gobj.Show "", obj, False
          Set obj = Item.Application.Manager.GetInstanceObject(obj.ID)
          If (Not obj Is Nothing) Then
              txtTheDogovor.Tag = obj.ID
              txtTheDogovor = obj.brief
          Else
              txtTheDogovor.Tag = ""
              txtTheDogovor = ""
          End If
          Set obj = Nothing
          Set Gobj = Nothing
        End If
  End If
End Sub
Private Sub cmbIsPayed_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtRcvInfo_Change()
  Changing

End Sub
Private Sub cmbIsNal_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtTheComment_Change()
  Changing

End Sub
Private Sub dtpLoadDate_Change()
  Changing

End Sub
Private Sub txtTRF_Change()
  If Not (OnInit) Then
  Changing

  End If
End Sub
Private Sub cmdTRF_CLick()
  On Error Resume Next
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub cmdTRF_MenuClick(ByVal sCaption As String)
        MsgBox "Режим не предусматривает редактирования", vbInformation
End Sub
Private Sub txtSummNDS_Change()
  Changing

End Sub
Private Sub txtSumm_Change()
  Changing

End Sub
Private Sub txtSummDop_Change()
  Changing

End Sub
Private Sub txtSummDopNDS_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(dtpQueryDate.Value)
If mIsOK Then mIsOK = txtFillial.Tag <> ""
If mIsOK Then mIsOK = (cmbPlatType.ListIndex >= 0)
If mIsOK Then mIsOK = txtPayDept.Tag <> ""
If mIsOK Then mIsOK = (cmbIsNal.ListIndex >= 0)
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

dtpQueryDate = Date
If Item.QueryDate <> 0 Then
 dtpQueryDate = Item.QueryDate
End If
If Not Item.Fillial Is Nothing Then
  txtFillial.Tag = Item.Fillial.ID
  txtFillial = Item.Fillial.brief
Else
  txtFillial.Tag = ""
  txtFillial = ""
End If
 LoadBtnPictures cmdFillial, cmdFillial.Tag
  cmdFillial.RemoveAllMenu
  cmdFillial.AddMenu "Очистить"
  On Error Resume Next
txtPEKCode = Item.PEKCode
cmbPlatType.Clear
cmbPlatType.AddItem "Отправитель"
cmbPlatType.ItemData(cmbPlatType.NewIndex) = 0
cmbPlatType.AddItem "Получатель"
cmbPlatType.ItemData(cmbPlatType.NewIndex) = 1
cmbPlatType.AddItem "Другой"
cmbPlatType.ItemData(cmbPlatType.NewIndex) = 2
 For iii = 0 To cmbPlatType.ListCount - 1
  If Item.PlatType = cmbPlatType.ItemData(iii) Then
   cmbPlatType.ListIndex = iii
   Exit For
  End If
 Next
dtpPlanedDate = Date
If Item.PlanedDate <> 0 Then
 dtpPlanedDate = Item.PlanedDate
Else
 dtpPlanedDate.Value = Null
End If
If Not Item.ClientFrom Is Nothing Then
  txtClientFrom.Tag = Item.ClientFrom.ID
  txtClientFrom = Item.ClientFrom.brief
Else
  txtClientFrom.Tag = ""
  txtClientFrom = ""
End If
 LoadBtnPictures cmdClientFrom, cmdClientFrom.Tag
  cmdClientFrom.RemoveAllMenu
  cmdClientFrom.AddMenu "Очистить"
  cmdClientFrom.AddMenu "Создать"
  cmdClientFrom.AddMenu "Выбрать"
  cmdClientFrom.AddMenu "Открыть"
If Not Item.ClientTo Is Nothing Then
  txtClientTo.Tag = Item.ClientTo.ID
  txtClientTo = Item.ClientTo.brief
Else
  txtClientTo.Tag = ""
  txtClientTo = ""
End If
 LoadBtnPictures cmdClientTo, cmdClientTo.Tag
  cmdClientTo.RemoveAllMenu
  cmdClientTo.AddMenu "Очистить"
  cmdClientTo.AddMenu "Создать"
  cmdClientTo.AddMenu "Выбрать"
  cmdClientTo.AddMenu "Открыть"
If Not Item.ClientPayed Is Nothing Then
  txtClientPayed.Tag = Item.ClientPayed.ID
  txtClientPayed = Item.ClientPayed.brief
Else
  txtClientPayed.Tag = ""
  txtClientPayed = ""
End If
 LoadBtnPictures cmdClientPayed, cmdClientPayed.Tag
  cmdClientPayed.RemoveAllMenu
  cmdClientPayed.AddMenu "Очистить"
  cmdClientPayed.AddMenu "Создать"
  cmdClientPayed.AddMenu "Выбрать"
  cmdClientPayed.AddMenu "Открыть"
dtpAcceptDate = Date
If Item.AcceptDate <> 0 Then
 dtpAcceptDate = Item.AcceptDate
Else
 dtpAcceptDate.Value = Null
End If
txtVRCFinfo = Item.VRCFinfo
If Not Item.Supplier Is Nothing Then
  txtSupplier.Tag = Item.Supplier.ID
  txtSupplier = Item.Supplier.brief
Else
  txtSupplier.Tag = ""
  txtSupplier = ""
End If
 LoadBtnPictures cmdSupplier, cmdSupplier.Tag
  cmdSupplier.RemoveAllMenu
  cmdSupplier.AddMenu "Очистить"
  cmdSupplier.AddMenu "Создать"
  cmdSupplier.AddMenu "Выбрать"
  cmdSupplier.AddMenu "Открыть"
If Not Item.PayDept Is Nothing Then
  txtPayDept.Tag = Item.PayDept.ID
  txtPayDept = Item.PayDept.brief
Else
  txtPayDept.Tag = ""
  txtPayDept = ""
End If
 LoadBtnPictures cmdPayDept, cmdPayDept.Tag
  cmdPayDept.RemoveAllMenu
  cmdPayDept.AddMenu "Очистить"
If Not Item.TheDogovor Is Nothing Then
  txtTheDogovor.Tag = Item.TheDogovor.ID
  txtTheDogovor = Item.TheDogovor.brief
Else
  txtTheDogovor.Tag = ""
  txtTheDogovor = ""
End If
 LoadBtnPictures cmdTheDogovor, cmdTheDogovor.Tag
  cmdTheDogovor.RemoveAllMenu
  cmdTheDogovor.AddMenu "Очистить"
  cmdTheDogovor.AddMenu "Создать"
  cmdTheDogovor.AddMenu "Выбрать"
  cmdTheDogovor.AddMenu "Открыть"
cmbIsPayed.Clear
cmbIsPayed.AddItem "Да"
cmbIsPayed.ItemData(cmbIsPayed.NewIndex) = -1
cmbIsPayed.AddItem "Нет"
cmbIsPayed.ItemData(cmbIsPayed.NewIndex) = 0
 For iii = 0 To cmbIsPayed.ListCount - 1
  If Item.IsPayed = cmbIsPayed.ItemData(iii) Then
   cmbIsPayed.ListIndex = iii
   Exit For
  End If
 Next
txtRcvInfo = Item.RcvInfo
cmbIsNal.Clear
cmbIsNal.AddItem "Да"
cmbIsNal.ItemData(cmbIsNal.NewIndex) = -1
cmbIsNal.AddItem "Нет"
cmbIsNal.ItemData(cmbIsNal.NewIndex) = 0
 For iii = 0 To cmbIsNal.ListCount - 1
  If Item.IsNal = cmbIsNal.ItemData(iii) Then
   cmbIsNal.ListIndex = iii
   Exit For
  End If
 Next
txtTheComment = Item.TheComment
dtpLoadDate = Date
If Item.Loaddate <> 0 Then
 dtpLoadDate = Item.Loaddate
Else
 dtpLoadDate.Value = Null
End If
If Not Item.TRF Is Nothing Then
  txtTRF.Tag = Item.TRF.ID
  txtTRF = Item.TRF.brief
Else
  txtTRF.Tag = ""
  txtTRF = ""
End If
 LoadBtnPictures cmdTRF, cmdTRF.Tag
  cmdTRF.RemoveAllMenu
  cmdTRF.AddMenu "Очистить"
txtSummNDS = Item.SummNDS
txtSumm = Item.Summ
txtSummDop = Item.SummDop
txtSummDopNDS = Item.SummDopNDS
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

  If IsNull(dtpQueryDate) Then
    Item.QueryDate = 0
  Else
    Item.QueryDate = dtpQueryDate.Value
  End If
If txtFillial.Tag <> "" Then
  Set Item.Fillial = Item.Application.FindRowObject("PEKD_DEPT", txtFillial.Tag)
Else
  Set Item.Fillial = Nothing
End If
Item.PEKCode = txtPEKCode
 If cmbPlatType.ListIndex >= 0 Then
   Item.PlatType = cmbPlatType.ItemData(cmbPlatType.ListIndex)
 End If
  If IsNull(dtpPlanedDate) Then
    Item.PlanedDate = 0
  Else
    Item.PlanedDate = dtpPlanedDate.Value
  End If
If txtClientFrom.Tag <> "" Then
  Set Item.ClientFrom = Item.Application.Manager.GetInstanceObject(txtClientFrom.Tag)
Else
  Set Item.ClientFrom = Nothing
End If
If txtClientTo.Tag <> "" Then
  Set Item.ClientTo = Item.Application.Manager.GetInstanceObject(txtClientTo.Tag)
Else
  Set Item.ClientTo = Nothing
End If
If txtClientPayed.Tag <> "" Then
  Set Item.ClientPayed = Item.Application.Manager.GetInstanceObject(txtClientPayed.Tag)
Else
  Set Item.ClientPayed = Nothing
End If
  If IsNull(dtpAcceptDate) Then
    Item.AcceptDate = 0
  Else
    Item.AcceptDate = dtpAcceptDate.Value
  End If
If txtSupplier.Tag <> "" Then
  Set Item.Supplier = Item.Application.Manager.GetInstanceObject(txtSupplier.Tag)
Else
  Set Item.Supplier = Nothing
End If
If txtPayDept.Tag <> "" Then
  Set Item.PayDept = Item.Application.FindRowObject("PEKD_DEPT", txtPayDept.Tag)
Else
  Set Item.PayDept = Nothing
End If
If txtTheDogovor.Tag <> "" Then
  Set Item.TheDogovor = Item.Application.Manager.GetInstanceObject(txtTheDogovor.Tag)
Else
  Set Item.TheDogovor = Nothing
End If
 If cmbIsPayed.ListIndex >= 0 Then
   Item.IsPayed = cmbIsPayed.ItemData(cmbIsPayed.ListIndex)
 End If
 If cmbIsNal.ListIndex >= 0 Then
   Item.IsNal = cmbIsNal.ItemData(cmbIsNal.ListIndex)
 End If
Item.TheComment = txtTheComment
  If IsNull(dtpLoadDate) Then
    Item.Loaddate = 0
  Else
    Item.Loaddate = dtpLoadDate.Value
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



