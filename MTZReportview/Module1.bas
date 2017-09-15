Attribute VB_Name = "Module1"
Option Explicit

'  orientation selections
Public Const DMORIENT_PORTRAIT As Integer = 1
Public Const DMORIENT_LANDSCAPE As Integer = 2

'  paper selections
Public Const DMPAPER_LETTER As Integer = 1
Public Const DMPAPER_FIRST As Integer = DMPAPER_LETTER     '  Letter 8 1/2 x 11 in
Public Const DMPAPER_LETTERSMALL As Integer = 2            '  Letter Small 8 1/2 x 11 in
Public Const DMPAPER_TABLOID As Integer = 3                '  Tabloid 11 x 17 in
Public Const DMPAPER_LEDGER As Integer = 4                 '  Ledger 17 x 11 in
Public Const DMPAPER_LEGAL As Integer = 5                  '  Legal 8 1/2 x 14 in
Public Const DMPAPER_STATEMENT As Integer = 6              '  Statement 5 1/2 x 8 1/2 in
Public Const DMPAPER_EXECUTIVE As Integer = 7              '  Executive 7 1/4 x 10 1/2 in
Public Const DMPAPER_A3 As Integer = 8                     '  A3 297 x 420 mm
Public Const DMPAPER_A4 As Integer = 9                     '  A4 210 x 297 mm
Public Const DMPAPER_A4SMALL As Integer = 10               '  A4 Small 210 x 297 mm
Public Const DMPAPER_A5 As Integer = 11                    '  A5 148 x 210 mm
Public Const DMPAPER_B4 As Integer = 12                    '  B4 250 x 354
Public Const DMPAPER_B5 As Integer = 13                    '  B5 182 x 257 mm
Public Const DMPAPER_FOLIO As Integer = 14                 '  Folio 8 1/2 x 13 in
Public Const DMPAPER_QUARTO As Integer = 15                '  Quarto 215 x 275 mm
Public Const DMPAPER_10X14 As Integer = 16                 '  10x14 in
Public Const DMPAPER_11X17 As Integer = 17                 '  11x17 in
Public Const DMPAPER_NOTE As Integer = 18                  '  Note 8 1/2 x 11 in
Public Const DMPAPER_ENV_9 As Integer = 19                 '  Envelope #9 3 7/8 x 8 7/8
Public Const DMPAPER_ENV_10 As Integer = 20                '  Envelope #10 4 1/8 x 9 1/2
Public Const DMPAPER_ENV_11 As Integer = 21                '  Envelope #11 4 1/2 x 10 3/8
Public Const DMPAPER_ENV_12 As Integer = 22                '  Envelope #12 4 \276 x 11
Public Const DMPAPER_ENV_14 As Integer = 23                '  Envelope #14 5 x 11 1/2
Public Const DMPAPER_CSHEET As Integer = 24                '  C size sheet
Public Const DMPAPER_DSHEET As Integer = 25                '  D size sheet
Public Const DMPAPER_ESHEET As Integer = 26                '  E size sheet
Public Const DMPAPER_ENV_DL As Integer = 27                '  Envelope DL 110 x 220mm
Public Const DMPAPER_ENV_C5 As Integer = 28                '  Envelope C5 162 x 229 mm
Public Const DMPAPER_ENV_C3 As Integer = 29                '  Envelope C3  324 x 458 mm
Public Const DMPAPER_ENV_C4 As Integer = 30                '  Envelope C4  229 x 324 mm
Public Const DMPAPER_ENV_C6 As Integer = 31                '  Envelope C6  114 x 162 mm
Public Const DMPAPER_ENV_C65 As Integer = 32               '  Envelope C65 114 x 229 mm
Public Const DMPAPER_ENV_B4 As Integer = 33                '  Envelope B4  250 x 353 mm
Public Const DMPAPER_ENV_B5 As Integer = 34                '  Envelope B5  176 x 250 mm
Public Const DMPAPER_ENV_B6 As Integer = 35                '  Envelope B6  176 x 125 mm
Public Const DMPAPER_ENV_ITALY As Integer = 36             '  Envelope 110 x 230 mm
Public Const DMPAPER_ENV_MONARCH As Integer = 37           '  Envelope Monarch 3.875 x 7.5 in
Public Const DMPAPER_ENV_PERSONAL As Integer = 38          '  6 3/4 Envelope 3 5/8 x 6 1/2 in
Public Const DMPAPER_FANFOLD_US As Integer = 39            '  US Std Fanfold 14 7/8 x 11 in
Public Const DMPAPER_FANFOLD_STD_GERMAN As Integer = 40    '  German Std Fanfold 8 1/2 x 12 in
Public Const DMPAPER_FANFOLD_LGL_GERMAN As Integer = 41    '  German Legal Fanfold 8 1/2 x 13 in
Public Const DMPAPER_LAST As Integer = DMPAPER_FANFOLD_LGL_GERMAN
Public Const DMPAPER_USER As Integer = 256

