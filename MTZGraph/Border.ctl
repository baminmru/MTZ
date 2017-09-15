VERSION 5.00
Begin VB.UserControl CBorder 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   2700
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2055
   ClipControls    =   0   'False
   FillStyle       =   6  'Cross
   BeginProperty Font 
      Name            =   "Times New Roman"
      Size            =   8.25
      Charset         =   204
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   HitBehavior     =   0  'None
   KeyPreview      =   -1  'True
   MaskColor       =   &H80000005&
   MouseIcon       =   "Border.ctx":0000
   ScaleHeight     =   2700
   ScaleWidth      =   2055
   ToolboxBitmap   =   "Border.ctx":0442
   Begin VB.PictureBox LinkZone 
      BorderStyle     =   0  'None
      Height          =   225
      Left            =   360
      Picture         =   "Border.ctx":0754
      ScaleHeight     =   225
      ScaleWidth      =   225
      TabIndex        =   2
      Top             =   1440
      Width           =   225
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   120
      TabIndex        =   0
      Top             =   1320
      Width           =   1695
      Begin VB.Image CtrlPicture 
         Height          =   960
         Left            =   720
         Picture         =   "Border.ctx":084E
         Stretch         =   -1  'True
         Top             =   0
         Width           =   840
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackStyle       =   0  'Transparent
         Caption         =   "объект"
         ForeColor       =   &H80000008&
         Height          =   420
         Left            =   0
         TabIndex        =   1
         Top             =   720
         Width           =   690
         WordWrap        =   -1  'True
      End
   End
   Begin VB.Image Image1 
      Height          =   75
      Index           =   2
      Left            =   1200
      MousePointer    =   6  'Size NE SW
      Picture         =   "Border.ctx":1E98
      Top             =   0
      Width           =   75
   End
   Begin VB.Image Image1 
      Height          =   75
      Index           =   1
      Left            =   600
      MousePointer    =   7  'Size N S
      Picture         =   "Border.ctx":1F2A
      Top             =   0
      Width           =   75
   End
   Begin VB.Image Image1 
      Height          =   75
      Index           =   0
      Left            =   0
      MousePointer    =   8  'Size NW SE
      Picture         =   "Border.ctx":1FBC
      Top             =   0
      Width           =   75
   End
   Begin VB.Image Image1 
      Height          =   75
      Index           =   7
      Left            =   0
      MousePointer    =   9  'Size W E
      Picture         =   "Border.ctx":204E
      Top             =   480
      Width           =   75
   End
   Begin VB.Image Image1 
      Height          =   75
      Index           =   6
      Left            =   0
      MousePointer    =   6  'Size NE SW
      Picture         =   "Border.ctx":20E0
      Top             =   960
      Width           =   75
   End
   Begin VB.Image Image1 
      Height          =   75
      Index           =   5
      Left            =   600
      MousePointer    =   7  'Size N S
      Picture         =   "Border.ctx":2172
      Top             =   960
      Width           =   75
   End
   Begin VB.Image Image1 
      Height          =   75
      Index           =   4
      Left            =   1200
      MousePointer    =   8  'Size NW SE
      Picture         =   "Border.ctx":2204
      Top             =   960
      Width           =   75
   End
   Begin VB.Image Image1 
      Height          =   75
      Index           =   3
      Left            =   1200
      MousePointer    =   9  'Size W E
      Picture         =   "Border.ctx":2296
      Top             =   480
      Width           =   75
   End
End
Attribute VB_Name = "CBorder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Dim xResize As Long, yResize As Long, Selected As Boolean, IndResize As Long, mDrawMode As Boolean
Public Event ResizeMe(ByVal Coner As Long, ByVal OldX As Long, OldY As Long, ByVal x As Long, ByVal y As Long)
Public Event Resizing(ByVal Coner As Long, ByVal OldX As Long, OldY As Long, ByVal x As Long, ByVal y As Long)

Public Event LinkMouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
Public Event LinkMouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
Public Event LinkMouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)

Public Event MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
Public Event MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
Public Event MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)

