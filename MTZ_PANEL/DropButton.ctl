VERSION 5.00
Begin VB.UserControl DropButton 
   ClientHeight    =   825
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1365
   ScaleHeight     =   825
   ScaleWidth      =   1365
   ToolboxBitmap   =   "DropButton.ctx":0000
   Begin VB.Frame Frame1 
      BorderStyle     =   0  'None
      Caption         =   "panel1"
      Height          =   735
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1215
      Begin VB.CommandButton btnMain 
         Height          =   405
         Left            =   0
         Style           =   1  'Graphical
         TabIndex        =   2
         TabStop         =   0   'False
         Top             =   0
         Width           =   615
      End
      Begin VB.CommandButton btnSecond 
         Caption         =   "6"
         BeginProperty Font 
            Name            =   "Marlett"
            Size            =   8.25
            Charset         =   2
            Weight          =   500
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   600
         Picture         =   "DropButton.ctx":0312
         TabIndex        =   1
         TabStop         =   0   'False
         Top             =   0
         Width           =   165
      End
   End
   Begin VB.Menu mnuRoot 
      Caption         =   "Root"
      Begin VB.Menu m 
         Caption         =   "m"
         Index           =   0
      End
   End
End
Attribute VB_Name = "DropButton"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 155
Option Explicit
'кнопка с выпадающим меню


Private nMenuItemsCount As Long

'событие выбора пункта меню
Public Event MenuClick(ByVal sCaption As String)
Attribute MenuClick.VB_HelpID = 225

'Event Declarations:
'нажатие на кнопку
Event Click() 'MappingInfo=btnMain,btnMain,-1,Click
Attribute Click.VB_Description = "Occurs when the user presses and then releases a mouse button over an object."
Attribute Click.VB_HelpID = 180

'двойное нажатие
Event DblClick()
Attribute DblClick.VB_Description = "Occurs when the user presses and releases a mouse button and then presses and releases it again over an object."
Attribute DblClick.VB_HelpID = 185


Event GetDataMember(DataMember As String, Data As Object)
Attribute GetDataMember.VB_Description = "Occurs when a data consumer is asking this data source for one of it's data members."
Attribute GetDataMember.VB_HelpID = 210
Event Resize() 'MappingInfo=UserControl,UserControl,-1,Resize
Attribute Resize.VB_Description = "Occurs when a form is first displayed or the size of an object changes."
Attribute Resize.VB_HelpID = 245

Private Sub btnMain_KeyUp(KeyCode As Integer, Shift As Integer)
Dim ShiftDown, AltDown, CtrlDown, Txt
   ShiftDown = (Shift And vbShiftMask) > 0
   AltDown = (Shift And vbAltMask) > 0
   CtrlDown = (Shift And vbCtrlMask) > 0
   If KeyCode = vbKeyDown Then   ' Display key combinations.
    If AltDown Then
      btnSecond_Click
    End If
   End If
End Sub

Private Sub btnSecond_Click()
    btnMain.SetFocus
    If nMenuItemsCount > 0 Then
        PopupMenu mnuRoot, , btnMain.Left, btnMain.Top + btnMain.Height
    End If
End Sub

Private Sub m_Click(Index As Integer)
    RaiseEvent MenuClick(m(Index).Caption)
End Sub

Private Sub UserControl_Initialize()
    nMenuItemsCount = 0
End Sub

Private Sub UserControl_InitProperties()
    Caption = Extender.Name
'  m_ForeColor = m_def_ForeColor
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  btnMain.Caption = PropBag.ReadProperty("Caption", Extender.Name)
  Set DownPicture = PropBag.ReadProperty("DownPicture", Nothing)
  Enabled = PropBag.ReadProperty("Enabled", True)
  Set Picture = PropBag.ReadProperty("Picture", Nothing)
  btnMain.ToolTipText = PropBag.ReadProperty("ToolTipText", "")
  Set DisabledPicture = PropBag.ReadProperty("DisabledPicture", Nothing)
  btnMain.BackColor = PropBag.ReadProperty("BackColor", &H8000000F)
  btnMain.Cancel = PropBag.ReadProperty("Cancel", False)
  btnMain.Default = PropBag.ReadProperty("Default", False)
  btnMain.MaskColor = PropBag.ReadProperty("MaskColor", 12632256)
  btnMain.UseMaskColor = PropBag.ReadProperty("UseMaskColor", False)
End Sub

