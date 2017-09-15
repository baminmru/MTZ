VERSION 5.00
Begin VB.UserControl HFrames 
   ClientHeight    =   4620
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5355
   ControlContainer=   -1  'True
   ScaleHeight     =   4620
   ScaleWidth      =   5355
   ToolboxBitmap   =   "HFrames.ctx":0000
   Begin VB.PictureBox HSplitter 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      FillColor       =   &H00808080&
      ForeColor       =   &H80000008&
      Height          =   75
      Left            =   0
      Picture         =   "HFrames.ctx":0312
      ScaleHeight     =   32.658
      ScaleMode       =   0  'User
      ScaleWidth      =   55692
      TabIndex        =   0
      Top             =   2400
      Visible         =   0   'False
      Width           =   5355
   End
   Begin VB.Image imgHSplitter 
      Height          =   225
      Left            =   0
      MousePointer    =   7  'Size N S
      Top             =   1920
      Width           =   5175
   End
End
Attribute VB_Name = "HFrames"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 275
Option Explicit
'горизонтальный сплитер
  
Dim mbMoving As Boolean
Dim mSplitPos As Single
Const sglSplitLimit = 1000
Dim SlaveFrameLeft As Single, SlaveFrameWidth As Single, SlaveFrameTop As Single, SlaveFrameHeight As Single
Dim MasterFrameLeft As Single, MasterFrameWidth As Single, MasterFrameTop As Single, MasterFrameHeight As Single
Public Event MasterResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
Attribute MasterResize.VB_HelpID = 305
Public Event SlaveResize(ByVal Top As Single, ByVal Left As Single, ByVal Width As Single, ByVal Height As Single)
Attribute SlaveResize.VB_HelpID = 330
Public Event PositionChanged()
Attribute PositionChanged.VB_HelpID = 310

'Event Declarations:
Event DblClick() 'MappingInfo=imgHSplitter,imgHSplitter,-1,DblClick
Attribute DblClick.VB_Description = "Occurs when the user presses and releases a mouse button and then presses and releases it again over an object."
Attribute DblClick.VB_HelpID = 295
Event Click() 'MappingInfo=imgHSplitter,imgHSplitter,-1,Click
Attribute Click.VB_Description = "Occurs when the user presses and then releases a mouse button over an object."
Attribute Click.VB_HelpID = 290




Private Sub imgHSplitter_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  On Error Resume Next
  With imgHSplitter
    HSplitter.Move .Left, .Top, .Width, .Height
    HSplitter.ZOrder 0
  End With
  'HSplitter.Visible = True
  mbMoving = True
End Sub

Private Sub imgHSplitter_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
  On Error Resume Next
  Dim sglPos As Single
  
  If mbMoving Then
    sglPos = y + imgHSplitter.Top
    If sglPos < sglSplitLimit Then
      HSplitter.Top = sglSplitLimit
    ElseIf sglPos > UserControl.Height - sglSplitLimit Then
      HSplitter.Top = UserControl.Height - sglSplitLimit
    Else
      HSplitter.Top = sglPos
    End If
    SizeControls HSplitter.Top
  End If
End Sub

Private Sub imgHSplitter_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  On Error Resume Next
  mSplitPos = HSplitter.Top
  SizeControls mSplitPos
  HSplitter.Top = mSplitPos
  'HSplitter.Visible = False
  mbMoving = False
  RaiseEvent PositionChanged
End Sub

'обработать перемещение споитера
 Sub SizeControls(y As Single)
Attribute SizeControls.VB_HelpID = 325
  On Error Resume Next
  'set the width
  
  
  If y < 1500 Then y = 1500
  If y > (UserControl.Height - 1500) Then
    If UserControl.Height - 1500 < 0 Then
      y = UserControl.Height / 2
    Else
        y = UserControl.Height - 1500
    End If
  End If
  MasterFrameLeft = 0
  MasterFrameTop = 0
  MasterFrameWidth = UserControl.ScaleWidth
  MasterFrameHeight = y
  imgHSplitter.Top = y
  SlaveFrameTop = y + 5 * Screen.TwipsPerPixelX
  SlaveFrameHeight = UserControl.ScaleHeight - (MasterFrameHeight) - 5 * Screen.TwipsPerPixelY
  SlaveFrameLeft = MasterFrameLeft
  SlaveFrameWidth = MasterFrameWidth
  imgHSplitter.Left = MasterFrameLeft
  imgHSplitter.Width = MasterFrameWidth
  RaiseEvent MasterResize(MasterFrameTop, MasterFrameLeft, MasterFrameWidth, MasterFrameHeight)
  RaiseEvent SlaveResize(SlaveFrameTop, SlaveFrameLeft, SlaveFrameWidth, SlaveFrameHeight)
End Sub


Private Sub usercontrol_Resize()
 On Error Resume Next
 If mSplitPos = 0 Then mSplitPos = UserControl.ScaleHeight / 2
  SizeControls mSplitPos
End Sub

'позиция сплитера
Public Property Get SpliterPosition() As Single
Attribute SpliterPosition.VB_HelpID = 335
  SpliterPosition = mSplitPos
End Property

'задать позицию сплитера
Public Property Let SpliterPosition(ByVal pos As Single)
  On Error Resume Next
  mSplitPos = pos
  If UserControl.Extender.Visible Then
    SizeControls mSplitPos
  End If
End Property



'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=UserControl,UserControl,-1,BackColor
Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_Description = "Returns/sets the background color used to display text and graphics in an object."
Attribute BackColor.VB_HelpID = 280
  BackColor = UserControl.BackColor
End Property

Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
  UserControl.BackColor() = New_BackColor
  PropertyChanged "BackColor"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=UserControl,UserControl,-1,BorderStyle
Public Property Get BorderStyle() As Integer
Attribute BorderStyle.VB_Description = "Returns/sets the border style for an object."
Attribute BorderStyle.VB_HelpID = 285
  BorderStyle = UserControl.BorderStyle
End Property

Public Property Let BorderStyle(ByVal New_BorderStyle As Integer)
  UserControl.BorderStyle() = New_BorderStyle
  PropertyChanged "BorderStyle"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=UserControl,UserControl,-1,ForeColor
Public Property Get ForeColor() As OLE_COLOR
Attribute ForeColor.VB_Description = "Returns/sets the foreground color used to display text and graphics in an object."
Attribute ForeColor.VB_HelpID = 300
  On Error Resume Next
  ForeColor = UserControl.ForeColor
End Property

Public Property Let ForeColor(ByVal New_ForeColor As OLE_COLOR)
  On Error Resume Next
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
  SpliterPosition = PropBag.ReadProperty("SpliterPosition", mSplitPos)
End Sub

'Write property values to storage
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  On Error Resume Next
  Call PropBag.WriteProperty("BackColor", UserControl.BackColor, &H8000000F)
  Call PropBag.WriteProperty("BorderStyle", UserControl.BorderStyle, 0)
  Call PropBag.WriteProperty("ForeColor", UserControl.ForeColor, &H80000012)
  Call PropBag.WriteProperty("SpliterPosition", SpliterPosition, mSplitPos)
End Sub

'сохранить позицию в реестре
Public Sub SavePosition()
Attribute SavePosition.VB_HelpID = 320
  SaveSetting "MTZ_PANEL", "HFRAMES", UserControl.Extender.Name, SpliterPosition
End Sub

'восстановить позицию из реестра
Public Sub RestorePosition()
Attribute RestorePosition.VB_HelpID = 315
  SpliterPosition = GetSetting("MTZ_PANEL", "HFRAMES", UserControl.Extender.Name, UserControl.Height / 2)
End Sub