Public Event Moving(ByVal XStart As Double, ByVal x As Single, ByVal YStart As Double, ByVal y As Single, UserDefault As Boolean)
Public Event Click()
Public Event DblClick()
'Public Event GotFocus()

'Default Property Values:
Private Const m_def_PictureXPercent = 80
Private Const m_def_PictureYPercent = 80
Private Const m_def_PictureAlignment = 3
Private Const m_def_Alignment = 5
Private Const m_def_L = 0
Private Const m_def_R = 0
Private Const m_def_B = 0
Private Const m_def_T = 0

Private m_L As Integer
Private m_R As Integer
Private m_B As Integer
Private m_T As Integer
Private m_bAllowDecomposition As Boolean

Enum LabelAlignment
  lalefttop = 0
  laleftcenter
  laLeftBottom
  laCenterTop
  laCenterCenter
  laCenterBottom
  laRightTop
  laRightCenter
  laRightBottom
End Enum

Dim m_Alignment As LabelAlignment
'Property Variables:
Private m_Picture As Picture
Private m_PictureXPercent As Long
Private m_PictureYPercent As Long
Private m_PictureAlignment As LabelAlignment
Private XSatrt As Double, YStart As Double

Public Sub BSelect()
 
  Image1(0).Visible = True
  Image1(1).Visible = True
  Image1(2).Visible = True
  Image1(3).Visible = True
  Image1(4).Visible = True
  Image1(5).Visible = True
  Image1(6).Visible = True
  Image1(7).Visible = True
  
  Selected = True
End Sub

Public Sub BDeSelect()
  Image1(0).Visible = False
  Image1(1).Visible = False
  Image1(2).Visible = False
  Image1(3).Visible = False
  Image1(4).Visible = False
  Image1(5).Visible = False
  Image1(6).Visible = False
  Image1(7).Visible = False
  Selected = False
End Sub


Private Sub CtrlPicture_Click()
  RaiseEvent Click
End Sub

Private Sub CtrlPicture_DblClick()
  RaiseEvent DblClick
End Sub

Private Sub CtrlPicture_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
RaiseEvent MouseDown(Button, Shift, x + Frame1.Left + CtrlPicture.Left, y + Frame1.Top + CtrlPicture.Top)
XStart = x
YStart = y
End Sub

Private Sub CtrlPicture_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
RaiseEvent MouseMove(Button, Shift, x + Frame1.Left + CtrlPicture.Left, y + Frame1.Top + CtrlPicture.Top)
If Button = 1 And Shift = 0 Then
  If Abs(XStart - x) > Screen.TwipsPerPixelX Or Abs(YStart - y) > Screen.TwipsPerPixelY Then
    Dim UseDefault As Boolean
    UseDefault = True
    RaiseEvent Moving(XStart, x, YStart, y, UseDefault)
    If UseDefault Then
    UserControl.Extender.ZOrder 0
    UserControl.Extender.Top = UserControl.Extender.Top + y - YStart
    UserControl.Extender.Left = UserControl.Extender.Left + x - XStart
    End If
  End If
End If
End Sub

Private Sub CtrlPicture_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
RaiseEvent MouseUp(Button, Shift, x + Frame1.Left + CtrlPicture.Left, y + Frame1.Top + CtrlPicture.Top)
End Sub

