VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Utility"
Attribute VB_GlobalNameSpace = True
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 545
Option Explicit
' общие функции


Private Declare Sub OutputDebugString Lib "kernel32" Alias "OutputDebugStringA" (ByVal lpOutputString As String)



Const SE0                    As Long = 0
Const ERROR_FILE_NOT_FOUND   As Long = 2
Const ERROR_PATH_NOT_FOUND   As Long = 3
Const ERROR_BAD_FORMAT       As Long = 11
Const SE_ERR_FNF             As Long = 2       '// file not found
Const SE_ERR_PNF             As Long = 3       '// path not found
Const SE_ERR_ACCESSDENIED    As Long = 5       '// access denied
Const SE_ERR_OOM             As Long = 8       '// out of memory
Const SE_ERR_DLLNOTFOUND     As Long = 32
Const SE_ERR_SHARE           As Long = 26
Const SE_ERR_ASSOCINCOMPLETE As Long = 27
Const SE_ERR_DDETIMEOUT      As Long = 28
Const SE_ERR_DDEFAIL         As Long = 29
Const SE_ERR_DDEBUSY         As Long = 30
Const SE_ERR_NOASSOC         As Long = 31
 
Const cstrSE0                        As String = "Недостаток памяти или ресурсов операционной системы."
Const cstrSEERROR_FILE_NOT_FOUND     As String = "Указанный файл не обнаружен."
Const cstrSEERROR_PATH_NOT_FOUND     As String = "Указанный путь не обнаружен."
Const cstrSEERROR_BAD_FORMAT         As String = "Файл .exe испорчен (non-Win32® .exe или ошибка в структуре .exe)."
Const cstrSESE_ERR_ACCESSDENIED      As String = "Доступ к этому файлу запрещен операционной системой."
Const cstrSESE_ERR_ASSOCINCOMPLETE   As String = "Данные о приложениях связанных с данным типом файлов испорчены."
Const cstrSESE_ERR_DDEBUSY           As String = "DDE транзакция не может быть завершена, так как активна другая DDE транзакция."
Const cstrSESE_ERR_DDEFAIL           As String = "DDE транзакция не выполнена."
Const cstrSESE_ERR_DDETIMEOUT        As String = "DDE транзакция не может быть завершена, так как истек запрошенный тайм-аут."
Const cstrSESE_ERR_DLLNOTFOUND       As String = "Указанная библиотека не обнаруженная."
Const cstrSESE_ERR_FNF               As String = "Указанный файл не обнаружен."
Const cstrSESE_ERR_NOASSOC           As String = "Не существует приложений, связанных с данным типом файла."
Const cstrSESE_ERR_OOM               As String = "Не достаточно памяти для выполнения операции."
Const cstrSESE_ERR_PNF               As String = "Указанный путь не обнаружен."
Const cstrSESE_ERR_SHARE             As String = "Ошибка совместного доступа."

Private Declare Function GetTempPath Lib "kernel32" Alias "GetTempPathA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

Private Declare Function CoCreateGuid Lib "OLE32.DLL" (pGUID As GUID) As Long
Private Declare Function StringFromGUID2 Lib "OLE32.DLL" (pGUID As GUID, ByVal s As String, ByVal sz As Long) As Long
Private Type GUID
   Data1 As Long
   Data2 As Integer
   Data3 As Integer
   Data4(7) As Byte
End Type

Private Declare Function GetCurrentProcess Lib "kernel32" () As Long
Private Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
Private Declare Sub ExitProcess Lib "kernel32" (ByVal uExitCode As Long)

'Получить новый GUID в фигурных скобках
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  IsEqual
'  IsGUID
'Example:
' dim variable as String
'  variable = me.CreateGUID2()
Public Function CreateGUID2() As String
Attribute CreateGUID2.VB_HelpID = 560
 
 On Error GoTo bye
 Dim g As GUID, s As String * 80, i As Long, j As Long
 Dim lpBuf As Long, out As String
 
 s = Space(80) & Chr(0)
 
 CoCreateGuid g
 i = StringFromGUID2(g, s, 80)
 
  For j = 1 To 38
    out = out & mID(s, j * 2 - 1, 1)
  Next
  CreateGUID2 = out
bye:
End Function

'Проверить является ли строка нормальным GUID
'Parameters:
'[IN]   sGUID , тип параметра: String  - GUID
'Returns:
' Boolean, семантика результата:
'   true  -является
'   false -нет
'See Also:
'  CreateGUID2
'Example:
' dim variable as Boolean
' variable = me.IsGUID(<параметры>)
Public Function IsGUID(ByVal sGUID As String) As Boolean
Attribute IsGUID.VB_HelpID = 610
      Dim i As Integer
      Dim code As String
      Dim Proto As String
      
      If Len(sGUID) <> 38 Then
          IsGUID = False
          Exit Function
      End If
      
      Proto = "{hhhhhhhh-hhhh-hhhh-hhhh-hhhhhhhhhhhh}"
      For i = 1 To 38
        code = mID(Proto, i, 1)
        If code = "h" Then
             code = mID(sGUID, i, 1)
             
             If Not IsHexDigit(code) Then
                  IsGUID = False
                  Exit Function
              End If
        
        Else
         If code <> mID(sGUID, i, 1) Then
            IsGUID = False
            Exit Function
         End If
        End If
      Next
      IsGUID = True
  End Function