Private Declare Function OpenPrinter Lib "winspool.drv" Alias "OpenPrinterA" (ByVal pPrinterName As String, phPrinter As Long, pDefault As PRINTER_DEFAULTS) As Long
Private Declare Function GetPrinter Lib "winspool.drv" Alias "GetPrinterA" (ByVal hPrinter As Long, ByVal Level As Long, pPrinter As Byte, ByVal cbBuf As Long, pcbNeeded As Long) As Long
Private Declare Function SetPrinter Lib "winspool.drv" Alias "SetPrinterA" (ByVal hPrinter As Long, ByVal Level As Long, pPrinter As Any, ByVal Command As Long) As Long
Private Declare Function ClosePrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Function GetLastError Lib "kernel32" () As Long

Private Const PRINTER_ALL_ACCESS As Long = &HF000C
Private Const PRINTER_READ As Long = &H20008
Private Const PRINTER_ACCESS_USE As Long = &H8

Private Type DEVMODE
    dmDeviceName As String * 32
    dmSpecVersion As Integer
    dmDriverVersion As Integer
    dmSize As Integer
    dmDriverExtra As Integer
    dmFields As Long
    dmOrientation As Integer
    dmPaperSize As Integer
    dmPaperLength As Integer
    dmPaperWidth As Integer
    dmScale As Integer
    dmCopies As Integer
    dmDefaultSource As Integer
    dmPrintQuality As Integer
    dmColor As Integer
    dmDuplex As Integer
    dmYResolution As Integer
    dmTTOption As Integer
    dmCollate As Integer
    dmFormName As String * 32
    dmUnusedPadding As Integer
    dmBitsPerPel As Integer
    dmPelsWidth As Long
    dmPelsHeight As Long
    dmDisplayFlags As Long
    dmDisplayFrequency As Long
End Type

Private Type PRINTER_DEFAULTS
    pDatatype As Long
    pDevMode As Long
    DesiredAccess As Long
End Type

Private Type PRINTER_INFO_2
    pServerName As Long
    pPrinterName As Long
    pShareName As Long
    pPortName As Long
    pDriverName As Long
    pComment As Long
    pLocation As Long
    pDevMode As Long
    pSepFile As Long
    pPrintProcessor As Long
    pDatatype As Long
    pParameters As Long
    pSecurityDescriptor As Long
    Attributes As Long
    Priority As Long
    DefaultPriority As Long
    StartTime As Long
    UntilTime As Long
    Status As Long
    cJobs As Long
    AveragePPM As Long
End Type

Public Function GetPrinterInfo(PrinterName As String, Orientation As Integer, PaperSize As Integer) As Boolean
    On Error Resume Next
    Dim hPrinter As Long
    Dim pi2 As PRINTER_INFO_2
    Dim pd As PRINTER_DEFAULTS
    Dim dm As DEVMODE
    Dim BufSize As Long
    Dim Buffer() As Byte
    
    pd.pDatatype = 0
    pd.pDevMode = 0
    pd.DesiredAccess = PRINTER_READ
    
    If OpenPrinter(PrinterName, hPrinter, pd) = 0 Then
'     MsgBox "Ошибка обращения к принтеру (OpenPrinter)"
      Exit Function
    End If
    GetPrinter hPrinter, 2, 0, 0, BufSize
    ReDim Buffer(BufSize + 10) As Byte
    If GetPrinter(hPrinter, 2, Buffer(0), BufSize, BufSize) = 0 Then
'      MsgBox "Ошибка обращения к принтеру (GetPrinter)"
      Exit Function
    End If
    CopyMemory pi2, Buffer(0), Len(pi2)
    CopyMemory dm, ByVal pi2.pDevMode, Len(dm)
    
    Orientation = dm.dmOrientation
    PaperSize = dm.dmPaperSize
    
    ClosePrinter hPrinter
    
    GetPrinterInfo = True
End Function

Public Function SetPrinterInfo(PrinterName As String, Orientation As Integer, PaperSize As Integer) As Boolean
    On Error Resume Next
    Dim hPrinter As Long
    Dim pi2 As PRINTER_INFO_2
    Dim pd As PRINTER_DEFAULTS
    Dim dm As DEVMODE
    Dim BufSize As Long
    Dim Buffer() As Byte
    
    pd.pDatatype = 0
    pd.pDevMode = 0
    pd.DesiredAccess = PRINTER_ALL_ACCESS
    
    If OpenPrinter(PrinterName, hPrinter, pd) = 0 Then
      MsgBox "Ошибка обращения к принтеру (OpenPrinter)"
      Exit Function
    End If
    
    GetPrinter hPrinter, 2, 0, 0, BufSize
    ReDim Buffer(BufSize + 10) As Byte
    If GetPrinter(hPrinter, 2, Buffer(0), BufSize, BufSize) = 0 Then
      MsgBox "Ошибка обращения к принтеру (GetPrinter)"
      Exit Function
    End If
    CopyMemory pi2, Buffer(0), Len(pi2)
    CopyMemory dm, ByVal pi2.pDevMode, Len(dm)
    
    dm.dmOrientation = Orientation
    dm.dmPaperSize = PaperSize
    
    CopyMemory ByVal pi2.pDevMode, dm, Len(dm)
    
'    If Not SetPrinter(hPrinter, 2, pi2, 0) Then
'      MsgBox "Ошибка обращения к принтеру (SetPrinter)"
'      Exit Function
'    End If
    If SetPrinter(hPrinter, 2, pi2, 0) = 0 Then
      MsgBox "Ошибка обращения к принтеру (SetPrinter)"
      Exit Function
    End If
    ClosePrinter hPrinter
    
    SetPrinterInfo = True
End Function
