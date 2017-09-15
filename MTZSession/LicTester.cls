VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "LicTester"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_HelpID = 150
Option Explicit

Public Enum LicType
    LTWrongKey = 0
    LTDemoKey = 1
    LTWorkKey = 2
    LTBadFormat = -1
End Enum

Private Const LICCODER As String = "QWERTYUIPSDFGHJK"


Private Function VerifyLic(ByVal R As Long) As Boolean
  Dim I As Long, top As Long
  Dim lvl As Long
  top = CLng(Sqr(Abs(R))) + 1
 
  If R = 0 Then
    VerifyLic = False
    Exit Function
  End If
  If (R = 1) Or (R = 2) Then
    VerifyLic = False
    Exit Function
  End If
  If (R Mod 2 = 0) Then
    VerifyLic = False
    Exit Function
  End If
  I = 3
  While I <= top
  
    If R Mod I = 0 Then
      VerifyLic = False
      Exit Function
    End If
    I = I + 2
  Wend
  VerifyLic = True
  Debug.Print R
End Function


Private Function VerifyDemoLic(ByVal R As Long) As Boolean
  Dim I As Long, top As Long
 
   
  If Not VerifyLic(R) Then
    If R = 0 Then
      VerifyDemoLic = False
      Exit Function
    End If
    If (R = 1) Or (R = 2) Then
      VerifyDemoLic = False
      Exit Function
    End If
    If (R Mod 2 = 0) Then
      VerifyDemoLic = False
      Exit Function
    End If
    top = CLng(Sqr(Abs(R))) + 1

  
    I = 3
    While I <= top
    
      If R Mod I = 0 Then
        If Not AlllowForDemo(I) Then
            VerifyDemoLic = False
            Exit Function
        End If
      End If
      I = I + 2
    Wend
    VerifyDemoLic = True
  End If
  
End Function



Private Function VerifyWorkLic(ByVal R As Long) As Boolean
  Dim I As Long, top As Long

  If Not VerifyLic(R) Then
    If R = 0 Then
      VerifyWorkLic = False
      Exit Function
    End If
    If (R = 1) Or (R = 2) Then
      VerifyWorkLic = False
      Exit Function
    End If
    If (R Mod 2 = 0) Then
      VerifyWorkLic = False
      Exit Function
    End If
    top = CLng(Sqr(Abs(R))) + 1

  
    I = 3
    While I <= top
    
      If R Mod I = 0 Then
        If Not AlllowForWork(I) Then
            Exit Function
        End If
      End If
      I = I + 2
    Wend
    VerifyWorkLic = True
  End If
  
End Function

Private Function AlllowForDemo(ByVal d As Long) As Boolean
    Dim R As Boolean
    Select Case d
        Case 11, 21, 31, 41, 61, 71, 91, 101
        R = True
        
        Case Else
        R = False
    End Select
    AlllowForDemo = R
End Function

Private Function AlllowForWork(ByVal d As Long) As Boolean
    Dim R As Boolean
    Select Case d
        Case 13, 23, 43, 53, 73, 83, 103, 113
        R = True
        
        Case Else
        R = False
    End Select
    AlllowForWork = R
End Function

Private Function GetR(ByVal s As String) As Long
  Dim R As Single
  R = 0
  
  If IsSame(Mid(s, 2, 4)) Or IsSame(Mid(s, 6, 4)) Or IsSame(Mid(s, 11, 4)) Or IsSame(Mid(s, 16, 4)) Or _
   IsSame(Mid(s, 21, 4)) Or IsSame(Mid(s, 26, 4)) Or IsSame(Mid(s, 30, 4)) Or IsSame(Mid(s, 34, 4)) Then
   GetR = 0
   Exit Function
  End If
  R = Abs(Val("&H" & Mid(s, 2, 4))) * 3 + Abs(Val("&H" & Mid(s, 6, 4))) * 5
  R = R + Abs(Val("&H" & Mid(s, 11, 4))) * 7 + Abs(Val("&H" & Mid(s, 16, 4))) * 11
  R = R + Abs(Val("&H" & Mid(s, 21, 4))) * 13 + Abs(Val("&H" & Mid(s, 26, 4))) * 17
  R = R + Abs(Val("&H" & Mid(s, 30, 4))) * 19 + Abs(Val("&H" & Mid(s, 34, 4))) * 23
  
  GetR = CLng(R) 'Mod 99999999
End Function

Private Function IsSame(ByVal s As String) As Boolean
    Dim I As Integer
    If Len(s) = 1 Then
        IsSame = True
        Exit Function
    End If
    For I = 2 To Len(s)
        If Mid(s, I, 1) = Mid(s, 1, 1) Then
         IsSame = True
        Exit Function
        End If
    Next
    IsSame = False
