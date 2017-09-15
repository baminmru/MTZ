VERSION 5.00
Begin VB.UserControl CBorder 
   AutoRedraw      =   -1  'True
   BackColor       =   &H8000000C&
   BackStyle       =   0  'Transparent
   ClientHeight    =   3135
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2580
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
   KeyPreview      =   -1  'True
   MaskColor       =   &H80000005&
   ScaleHeight     =   3135
   ScaleWidth      =   2580
   ToolboxBitmap   =   "Border.ctx":0000
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
      Top             =   1200
      Width           =   1815
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackStyle       =   0  'Transparent
         BorderStyle     =   1  'Fixed Single
         Caption         =   "узел"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   300
         Left            =   750
         TabIndex        =   1
         Top             =   120
         Width           =   570
         WordWrap        =   -1  'True
      End
   End
   Begin VB.Image Image1 
      Height          =   75
      Index           =   2
      Left            =   840
      MousePointer    =   6  'Size NE SW
      Picture         =   "Border.ctx":0312
      Top             =   240
      Width           =   75
   End
   Begin VB.Image Image1 
      Height          =   75
      Index           =   1
      Left            =   480
      MousePointer    =   7  'Size N S
      Picture         =   "Border.ctx":03A4
      Top             =   240
      Width           =   75
   End
   Begin VB.Image Image1 
      Height          =   75
      Index           =   0
      Left            =   120
      MousePointer    =   8  'Size NW SE
      Picture         =   "Border.ctx":0436
      Top             =   240
      Width           =   75
   End
   Begin VB.Image Image1 
      Height          =   75
      Index           =   7
      Left            =   120
      MousePointer    =   9  'Size W E
      Picture         =   "Border.ctx":04C8
      Top             =   480
      Width           =   75
   End
   Begin VB.Image Image1 
      Height          =   75
      Index           =   6
      Left            =   120
      MousePointer    =   6  'Size NE SW
      Picture         =   "Border.ctx":055A
      Top             =   720
      Width           =   75
   End
   Begin VB.Image Image1 
      Height          =   75
      Index           =   5
      Left            =   480
      MousePointer    =   7  'Size N S
      Picture         =   "Border.ctx":05EC
      Top             =   720
      Width           =   75
   End
   Begin VB.Image Image1 
      Height          =   75
      Index           =   4
      Left            =   840
      MousePointer    =   8  'Size NW SE
      Picture         =   "Border.ctx":067E
      Top             =   720
      Width           =   75
   End
   Begin VB.Image Image1 
      Height          =   75
      Index           =   3
      Left            =   840
      MousePointer    =   9  'Size W E
      Picture         =   "Border.ctx":0710
      Top             =   480
      Width           =   75
   End
End
Attribute VB_Name = "CBorder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 10
Option Explicit
'контрол для реализации перемещаемых компонентов на форме настройки

Dim prevColor As Long
Dim xResize As Long, yResize As Long
Dim Selected As Boolean, IndResize As Long, mDrawMode As Boolean
Dim m_Alignment As LabelAlignment
'Property Variables:
Private m_Picture As Picture
Private m_PictureXPercent As Long
Private m_PictureYPercent As Long
Private m_PictureAlignment As LabelAlignment
Private XStart As Double, YStart As Double



'Default Property Values:
Private Const m_def_PictureXPercent = 80
Private Const m_def_PictureYPercent = 80
Private Const m_def_PictureAlignment = 3

Private Const m_def_Alignment = 5
Private m_bAllowDecomposition As Boolean



Public Event ResizeMe(ByVal Coner As Long, ByVal OldX As Long, OldY As Long, ByVal x As Long, ByVal y As Long)
Attribute ResizeMe.VB_HelpID = 130
Public Event Resizing(ByVal Coner As Long, ByVal OldX As Long, OldY As Long, ByVal x As Long, ByVal y As Long)
Attribute Resizing.VB_HelpID = 135
Public Event MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
Attribute MouseDown.VB_HelpID = 105
Public Event MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
Attribute MouseMove.VB_HelpID = 110
Public Event MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
Attribute MouseUp.VB_HelpID = 115
Public Event Moving(ByVal XStart As Double, ByVal x As Single, ByVal YStart As Double, ByVal y As Single, UserDefault As Boolean)
Attribute Moving.VB_HelpID = 120
Public Event Click()
Attribute Click.VB_HelpID = 45
Public Event DblClick()
Attribute DblClick.VB_HelpID = 55
'Public Event GotFocus()


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