Private Sub Image1_MouseDown(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 1 And Shift = 0 Then
    IndResize = Index
    xResize = x
    yResize = y
    
  End If
End Sub

Private Sub Image1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
 If Button = 1 And Shift = 0 Then
    '0 1 2
    '7   3
    '6 5 4
      If Abs(xResize - x) > Screen.TwipsPerPixelX Or Abs(yResize - y) > Screen.TwipsPerPixelY Then
        RaiseEvent Resizing(Index, xResize, yResize, x, y)
      End If
      
  End If
End Sub

Private Sub Image1_MouseUp(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single)
  If Button = 1 And Shift = 0 Then
    '0 1 2
    '7   3
    '6 5 4
      RaiseEvent ResizeMe(Index, xResize, yResize, x, y)
  End If
End Sub


Private Sub Label1_Change()
  UserControl_Resize
End Sub

Private Sub Label1_Click()
  RaiseEvent Click
End Sub

Private Sub Label1_DblClick()
  RaiseEvent DblClick
End Sub

Private Sub frame1_Click()
  UserControl.SetFocus
  RaiseEvent Click
End Sub

Private Sub frame1_DblClick()
  UserControl.SetFocus
  RaiseEvent DblClick
End Sub


Private Sub LinkZone_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  RaiseEvent LinkMouseDown(Button, Shift, x + Frame1.Left + LinkZone.Left, y + Frame1.Top + LinkZone.Top)
End Sub

Private Sub LinkZone_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
  RaiseEvent LinkMouseMove(Button, Shift, x + Frame1.Left + LinkZone.Left, y + Frame1.Top + LinkZone.Top)
End Sub

Private Sub LinkZone_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
RaiseEvent LinkMouseUp(Button, Shift, x + Frame1.Left + LinkZone.Left, y + Frame1.Top + LinkZone.Top)
End Sub

Private Sub UserControl_GotFocus()
  'BSelect
End Sub


Private Sub UserControl_LostFocus()
  'BDeSelect
End Sub

Private Sub frame1_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  RaiseEvent MouseDown(Button, Shift, x + Frame1.Left, y + Frame1.Top)
  XStart = x
  YStart = y
End Sub

Private Sub frame1_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
RaiseEvent MouseMove(Button, Shift, x + Frame1.Left, y + Frame1.Top)
If Button = 1 And Shift = 0 Then
  If Abs(XStart - x) > Screen.TwipsPerPixelX Or Abs(YStart - y) > Screen.TwipsPerPixelY Then
    Dim UseDefault As Boolean
    UseDefault = True
    RaiseEvent Moving(XStart, x, YStart, y, UseDefault)
    If UseDefault Then
        UserControl.Extender.ZOrder 0
        UserControl.Extender.Top = UserControl.Extender.Top + y - YStart
        UserControl.Extender.Left = UserControl.Extender.Left + x - XStart
    End If
  End If
End If
End Sub

Private Sub frame1_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  RaiseEvent MouseUp(Button, Shift, x + Frame1.Left, y + Frame1.Top)
  If Button = 1 And Shift = 0 Then
  If Abs(XStart - x) > Screen.TwipsPerPixelX Or Abs(YStart - y) > Screen.TwipsPerPixelY Then
    Dim UseDefault As Boolean
    UseDefault = True
    RaiseEvent Moving(XStart, x, YStart, y, UseDefault)
    If UseDefault Then
        UserControl.Extender.ZOrder 0
        UserControl.Extender.Top = UserControl.Extender.Top + y - YStart
        UserControl.Extender.Left = UserControl.Extender.Left + x - XStart
    End If
 End If
End If

End Sub

Private Sub label1_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  RaiseEvent MouseDown(Button, Shift, x + Frame1.Left + Label1.Left, y + Frame1.Top + Label1.Top)
  XStart = x
  YStart = y
End Sub

Private Sub label1_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
RaiseEvent MouseMove(Button, Shift, x + Frame1.Left + Label1.Left, y + Frame1.Top + Label1.Top)
If Button = 1 And Shift = 0 Then
  If Abs(XStart - x) > Screen.TwipsPerPixelX Or Abs(YStart - y) > Screen.TwipsPerPixelY Then
    Dim UseDefault As Boolean
    UseDefault = True
    RaiseEvent Moving(XStart, x, YStart, y, UseDefault)
    If UseDefault Then
        UserControl.Extender.ZOrder 0
        UserControl.Extender.Top = UserControl.Extender.Top + y - YStart
        UserControl.Extender.Left = UserControl.Extender.Left + x - XStart
    End If
  End If
End If

End Sub

Private Sub label1_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
  RaiseEvent MouseUp(Button, Shift, x + Frame1.Left + Label1.Left, y + Frame1.Top + Label1.Top)
End Sub


Private Sub UserControl_Resize()
    
  If UserControl.Extender.Width < 60 * Screen.TwipsPerPixelX Then UserControl.Extender.Width = 60 * Screen.TwipsPerPixelX
  If UserControl.Extender.Height < 60 * Screen.TwipsPerPixelY Then UserControl.Extender.Height = 60 * Screen.TwipsPerPixelY
    
  On Error Resume Next
  Image1(1).Visible = False
  Image1(2).Visible = False
  Image1(3).Visible = False
  Image1(4).Visible = False
  Image1(5).Visible = False
  Image1(6).Visible = False
  Image1(7).Visible = False
  Image1(0).Visible = False
  Label1.Visible = False
  CtrlPicture.Visible = False


  Image1(0).Top = 0
  Image1(0).Left = 0
  Image1(1).Top = 0
  Image1(1).Left = (UserControl.ScaleWidth - Image1(0).Width) / 2
  Image1(2).Top = 0
  Image1(2).Left = UserControl.ScaleWidth - Image1(0).Width
  Image1(3).Top = (UserControl.ScaleHeight - Image1(0).Height) / 2
  Image1(3).Left = UserControl.ScaleWidth - Image1(0).Width
  Image1(4).Top = UserControl.ScaleHeight - Image1(0).Height
  Image1(4).Left = UserControl.ScaleWidth - Image1(0).Width
  Image1(5).Top = UserControl.ScaleHeight - Image1(0).Height
  Image1(5).Left = (UserControl.ScaleWidth - Image1(0).Width) / 2
  Image1(6).Top = UserControl.ScaleHeight - Image1(0).Height
  Image1(6).Left = 0
  Image1(7).Top = (UserControl.ScaleHeight - Image1(0).Height) / 2
  Image1(7).Left = 0
  Frame1.Top = Image1(0).Height
  Frame1.Left = Image1(0).Width
  Frame1.Width = UserControl.ScaleWidth - 2 * Image1(0).Width
  Frame1.Height = UserControl.ScaleHeight - 2 * Image1(0).Height
  
  LinkZone.Top = Frame1.Height + Frame1.Top - 15 * Screen.TwipsPerPixelY
  LinkZone.Left = Frame1.Left + Frame1.Width - 15 * Screen.TwipsPerPixelX
  LinkZone.Width = 15 * Screen.TwipsPerPixelX
  LinkZone.Height = 15 * Screen.TwipsPerPixelX
    
  'If m_PictureXPercent <= 0 Or m_PictureXPercent >= 100 Then m_PictureXPercent = 80
  'If m_PictureYPercent <= 0 Or m_PictureYPercent >= 100 Then m_PictureYPercent = 80
  'If Frame1.Width * m_PictureXPercent / 100 < 32 * Screen.TwipsPerPixelX Then
  '  CtrlPicture.Width = Frame1.Width * m_PictureXPercent / 100
  'Else
  '  CtrlPicture.Width = 32 * Screen.TwipsPerPixelX
  'End If
  'If Frame1.Height * m_PictureYPercent / 100 < 32 * Screen.TwipsPerPixelY Then
  '  CtrlPicture.Height = Frame1.Height * m_PictureYPercent / 100
  'Else
  '  CtrlPicture.Height = 32 * Screen.TwipsPerPixelY
  'End If
  
  
  'Scale picture
'  CtrlPicture.Left = Frame1.Width / 2
'  CtrlPicture.Top = 0
'
'  CtrlPicture.Width = Frame1.Width / 2
'  CtrlPicture.Height = Frame1.Height / 2
  
  CtrlPicture.Left = 0 'Frame1.Width / 2
  CtrlPicture.Top = 0
  CtrlPicture.Width = 32 * Screen.TwipsPerPixelX
  CtrlPicture.Height = 32 * Screen.TwipsPerPixelY

  
  Label1.Left = 0
  Label1.Top = CtrlPicture.Height
  Label1.Width = Frame1.Width - Label1.Left
  Label1.Height = Frame1.Height - Label1.Top
  
  'Label1.FontSize = GetFontSize
  
  
  'Label1.WordWrap = True
'  Select Case PictureAlignment
'  Case lalefttop
'    CtrlPicture.Left = 0
'    CtrlPicture.Top = 0
'
'  Case laleftcenter
'    CtrlPicture.Left = 0
'    CtrlPicture.Top = Frame1.Height / 2 - CtrlPicture.Height / 2
'
'  Case laLeftBottom
'    CtrlPicture.Left = 0
'    CtrlPicture.Top = Frame1.Height - CtrlPicture.Height
'
'  Case laCenterTop
'    CtrlPicture.Left = Frame1.Width / 2 - CtrlPicture.Width / 2
'    CtrlPicture.Top = 0
'
'  Case laCenterCenter
'    CtrlPicture.Left = Frame1.Width / 2 - CtrlPicture.Width / 2
'    CtrlPicture.Top = Frame1.Height / 2 - CtrlPicture.Height / 2
'
'  Case laCenterBottom
'    CtrlPicture.Left = Frame1.Width / 2 - CtrlPicture.Width / 2
'    CtrlPicture.Top = Frame1.Height - CtrlPicture.Height
'
'  Case laRightTop
'    CtrlPicture.Left = Frame1.Width - CtrlPicture.Width
'    CtrlPicture.Top = 0
'
'  Case laRightCenter
'    CtrlPicture.Left = Frame1.Width - CtrlPicture.Width
'    CtrlPicture.Top = Frame1.Height / 2 - CtrlPicture.Height / 2
'
'  Case laRightBottom
'    CtrlPicture.Left = Frame1.Width - CtrlPicture.Width
'    CtrlPicture.Top = Frame1.Height - CtrlPicture.Height
'  End Select
  
  
'If Not DrawMode Then
  
'  Select Case Alignment
'  Case lalefttop
'    Label1.Left = 0
'    Label1.Top = 0
'
'
'  Case laleftcenter
'    Label1.Left = 0
'    Label1.Top = Frame1.Height / 2 - Label1.Height / 2
'
'  Case laLeftBottom
'    Label1.Left = 0
'    Label1.Top = Frame1.Height - Label1.Height
'
'
'  Case laCenterTop
'    Label1.Left = Frame1.Width / 2 - Label1.Width / 2
'    Label1.Top = 0
'
'
'  Case laCenterCenter
'    Label1.Left = Frame1.Width / 2 - Label1.Width / 2
'    Label1.Top = Frame1.Height / 2 - Label1.Height / 2
'
'
'  Case laCenterBottom
'    Label1.Left = Frame1.Width / 2 - Label1.Width / 2
'    Label1.Top = Frame1.Height - Label1.Height
'
'  Case laRightTop
'    Label1.Left = Frame1.Width - Label1.Width
'    Label1.Top = 0
'
'
'  Case laRightCenter
'    Label1.Left = Frame1.Width - Label1.Width
'    Label1.Top = Frame1.Height / 2 - Label1.Height / 2
'
'
'  Case laRightBottom
'    Label1.Left = Frame1.Width - Label1.Width
'    Label1.Top = Frame1.Height - Label1.Height
'  End Select
          
  If Selected Then
    Image1(1).Visible = True
    Image1(2).Visible = True
    Image1(3).Visible = True
    Image1(4).Visible = True
    Image1(5).Visible = True
    Image1(6).Visible = True
    Image1(7).Visible = True
    Image1(0).Visible = True
  End If
 Label1.Visible = True
 CtrlPicture.Visible = True
 Label1.ZOrder 1
'End If
RepaintMe
End Sub

Private Function GetFontSize() As Integer
     GetFontSize = Int(Sqr(Label1.Height * Label1.Width / Screen.TwipsPerPixelY / Screen.TwipsPerPixelX / Len(Label1.Caption)) / 1.3)
End Function

Public Property Get l() As Integer
  l = m_L
End Property

Public Property Let l(ByVal New_L As Integer)
  m_L = New_L
  PropertyChanged "L"
  RepaintMe
End Property

Public Property Get R() As Integer
  R = m_R
End Property

Public Property Let R(ByVal New_R As Integer)
  m_R = New_R
  PropertyChanged "R"
  RepaintMe
End Property

Public Property Get b() As Integer
  b = m_B
End Property

Public Property Let b(ByVal New_B As Integer)
  m_B = New_B
  PropertyChanged "B"
  RepaintMe
End Property

Public Property Get T() As Integer
  T = m_T
End Property

Public Property Let T(ByVal New_T As Integer)
  m_T = New_T
  PropertyChanged "T"
  RepaintMe
End Property


'Initialize Properties for User Control
Private Sub UserControl_InitProperties()
'  Set m_Font = Ambient.Font
  m_L = m_def_L
  m_R = m_def_R
  m_B = m_def_B
  m_T = m_def_T
'  m_BackColor = m_def_BackColor

  m_PictureAlignment = m_def_PictureAlignment
  m_Alignment = m_def_Alignment
  Set m_Picture = LoadPicture("")
  m_PictureXPercent = m_def_PictureXPercent
  m_PictureYPercent = m_def_PictureYPercent
End Sub

'Load property values from storage
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)

