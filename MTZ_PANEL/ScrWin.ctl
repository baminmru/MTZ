VERSION 5.00
Begin VB.UserControl ScrolledWindow 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   4665
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5520
   ControlContainer=   -1  'True
   ScaleHeight     =   4665
   ScaleWidth      =   5520
   ToolboxBitmap   =   "ScrWin.ctx":0000
   Begin VB.PictureBox picCorner 
      BorderStyle     =   0  'None
      Height          =   1095
      Left            =   1920
      ScaleHeight     =   1095
      ScaleWidth      =   975
      TabIndex        =   2
      Top             =   1680
      Width           =   975
   End
   Begin VB.VScrollBar vbarWindow 
      Height          =   1575
      Left            =   5220
      SmallChange     =   60
      TabIndex        =   1
      Top             =   30
      Width           =   255
   End
   Begin VB.HScrollBar hbarWindow 
      Height          =   255
      Left            =   0
      SmallChange     =   60
      TabIndex        =   0
      Top             =   4335
      Width           =   1815
   End
End
Attribute VB_Name = "ScrolledWindow"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 430
Option Explicit
'панель с возможностью перемещения контролов

' The contained controls' current offsets
' from their original positions.
Private m_XOffset As Long 'As Single
Private m_YOffset As Long 'As Single

Private mHBarDelta As Long
Private mVBarDelta As Long

'тип границ
Public Property Get BorderStyle_() As FormBorderStyleConstants
Attribute BorderStyle_.VB_HelpID = 440
    BorderStyle_ = BorderStyle
End Property


'тип границ
Public Property Let BorderStyle_(value As FormBorderStyleConstants)
    BorderStyle = value
End Property

Private Function DeCalcHValue(lIn As Long) As Long
    DeCalcHValue = lIn * mHBarDelta
End Function

Private Function DeCalcVValue(lIn As Long) As Long
    DeCalcVValue = lIn * mVBarDelta
End Function


Private Function CalcHValue(lIn As Long) As Long
    CalcHValue = lIn \ mHBarDelta + IIf(lIn Mod mHBarDelta > 0, 1, 0)
End Function

Private Function CalcVValue(lIn As Long) As Long
    CalcVValue = lIn \ mVBarDelta + IIf(lIn Mod mVBarDelta > 0, 1, 0)
End Function


Private Function GetVBarMax(lIn As Long) As Long

    If lIn <= 32000 Then
        mVBarDelta = 1
        GetVBarMax = lIn
        Exit Function
    End If
    
    mVBarDelta = lIn \ 32000 + IIf(lIn Mod 32000 > 0, 1, 0)
    GetVBarMax = CalcVValue(lIn)
    
End Function

Private Function GetHBarMax(lIn As Long) As Long

    If lIn <= 32000 Then
        mHBarDelta = 1
        GetHBarMax = lIn
        Exit Function
    End If
    
    mHBarDelta = lIn \ 32000 + IIf(lIn Mod 32000 > 0, 1, 0)
    GetHBarMax = CalcHValue(lIn)
    
End Function

