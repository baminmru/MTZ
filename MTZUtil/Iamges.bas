Attribute VB_Name = "IamgesFiles"
Attribute VB_HelpID = 135
Private Type PictureHeader
   Magic As Long
   Size As Long
End Type
Private Declare Function CreateStreamOnHGlobal Lib "ole32" ( _
   ByVal hGlobal As Long, _
   ByVal fDeleteOnRelease As Long, _
   ppstm As IStream) As Long

Private Declare Function GetHGlobalFromStream Lib "ole32" ( _
  ByVal pstm As IStream, _
  phglobal As Long) As Long

Private Declare Function GlobalSize Lib "kernel32" ( _
  ByVal hMem As Long) As Long

Private Declare Function GlobalLock Lib "kernel32" ( _
  ByVal hMem As Long) As Long

Private Declare Function GlobalUnlock Lib "kernel32" ( _
  ByVal hMem As Long) As Long

Private Declare Function GlobalAlloc Lib "kernel32" ( _
  ByVal wFlags As Long, _
  ByVal dwBytes As Long) As Long

Const S_OK = 0
Const PictureID = &H746C&

' Global Memory Flags
Const GMEM_MOVEABLE = &H2
Const GMEM_ZEROINIT = &H40
Const GHND = (GMEM_MOVEABLE Or GMEM_ZEROINIT)

'
' Array2Picture
'
' Converts a byte array (which contains a valid picture) to a
' Picture object.
'
'Parameters:
' параметров нет
'Returns:
'  объект класса Byte) As StdPicture
'  ,или Nothing
'See Also:
'  FileFromADOFieldLoad
'  FileFromADOFieldSave
'  Picture2Array
'Example:
' dim variable as Byte) As StdPicture
' Set variable = me.Array2Picture()
Public Function Array2Picture(aBytes() As Byte) As StdPicture
Attribute Array2Picture.VB_HelpID = 140
Dim oIPS As IPersistStream
Dim oStream As IStream, hGlobal As Long, lPtr As Long
Dim lSize As Long, Hdr As PictureHeader
Dim lRes As Long

   ' Create a new empty
   ' picture object
   Set Array2Picture = New StdPicture
   
   ' Get the IPersistStream interface
   Set oIPS = Array2Picture
   
   ' Calculate the array size
   lSize = UBound(aBytes) - LBound(aBytes) + 1
   
   ' Allocate global memory
   hGlobal = GlobalAlloc(GHND, lSize + Len(Hdr))
   
   If hGlobal Then
   
      ' Get a pointer to the memory
      lPtr = GlobalLock(hGlobal)
      
      ' Initialize the header
      Hdr.Magic = PictureID
      Hdr.Size = lSize
      
      ' Write the header
      MoveMemory ByVal lPtr, Hdr, Len(Hdr)
      
      ' Copy the byte array to
      ' the global memory
      MoveMemory ByVal lPtr + Len(Hdr), aBytes(0), lSize
      
      ' Release the pointer
      GlobalUnlock hGlobal
      
      ' Create a IStream object
      ' with the global memory
      lRes = CreateStreamOnHGlobal(hGlobal, True, oStream)
   
      If lRes = S_OK Then
   
         ' Load the picture
         ' from the stream
         oIPS.Load oStream
               
      End If
      
      ' Release the IStream
      ' object
      Set oStream = Nothing
   
   End If

End Function
'картинка преобразуется в массив
'Parameters:
' параметры
'oObj  - картинка
'aBytes - массив
'See Also:
'  Array2Picture
'  FileFromADOFieldLoad
'  FileFromADOFieldSave
'Example:
'  call me.Picture2Array()
Public Sub Picture2Array(ByVal oObj As StdPicture, aBytes() As Byte)
Attribute Picture2Array.VB_HelpID = 155
Dim oIPS As IPersistStream
Dim oStream As IStream, hGlobal As Long, lPtr As Long
Dim lSize As Long, Hdr As PictureHeader
Dim lRes As Long

   ' Get the IPersistStream interface
   Set oIPS = oObj
   
   ' Create a IStream object
   ' on global memory
   lRes = CreateStreamOnHGlobal(0, True, oStream)
   
   If lRes = S_OK Then
   
      ' Save the picture in the stream
      oIPS.Save oStream, True
      
      ' Get the global memory handle
      ' from the stream
      If GetHGlobalFromStream(oStream, hGlobal) = S_OK Then
      
         ' Get the memory size
         lSize = GlobalSize(hGlobal)
         
         ' Get a pointer to the memory
         lPtr = GlobalLock(hGlobal)
         
         If lPtr Then
         
            lSize = lSize - Len(Hdr)
            
            ' Redim the array
            ReDim aBytes(0 To lSize - 1)
                                             
         
            ' Copy the data to the array
            MoveMemory aBytes(0), ByVal lPtr + Len(Hdr), lSize
         
         End If
         
         ' Release the pointer
         GlobalUnlock hGlobal
         
      End If
      
      ' Release the IStream
      ' object
      Set oStream = Nothing
   
   End If

End Sub

'========================================================
' Назначение:
'       Извлечение файла из указанного поля таблицы
' Аргументы:
'       путь к файлу (куда надо сохранять)
'       набор записей (открытый в любом режиме. Указатель уже стоит на нужной записи)
'       имя поля для извлечения из него файла
'       если файл, бывший до этого с таким же названием нужно удалять (по умолчанию - да)
' Автор: nibbles
' ===========================================================
'Parameters:
' параметров нет
'See Also:
'  Array2Picture
'  FileFromADOFieldSave
'  Picture2Array
'Example:
'  call me.FileFromADOFieldLoad(...параметры...)
Public Sub FileFromADOFieldLoad(ByVal strPath As String, _
                                ByRef rst As ADODB.Recordset, _
                                ByVal strField As String, _
                                Optional IsOverwrite As Boolean = True)
Attribute FileFromADOFieldLoad.VB_HelpID = 145
Dim myStream    As New ADODB.Stream
Dim FSys        As Object 'New Scripting.FileSystemObject
    Set FSys = CreateObject("Scripting.FileSystemObject")
    ' Удалить файл, если он был до этого...
    If IsOverwrite Then
        If FSys.FileExists(strPath) Then
            FSys.DeleteFile strPath, False
        End If
    End If

    Set myStream = New ADODB.Stream
    myStream.Type = adTypeBinary
    myStream.Open
    myStream.Write rst(strField).Value
    myStream.SaveToFile strPath
    myStream.Close
    Set myStream = Nothing
    
End Sub

'==========================================================
' Назначение:
'       Сохранение файла в указанное поле таблицы
' Аргументы:
'       путь к файлу
'       набор записей (открытый для R/W. Указатель должен стоять на нужной записи)
'       имя поля для записи в него файла
' Автор: nibbles
' ==========================================================
'Parameters:
' параметров нет
'See Also:
'  Array2Picture
'  FileFromADOFieldLoad
'  Picture2Array
'Example:
'  call me.FileFromADOFieldSave(...параметры...)
Public Sub FileFromADOFieldSave(ByVal strPath As String, _
                                ByRef rst As ADODB.Recordset, _
                                ByVal strField As String)
Attribute FileFromADOFieldSave.VB_HelpID = 150
Dim myStream As New ADODB.Stream
    
    Set myStream = New ADODB.Stream
    myStream.Type = adTypeBinary
    myStream.Open
    myStream.LoadFromFile strPath
    rst(strField).Value = myStream.Read
    myStream.Close
    Set myStream = Nothing
    
End Sub