'  Set m_Font = PropBag.ReadProperty("Font", Ambient.Font)
  m_L = PropBag.ReadProperty("L", m_def_L)
  m_R = PropBag.ReadProperty("R", m_def_R)
  m_B = PropBag.ReadProperty("B", m_def_B)
  m_T = PropBag.ReadProperty("T", m_def_T)
  
  On Error Resume Next
  Label1.Caption = PropBag.ReadProperty("Caption", "Label1")
  Label1.FontSize = PropBag.ReadProperty("FontSize", 0)
  Label1.FontItalic = PropBag.ReadProperty("FontItalic", 0)
  Label1.FontBold = PropBag.ReadProperty("FontBold", 0)
  Label1.BackColor = PropBag.ReadProperty("BackColor", &H80000005)
  UserControl.BackColor = Label1.BackColor
  Set Picture = PropBag.ReadProperty("Picture", Nothing)
  m_PictureAlignment = PropBag.ReadProperty("PictureAlignment", m_def_PictureAlignment)
  m_Alignment = PropBag.ReadProperty("Alignment", m_def_Alignment)
  Set m_Picture = PropBag.ReadProperty("Picture", Nothing)
  Set CtrlPicture.Picture = m_Picture
  m_PictureXPercent = PropBag.ReadProperty("PictureXPercent", m_def_PictureXPercent)
  m_PictureYPercent = PropBag.ReadProperty("PictureYPercent", m_def_PictureYPercent)
  m_bAllowDecomposition = PropBag.ReadProperty("Decomposition", False)