' подстройка размеров скролбаров к размерам дочерних контролов
' взято из примера Microsoft
Public Sub ArrangeConstituentControls()
Attribute ArrangeConstituentControls.VB_HelpID = 435
On Error Resume Next
Dim need_hbar As Boolean
Dim need_vbar As Boolean
Dim need_wid As Long ' As Single
Dim need_hgt As Long ' As Single
Dim have_wid As Long ' As Single
Dim have_hgt As Long ' As Single
Dim wid As Long ' As Single
Dim hgt As Long ' As Single
Dim ctl As Control

    ' See if there are any contained controls.
    If ContainedControls.Count < 1 Then
        ' There are no contained controls.
        ' We don't need either scroll bar
        need_hbar = False
        need_vbar = False
    Else
        ' There are contained controls.
        ' Bound them.
        need_wid = 0
        need_hgt = 0

        ' Protect against controls missing some
        ' properties. For example, Timer has no
        ' Width and Height.
        On Error Resume Next

        For Each ctl In ContainedControls
            If TypeOf ctl Is Line Then
                If need_wid < ctl.X1 - m_XOffset Then need_wid = ctl.X1 - m_XOffset
                If need_wid < ctl.X2 - m_XOffset Then need_wid = ctl.X2 - m_XOffset
                If need_hgt < ctl.Y1 - m_YOffset Then need_hgt = ctl.Y1 - m_YOffset
                If need_hgt < ctl.Y2 - m_YOffset Then need_hgt = ctl.Y2 - m_YOffset
            Else
                If need_wid < ctl.Left + ctl.Width - m_XOffset Then need_wid = ctl.Left + ctl.Width - m_XOffset
                If need_hgt < ctl.Top + ctl.Height - m_YOffset Then need_hgt = ctl.Top + ctl.Height - m_YOffset
            End If
        Next ctl
        'On Error GoTo 0

        ' See which scroll bars we need.
        have_wid = Width 'ScaleWidth
        have_hgt = Height 'ScaleHeight

        ' See if we need the horizontal scroll bar.
        If need_wid > have_wid Then
            ' We need the horizontal scroll bar.
            need_hbar = True

            ' Allow room for the scroll bar.
            have_hgt = have_hgt - hbarWindow.Height
        Else
            need_hbar = False
        End If

        ' See if we need the vertical scroll bar.
        If need_hgt > have_hgt Then
            ' We need the vertical scroll bar.
            need_vbar = True

            ' Allow room for the scroll bar.
            have_wid = have_wid - vbarWindow.Width

            ' See if we now need the horizontal scroll bar.
            If (Not need_hbar) And _
               (need_wid > have_wid) _
            Then
                ' We now need the horizontal scroll bar.
                need_hbar = True

                ' Allow room for the scroll bar.
                have_hgt = have_hgt - hbarWindow.Height
            End If
        Else
            need_vbar = False
        End If
    End If

    ' Display the needed scroll bars.
    If need_hbar Then
        ' Allow room for the other scroll bar
        ' if it is needed.
        If need_vbar Then
            wid = ScaleWidth - vbarWindow.Width
        Else
            wid = ScaleWidth
        End If

        ' Position the scroll bar.
        hbarWindow.Move 0, _
            ScaleHeight - hbarWindow.Height, _
            wid
        hbarWindow.Max = GetHBarMax(need_wid - have_wid)
        hbarWindow.LargeChange = CalcHValue(wid)
        hbarWindow.Visible = True
        hbarWindow.ZOrder
    Else
        ' Display the whole picture horizontally.
        hbarWindow.value = 0
        m_XOffset = 0
        ' Hide the horizontal scroll bar.
        hbarWindow.Visible = False
    End If

    If need_vbar Then
        ' Allow room for the other scroll bar
        ' if it is needed.
        If need_hbar Then
            hgt = ScaleHeight - hbarWindow.Height
        Else
            hgt = ScaleHeight
        End If

        ' Position the scroll bar.
        vbarWindow.Move _
            ScaleWidth - vbarWindow.Width, _
            0, vbarWindow.Width, hgt
        vbarWindow.Max = GetVBarMax(need_hgt - have_hgt)
        vbarWindow.LargeChange = CalcVValue(hgt)
        vbarWindow.Visible = True
        vbarWindow.ZOrder
    Else
        ' Display the whole picture vertically.
        vbarWindow.value = 0
        m_YOffset = 0

        ' Hide the vertical scroll bar.
        vbarWindow.Visible = False
    End If

    ' If both scroll bars are visible, put
    ' picCorner in the lower right corner.
    If need_hbar And need_vbar Then
        picCorner.Move _
            ScaleWidth - vbarWindow.Width, _
            ScaleHeight - hbarWindow.Height, _
            vbarWindow.Width, _
            hbarWindow.Height
        picCorner.Visible = True
        picCorner.ZOrder
    Else
        picCorner.Visible = False
    End If
    
End Sub
' Position the contained controls based on their
' current offsets and the scroll bar values.
Private Sub ArrangeContainedControls()
On Error Resume Next
Dim dx As Long
Dim dy As Long
Dim ctl As Control
Dim is_visible As Boolean

    ' See how far we need to move the controls
    ' relative to their current positions.
    dx = -hbarWindow.value - m_XOffset
    dx = DeCalcHValue(dx)
    dy = -vbarWindow.value - m_YOffset
    dy = DeCalcVValue(dy)

    ' Position the controls.
    For Each ctl In ContainedControls
        ' See if the control is visible,
        ' guarding against controls like Timer
        ' that don't have a Visible property.
        On Error Resume Next
        'is_visible = ctl.Visible
        'If Err.Number <> 0 Then
        'is_visible = False
        'End If
        'Err.Clear
        'On Error GoTo 0

        ' If the control is visible, move it.
        'If is_visible Then
            If TypeOf ctl Is Line Then
                ctl.X1 = ctl.X1 + dx
                ctl.X2 = ctl.X2 + dx
                ctl.Y1 = ctl.Y1 + dy
                ctl.Y2 = ctl.Y2 + dy
            Else
                ctl.Left = ctl.Left + dx
                ctl.Top = ctl.Top + dy
            End If
        'End If
    Next ctl

    ' Save the new offsets for next time.
    m_XOffset = -hbarWindow.value
    m_YOffset = -vbarWindow.value
End Sub

Private Sub picCorner_DblClick()
Customize
ArrangeConstituentControls
End Sub

Private Sub UserControl_Initialize()
UserControl.Enabled = True
End Sub

' The first time this happens, arrange the scroll bars.
Private Sub UserControl_Paint()
On Error Resume Next
Static done_before As Boolean

    If done_before Then Exit Sub
    done_before = True

    ArrangeConstituentControls
End Sub