Public Sub BSelect()
Attribute BSelect.VB_HelpID = 35
 
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
Attribute BDeSelect.VB_HelpID = 30
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
      If Abs(xResize - x) > 5 Or Abs(yResize - y) > 5 Then
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
  usercontrol_Resize
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


Private Sub usercontrol_Resize()
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
  
  Label1.Left = 0
  Label1.Top = 0
  Label1.Width = Frame1.Width - Label1.Left
  Label1.Height = Frame1.Height - Label1.Top
  'Label1.FontSize = GetFontSize
   
  Label1.WordWrap = True
  
  Select Case Alignment
  Case lalefttop
    Label1.Left = 0
    Label1.Top = 0


  Case laleftcenter
    Label1.Left = 0
    Label1.Top = Frame1.Height / 2 - Label1.Height / 2

  Case laLeftBottom
    Label1.Left = 0
    Label1.Top = Frame1.Height - Label1.Height


  Case laCenterTop
    Label1.Left = Frame1.Width / 2 - Label1.Width / 2
    Label1.Top = 0


  Case laCenterCenter
    Label1.Left = Frame1.Width / 2 - Label1.Width / 2
    Label1.Top = Frame1.Height / 2 - Label1.Height / 2


  Case laCenterBottom
    Label1.Left = Frame1.Width / 2 - Label1.Width / 2
    Label1.Top = Frame1.Height - Label1.Height

  Case laRightTop
    Label1.Left = Frame1.Width - Label1.Width
    Label1.Top = 0


  Case laRightCenter
    Label1.Left = Frame1.Width - Label1.Width
    Label1.Top = Frame1.Height / 2 - Label1.Height / 2


  Case laRightBottom
    Label1.Left = Frame1.Width - Label1.Width
    Label1.Top = Frame1.Height - Label1.Height
  End Select
          
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
  Label1.ZOrder 1
End Sub

Private Function GetFontSize() As Integer
     GetFontSize = Int(Sqr(Label1.Height * Label1.Width / Screen.TwipsPerPixelY / Screen.TwipsPerPixelX / Len(Label1.Caption)) / 1.3)
End Function


'Initialize Properties for User Control
Private Sub UserControl_InitProperties()
  m_Alignment = m_def_Alignment
End Sub

'Load property values from storage
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)

  
  On Error Resume Next
  Label1.Caption = PropBag.ReadProperty("Caption", "Label1")
  Label1.FontSize = PropBag.ReadProperty("FontSize", 0)
  Label1.FontItalic = PropBag.ReadProperty("FontItalic", 0)
  Label1.FontBold = PropBag.ReadProperty("FontBold", 0)
  Label1.BackColor = PropBag.ReadProperty("BackColor", &H80000005)
  UserControl.BackColor = Label1.BackColor
  Label1.FontStrikethru = PropBag.ReadProperty("FontStrikethru", 0)
  Label1.FontUnderline = PropBag.ReadProperty("FontUnderline", 0)
  Label1.ForeColor = PropBag.ReadProperty("ForeColor", &H80000008)
  
  m_Alignment = PropBag.ReadProperty("Alignment", m_def_Alignment)
  
  m_bAllowDecomposition = PropBag.ReadProperty("Decomposition", False)
  Frame1.ToolTipText = PropBag.ReadProperty("ToolTipText", "")
End Sub

'Write property values to storage
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Call PropBag.WriteProperty("Alignment", m_Alignment, m_def_Alignment)

  Call PropBag.WriteProperty("Caption", Label1.Caption, "Label1")
  Call PropBag.WriteProperty("FontSize", Label1.FontSize, 0)
  Call PropBag.WriteProperty("FontItalic", Label1.FontItalic, 0)
  Call PropBag.WriteProperty("FontBold", Label1.FontBold, 0)
  Call PropBag.WriteProperty("BackColor", Label1.BackColor, &H80000005)
  Call PropBag.WriteProperty("FontStrikethru", Label1.FontStrikethru, 0)
  Call PropBag.WriteProperty("FontUnderline", Label1.FontUnderline, 0)
  Call PropBag.WriteProperty("ForeColor", Label1.ForeColor, &H80000008)
  
  Call PropBag.WriteProperty("Decomposition", m_bAllowDecomposition)
  Call PropBag.WriteProperty("ToolTipText", Frame1.ToolTipText, "")
End Sub


'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=Label1,Label1,-1,Caption
Public Property Get Caption() As String
Attribute Caption.VB_Description = "Returns/sets the text displayed in an object's title bar or below an object's icon."
Attribute Caption.VB_HelpID = 40
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
Attribute Font.VB_HelpID = 65
Attribute Font.VB_UserMemId = -512
  Set Font = Label1.Font