End Sub

'Write property values to storage
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
'  Call PropBag.WriteProperty("Font", m_Font, Ambient.Font)
  Call PropBag.WriteProperty("L", m_L, m_def_L)
  Call PropBag.WriteProperty("R", m_R, m_def_R)
  Call PropBag.WriteProperty("B", m_B, m_def_B)
  Call PropBag.WriteProperty("T", m_T, m_def_T)
  Call PropBag.WriteProperty("Alignment", m_Alignment, m_def_Alignment)

  Call PropBag.WriteProperty("Caption", Label1.Caption, "Label1")
  Call PropBag.WriteProperty("BackColor", Label1.BackColor, &H80000005)
  Call PropBag.WriteProperty("FontStrikethru", Label1.FontStrikethru, 0)
  Call PropBag.WriteProperty("FontUnderline", Label1.FontUnderline, 0)
  Call PropBag.WriteProperty("ForeColor", Label1.ForeColor, &H80000008)
  
  Call PropBag.WriteProperty("Picture", Picture, Nothing)
  Call PropBag.WriteProperty("PictureAlignment", m_PictureAlignment, m_def_PictureAlignment)
  Call PropBag.WriteProperty("Picture", m_Picture, Nothing)
  Call PropBag.WriteProperty("PictureXPercent", m_PictureXPercent, m_def_PictureXPercent)
  Call PropBag.WriteProperty("PictureYPercent", m_PictureYPercent, m_def_PictureYPercent)
  Call PropBag.WriteProperty("Decomposition", m_bAllowDecomposition)