'Проверить является ли символ допустимым шестнадцатиричным числом
'Parameters:
'[IN]   Ch , тип параметра: String  - ...
'Returns:
' Boolean, семантика результата:
'   true  - да
'   false - нет
'See Also:
'  ArrayToHex
'  HexToArray
'  IsEqual
'  IsGUID
'  IsSet
'Example:
' dim variable as Boolean
' variable = me.IsHexDigit(<параметры>)
Public Function IsHexDigit(ByVal Ch As String) As Boolean
Attribute IsHexDigit.VB_HelpID = 615
  IsHexDigit = InStr(1, "0123456789abcdef", LCase(Left$(Ch, 1)), vbTextCompare) > 0
End Function

'Преобразовать файл в массив байтов
'Parameters:
'[IN]   path , тип параметра: String  - путь к файлу
'Returns:
'  массив данных
'See Also:
'  ArrayToFile
'  ArrayToHex
'  GetFileExtension2
'  GetImage
'  HexToArray
'  LoadImage
'  StringToFile
'Example:
' dim variable as Variant
' variable = me.FileToArray(<параметры>)
' Set variable = me.FileToArray(<параметры>)
Public Function FileToArray(ByVal path As String)
Attribute FileToArray.VB_HelpID = 585
   Dim i As Long, ff As Integer, lf As Long
   Dim TB() As Byte
   On Error GoTo IconError
    ff = FreeFile
    Open path For Binary As #ff   ' Read into byte array.
    i = 0
    lf = LOF(ff)                     ' Get the file size.
    If lf = 0 Then
      FileToArray = Null
      Exit Function
    End If
    
    ReDim TB(0 To lf - 1) As Byte     ' Resize the array.
    i = 0
    While i <= lf - 1
       Get #ff, , TB(i)             ' Read data into array.
       i = i + 1
    Wend
    Close #ff
    FileToArray = TB

 Exit Function

IconError:
   FileToArray = Null
End Function

'Преобразование массива в файл
'Parameters:
'[IN]   path , тип параметра: String - путь к файлу,
'[IN]   TB , тип параметра: Variant  - массив данных
'Returns:
' Boolean, семантика результата:
'   true  -удача
'   false -ошибка
'See Also:
'  ArrayToHex
'  DoOpenFile
'  EditDocument
'  FileToArray
'  GetFileExtension2
'  GetImage
'  HexToArray
'  LoadImage
'  OpenDocument
'  StringToFile
'Example:
' dim variable as Boolean
' variable = me.ArrayToFile(<параметры>)
Public Function ArrayToFile(ByVal path As String, ByVal TB As Variant) As Boolean
Attribute ArrayToFile.VB_HelpID = 550

   Dim ff As Integer
   Dim i As Long
   On Error GoTo bye
   If Not IsArray(TB) Then Exit Function
   
   ff = FreeFile
'   Open path For Binary As #ff
'
'   For i = LBound(TB) To UBound(TB)
'      Put #ff, , CByte(TB(i))
'   Next i
   
   Open path For Binary Access Write As #ff
   
   Dim kk() As Byte
   kk = TB
   
   
   Put #ff, , kk()
   
   Close #ff
   
   ArrayToFile = True
bye:
   ArrayToFile = False
End Function

'Преобразование массива байтов в шестнадцатиричную строку
'Parameters:
'[IN]   TB , тип параметра: Variant  - массив
'Returns:
'  значение типа String
'See Also:
'  ArrayToFile
'  DoGetTempPath
'  DoOpenFile
'  EditDocument
'  FileToArray
'  GetFileExtension2
'  HexToArray
'  OpenDocument
'  StringToFile
'  StripTerminator
'Example:
' dim variable as String
' variable = me.ArrayToHex(<параметры>)
Public Function ArrayToHex(ByVal TB As Variant) As String
Attribute ArrayToHex.VB_HelpID = 555
   Dim ff As Integer
   Dim i As Long, pos As Long
   Dim s As String
   On Error GoTo bye
   If Not IsArray(TB) Then Exit Function
   s = Space((UBound(TB) - LBound(TB) + 1) * 2)
   pos = 1
   For i = LBound(TB) To UBound(TB)
      Mid(s, pos, 2) = Right("00" & Hex(CByte(TB(i))), 2)
      pos = pos + 2
   Next i
   ArrayToHex = s
bye:
End Function

'Преобразование шестнадцатиричной строки в массив байтов
'Parameters:
'[IN]   hexString , тип параметра: String - шестнадцатиричная строка
'Returns:
'  массив
'  ,или Null
'See Also:
'  ArrayToFile
'  ArrayToHex
'  FileToArray
'  StringToFile
'Example:
' dim variable as Variant
' variable = me.HexToArray(<параметры>)
' Set variable = me.HexToArray(<параметры>)
Public Function HexToArray(ByVal hexString As String)
Attribute HexToArray.VB_HelpID = 600
   Dim i As Long, ff As Integer
   Dim TB() As Byte
   On Error GoTo IconError
    
    ReDim TB(0 To Len(hexString) / 2 - 1) As Byte    ' Resize the array.
    i = 0
    While i < Len(hexString) / 2
       TB(i) = Val("&H" & mID(hexString, i * 2 + 1, 2))
       i = i + 1
    Wend
    
    HexToArray = TB

 Exit Function