Private Sub usercontrol_Resize()
  RaiseEvent Resize
    Dim nWidth As Long
    If UserControl.Width < btnSecond.Width * 2 Then
        Extender.Width = btnSecond.Width * 2
    End If
    If UserControl.Height < Screen.TwipsPerPixelY * 15 Then
        Extender.Height = Screen.TwipsPerPixelY * 15
    End If
    If nMenuItemsCount = 0 Then
        nWidth = 0
        btnSecond.value = False
    Else
        nWidth = btnSecond.Width
    End If
    
    Frame1.Top = 0
    Frame1.Left = 0
    Frame1.Width = UserControl.Width
    Frame1.Height = UserControl.Height
    btnMain.Width = UserControl.Width - nWidth
    btnSecond.Left = btnMain.Left + btnMain.Width
    btnMain.Height = UserControl.Height
    btnSecond.Height = UserControl.Height
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  PropBag.WriteProperty "Caption", btnMain.Caption
  Call PropBag.WriteProperty("Caption", btnMain.Caption, "")
  Call PropBag.WriteProperty("DownPicture", DownPicture, Nothing)
  Call PropBag.WriteProperty("Enabled", UserControl.Enabled, True)
  Call PropBag.WriteProperty("Picture", Picture, Nothing)
  Call PropBag.WriteProperty("ToolTipText", btnMain.ToolTipText, "")
  Call PropBag.WriteProperty("DisabledPicture", DisabledPicture, Nothing)
  Call PropBag.WriteProperty("BackColor", btnMain.BackColor, &H8000000F)
  Call PropBag.WriteProperty("Cancel", btnMain.Cancel, False)
  Call PropBag.WriteProperty("Default", btnMain.Default, False)
  Call PropBag.WriteProperty("MaskColor", btnMain.MaskColor, 12632256)
  Call PropBag.WriteProperty("UseMaskColor", btnMain.UseMaskColor, False)
End Sub

'добавить пункт меню в список выпадающих меню
'параметры
'sCaption -заголовок
'bEnabled - разрешен ли пункт меню
Public Sub AddMenu(ByVal sCaption As String, Optional ByVal bEnabled As Boolean = True)
Attribute AddMenu.VB_HelpID = 160
    nMenuItemsCount = nMenuItemsCount + 1
    Load m(nMenuItemsCount)
    m(nMenuItemsCount).Caption = sCaption
    m(nMenuItemsCount).Visible = True
    m(nMenuItemsCount).Enabled = bEnabled
    
    If nMenuItemsCount = 1 Then
        m(0).Visible = False
        usercontrol_Resize
    End If
    
End Sub


'удалить пункт меню в список выпадающих меню
'параметры
'sCaption -заголовок
Public Function RemoveMenu(ByVal sCaption As String) As Boolean
Attribute RemoveMenu.VB_HelpID = 240
    RemoveMenu = False
    Dim mnu As Menu
    For Each mnu In m
        If mnu.Caption = sCaption Then
            nMenuItemsCount = nMenuItemsCount - 1
            If nMenuItemsCount = 0 Then
                m(0).Visible = True
                usercontrol_Resize
            End If
            Unload mnu
            RemoveMenu = True
            Exit For
        End If
    Next mnu
End Function

'получить пункт меню в список выпадающих меню
'параметры
'sCaption -заголовок
Public Function GetMenuItem(ByVal sCaption As String) As Object
Attribute GetMenuItem.VB_HelpID = 215
    Dim mnu As Menu
    Set GetMenuItem = Nothing
    For Each mnu In m
        If mnu.Caption = sCaption Then
            Set GetMenuItem = mnu
            Exit For
        End If
    Next mnu
End Function

Private Sub btnMain_Click()
  RaiseEvent Click
End Sub

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=btnMain,btnMain,-1,Caption
'надпись на кнопке
Public Property Get Caption() As String
Attribute Caption.VB_Description = "Returns/sets the text displayed in an object's title bar or below an object's icon."
Attribute Caption.VB_HelpID = 175
  Caption = btnMain.Caption
End Property

'заданть надпись на кнопке
'параметры
'New_Caption -заголовок
Public Property Let Caption(ByVal New_Caption As String)
  btnMain.Caption() = New_Caption
  PropertyChanged "Caption"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=btnMain,btnMain,-1,DownPicture
'картинка при нажатии
Public Property Get DownPicture() As Picture
Attribute DownPicture.VB_Description = "Returns/sets a graphic to be displayed when the button is in the down position, if Style is set to 1."
Attribute DownPicture.VB_HelpID = 200
  Set DownPicture = btnMain.DownPicture
End Property
'картинка при нажатии
Public Property Set DownPicture(ByVal New_DownPicture As Picture)
  Set btnMain.DownPicture = New_DownPicture
  PropertyChanged "DownPicture"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=UserControl,UserControl,-1,Enabled
'разрешение работы контрола
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Returns/sets a value that determines whether an object can respond to user-generated events."
Attribute Enabled.VB_HelpID = 205
  Enabled = UserControl.Enabled
End Property

'разрешение работы контрола
Public Property Let Enabled(ByVal New_Enabled As Boolean)
  UserControl.Enabled() = New_Enabled
  btnMain.Enabled = New_Enabled
  btnSecond.Enabled = New_Enabled
  PropertyChanged "Enabled"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=btnMain,btnMain,-1,Picture