End Function

'Parameters:
'[IN]   LicCode , тип параметра: String  - ...
'Returns:
'  объект класса LicType
'  ,или Nothing
'Example:
' dim variable as LicType
' Set variable = me.TestLicense(...параметры...)
Public Function TestLicense(ByVal LicCode As String) As LicType
Attribute TestLicense.VB_HelpID = 155
    Dim s As String
    Dim iii As String
    Dim LLic As String
    Dim RLic As String

    If Len(LicCode) <> 77 Then
        TestLicense = LTBadFormat
        Exit Function
    End If
    LLic = Left(LicCode, 38)
    RLic = Right(LicCode, 39)
    RLic = LIC2GUID(RLic)

    If Not IsGUID(LLic) Then
        TestLicense = LTBadFormat
        Exit Function
    End If
    
    
    If Not IsGUID(RLic) Then
        TestLicense = LTBadFormat
        Exit Function
    End If
    
    
    
    
    If VerifyWorkLic(GetR(LLic) * 7 + GetR(RLic)) Then
     TestLicense = LTWorkKey
    ElseIf VerifyDemoLic(GetR(LLic) * 7 + GetR(RLic)) Then
      TestLicense = LTDemoKey
    Else
      TestLicense = LTWrongKey
    End If
        
    
End Function


Private Function GUID2LIC(ByVal guid As String) As String

  Dim v(1 To 8) As Long, s(1 To 8) As String
 
  

  v(1) = (Val("&H" & Mid(guid, 2, 4)))
  v(2) = (Val("&H" & Mid(guid, 6, 4)))
  v(3) = (Val("&H" & Mid(guid, 11, 4)))
  v(4) = (Val("&H" & Mid(guid, 16, 4)))
  v(5) = (Val("&H" & Mid(guid, 21, 4)))
  v(6) = (Val("&H" & Mid(guid, 26, 4)))
  v(7) = (Val("&H" & Mid(guid, 30, 4)))
  v(8) = (Val("&H" & Mid(guid, 34, 4)))
  s(1) = MapV2S(v(1))
  s(2) = MapV2S(v(2))
  s(3) = MapV2S(v(3))
  s(4) = MapV2S(v(4))
  s(5) = MapV2S(v(5))
  s(6) = MapV2S(v(6))
  s(7) = MapV2S(v(7))
  s(8) = MapV2S(v(8))
 
  
  
  GUID2LIC = s(1) & "-" & s(2) & "-" & s(3) & "-" & s(4) & "-" & s(5) & "-" & s(6) & "-" & s(7) & "-" & s(8)
End Function


Private Function MapV2S(ByVal v As Long) As String
 Dim dd As Long, s As String, rr As Long, v1 As Long
 dd = Len(LICCODER)
 s = ""
 If v < 0 Then
    v1 = 65536 + v
 Else
    v1 = v
 End If
 While v1 > 0
 rr = v1 Mod dd
 s = s & Mid(LICCODER, rr + 1, 1)
 v1 = v1 \ dd
 Wend
 s = Left(s & "AAAA", 4)
 MapV2S = s
End Function

Private Function MapS2V(ByVal s As String) As Long
 Dim dd As Long, v As Long, rr As Long, s1 As String, I As Long, j As Long
 dd = Len(LICCODER)
 v = 0
 s1 = s
 s1 = Replace(s1, "A", "")
 For j = Len(s1) To 1 Step -1
    For I = 1 To dd
     If Mid(s1, j, 1) = Mid(LICCODER, I, 1) Then
      v = v * dd + (I - 1)
      Exit For
     End If
    Next
 Next
 
 MapS2V = v
End Function

Private Function Hex4(ByVal s As Long) As String
    Dim s1 As String
    s1 = Hex(s)
    s1 = Right("0000" & s1, 4)
    Hex4 = s1
End Function

Private Function LIC2GUID(ByVal lic As String) As String
  Dim v(1 To 8) As Long, s() As String
 
  s = Split(lic, "-")

  
  v(1) = MapS2V(s(0))
  v(2) = MapS2V(s(1))
  v(3) = MapS2V(s(2))
  v(4) = MapS2V(s(3))
  v(5) = MapS2V(s(4))
  v(6) = MapS2V(s(5))
  v(7) = MapS2V(s(6))
  v(8) = MapS2V(s(7))
  
 
  LIC2GUID = "{" & Hex4(v(1)) & Hex4(v(2)) & "-" & Hex4(v(3)) & "-" & Hex4(v(4)) & "-" & Hex4(v(5)) & "-" & Hex4(v(6)) & Hex4(v(7)) & Hex4(v(8)) & "}"
End Function