IconError:
   HexToArray = Null
   'Resume
   
End Function

'Загрузить картинку в контрол из массива байтов
'Parameters:
'[IN][OUT]  Image , тип параметра: Object - контрол,
'[IN][OUT]   Data , тип параметра: Variant  - массив байтов
'See Also:
'  ArrayToFile
'  ArrayToHex
'  GetImage
'  HexToArray
'  LoadBtnPictures
'  StringToFile
'Example:
'  call me.LoadImage(<параметры>)
Public Sub LoadImage(Image As Object, Data As Variant)
Attribute LoadImage.VB_HelpID = 635
  Dim s As String
  Dim Bytes() As Byte
  On Error Resume Next
  Bytes = Data
  Set Image.Picture = Array2Picture(Bytes)  'GetImage(Data)
End Sub

'Сформировать стандартный интерфейс для работы с картинкой на основе массива байтов
'Parameters:
'[IN][OUT]  Data , тип параметра: Variant  - массив
'Returns:
'  объект класса StdPicture
'  ,или Nothing
'See Also:
'  ArrayToFile
'  ArrayToHex
'  LoadBtnPictures
'  LoadImage
'Example:
' dim variable as StdPicture
' Set variable = me.GetImage(<параметры>)
Public Function GetImage(Data As Variant) As StdPicture
Attribute GetImage.VB_HelpID = 595
  Dim s As String
  On Error Resume Next
  Set GetImage = LoadPicture
  s = App.path & "\" & Replace(Replace(Replace(CreateGUID2(), "-", ""), "{", ""), "}", "")
  ArrayToFile s, Data
  Set GetImage = LoadPicture(s)
  Kill s
End Function

'Записать строку в файл
'Parameters:
'[IN]   path , тип параметра: String - путь к файлу,
'[IN]   s , тип параметра: String  - строка данных
'Returns:
' Boolean, семантика результата:
'   true  - удача
'   false - ошибка
'See Also:
'  ArrayToFile
'  ArrayToHex
'  DoGetTempPath
'  DoOpenFile
'  EditDocument
'  FileToArray
'  GetFileExtension2
'  GetImage
'  HexToArray
'  LoadBtnPictures
'  LoadGridLayout
'  LoadImage
'  OpenDocument
'Example:
' dim variable as Boolean
' variable = me.StringToFile(<параметры>)
Public Function StringToFile(ByVal path As String, ByVal s As String) As Boolean
Attribute StringToFile.VB_HelpID = 675
   Dim ff As Integer
   On Error GoTo bye
   ff = FreeFile
   Open path For Output As #ff
   Print #ff, s
   Close #ff
   StringToFile = True
bye:
   StringToFile = False
End Function

'Открыть файл соответствующим обработчиком
'Parameters:
'[IN][OUT]  TheFile , тип параметра: Variant - данные файла,
'[IN]   fileExt , тип параметра: String  - расширение файла
'Returns:
'  значение типа String
'See Also:
'  ArrayToFile
'  ArrayToHex
'  DoGetTempPath
'  EditDocument
'  FileToArray
'  GetFileExtension2
'  OpenDocument
'Example:
' dim variable as String
' variable = me.DoOpenFile(<параметры>)
Public Function DoOpenFile(TheFile As Variant, ByVal fileExt As String) As String
Attribute DoOpenFile.VB_HelpID = 575
  DoOpenFile = False
  
  Screen.MousePointer = vbHourglass
  On Error Resume Next
  Dim OpenFileName As String
  ' Копирование файла во временный каталог
  Dim TempPath As String
  Dim i As Long
  TempPath = DoGetTempPath
  
  i = 0
  OpenFileName = TempPath & "tmp_0." & fileExt
  Do While Dir(OpenFileName) <> ""
    i = i + 1
    OpenFileName = TempPath & "tmp_" & i & "." & fileExt
  Loop
  
  ArrayToFile OpenFileName, TheFile
   
  
  If OpenDocument(0, OpenFileName) Then
    DoOpenFile = OpenFileName
  Else
    DoOpenFile = ""
    Kill OpenFileName
  End If
  
  Screen.MousePointer = vbDefault
End Function

'Получить строку для временного каталога
'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  DoOpenFile
'  EditDocument
'  GetFileExtension2
'  OpenDocument
'  StopApplication
'  StringToFile
'Example:
' dim variable as String
'  variable = me.DoGetTempPath()
Public Function DoGetTempPath() As String
Attribute DoGetTempPath.VB_HelpID = 570
    Dim strTempPath  As String
    strTempPath = Space(1024)
    Call GetTempPath(1024, strTempPath)
    DoGetTempPath = StripTerminator(strTempPath)
End Function

