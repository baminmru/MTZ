VERSION 5.00
Begin VB.UserControl VFrames 
   ClientHeight    =   5370
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7185
   ControlContainer=   -1  'True
   ScaleHeight     =   5370
   ScaleWidth      =   7185
   ToolboxBitmap   =   "VFrames.ctx":0000
   Begin VB.PictureBox VSplitter 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      FillColor       =   &H00808080&
      ForeColor       =   &H80000008&
      Height          =   15360
      Left            =   3600
      Picture         =   "VFrames.ctx":0312
      ScaleHeight     =   6688.403
      ScaleMode       =   0  'User
      ScaleWidth      =   780
      TabIndex        =   0
      Top             =   120
      Visible         =   0   'False
      Width           =   72
   End
   Begin VB.Image imgVSplitter 
      Height          =   4785
      Left            =   3240
      MousePointer    =   9  'Size W E
      Top             =   120
      Width           =   150
   End
End
Attribute VB_Name = "VFrames"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 495
Option Explicit
'вертикальный сплиттер
  
Dim SlaveFrameLeft As Single, SlaveFrameWidth As Single, SlaveFrameTop As Single, SlaveFrameHeight As Single
Dim MasterFrameLeft As Single, MasterFrameWidth As Single, MasterFrameTop As Single, MasterFrameHeight As Single
  
  
  
Dim mbMoving As Boolean
Const sglSplitLimit = 100

Public Event MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
Attribute MasterResize.VB_HelpID = 525
Public Event SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
Attribute SlaveResize.VB_HelpID = 550
Public Event PositionChanged()
Attribute PositionChanged.VB_HelpID = 530
'Event Declarations:
Event DblClick() 'MappingInfo=imgHSplitter,imgHSplitter,-1,DblClick
Attribute DblClick.VB_HelpID = 515
Event Click() 'MappingInfo=imgHSplitter,imgHSplitter,-1,Click
Attribute Click.VB_HelpID = 510


Private Sub usercontrol_Resize()
On Error Resume Next
SizeControls imgVSplitter.Left
End Sub


'получить позицию сплитера
Public Property Get SpliterPosition() As Single
Attribute SpliterPosition.VB_HelpID = 555
  SpliterPosition = imgVSplitter.Left
End Property


'задать позицию сплитера
Public Property Let SpliterPosition(ByVal pos As Single)
  On Error Resume Next
  SizeControls pos
End Property


'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=UserControl,UserControl,-1,BackColor
'цвет фона
Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_HelpID = 500
  BackColor = UserControl.BackColor
End Property

'задать цвет фона
Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
  UserControl.BackColor() = New_BackColor
  PropertyChanged "BackColor"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=UserControl,UserControl,-1,BorderStyle
'тип границы
Public Property Get BorderStyle() As Integer
Attribute BorderStyle.VB_HelpID = 505
  BorderStyle = UserControl.BorderStyle
End Property


'задать тип границ
Public Property Let BorderStyle(ByVal New_BorderStyle As Integer)
  UserControl.BorderStyle() = New_BorderStyle
  PropertyChanged "BorderStyle"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=UserControl,UserControl,-1,ForeColor
'цвет элементов
Public Property Get ForeColor() As OLE_COLOR
Attribute ForeColor.VB_HelpID = 520
  ForeColor = UserControl.ForeColor
End Property

'задать цвет элементов
Public Property Let ForeColor(ByVal New_ForeColor As OLE_COLOR)
  UserControl.ForeColor() = New_ForeColor
  PropertyChanged "ForeColor"
End Property

Private Sub imgHSplitter_DblClick()
  On Error Resume Next
  RaiseEvent DblClick
End Sub

Private Sub imgHSplitter_Click()
On Error Resume Next
  RaiseEvent Click
End Sub

'Load property values from storage
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
On Error Resume Next
  UserControl.BackColor = PropBag.ReadProperty("BackColor", &H8000000F)
  UserControl.BorderStyle = PropBag.ReadProperty("BorderStyle", 0)
  UserControl.ForeColor = PropBag.ReadProperty("ForeColor", &H80000012)
  SpliterPosition = PropBag.ReadProperty("SpliterPosition", 2000)
End Sub

'Write property values to storage
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
On Error Resume Next
  Call PropBag.WriteProperty("BackColor", UserControl.BackColor, &H8000000F)
  Call PropBag.WriteProperty("BorderStyle", UserControl.BorderStyle, 0)
  Call PropBag.WriteProperty("ForeColor", UserControl.ForeColor, &H80000012)
  Call PropBag.WriteProperty("SpliterPosition", SpliterPosition, 2000)
End Sub


Private Sub imgVSplitter_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  On Error Resume Next
  With imgVSplitter
    VSplitter.Move .Left, .Top, .Width, .Height
    VSplitter.ZOrder 0
  End With
  'VSplitter.Visible = True
  mbMoving = True
End Sub

Private Sub imgVSplitter_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
  Dim sglPos As Single
  On Error Resume Next
  If mbMoving Then
    sglPos = x + imgVSplitter.Left
    If sglPos < sglSplitLimit Then
      VSplitter.Left = sglSplitLimit
    ElseIf sglPos > UserControl.Width - sglSplitLimit Then
      VSplitter.Left = UserControl.Width - sglSplitLimit
    Else
      VSplitter.Left = sglPos
    End If
    SizeControls VSplitter.Left
  End If
End Sub

Private Sub imgVSplitter_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  On Error Resume Next
  SizeControls VSplitter.Left
  'VSplitter.Visible = False
  mbMoving = False
  RaiseEvent PositionChanged
End Sub

'обработка перемещения сплитера
Sub SizeControls(x As Single)
Attribute SizeControls.VB_HelpID = 545
  On Error Resume Next
  'set the width
  If x < 1500 Then x = 1500
  If x > (UserControl.Width - 1500) Then
    If UserControl.Width < 1500 Then
      x = UserControl.Width / 2
    Else
        x = UserControl.Width - 1500
    End If
  End If
  MasterFrameLeft = 0
  MasterFrameTop = 0
  MasterFrameHeight = UserControl.Height
  MasterFrameWidth = x
  imgVSplitter.Left = x
  SlaveFrameLeft = x + 5 * Screen.TwipsPerPixelX
  SlaveFrameWidth = UserControl.ScaleWidth - (MasterFrameWidth) - 5 * Screen.TwipsPerPixelX
  SlaveFrameTop = MasterFrameTop
  SlaveFrameHeight = MasterFrameHeight
  imgVSplitter.Top = MasterFrameTop
  imgVSplitter.Height = MasterFrameHeight
  RaiseEvent MasterResize(MasterFrameTop, MasterFrameLeft, MasterFrameWidth, MasterFrameHeight)
  RaiseEvent SlaveResize(SlaveFrameTop, SlaveFrameLeft, SlaveFrameWidth, SlaveFrameHeight)

End Sub


'сохранить позицию в реестре
Public Sub SavePosition()
Attribute SavePosition.VB_HelpID = 540
  SaveSetting "MTZ_PANEL", "VFRAMES", UserControl.Extender.Name, SpliterPosition
End Sub

'восстановить позицию из реестра
Public Sub RestorePosition()
Attribute RestorePosition.VB_HelpID = 535
  SpliterPosition = GetSetting("MTZ_PANEL", "VFRAMES", UserControl.Extender.Name, UserControl.Width / 2)
End Sub