End Sub


Private Sub RepaintMe()
  Dim W  As Long, H As Long
  W = Image1(0).Width
  H = Image1(0).Height
'  If l > 0 And l < 10 Then
'    bL.x1 = W
'    bL.y1 = H
'    bL.x2 = W
'    bL.y2 = UserControl.ScaleHeight - H
'    bL.BorderWidth = l
'    bL.Visible = True
'  End If
'  If T > 0 And T < 10 Then
'    bT.x1 = W
'    bT.y1 = H
'    bT.x2 = UserControl.ScaleWidth - W
'    bT.y2 = H
'    bT.BorderWidth = T
'    bT.Visible = True
'  End If
'  If R > 0 And R < 10 Then
'    bR.x1 = UserControl.ScaleWidth - W
'    bR.y1 = H
'    bR.x2 = UserControl.ScaleWidth - W
'    bR.y2 = UserControl.ScaleHeight - H
'    bR.BorderWidth = R
'    bR.Visible = True
'  End If
'  If b > 0 And b < 10 Then
'      bB.x1 = W
'      bB.y1 = UserControl.ScaleHeight - H
'      bB.x2 = UserControl.ScaleWidth - W
'      bB.y2 = UserControl.ScaleHeight - H
'      bB.BorderWidth = b
'      bB.Visible = True
'  End If
'  'If Not DrawMode Then
'    If l = 0 Then bL.Visible = False
'    If R = 0 Then bR.Visible = False
'    If b = 0 Then bB.Visible = False
'    If T = 0 Then bT.Visible = False
'  'End If
'
End Sub
'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=Label1,Label1,-1,Caption
Public Property Get Caption() As String
Attribute Caption.VB_Description = "Returns/sets the text displayed in an object's title bar or below an object's icon."
  Caption = Label1.Caption