'Отбросить завершающий 0 у строки
'Parameters:
'[IN]   strString , тип параметра: String  - строка
'Returns:
'  значение типа String
'See Also:
'  CreateGUID2
'  GetFileExtension2
'  GetImage
'  IsEqual
'  IsGUID
'  IsHexDigit
'  IsSet
'  MakeMSSQLDate
'  MakeODBCDate
'Example:
' dim variable as String
' variable = me.StripTerminator(<параметры>)
Public Function StripTerminator(ByVal strString As String) As String
Attribute StripTerminator.VB_HelpID = 680
    Dim intZeroPos As Integer
    intZeroPos = InStr(strString, Chr$(0))
    If intZeroPos > 0 Then
        StripTerminator = Left$(strString, intZeroPos - 1)
    Else
        StripTerminator = strString
    End If
End Function

'Открыть документ используя глагол Open
'Parameters:
'[IN]   hWnd , тип параметра: Long окно,
'[IN]   DocumentPath , тип параметра: String  - путь к файлу
'Returns:
' Boolean, семантика результата:
'   true  - удача
'   false - ошибка
'See Also:
'  DoGetTempPath
'  DoOpenFile
'  EditDocument
'  StopApplication
'Example:
' dim variable as Boolean
' variable = me.OpenDocument(<параметры>)
Public Function OpenDocument(ByVal hWnd As Long, ByVal DocumentPath As String) As Boolean
Attribute OpenDocument.VB_HelpID = 665
On Error GoTo Error_Detected
Dim hInst As Long
Dim lbRes As Long
    OpenDocument = False
    'hWnd = GetDesktopWindow
    hInst = ShellExecute(hWnd, "Open", DocumentPath, 0&, 0&, 5)
    If CheckError(hInst) Then Exit Function
    'hInstance = hInst
    OpenDocument = True
Exit Function
Error_Detected:
    'OpenDocument = False
    'Dim ErrorString As String
    'ErrorString = "OpenDocument - " + Err.Description + ", code = " + CStr(Err.Number)
    'GenerateError App, ErrorString, wmLOGAppType, wmLOGAppLogLevel
    'Err.Clear
End Function

'Открыть файл используя глагол Edit
'Parameters:
'[IN]   hWnd , тип параметра: Long - окно,
'[IN]   DocumentPath , тип параметра: String  - путь к файлу
'Returns:
' Boolean, семантика результата:
'   true  - удача
'   false - ошибка
'See Also:
'  DoOpenFile
'  OpenDocument
'  StopApplication
'Example:
' dim variable as Boolean
' variable = me.EditDocument(<параметры>)
Public Function EditDocument(ByVal hWnd As Long, ByVal DocumentPath As String) As Boolean
Attribute EditDocument.VB_HelpID = 580
On Error GoTo Error_Detected
Dim hInst As Long
Dim lbRes As Long
    EditDocument = False
    'hWnd = GetDesktopWindow
    hInst = ShellExecute(hWnd, "edit", DocumentPath, 0&, 0&, 5)
    If CheckError(hInst) Then Exit Function
    'hInstance = hInst
    EditDocument = True
Exit Function
Error_Detected:
    'OpenDocument = False
    'Dim ErrorString As String
    'ErrorString = "OpenDocument - " + Err.Description + ", code = " + CStr(Err.Number)
    'GenerateError App, ErrorString, wmLOGAppType, wmLOGAppLogLevel
    'Err.Clear
End Function


Private Function CheckError(ByVal hCode As Long) As Boolean
    Select Case hCode
        Case SE0:
            CheckError = True: MsgBox cstrSE0, vbExclamation ' cstrMessageBoxCaption
        Case ERROR_FILE_NOT_FOUND:
            CheckError = True: MsgBox cstrSEERROR_FILE_NOT_FOUND, vbExclamation  ' cstrMessageBoxCaption
        Case ERROR_PATH_NOT_FOUND:
            CheckError = True: MsgBox cstrSEERROR_PATH_NOT_FOUND, vbExclamation '  cstrMessageBoxCaption
        Case ERROR_BAD_FORMAT:
            CheckError = True: MsgBox cstrSEERROR_BAD_FORMAT, vbExclamation ' cstrMessageBoxCaption
        Case SE_ERR_FNF:
            CheckError = True: MsgBox cstrSESE_ERR_FNF, vbExclamation ' cstrMessageBoxCaption
        Case SE_ERR_PNF:
            CheckError = True: MsgBox cstrSESE_ERR_PNF, vbExclamation ' cstrMessageBoxCaption
        Case SE_ERR_ACCESSDENIED:
            CheckError = True: MsgBox cstrSESE_ERR_ACCESSDENIED, vbExclamation ' cstrMessageBoxCaption
        Case SE_ERR_OOM:
            CheckError = True: MsgBox cstrSESE_ERR_OOM, vbExclamation ' cstrMessageBoxCaption
        Case SE_ERR_DLLNOTFOUND:
            CheckError = True: MsgBox cstrSESE_ERR_DLLNOTFOUND, vbExclamation ' cstrMessageBoxCaption
        Case SE_ERR_SHARE:
            CheckError = True: MsgBox cstrSESE_ERR_SHARE, vbExclamation ' cstrMessageBoxCaption
        Case SE_ERR_ASSOCINCOMPLETE:
            CheckError = True: MsgBox cstrSESE_ERR_ASSOCINCOMPLETE, vbExclamation ' cstrMessageBoxCaption
        Case SE_ERR_DDETIMEOUT:
            CheckError = True: MsgBox cstrSESE_ERR_DDETIMEOUT, vbExclamation ' cstrMessageBoxCaption
        Case SE_ERR_DDEFAIL:
            CheckError = True: MsgBox cstrSESE_ERR_DDEFAIL, vbExclamation ' cstrMessageBoxCaption
        Case SE_ERR_DDEBUSY:
            CheckError = True: MsgBox cstrSESE_ERR_DDEBUSY, vbExclamation ' cstrMessageBoxCaption
        Case SE_ERR_NOASSOC:
            CheckError = True: MsgBox cstrSESE_ERR_NOASSOC, vbExclamation ' cstrMessageBoxCaption
        Case Else:
            CheckError = False
    End Select
