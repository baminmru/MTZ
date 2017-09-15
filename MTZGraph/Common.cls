VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Common"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Private Declare Function CoCreateGuid Lib "OLE32.DLL" (pGUID As GUID) As Long
Private Declare Function StringFromGUID2 Lib "OLE32.DLL" (pGUID As GUID, ByVal S As String, ByVal sz As Long) As Long
Private Type GUID
   Data1 As Long
   Data2 As Integer
   Data3 As Integer
   Data4(7) As Byte
End Type




Public Function CreateGUID2() As String

 On Error GoTo bye
 Dim g As GUID, S As String * 80, i As Long, j As Long
 Dim lpBuf As Long, out As String
 
 S = Space(80) & Chr(0)
 
 CoCreateGuid g
 i = StringFromGUID2(g, S, 80)
 
  For j = 1 To 38
    out = out & Mid(S, j * 2 - 1, 1)
  Next
  CreateGUID2 = out
bye:
End Function


Public Function IsGUID(ByVal sGUID As String) As Boolean
      Dim i As Integer
      Dim code As String
      Dim Proto As String
      
      If Len(sGUID) <> 38 Then
          IsGUID = False
          Exit Function
      End If
      
      Proto = "{hhhhhhhh-hhhh-hhhh-hhhh-hhhhhhhhhhhh}"
      For i = 1 To 38
        code = Mid(Proto, i, 1)
        If code = "h" Then
             code = Mid(sGUID, i, 1)
             
             If Not IsHexDigit(code) Then
                  IsGUID = False
                  Exit Function
              End If
        
        Else
         If code <> Mid(sGUID, i, 1) Then
            IsGUID = False
            Exit Function
         End If
        End If
      Next
      IsGUID = True
  End Function


Public Function IsHexDigit(ByVal Ch As String) As Boolean
  IsHexDigit = InStr(1, "0123456789abcdef", LCase(Left$(Ch, 1)), vbTextCompare) > 0
End Function



Public Function FileToArray(ByVal path As String)
   Dim i As Long, ff As Integer
   Dim TB() As Byte
   On Error GoTo IconError
    ff = FreeFile
    Open path For Binary As #ff   ' Read into byte array.
    i = 0
    i = LOF(ff)                     ' Get the file size.
    ReDim TB(i + 1) As Byte        ' Resize the array.
    i = 0
    Do Until EOF(ff)
       Get #ff, , TB(i)             ' Read data into array.
       i = i + 1
    Loop
    Close #ff
    FileToArray = TB

 Exit Function

IconError:
   FileToArray = Null
End Function


Public Function ArrayToFile(ByVal path As String, ByVal TB As Variant) As Boolean

   Dim ff As Integer
   Dim i As Long
   On Error GoTo bye
   If Not IsArray(TB) Then Exit Function
   
   ff = FreeFile
   Open path For Binary As #ff

   For i = LBound(TB) To UBound(TB)
      Put #ff, , CByte(TB(i))
   Next i
   Close #ff
   ArrayToFile = True
bye:
   ArrayToFile = False
End Function


Public Sub LoadImage(Image As Object, Data As Variant)
  Dim S As String
  On Error Resume Next
  Set Image.Picture = GetImage(Data)
End Sub


Public Function GetImage(Data As Variant) As StdPicture
  Dim S As String
  On Error Resume Next
  Set GetImage = LoadPicture
  S = App.path & "\" & Replace(Replace(Replace(Util.CreateGUID2(), "-", ""), "{", ""), "}", "")
  ArrayToFile S, Data
  Set GetImage = LoadPicture(S)
  Kill S
End Function


Public Function StringToFile(ByVal path As String, ByVal S As String) As Boolean
   Dim ff As Integer
   On Error GoTo bye
   ff = FreeFile
   Open path For Output As #ff
   Print #ff, S
   Close #ff
   StringToFile = True
bye:
   StringToFile = False
End Function


