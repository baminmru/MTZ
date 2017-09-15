Attribute VB_Name = "Module1"
Attribute VB_HelpID = 170

'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скал€рного типа
'See Also:
'  CF_BITMAP
'  CF_DIB
'  CF_DSPBITMAP
'  ClientToScreen
'  CreateCompatibleBitmap
'  CreateCompatibleDC
'  DeleteDC
'  DeleteObject
'  DrawText
'  DrawTextEx
'  DT_BOTTOM
'  DT_CALCRECT
'  DT_CENTER
'  DT_CHARSTREAM
'  DT_DISPFILE
'  DT_EXPANDTABS
'  DT_EXTERNALLEADING
'  DT_INTERNAL
'  DT_LEFT
'  DT_METAFILE
'  DT_NOCLIP
'  DT_NOPREFIX
'  DT_PLOTTER
'  DT_RASCAMERA
'  DT_RASDISPLAY
'  DT_RASPRINTER
'  DT_RIGHT
'  DT_SINGLELINE
'  DT_TABSTOP
'  DT_TOP
'  DT_VCENTER
'  DT_WORDBREAK
'  FillRect
'  GetClientRect
'  GetCurrentObject
'  GetDC
'  GetWindow
'  GW_CHILD
'  GW_HWNDLAST
'  GW_HWNDPREV
'  IntersectClipRect
'  IsWindowVisible
'  MapWindowPoints
'  ReleaseDC
'  RestoreDC
'  SaveDC
'  SelectObject
'  SendMessage
'  SetClipboardData
'  SetWindowOrgEx
'  SRCCOPY
'  TextOut
'  WM_ERASEBKGND
'  WM_PAINT
'Example:
Option Explicit

Public Type RECT
        Left As Long
        Top As Long
        Right As Long
        Bottom As Long
End Type

Public Type POINTAPI
        x As Long
        y As Long
End Type

Public Type BITMAP
        bmType As Long
        bmWidth As Long
        bmHeight As Long
        bmWidthBytes As Long
        bmPlanes As Integer
        bmBitsPixel As Integer
        bmBits As Long
End Type

Public Type DRAWTEXTPARAMS
  cbSize As Long
  iTabLength As Long
  iLeftMargin As Long
  iRightMargin As Long
  uiLengthDrawn As Long
End Type

Declare Function GetWindow Lib "user32" (ByVal hwnd As Long, ByVal wCmd As Long) As Long
Attribute GetWindow.VB_HelpID = 360
Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Attribute SendMessage.VB_HelpID = 415
Declare Function IntersectClipRect Lib "gdi32" (ByVal hdc As Long, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Attribute IntersectClipRect.VB_HelpID = 380
Declare Function MapWindowPoints Lib "user32" (ByVal hwndFrom As Long, ByVal hwndTo As Long, lppt As Any, ByVal cPoints As Long) As Long
Attribute MapWindowPoints.VB_HelpID = 390
Declare Function CreateCompatibleBitmap Lib "gdi32" (ByVal hdc As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
Attribute CreateCompatibleBitmap.VB_HelpID = 200
Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hdc As Long) As Long
Attribute CreateCompatibleDC.VB_HelpID = 205
Declare Function IsWindowVisible Lib "user32" (ByVal hwnd As Long) As Long
Attribute IsWindowVisible.VB_HelpID = 385
Declare Function SetWindowOrgEx Lib "gdi32" (ByVal hdc As Long, ByVal nX As Long, ByVal nY As Long, ByVal lpPoint As Long) As Long
Attribute SetWindowOrgEx.VB_HelpID = 425
Declare Function SaveDC Lib "gdi32" (ByVal hdc As Long) As Long
Attribute SaveDC.VB_HelpID = 405
Declare Function RestoreDC Lib "gdi32" (ByVal hdc As Long, ByVal nSavedDC As Long) As Long
Attribute RestoreDC.VB_HelpID = 400
Declare Function GetClientRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
Attribute GetClientRect.VB_HelpID = 345
Declare Function ClientToScreen Lib "user32" (ByVal hwnd As Long, lpPoint As POINTAPI) As Long
Attribute ClientToScreen.VB_HelpID = 195
Declare Function ReleaseDC Lib "user32" (ByVal hwnd As Long, ByVal hdc As Long) As Long
Attribute ReleaseDC.VB_HelpID = 395
Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long
Attribute DeleteDC.VB_HelpID = 210
Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Attribute SelectObject.VB_HelpID = 410
Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Attribute GetDC.VB_HelpID = 355
Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Attribute DeleteObject.VB_HelpID = 215
Declare Function FillRect Lib "user32" (ByVal hdc As Long, lpRect As RECT, ByVal hBrush As Long) As Long
Attribute FillRect.VB_HelpID = 340
Declare Function GetCurrentObject Lib "gdi32" (ByVal hdc As Long, ByVal uObjectType As Long) As Long
Attribute GetCurrentObject.VB_HelpID = 350
Declare Function SetClipboardData Lib "user32" (ByVal wFormat As Long, ByRef hMem As BITMAP) As Long
Attribute SetClipboardData.VB_HelpID = 420
Public Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Attribute BitBlt.VB_HelpID = 175
Public Declare Function TextOut Lib "gdi32" Alias "TextOutA" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal lpString As String, ByVal nCount As Long) As Long
Attribute TextOut.VB_HelpID = 435
Public Declare Function DrawTextEx Lib "user32" Alias "DrawTextExA" (ByVal hdc As Long, ByVal lpsz As String, ByVal n As Long, lpRect As RECT, ByVal un As Long, lpDrawTextParams As DRAWTEXTPARAMS) As Long
Attribute DrawTextEx.VB_HelpID = 225
Public Declare Function DrawText Lib "user32" Alias "DrawTextA" (ByVal hdc As Long, ByVal lpStr As String, ByVal nCount As Long, lpRect As RECT, ByVal wFormat As Long) As Long
Attribute DrawText.VB_HelpID = 220

