Attribute VB_Name = "Module1"
Option Explicit
Public Util As Common
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
Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Declare Function IntersectClipRect Lib "gdi32" (ByVal hdc As Long, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Declare Function MapWindowPoints Lib "user32" (ByVal hwndFrom As Long, ByVal hwndTo As Long, lppt As Any, ByVal cPoints As Long) As Long
Declare Function CreateCompatibleBitmap Lib "gdi32" (ByVal hdc As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long
Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hdc As Long) As Long
Declare Function IsWindowVisible Lib "user32" (ByVal hwnd As Long) As Long
Declare Function SetWindowOrgEx Lib "gdi32" (ByVal hdc As Long, ByVal nX As Long, ByVal nY As Long, ByVal lpPoint As Long) As Long
Declare Function SaveDC Lib "gdi32" (ByVal hdc As Long) As Long
Declare Function RestoreDC Lib "gdi32" (ByVal hdc As Long, ByVal nSavedDC As Long) As Long
Declare Function GetClientRect Lib "user32" (ByVal hwnd As Long, lpRect As RECT) As Long
Declare Function ReleaseDC Lib "user32" (ByVal hwnd As Long, ByVal hdc As Long) As Long
Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long
Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Declare Function FillRect Lib "user32" (ByVal hdc As Long, lpRect As RECT, ByVal hBrush As Long) As Long
Declare Function GetCurrentObject Lib "gdi32" (ByVal hdc As Long, ByVal uObjectType As Long) As Long
Declare Function SetClipboardData Lib "user32" (ByVal wFormat As Long, ByRef hMem As BITMAP) As Long
Public Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Public Declare Function TextOut Lib "gdi32" Alias "TextOutA" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal lpString As String, ByVal nCount As Long) As Long
Public Declare Function DrawTextEx Lib "user32" Alias "DrawTextExA" (ByVal hdc As Long, ByVal lpsz As String, ByVal n As Long, lpRect As RECT, ByVal un As Long, lpDrawTextParams As DRAWTEXTPARAMS) As Long
Public Declare Function DrawText Lib "user32" Alias "DrawTextA" (ByVal hdc As Long, ByVal lpStr As String, ByVal nCount As Long, lpRect As RECT, ByVal wFormat As Long) As Long

Public Const DT_WORDBREAK = &H10

Public Const DT_VCENTER = &H4

Public Const DT_TOP = &H0

Public Const DT_TABSTOP = &H80

Public Const DT_BOTTOM = &H8

Public Const DT_CALCRECT = &H400

Public Const DT_CENTER = &H1

Public Const DT_CHARSTREAM = 4          '  Character-stream, PLP

Public Const DT_DISPFILE = 6            '  Display-file

Public Const DT_EXPANDTABS = &H40

Public Const DT_EXTERNALLEADING = &H200

Public Const DT_INTERNAL = &H1000

Public Const DT_LEFT = &H0

Public Const DT_METAFILE = 5            '  Metafile, VDM

Public Const DT_NOCLIP = &H100

Public Const DT_NOPREFIX = &H800

Public Const DT_PLOTTER = 0             '  Vector plotter

Public Const DT_RASCAMERA = 3           '  Raster camera

Public Const DT_RASDISPLAY = 1          '  Raster display

Public Const DT_RASPRINTER = 2          '  Raster printer

Public Const DT_RIGHT = &H2

Public Const DT_SINGLELINE = &H20



Public Const SRCCOPY = &HCC0020
Public Const CF_BITMAP = 2
Public Const CF_DIB = 8
Public Const CF_DSPBITMAP = &H82
Public Const WM_ERASEBKGND = &H14
Public Const WM_PAINT = &HF
Public Const GW_CHILD = 5
Public Const GW_HWNDLAST = 1
Public Const GW_HWNDPREV = 3

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

Public Sub GetFormImage(ByVal f As Object, ByVal filename As String)
    Dim CliRect As RECT
    Dim f2 As Form2
    On Error Resume Next
    Set f2 = New Form2
    
    f2.Hide
    On Error GoTo bye
    ScreenDC = GetDC(0)
    PaintLParam = 0
    
    PrintDC = CreateCompatibleDC(ScreenDC)

    PrintBits = CreateCompatibleBitmap(ScreenDC, f.Width / Screen.TwipsPerPixelX, f.Height / Screen.TwipsPerPixelY)

    OldBits = SelectObject(PrintDC, PrintBits)

    ' Clear the contents of the bitmap
    GetClientRect f.hwnd, CliRect
    
    FillRect PrintDC, CliRect, GetCurrentObject(GetDC(f.hwnd), 2)
    
    f2.Picture1.AutoRedraw = True
    
    ' Paint form into a bitmap
    PrintHandle f.hwnd, f.hwnd
    
    f2.Picture1.Height = f.Height
    f2.Picture1.Width = f.Width
    
    BitBlt f2.Picture1.hdc, 0, 0, f.Width / Screen.TwipsPerPixelX, f.Height / Screen.TwipsPerPixelY, PrintDC, 0, 0, SRCCOPY
    
    f2.Picture1.AutoRedraw = False
    
    SavePicture f2.Picture1.Image, filename
    
    SelectObject PrintDC, OldBits
    DeleteDC PrintDC
    ReleaseDC 0, ScreenDC
    Unload f2
    Set f2 = Nothing
    Exit Sub
bye:
    'MsgBox Err.Description
    Unload f2
    Set f2 = Nothing
End Sub