End Function

'Вернуть расширение файла
'Parameters:
'[IN]   FullName , тип параметра: String - путь к файлу,
'[IN][OUT]   NameWithoutExtension , тип параметра: String  - расширение
'Returns:
'  значение типа String
'See Also:
'  CreateGUID2
'  DoGetTempPath
'  IsEqual
'  IsGUID
'  IsHexDigit
'  IsSet
'  MakeMSSQLDate
'  MakeODBCDate
'  StripTerminator
'Example:
' dim variable as String
' variable = me.GetFileExtension2(<параметры>)
Public Function GetFileExtension2(ByVal FullName As String, Optional ByRef NameWithoutExtension As String) As String
Attribute GetFileExtension2.VB_HelpID = 590
  Dim i As Long
  For i = Len(FullName) To 1 Step -1
    If mID(FullName, i, 1) = "." Then Exit For
  Next i
  If i = 1 Then
    NameWithoutExtension = FullName
    GetFileExtension2 = ""
  Else
    NameWithoutExtension = Left(FullName, i - 1)
    GetFileExtension2 = mID(FullName, i + 1)
  End If
End Function

'Загрузить картинки в контрольный элемент из каталога картинок
'Parameters:
'[IN][OUT]  ctl , тип параметра: Object - контрол,
'[IN]   InitString , тип параметра: String  - название файлов картинки (через ;)
'       Picture;DisabledPicture;DownPicture
'See Also:
'  LoadGridLayout
'  LoadImage
'Example:
'  call me.LoadBtnPictures(<параметры>)
Public Sub LoadBtnPictures(ctl As Object, ByVal InitString As String)
Attribute LoadBtnPictures.VB_HelpID = 625
  Dim mtzpath As String, arr
  mtzpath = GetSetting("MTZ", "CONFIG", "IMAGEPATH", "")
  If mtzpath = "" Then Exit Sub
  If ctl.Tag = "" Then Exit Sub
  On Error Resume Next
  arr = Split(InitString, ";")
  If UBound(arr) >= 0 Then Set ctl.Picture = LoadPicture(mtzpath & arr(0))
  If UBound(arr) >= 1 Then Set ctl.DisabledPicture = LoadPicture(mtzpath & arr(1))
  If UBound(arr) >= 2 Then Set ctl.DownPicture = LoadPicture(mtzpath & arr(2))
End Sub

'Загрузить внешний вид таблицы
'Parameters:
'[IN][OUT]  m_GridEX , тип параметра: Object - Janus Grid,
'[IN]   Name , тип параметра: String = ""  - название файла с установками (без расширения)
'See Also:
'  LoadBtnPictures
'  LoadImage
'Example:
'  call me.LoadGridLayout(<параметры>)
Public Sub LoadGridLayout(m_GridEX As Object, Optional ByVal Name As String = "")
Attribute LoadGridLayout.VB_HelpID = 630
  On Error Resume Next
  Dim s As String
  s = GetSetting("MTZ", "CONFIG", "LAYOUTS", "")
  If s = "" Then Exit Sub
  If Name = "" Then Name = m_GridEX.Name
  Dim cnt As Long
  cnt = m_GridEX.ItemCount
  m_GridEX.LoadLayout s & Name & ".glt"
  m_GridEX.ItemCount = cnt
  m_GridEX.Refresh
  m_GridEX.RefreshSort
  m_GridEX.RefreshGroups
  m_GridEX.CollapseAll
  If m_GridEX.ItemCount > 0 Then
    m_GridEX.Row = 1
  End If
  m_GridEX.CollapseAll
End Sub

