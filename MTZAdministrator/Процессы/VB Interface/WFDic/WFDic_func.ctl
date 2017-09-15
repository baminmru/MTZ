VERSION 5.00
Object = "{1801C003-859D-471D-BF31-D4428050324B}#2.1#0"; "MTZ_PANEL.ocx"
Begin VB.UserControl WFDic_func 
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
      Begin VB.TextBox txtIntegrationData2 
         Height          =   300
         Left            =   3450
         MaxLength       =   120
         TabIndex        =   20
         ToolTipText     =   "Даные для интеграции 2"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtIntegrationData1 
         Height          =   300
         Left            =   3450
         MaxLength       =   120
         TabIndex        =   18
         ToolTipText     =   "Даные для интеграции 1"
         Top             =   405
         Width           =   3000
      End
      Begin VB.TextBox txtthe_Comment 
         Height          =   1200
         Left            =   300
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   16
         ToolTipText     =   "Примечание"
         Top             =   5340
         Width           =   3000
      End
      Begin VB.ComboBox cmbIsMailStone 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   14
         ToolTipText     =   "Это веха процесса"
         Top             =   4635
         Width           =   3000
      End
      Begin VB.TextBox txtRTMProgID 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   12
         ToolTipText     =   "Класс режима исполнения"
         Top             =   3930
         Width           =   3000
      End
      Begin VB.TextBox txtEdtMode 
         Height          =   300
         Left            =   300
         MaxLength       =   64
         TabIndex        =   10
         ToolTipText     =   "Режим запуска"
         Top             =   3225
         Width           =   3000
      End
      Begin VB.TextBox txtProgID 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   8
         ToolTipText     =   "COM класс"
         Top             =   2520
         Width           =   3000
      End
      Begin VB.TextBox txtIconName 
         Height          =   300
         Left            =   300
         MaxLength       =   80
         TabIndex        =   6
         ToolTipText     =   "Название иконки"
         Top             =   1815
         Width           =   3000
      End
      Begin VB.ComboBox cmbStepClass 
         Height          =   315
         Left            =   300
         Sorted          =   -1  'True
         Style           =   2  'Dropdown List
         TabIndex        =   4
         ToolTipText     =   "Тип"
         Top             =   1110
         Width           =   3000
      End
      Begin VB.TextBox txtName 
         Height          =   300
         Left            =   300
         MaxLength       =   255
         TabIndex        =   2
         ToolTipText     =   "Название"
         Top             =   405
         Width           =   3000
      End
      Begin VB.Label lblIntegrationData2 
         BackStyle       =   0  'Transparent
         Caption         =   "Даные для интеграции 2:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   19
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblIntegrationData1 
         BackStyle       =   0  'Transparent
         Caption         =   "Даные для интеграции 1:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   3450
         TabIndex        =   17
         Top             =   75
         Width           =   3000
      End
      Begin VB.Label lblthe_Comment 
         BackStyle       =   0  'Transparent
         Caption         =   "Примечание:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   15
         Top             =   5010
         Width           =   3000
      End
      Begin VB.Label lblIsMailStone 
         BackStyle       =   0  'Transparent
         Caption         =   "Это веха процесса:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   13
         Top             =   4305
         Width           =   3000
      End
      Begin VB.Label lblRTMProgID 
         BackStyle       =   0  'Transparent
         Caption         =   "Класс режима исполнения:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   11
         Top             =   3600
         Width           =   3000
      End
      Begin VB.Label lblEdtMode 
         BackStyle       =   0  'Transparent
         Caption         =   "Режим запуска:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   9
         Top             =   2895
         Width           =   3000
      End
      Begin VB.Label lblProgID 
         BackStyle       =   0  'Transparent
         Caption         =   "COM класс:"
         ForeColor       =   &H00FF0000&
         Height          =   300
         Left            =   300
         TabIndex        =   7
         Top             =   2190
         Width           =   3000
      End
      Begin VB.Label lblIconName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название иконки:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   5
         Top             =   1485
         Width           =   3000
      End
      Begin VB.Label lblStepClass 
         BackStyle       =   0  'Transparent
         Caption         =   "Тип:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   3
         Top             =   780
         Width           =   3000
      End
      Begin VB.Label lblName 
         BackStyle       =   0  'Transparent
         Caption         =   "Название:"
         ForeColor       =   &H000000FF&
         Height          =   300
         Left            =   300
         TabIndex        =   1
         Top             =   75
         Width           =   3000
      End
   End