End Property

Public Property Set Font(ByVal New_Font As Font)
  'Set Label1.Font = New_Font
  'PropertyChanged "Font"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=Label1,Label1,-1,FontName
Public Property Get FontName() As String
Attribute FontName.VB_Description = "Specifies the name of the font that appears in each row for the given level."
Attribute FontName.VB_HelpID = 80
  FontName = Label1.FontName
End Property

Public Property Let FontName(ByVal New_FontName As String)
  'Label1.FontName() = New_FontName
  'PropertyChanged "FontName"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=Label1,Label1,-1,FontSize
Public Property Get FontSize() As Single
Attribute FontSize.VB_HelpID = 85
  FontSize = Label1.FontSize
End Property

Public Property Let FontSize(ByVal New_FontSize As Single)
  Label1.FontSize() = New_FontSize
  PropertyChanged "FontSize"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=Label1,Label1,-1,FontItalic
Public Property Get FontItalic() As Boolean
Attribute FontItalic.VB_HelpID = 75
  FontItalic = Label1.FontItalic
End Property

Public Property Let FontItalic(ByVal New_FontItalic As Boolean)
  Label1.FontItalic() = New_FontItalic
  PropertyChanged "FontItalic"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=Label1,Label1,-1,FontBold
Public Property Get FontBold() As Boolean
Attribute FontBold.VB_HelpID = 70
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
Attribute BackColor.VB_HelpID = 25
  BackColor = UserControl.BackColor 'Label1.BackColor
End Property

Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
  'Label1.BackColor = New_BackColor
  UserControl.BackColor = New_BackColor
  PropertyChanged "BackColor"
End Property


Public Property Get Alignment() As LabelAlignment
Attribute Alignment.VB_HelpID = 15
Alignment = m_Alignment

End Property

Public Property Let Alignment(ByVal vNewValue As LabelAlignment)
m_Alignment = vNewValue
usercontrol_Resize
End Property
'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=Label1,Label1,-1,FontStrikethru
Public Property Get FontStrikethru() As Boolean
Attribute FontStrikethru.VB_Description = "Returns/sets strikethrough font styles."
Attribute FontStrikethru.VB_HelpID = 90
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
Attribute FontUnderline.VB_HelpID = 95
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
Attribute ForeColor.VB_HelpID = 100
  ForeColor = Label1.ForeColor
End Property

Public Property Let ForeColor(ByVal New_ForeColor As OLE_COLOR)
  Label1.ForeColor() = New_ForeColor
  PropertyChanged "ForeColor"
End Property


'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MemberInfo=23,0,0,0
Public Property Get PictureAlignment() As LabelAlignment
Attribute PictureAlignment.VB_HelpID = 125
  PictureAlignment = m_PictureAlignment
End Property

Public Property Let PictureAlignment(ByVal New_PictureAlignment As LabelAlignment)
  m_PictureAlignment = New_PictureAlignment
  PropertyChanged "PictureAlignment"
  usercontrol_Resize
End Property


Public Property Get DrawMode() As Boolean
Attribute DrawMode.VB_HelpID = 60
  DrawMode = mDrawMode
End Property

Public Property Let DrawMode(ByVal v As Boolean)
  mDrawMode = v
  If mDrawMode Then
    'prevColor = Label1.ForeColor
    Label1.ForeColor = vbRed
  Else
    Label1.ForeColor = vbBlack 'prevColor
  End If
  usercontrol_Resize
End Property

Public Property Get AllowDecomposition() As Boolean
Attribute AllowDecomposition.VB_HelpID = 20
    AllowDecomposition = m_bAllowDecomposition
End Property

Public Property Let AllowDecomposition(ByVal bNewValue As Boolean)
    m_bAllowDecomposition = bNewValue
End Property

Public Property Get Color() As OLE_COLOR
Attribute Color.VB_HelpID = 50
    Color = Frame1.BackColor
End Property

Public Property Let Color(ByVal NewColor As OLE_COLOR)
    Frame1.BackColor = NewColor
End Property


Public Property Get ToolTipText() As String
Attribute ToolTipText.VB_Description = "Returns/sets the text displayed when the mouse is paused over the control."
Attribute ToolTipText.VB_HelpID = 140
  ToolTipText = Frame1.ToolTipText
End Property

Public Property Let ToolTipText(ByVal New_ToolTipText As String)
  Frame1.ToolTipText() = New_ToolTipText
  PropertyChanged "ToolTipText"
End Property