'Расширенная проверка равенства двух значений
'Parameters:
'[IN][OUT]  v1 , тип параметра: Variant -первое значение,
'[IN][OUT]   v2 , тип параметра: Variant  - второе
'Returns:
' Boolean, семантика результата:
'   true  - равны
'   false - не равны
'See Also:
'  ArrayToFile
'  ArrayToHex
'  CreateGUID2
'  DoGetTempPath
'  DoOpenFile
'  EditDocument
'  FileToArray
'  GetFileExtension2
'  GetImage
'  HexToArray
'  IsGUID
'  IsHexDigit
'  IsSet
'  LoadBtnPictures
'  LoadGridLayout
'  LoadImage
'  MakeMSSQLDate
'  MakeODBCDate
'  OpenDocument
'  StopApplication
'  StringToFile
'  StripTerminator
'Example:
' dim variable as Boolean
' variable = me.IsEqual(<параметры>)
Public Function IsEqual(v1 As Variant, v2 As Variant) As Boolean
Attribute IsEqual.VB_HelpID = 605
  If IsNull(v1) And IsNull(v2) Then IsEqual = True: Exit Function
  If IsNull(v1) And Not IsNull(v2) Then IsEqual = False: Exit Function
  If Not IsNull(v1) And IsNull(v2) Then IsEqual = False: Exit Function
  If v1 = v2 Then
    IsEqual = True
  Else
    IsEqual = False
  End If
End Function

'Проверка задано ли значение
'Parameters:
'[IN][OUT]  v1 , тип параметра: Variant  - значение
'Returns:
' Boolean, семантика результата:
'   true  - не задано
'   false - задано
'See Also:
'  IsEqual
'  IsGUID
'  IsHexDigit
'Example:
' dim variable as Boolean
' variable = me.IsSet(<параметры>)
Public Function IsSet(v1 As Variant) As Boolean
Attribute IsSet.VB_HelpID = 620
  IsSet = True
  If IsNull(v1) Then IsSet = False
  If IsEmpty(v1) Then IsSet = False
  If VarType(v1) = vbString Then
    If v1 = "" Then
      IsSet = False
    End If
  End If
  If IsObject(v1) Then
    If v1 Is Nothing Then
      IsSet = False
    End If
  End If
End Function

'преобразовать дату в строку формата yyyy-mm-dd hh:mi:ss(24h)
'Parameters:
'[IN]   d , тип параметра: Date  - дата
'Returns:
'  значение типа String
'See Also:
'  ArrayToFile
'  ArrayToHex
'  CreateGUID2
'  DoGetTempPath
'  DoOpenFile
'  EditDocument
'  FileToArray
'  GetFileExtension2
'  GetImage
'  HexToArray
'  IsEqual
'  IsGUID
'  IsHexDigit
'  IsSet
'  LoadBtnPictures
'  LoadGridLayout
'  LoadImage
'  MakeMSSQLDate
'  OpenDocument
'  StopApplication
'  StringToFile
'  StripTerminator
'Example:
' dim variable as String
' variable = me.MakeODBCDate(<параметры>)
Public Function MakeODBCDate(ByVal d As Date) As String
Attribute MakeODBCDate.VB_HelpID = 645
  'yyyy-mm-dd hh:mi:ss(24h)
  Dim s As String
  If IsNull(d) Then
    MakeODBCDate = "NULL"
  Else
    MakeODBCDate = Right("0000" & Year(d), 4) & "-" & Right("00" & Month(d), 2) & "-" & Right("00" & Day(d), 2) & " " & Right("00" & Hour(d), 2) & ":" & Right("00" & Minute(d), 2) & ":" & Right("00" & Second(d), 2)
  End If
End Function

'Преобразование даты для включения в sql запрос
'Parameters:
'[IN]   d , тип параметра: Date  - дата
'Returns:
'  значение типа String
'See Also:
'  MakeODBCDate
'Example:
' dim variable as String
' variable = me.MakeMSSQLDate(<параметры>)
Public Function MakeMSSQLDate(ByVal d As Date) As String
Attribute MakeMSSQLDate.VB_HelpID = 640
  If IsNull(d) Then
    MakeMSSQLDate = "NULL"
  Else
    MakeMSSQLDate = "convert(datetime,'" & MakeODBCDate(d) & "',120)"
  End If
End Function
' преобразовать дату для ORACLE запроса
'Parameters:
'[IN]   d , тип параметра: Date  - дата
'Returns:
'  значение типа String
'See Also:
'  ArrayToFile
'  ArrayToHex
'  CreateGUID2
'  DebugOutput
'  DoGetTempPath
'  DoOpenFile
'  EditDocument
'  FileToArray
'  GetFileExtension2
'  GetImage
'  HexToArray
'  IsEqual
'  IsGUID
'  IsHexDigit
'  IsSet
'  LoadBtnPictures
'  LoadGridLayout
'  LoadImage
'  MakeMSSQLDate
'  MakeODBCDate
'  MTZGetSetting
'  MTZSaveSetting
'  OpenDocument
'  StopApplication
'  StringToFile
'  StripTerminator
'  VerifyLic
'Example:
' dim variable as String
' variable = me.MakeORACLEDate(...параметры...)
Public Function MakeORACLEDate(ByVal d As Date) As String
Attribute MakeORACLEDate.VB_HelpID = 650
  If IsNull(d) Then
     MakeORACLEDate = "NULL"
  Else
     MakeORACLEDate = "to_date('" & MakeODBCDate(d) & "','YYYY-MM-DD HH24:MI:SS')"
  End If
End Function