Public Const DT_WORDBREAK = &H10
Attribute DT_WORDBREAK.VB_VarHelpID = 335

Public Const DT_VCENTER = &H4
Attribute DT_VCENTER.VB_VarHelpID = 330

Public Const DT_TOP = &H0
Attribute DT_TOP.VB_VarHelpID = 325

Public Const DT_TABSTOP = &H80
Attribute DT_TABSTOP.VB_VarHelpID = 320

Public Const DT_BOTTOM = &H8
Attribute DT_BOTTOM.VB_VarHelpID = 230

Public Const DT_CALCRECT = &H400
Attribute DT_CALCRECT.VB_VarHelpID = 235

Public Const DT_CENTER = &H1
Attribute DT_CENTER.VB_VarHelpID = 240

Public Const DT_CHARSTREAM = 4          '  Character-stream, PLP
Attribute DT_CHARSTREAM.VB_VarHelpID = 245

Public Const DT_DISPFILE = 6            '  Display-file
Attribute DT_DISPFILE.VB_VarHelpID = 250

Public Const DT_EXPANDTABS = &H40
Attribute DT_EXPANDTABS.VB_VarHelpID = 255

Public Const DT_EXTERNALLEADING = &H200
Attribute DT_EXTERNALLEADING.VB_VarHelpID = 260

Public Const DT_INTERNAL = &H1000
Attribute DT_INTERNAL.VB_VarHelpID = 265

Public Const DT_LEFT = &H0
Attribute DT_LEFT.VB_VarHelpID = 270

Public Const DT_METAFILE = 5            '  Metafile, VDM
Attribute DT_METAFILE.VB_VarHelpID = 275

Public Const DT_NOCLIP = &H100
Attribute DT_NOCLIP.VB_VarHelpID = 280

Public Const DT_NOPREFIX = &H800
Attribute DT_NOPREFIX.VB_VarHelpID = 285

Public Const DT_PLOTTER = 0             '  Vector plotter
Attribute DT_PLOTTER.VB_VarHelpID = 290

Public Const DT_RASCAMERA = 3           '  Raster camera
Attribute DT_RASCAMERA.VB_VarHelpID = 295

Public Const DT_RASDISPLAY = 1          '  Raster display
Attribute DT_RASDISPLAY.VB_VarHelpID = 300

Public Const DT_RASPRINTER = 2          '  Raster printer
Attribute DT_RASPRINTER.VB_VarHelpID = 305

Public Const DT_RIGHT = &H2
Attribute DT_RIGHT.VB_VarHelpID = 310

Public Const DT_SINGLELINE = &H20
Attribute DT_SINGLELINE.VB_VarHelpID = 315



Public Const SRCCOPY = &HCC0020
Attribute SRCCOPY.VB_VarHelpID = 430
Public Const CF_BITMAP = 2
Attribute CF_BITMAP.VB_VarHelpID = 180
Public Const CF_DIB = 8
Attribute CF_DIB.VB_VarHelpID = 185
Public Const CF_DSPBITMAP = &H82
Attribute CF_DSPBITMAP.VB_VarHelpID = 190
Public Const WM_ERASEBKGND = &H14
Attribute WM_ERASEBKGND.VB_VarHelpID = 440
Public Const WM_PAINT = &HF
Attribute WM_PAINT.VB_VarHelpID = 445
Public Const GW_CHILD = 5
Attribute GW_CHILD.VB_VarHelpID = 365
Public Const GW_HWNDLAST = 1
Attribute GW_HWNDLAST.VB_VarHelpID = 370
Public Const GW_HWNDPREV = 3
Attribute GW_HWNDPREV.VB_VarHelpID = 375

Private PrintDC As Long, ScreenDC As Long
Private PaintLParam As Long
Private OldBits As Long, PrintBits As Long

Private Sub PrintHandle(ByVal Handle As Long, ByVal Self As Long)
Dim Child As Long
Dim SavedIndex As Integer
Dim r As RECT
    If IsWindowVisible(Handle) Then
      SavedIndex = SaveDC(PrintDC)
      GetClientRect Handle, r
      MapWindowPoints Handle, Self, r, 2
      SetWindowOrgEx PrintDC, -r.Left, -r.Top, 0
      IntersectClipRect PrintDC, 0, 0, r.Right - r.Left, r.Bottom - r.Top
      SendMessage Handle, WM_ERASEBKGND, PrintDC, 0
      SendMessage Handle, WM_PAINT, PrintDC, PaintLParam
      Child = GetWindow(Handle, GW_CHILD)
      If Child <> 0 Then
        Child = GetWindow(Child, GW_HWNDLAST)
        While Child <> 0
          PrintHandle Child, Self
          Child = GetWindow(Child, GW_HWNDPREV)
        Wend
      End If
      RestoreDC PrintDC, SavedIndex
    End If
End Sub