' Rearrange the scroll bars.
Private Sub usercontrol_Resize()
On Error Resume Next
    If UserControl.Extender.Width < 30 * Screen.TwipsPerPixelX Then UserControl.Extender.Width = 30 * Screen.TwipsPerPixelX: Exit Sub
    If UserControl.Extender.Height < 30 * Screen.TwipsPerPixelX Then UserControl.Extender.Height = 30 * Screen.TwipsPerPixelX: Exit Sub
    ArrangeConstituentControls
    ArrangeContainedControls
End Sub

' Position the contained controls.
Private Sub vbarWindow_Change()
On Error Resume Next
    ArrangeContainedControls
End Sub
' Position the contained controls.
Private Sub hbarWindow_Change()
On Error Resume Next
    ArrangeContainedControls
End Sub

' Position the contained controls.
Private Sub vbarWindow_Scroll()
On Error Resume Next
    ArrangeContainedControls
End Sub
' Position the contained controls.
Private Sub hbarWindow_Scroll()
On Error Resume Next
    ArrangeContainedControls
End Sub

'передвинуть скролбары в верхний левый угол
Public Sub ToTop()
Attribute ToTop.VB_HelpID = 475
On Error Resume Next
    vbarWindow.value = vbarWindow.Min
    hbarWindow.value = hbarWindow.Min
    ArrangeContainedControls
End Sub

'видимость вертикального скрола
Public Function VBarVisible() As Boolean
Attribute VBarVisible.VB_HelpID = 480
On Error Resume Next
    VBarVisible = vbarWindow.Visible
End Function

'видимость горизонтального скрола
Public Function HBarVisible() As Boolean
Attribute HBarVisible.VB_HelpID = 455
    HBarVisible = hbarWindow.Visible 'And UserControl.Extender.Visible
End Function

'подобрать оптимальный размер
'результат через параметры
'OptX - размер по оси икс,
'OptY - размер по оси игрек
Public Sub OptimalSize(OptX As Single, OptY As Single)
Attribute OptimalSize.VB_HelpID = 460
On Error Resume Next
Dim need_wid As Long ' As Single
Dim need_hgt As Long ' As Single
Dim ctl As Control
 need_wid = 0
 need_hgt = 0

 ' See if there are any contained controls.
 If ContainedControls.Count > 1 Then
    On Error Resume Next

    For Each ctl In ContainedControls
        If TypeOf ctl Is Line Then
            If need_wid < ctl.X1 Then need_wid = ctl.X1
            If need_wid < ctl.X2 Then need_wid = ctl.X2
            If need_hgt < ctl.Y1 Then need_hgt = ctl.Y1
            If need_hgt < ctl.Y2 Then need_hgt = ctl.Y2
        Else
            If need_wid < ctl.Left + ctl.Width Then need_wid = ctl.Left + ctl.Width
            If need_hgt < ctl.Top + ctl.Height Then need_hgt = ctl.Top + ctl.Height
        End If
    Next ctl
    'On Error GoTo 0
 End If
 OptX = need_wid
 OptY = need_hgt
End Sub



'WARNING! DO NOT REMOVE OR MODIFY THE FOLLOWING COMMENTED LINES!
'MappingInfo=UserControl,UserControl,-1,Enabled
' запрет изменения панели
Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Returns/sets a value that determines whether an object can respond to user-generated events."
Attribute Enabled.VB_HelpID = 450
  Enabled = UserControl.Enabled
End Property

'запрет изменения панели
Public Property Let Enabled(ByVal New_Enabled As Boolean)
On Error Resume Next
  UserControl.Enabled = New_Enabled
'  Dim ctl As Control
'  On Error Resume Next
'  For Each ctl In UserControl.ContainedControls
'    ctl.Enabled = New_Enabled
'  Next
  PropertyChanged "Enabled"
End Property

'Load property values from storage
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  Enabled = PropBag.ReadProperty("Enabled", True)
End Sub

'Write property values to storage
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)

  Call PropBag.WriteProperty("Enabled", UserControl.Enabled, True)
End Sub

Property Get PanelControls() As ContainedControls
Attribute PanelControls.VB_HelpID = 465
On Error Resume Next
 Set PanelControls = ContainedControls
End Property

'открытие окна настройки панели
Public Sub Customize()
Attribute Customize.VB_HelpID = 445
    On Error Resume Next
    
    If Not CBool(GetSetting("MTZ", "CONFIG", "CFGFRM", False)) Then
        MsgBox "Настройка  форм запрещена", vbInformation + vbOKOnly, "Предупреждение"
        Exit Sub
    End If
    Dim f As Form1
    Set f = New Form1
    Set f.sw = Me
    f.Show vbModal
    Set f = Nothing
End Sub

'получить строку для сохранения с описанием позиции контролов
Public Property Get PanelCustomisationString() As String
Attribute PanelCustomisationString.VB_HelpID = 470
On Error Resume Next
  PanelCustomisationString = GetPanelStr(Me)
End Property

'восстановить позицию контролов из строки
Public Property Let PanelCustomisationString(ByVal v As String)
On Error Resume Next
  SetPanelStr v, Me
End Property