'Остановить работу приложения
'Parameters:
' параметров нет
'See Also:
'  DoGetTempPath
'  DoOpenFile
'  EditDocument
'  OpenDocument
'Example:
'  call me.StopApplication()
Public Sub StopApplication()
Attribute StopApplication.VB_HelpID = 670
  On Error Resume Next
  TerminateProcess GetCurrentProcess(), 0
End Sub
' записать в глобальный реестр
'Parameters:
'[IN][OUT]  AppName , тип параметра: String -приложение,
'[IN][OUT]   Section , тип параметра: String- секция,
'[IN][OUT]   Key , тип параметра: String- ключ,
'[IN][OUT]   Value , тип параметра: String  - значение
'See Also:
'  ArrayToFile
'  ArrayToHex
'  CreateGUID2
'  DebugOutput
'  DoGetTempPath
'  DoOpenFile
'  EditDocument
'  FileToArray
'  GetFileExtension2
'  GetImage
'  HexToArray
'  IsEqual
'  IsGUID
'  IsHexDigit
'  IsSet
'  LoadBtnPictures
'  LoadGridLayout
'  LoadImage
'  MakeMSSQLDate
'  MakeODBCDate
'  MakeORACLEDate
'  MTZGetSetting
'  OpenDocument
'  StopApplication
'  StringToFile
'  StripTerminator
'  VerifyLic
'Example:
'  call me.MTZSaveSetting(...параметры...)
Public Sub MTZSaveSetting(AppName As String, Section As String, Key As String, Value As String)
Attribute MTZSaveSetting.VB_HelpID = 660
 Dim reg As New regUtil
 On Error Resume Next
 reg.Rights = ReadWrite
 If reg.OpenKey("SOFTWARE\" & AppName & "\" & Section, HKEY_LOCAL_MACHINE, True) Then
  Call reg.SetValue(Key, Value)
 End If
End Sub
' получить параметр из глобального реестра
'Parameters:
'[IN][OUT]  AppName , тип параметра: String - приложение,
'[IN][OUT]   Section , тип параметра: String - секция,
'[IN][OUT]   Key , тип параметра: String- ключ,
'[IN][OUT]   Optional DefaultValue , тип параметра: String  - значение по умолчанию
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'  ,или значение любого скалярного типа
'See Also:
'  ArrayToFile
'  ArrayToHex
'  CreateGUID2
'  DebugOutput
'  DoGetTempPath
'  DoOpenFile
'  EditDocument
'  FileToArray
'  GetFileExtension2
'  GetImage
'  HexToArray
'  IsEqual
'  IsGUID
'  IsHexDigit
'  IsSet
'  LoadBtnPictures
'  LoadGridLayout
'  LoadImage
'  MakeMSSQLDate
'  MakeODBCDate
'  MakeORACLEDate
'  MTZSaveSetting
'  OpenDocument
'  StopApplication
'  StringToFile
'  StripTerminator
'  VerifyLic
'Example:
' dim variable as Variant
' variable = me.MTZGetSetting(...параметры...)
' Set variable = me.MTZGetSetting(...параметры...)
Public Function MTZGetSetting(AppName As String, Section As String, Key As String, Optional DefaultValue As String)
Attribute MTZGetSetting.VB_HelpID = 655
 
 Dim reg As New regUtil
 Dim v As String
 On Error Resume Next
 
 MTZGetSetting = ""
 
 
 reg.Rights = ReadOnly
 If reg.OpenKey("SOFTWARE\" & AppName & "\" & Section, HKEY_LOCAL_MACHINE, False) Then
  v = reg.GetValue(Key)
  MTZGetSetting = v
 End If
 If MTZGetSetting = "" Then
    If Not IsMissing(DefaultValue) Then
       MTZGetSetting = DefaultValue
    End If
 End If
End Function
'отладочная печать
'Parameters:
'[IN]   s , тип параметра: String - собщение,
'[IN][OUT]   Optional msgclass , тип параметра: String = "DBG"  - ...
'See Also:
'  ArrayToFile
'  ArrayToHex
'  CreateGUID2
'  DoGetTempPath
'  DoOpenFile
'  EditDocument
'  FileToArray
'  GetFileExtension2
'  GetImage
'  HexToArray
'  IsEqual
'  IsGUID
'  IsHexDigit
'  IsSet
'  LoadBtnPictures
'  LoadGridLayout
'  LoadImage
'  MakeMSSQLDate
'  MakeODBCDate
'  MakeORACLEDate
'  MTZGetSetting
'  MTZSaveSetting
'  OpenDocument
'  StopApplication
'  StringToFile
'  StripTerminator
'  VerifyLic
'Example:
'  call me.DebugOutput(...параметры...)
Public Sub DebugOutput(ByVal s As String, Optional msgclass As String = "DBG")
Attribute DebugOutput.VB_HelpID = 565
Dim s1 As String
s1 = Now & " " & msgclass & ": " & s & Chr(0)
OutputDebugString s1
End Sub
' проверка лицензии
'Parameters:
'[IN]   ss , тип параметра: String  - данные
'Returns:
' Boolean, семантика результата:
'   true  - проверена
'   false -
'See Also:
'  ArrayToFile
'  ArrayToHex
'  CreateGUID2
'  DebugOutput
'  DoGetTempPath
'  DoOpenFile
'  EditDocument
'  FileToArray
'  GetFileExtension2
'  GetImage
'  HexToArray
'  IsEqual
'  IsGUID
'  IsHexDigit
'  IsSet
'  LoadBtnPictures
'  LoadGridLayout
'  LoadImage
'  MakeMSSQLDate
'  MakeODBCDate
'  MakeORACLEDate
'  MTZGetSetting
'  MTZSaveSetting
'  OpenDocument
'  StopApplication
'  StringToFile
'  StripTerminator
'Example:
' dim variable as Boolean
' variable = me.VerifyLic(...параметры...)
Public Function VerifyLic(ByVal ss As String) As Boolean
Attribute VerifyLic.VB_HelpID = 685
  Dim r As Long
  Dim i As Long, top As Long
  r = GetR(ss)
  top = CLng(Sqr(Abs(r))) + 1
   
  If (r = 1) Or (r = 2) Then
    VerifyLic = False
    Exit Function
  End If
  If (r Mod 2 = 0) Then
    VerifyLic = False
    Exit Function
  End If
  i = 3
  While i <= top
  
    If r Mod i = 0 Then
      VerifyLic = False
      Exit Function
    End If
    i = i + 2
  Wend
  VerifyLic = True
End Function

Private Function GetR(ByVal s As String) As Long
  Dim r As Long
  r = 0
  r = Val("&H" & mID(s, 2, 2)) + Val("&H" & mID(s, 4, 2)) + Val("&H" & mID(s, 6, 2)) + Val("&H" & mID(s, 6, 2))
  r = r + Val("&H" & mID(s, 11, 4)) + Val("&H" & mID(s, 16, 4)) + Val("&H" & mID(s, 21, 4))
  r = r + Val("&H" & mID(s, 26, 2)) + Val("&H" & mID(s, 28, 2)) + Val("&H" & mID(s, 30, 2)) + Val("&H" & mID(s, 32, 2)) + Val("&H" & mID(s, 34, 2)) + Val("&H" & mID(s, 36, 2))
  GetR = Abs(r)
End Function



 'Parameters : a string
  'Return : * a string which give the bar code when it is dispayed with code128.TTF font
  '         * an empty string if the supplied parameter is no good

Public Function Code128(StringToCode As String) As String
  
 
  Dim i As Long, checksum As Long, mini As Long, dummy As Long, tableB As Boolean
  Code128 = ""
  If Len(StringToCode) > 0 Then
 
  'Check for valid characters
    For i = 1 To Len(StringToCode)
      Select Case Asc(mID(StringToCode, i, 1))
      Case 32 To 126, 198
      Case Else
        i = 0
        Exit For
      End Select
    Next
    'Calculation of the code string with optimized use of tables B and C
    Code128 = ""
    tableB = True
    If i > 0 Then
      i = 1 ' i become the string index
      Do While i <= Len(StringToCode)
        If tableB Then
          ' See if interesting to switch to table C
          ' yes for 4 digits at start or end, else if 6 digits
          mini = IIf(i = 1 Or i + 3 = Len(StringToCode), 4, 6)
          GoSub testnum
          If mini < 0 Then ' Choice of table C
            If i = 1 Then ' Starting with table C
              Code128 = Chr(205)
            Else 'Switch to table C
              Code128 = Code128 & Chr(199)
            End If
            tableB = False
          Else
            If i = 1 Then Code128 = Chr(204) ' Starting with table B
          End If
        End If
        If Not tableB Then
          ' We are on table C, try to process 2 digits
          mini = 2
          GoSub testnum
          If mini < 0 Then ' OK for 2 digits, process it
            dummy = Round(mID(StringToCode, i, 2))
            dummy = IIf(dummy < 95, dummy + 32, dummy + 100)
            Code128 = Code128 & Chr(dummy)
            i = i + 2
          Else ' We haven't 2 digits, switch to table B
            Code128 = Code128 & Chr(200)
            tableB = True
          End If
        End If
        If tableB Then
          ' Process 1 digit with table B
          Code128 = Code128 & mID(StringToCode, i, 1)
          i = i + 1
        End If
      Loop
      ' Calculation of the checksum
      For i = 1 To Len(Code128)
        dummy = Asc(mID(Code128, i, 1))
        dummy = IIf(dummy < 127, dummy - 32, dummy - 100)
        If i = 1 Then checksum = dummy
        checksum = (checksum + (i - 1) * dummy) Mod 103
      Next
      ' Calculation of the checksum ASCII code
      checksum = IIf(checksum < 95, checksum + 32, checksum + 100)
      ' Add the checksum and the STOP
      Code128 = Code128 & Chr(checksum) & Chr(206)
    End If
  End If
  Exit Function
testnum:
  
  'if the mini characters from i are numeric, then mini=0
  mini = mini - 1
  If i + mini <= Len(StringToCode) Then
    Do While mini >= 0
      If Asc(mID(StringToCode, i + mini, 1)) < 48 Or Asc(mID(StringToCode, i + mini, 1)) > 57 Then Exit Do
      mini = mini - 1
    Loop
  End If
Return
End Function