End
Attribute VB_Name = "WFDic_func"
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

Private Sub txtName_Change()
  Changing

End Sub
Private Sub cmbStepClass_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtIconName_Change()
  Changing

End Sub
Private Sub txtProgID_Change()
  Changing

End Sub
Private Sub txtEdtMode_Change()
  Changing

End Sub
Private Sub txtRTMProgID_Change()
  Changing

End Sub
Private Sub cmbIsMailStone_Click()
  On Error Resume Next
  Changing

End Sub
Private Sub txtthe_Comment_Change()
  Changing

End Sub
Private Sub txtIntegrationData1_Change()
  Changing

End Sub
Private Sub txtIntegrationData2_Change()
  Changing

End Sub
Private Sub UserControl_Terminate()
  Set Item = Nothing
End Sub
Public Function IsOK() As Boolean
  On Error Resume Next
  Dim mIsOK As Boolean
  mIsOK = True

If mIsOK Then mIsOK = IsSet(txtName.Text)
If mIsOK Then mIsOK = (cmbStepClass.ListIndex >= 0)
If mIsOK Then mIsOK = IsSet(txtIconName.Text)
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

txtName = Item.Name
cmbStepClass.Clear
cmbStepClass.AddItem "SimpleFunction"
cmbStepClass.ItemData(cmbStepClass.NewIndex) = 0
cmbStepClass.AddItem "StartFunction"
cmbStepClass.ItemData(cmbStepClass.NewIndex) = 1
cmbStepClass.AddItem "StopFunction"
cmbStepClass.ItemData(cmbStepClass.NewIndex) = 2
cmbStepClass.AddItem "PeriodicFunction"
cmbStepClass.ItemData(cmbStepClass.NewIndex) = 3
 For iii = 0 To cmbStepClass.ListCount - 1
  If Item.StepClass = cmbStepClass.ItemData(iii) Then
   cmbStepClass.ListIndex = iii
   Exit For
  End If
 Next
txtIconName = Item.IconName
txtProgID = Item.ProgId
txtEdtMode = Item.EdtMode
txtRTMProgID = Item.RTMProgID
cmbIsMailStone.Clear
cmbIsMailStone.AddItem "Да"
cmbIsMailStone.ItemData(cmbIsMailStone.NewIndex) = -1
cmbIsMailStone.AddItem "Нет"
cmbIsMailStone.ItemData(cmbIsMailStone.NewIndex) = 0
 For iii = 0 To cmbIsMailStone.ListCount - 1
  If Item.IsMailStone = cmbIsMailStone.ItemData(iii) Then
   cmbIsMailStone.ListIndex = iii
   Exit For
  End If
 Next
txtthe_Comment = Item.the_Comment
txtIntegrationData1 = Item.IntegrationData1
txtIntegrationData2 = Item.IntegrationData2
OnInit = False
End Sub
Private Sub Changing()
If OnInit Then Exit Sub

 mIsChanged = True
 RaiseEvent Changed
End Sub
Public Sub Save()
If OnInit Then Exit Sub

Item.Name = txtName
 If cmbStepClass.ListIndex >= 0 Then
   Item.StepClass = cmbStepClass.ItemData(cmbStepClass.ListIndex)
 End If
Item.IconName = txtIconName
Item.ProgId = txtProgID
Item.EdtMode = txtEdtMode
Item.RTMProgID = txtRTMProgID
 If cmbIsMailStone.ListIndex >= 0 Then
   Item.IsMailStone = cmbIsMailStone.ItemData(cmbIsMailStone.ListIndex)
 End If
Item.the_Comment = txtthe_Comment
Item.IntegrationData1 = txtIntegrationData1
Item.IntegrationData2 = txtIntegrationData2
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