End Property

Public Property Let Caption(ByVal New_Caption As String)
  Label1.Caption() = New_Caption
  PropertyChanged "Caption"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=Label1,Label1,-1,Font
Public Property Get Font() As Font
Attribute Font.VB_Description = "Returns a Font object."
Attribute Font.VB_UserMemId = -512
  Set Font = Label1.Font
End Property

Public Property Set Font(ByVal New_Font As Font)
  Set Label1.Font = New_Font
  PropertyChanged "Font"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=Label1,Label1,-1,FontName
Public Property Get FontName() As String
Attribute FontName.VB_Description = "Specifies the name of the font that appears in each row for the given level."
  FontName = Label1.FontName
End Property

Public Property Let FontName(ByVal New_FontName As String)
  Label1.FontName() = New_FontName
  PropertyChanged "FontName"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=Label1,Label1,-1,FontSize
Public Property Get FontSize() As Single
Attribute FontSize.VB_Description = "Specifies the size (in points) of the font that appears in each row for the given level."
  FontSize = Label1.FontSize
End Property

Public Property Let FontSize(ByVal New_FontSize As Single)
  Label1.FontSize() = New_FontSize
  PropertyChanged "FontSize"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=Label1,Label1,-1,FontItalic
Public Property Get FontItalic() As Boolean
Attribute FontItalic.VB_Description = "Returns/sets italic font styles."
  FontItalic = Label1.FontItalic
End Property

Public Property Let FontItalic(ByVal New_FontItalic As Boolean)
  Label1.FontItalic() = New_FontItalic
  PropertyChanged "FontItalic"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=Label1,Label1,-1,FontBold
Public Property Get FontBold() As Boolean
Attribute FontBold.VB_Description = "Returns/sets bold font styles."
  FontBold = Label1.FontBold
End Property

Public Property Let FontBold(ByVal New_FontBold As Boolean)
  Label1.FontBold() = New_FontBold
  PropertyChanged "FontBold"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=Label1,Label1,-1,BackColor
Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_Description = "Returns/sets the background color used to display text and graphics in an object."
  BackColor = UserControl.BackColor 'Label1.BackColor
End Property

Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
  'Label1.BackColor = New_BackColor
  UserControl.BackColor = New_BackColor
  PropertyChanged "BackColor"