'картинка на кнопке
Public Property Get Picture() As Picture
Attribute Picture.VB_Description = "Returns/sets a graphic to be displayed in a CommandButton, OptionButton or CheckBox control, if Style is set to 1."
Attribute Picture.VB_HelpID = 230
  Set Picture = btnMain.Picture
End Property

'картинка на кнопке
Public Property Set Picture(ByVal New_Picture As Picture)
  Set btnMain.Picture = New_Picture
  PropertyChanged "Picture"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=btnMain,btnMain,-1,Style
'стиль кнопки
Public Property Get Style() As Integer
Attribute Style.VB_Description = "Returns/sets the appearance of the control, whether standard (standard Windows style) or graphical (with a custom picture)."
Attribute Style.VB_HelpID = 250
  Style = btnMain.Style
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=btnMain,btnMain,-1,ToolTipText
'тултип кнопки
Public Property Get ToolTipText() As String
Attribute ToolTipText.VB_Description = "Returns/sets the text displayed when the mouse is paused over the control."
Attribute ToolTipText.VB_HelpID = 255
  ToolTipText = btnMain.ToolTipText
End Property

'тултип кнопки
Public Property Let ToolTipText(ByVal New_ToolTipText As String)
  btnMain.ToolTipText = New_ToolTipText
  Frame1.ToolTipText = New_ToolTipText
  PropertyChanged "ToolTipText"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=btnMain,btnMain,-1,DisabledPicture
'картинка при запрете
Public Property Get DisabledPicture() As Picture
Attribute DisabledPicture.VB_Description = "Returns/sets a graphic to be displayed when the button is disabled, if Style is set to 1."
Attribute DisabledPicture.VB_HelpID = 195
  Set DisabledPicture = btnMain.DisabledPicture
End Property

'картинка при запрете
Public Property Set DisabledPicture(ByVal New_DisabledPicture As Picture)
  Set btnMain.DisabledPicture = New_DisabledPicture
  PropertyChanged "DisabledPicture"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=btnMain,btnMain,-1,BackColor
'фоновый цвет
Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_Description = "Returns/sets the background color used to display text and graphics in an object."
Attribute BackColor.VB_HelpID = 165
  BackColor = btnMain.BackColor
End Property

'фоновый цвет
Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
  btnMain.BackColor() = New_BackColor
  btnSecond.BackColor() = New_BackColor
  PropertyChanged "BackColor"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=btnMain,btnMain,-1,Cancel
'кнопка работает как отмена
Public Property Get Cancel() As Boolean
Attribute Cancel.VB_Description = "Indicates whether a command button is the Cancel button on a form."
Attribute Cancel.VB_HelpID = 170
  Cancel = btnMain.Cancel
End Property

'кнопка работает как отмена
Public Property Let Cancel(ByVal New_Cancel As Boolean)
  btnMain.Cancel() = New_Cancel
  PropertyChanged "Cancel"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=btnMain,btnMain,-1,Default
'кнопка работает как утверждение
Public Property Get Default() As Boolean
Attribute Default.VB_Description = "Determines which CommandButton control is the default command button on a form."
Attribute Default.VB_HelpID = 190
  Default = btnMain.Default
End Property

'кнопка работает как утверждение
Public Property Let Default(ByVal New_Default As Boolean)
  btnMain.Default() = New_Default
  PropertyChanged "Default"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=btnMain,btnMain,-1,MaskColor
'маскирующий цвет
Public Property Get MaskColor() As Long
Attribute MaskColor.VB_Description = "Returns or sets a color in a button's picture to be a 'mask' (that is, transparent), if Style is set to 1."
Attribute MaskColor.VB_HelpID = 220
  MaskColor = btnMain.MaskColor
End Property

'маскирующий цвет
Public Property Let MaskColor(ByVal New_MaskColor As Long)
  btnMain.MaskColor() = New_MaskColor
  PropertyChanged "MaskColor"
End Property

'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=btnMain,btnMain,-1,UseMaskColor
Public Property Get UseMaskColor() As Boolean
Attribute UseMaskColor.VB_Description = "Returns or sets a value that determines whether the color assigned in the MaskColor property is used as a 'mask'. (That is, used to create transparent regions.)  Applies only if Style is set to 1."
Attribute UseMaskColor.VB_HelpID = 260
  UseMaskColor = btnMain.UseMaskColor
End Property

Public Property Let UseMaskColor(ByVal New_UseMaskColor As Boolean)
  btnMain.UseMaskColor() = New_UseMaskColor
  PropertyChanged "UseMaskColor"
End Property


'удалить все пункы меню с кнопки
Public Sub RemoveAllMenu()
Attribute RemoveAllMenu.VB_HelpID = 235
    Dim mnu As Menu
again:
    m(0).Visible = True
    For Each mnu In m
        If mnu.Index <> 0 Then
            Unload mnu
            GoTo again
        End If
    Next mnu
    nMenuItemsCount = m.Count - 1
    usercontrol_Resize
 End Sub