End Property


Public Property Get Alignment() As LabelAlignment
Alignment = m_Alignment

End Property

Public Property Let Alignment(ByVal vNewValue As LabelAlignment)
m_Alignment = vNewValue
UserControl_Resize
End Property
'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=Label1,Label1,-1,FontStrikethru
Public Property Get FontStrikethru() As Boolean
Attribute FontStrikethru.VB_Description = "Returns/sets strikethrough font styles."
  FontStrikethru = Label1.FontStrikethru
End Property

Public Property Let FontStrikethru(ByVal New_FontStrikethru As Boolean)
  Label1.FontStrikethru() = New_FontStrikethru
  PropertyChanged "FontStrikethru"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=Label1,Label1,-1,FontUnderline
Public Property Get FontUnderline() As Boolean
Attribute FontUnderline.VB_Description = "Returns/sets underline font styles."
  FontUnderline = Label1.FontUnderline
End Property

Public Property Let FontUnderline(ByVal New_FontUnderline As Boolean)
  Label1.FontUnderline() = New_FontUnderline
  PropertyChanged "FontUnderline"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=Label1,Label1,-1,ForeColor
Public Property Get ForeColor() As OLE_COLOR
Attribute ForeColor.VB_Description = "Returns/sets the foreground color used to display text and graphics in an object."
  ForeColor = Label1.ForeColor
End Property

Public Property Let ForeColor(ByVal New_ForeColor As OLE_COLOR)
  Label1.ForeColor() = New_ForeColor
  PropertyChanged "ForeColor"
End Property
'
'
''WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
''MappingInfo=Picture,Picture,-1,Picture
'Public Property Get Picture() As Picture
'  Set Picture = CtrlPicture.Picture
'End Property
'
'Public Property Set Picture(ByVal New_Picture As Picture)
'  Set CtrlPicture.Picture = New_Picture
'  PropertyChanged "Picture"
'End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MemberInfo=23,0,0,0
Public Property Get PictureAlignment() As LabelAlignment
  PictureAlignment = m_PictureAlignment
End Property

Public Property Let PictureAlignment(ByVal New_PictureAlignment As LabelAlignment)
  m_PictureAlignment = New_PictureAlignment
  PropertyChanged "PictureAlignment"
  UserControl_Resize
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MemberInfo=11,0,0,
Public Property Get Picture() As Picture
Attribute Picture.VB_Description = "Returns/sets a graphic to be displayed in a control."
  Set Picture = m_Picture
End Property

Public Property Set Picture(ByVal New_Picture As Picture)
  Set m_Picture = New_Picture
  Set CtrlPicture.Picture = New_Picture
  PropertyChanged "Picture"
  UserControl_Resize
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MemberInfo=8,0,0,80
Public Property Get PictureXPercent() As Long
  PictureXPercent = m_PictureXPercent
End Property

Public Property Let PictureXPercent(ByVal New_PictureXPercent As Long)
  m_PictureXPercent = New_PictureXPercent
  PropertyChanged "PictureXPercent"
  UserControl_Resize
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MemberInfo=8,0,0,80
Public Property Get PictureYPercent() As Long
  PictureYPercent = m_PictureYPercent
End Property

Public Property Let PictureYPercent(ByVal New_PictureYPercent As Long)
  m_PictureYPercent = New_PictureYPercent
  PropertyChanged "PictureYPercent"
  UserControl_Resize
End Property


Public Property Get DrawMode() As Boolean
  DrawMode = mDrawMode
End Property

Public Property Let DrawMode(ByVal v As Boolean)
  mDrawMode = v
  UserControl_Resize
End Property

Public Property Get AllowDecomposition() As Boolean
    AllowDecomposition = m_bAllowDecomposition
End Property

Public Property Let AllowDecomposition(ByVal bNewValue As Boolean)
    m_bAllowDecomposition = bNewValue
End Property

Public Property Get Color() As OLE_COLOR
    Color = Frame1.BackColor
End Property

Public Property Let Color(ByVal NewColor As OLE_COLOR)
    Frame1.BackColor = NewColor
End Property
