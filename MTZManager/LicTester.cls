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
Attribute VB_HelpID = 500
Option Explicit

Public Enum LicType
    LTWrongKey = 0
    LTDemoKey = 1
    LTWorkKey = 2
    LTBadFormat = -1
End Enum


Private Function VerifyLic(ByVal r As Long) As Boolean
  Dim i As Long, top As Long
  Dim lvl As Long
  top = CLng(Sqr(Abs(r))) + 1
  lvl = (top + 1) / 2
  If r = 0 Then
    VerifyLic = False
    Exit Function
  End If
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
        If i < lvl Then
             VerifyLic = False
        Exit Function
        End If
      VerifyLic = False
      Exit Function
    End If
    i = i + 2
  Wend
  VerifyLic = True
  Debug.Print r
End Function


Private Function VerifyDemoLic(ByVal r As Long) As Boolean
  Dim i As Long, top As Long
  Dim lvl As Long
   
  If Not VerifyLic(r) Then
    If r = 0 Then
      VerifyDemoLic = False
      Exit Function
    End If
    If (r = 1) Or (r = 2) Then
      VerifyDemoLic = False
      Exit Function
    End If
    If (r Mod 2 = 0) Then
      VerifyDemoLic = False
      Exit Function
    End If
    top = CLng(Sqr(Abs(r))) + 1
    lvl = (top + 1) / 2
  
    i = 3
    While i <= top
    
      If r Mod i = 0 Then
        If Not AlllowForDemo(i) Then
            VerifyDemoLic = False
            Exit Function
        End If
      End If
      i = i + 2
    Wend
    VerifyDemoLic = True
  End If
  
End Function



Private Function VerifyWorkLic(ByVal r As Long) As Boolean
  Dim i As Long, top As Long
  Dim lvl As Long
   
  If Not VerifyLic(r) Then
    If r = 0 Then
      VerifyWorkLic = False
      Exit Function
    End If
    If (r = 1) Or (r = 2) Then
      VerifyWorkLic = False
      Exit Function
    End If
    If (r Mod 2 = 0) Then
      VerifyWorkLic = False
      Exit Function
    End If
    top = CLng(Sqr(Abs(r))) + 1
    lvl = (top + 1) / 2
  
    i = 3
    While i <= top
    
      If r Mod i = 0 Then
        If Not AlllowForWork(i) Then
            Exit Function
        End If
      End If
      i = i + 2
    Wend
    VerifyWorkLic = True
  End If
  
End Function

Private Function AlllowForDemo(ByVal d As Long) As Boolean
    Dim r As Boolean
    Select Case d
        Case 11, 21, 31, 41, 61, 71, 91, 101
        r = True
        
        Case Else
        r = False
    End Select
    AlllowForDemo = r
End Function

Private Function AlllowForWork(ByVal d As Long) As Boolean
    Dim r As Boolean
    Select Case d
        Case 13, 23, 43, 53, 73, 83, 103, 113
        r = True
        
        Case Else
        r = False
    End Select
    AlllowForWork = r
End Function

Private Function GetR(ByVal s As String) As Long
  Dim r As Single
  r = 0
  
  If IsSame(Mid(s, 2, 4)) Or IsSame(Mid(s, 6, 4)) Or IsSame(Mid(s, 11, 4)) Or IsSame(Mid(s, 16, 4)) Or _
   IsSame(Mid(s, 21, 4)) Or IsSame(Mid(s, 26, 4)) Or IsSame(Mid(s, 30, 4)) Or IsSame(Mid(s, 34, 4)) Then
   GetR = 0
   Exit Function
  End If
  r = Abs(Val("&H" & Mid(s, 2, 4))) * 3 + Abs(Val("&H" & Mid(s, 6, 4))) * 5
  r = r + Abs(Val("&H" & Mid(s, 11, 4))) * 7 + Abs(Val("&H" & Mid(s, 16, 4))) * 11
  r = r + Abs(Val("&H" & Mid(s, 21, 4))) * 13 + Abs(Val("&H" & Mid(s, 26, 4))) * 17
  r = r + Abs(Val("&H" & Mid(s, 30, 4))) * 19 + Abs(Val("&H" & Mid(s, 34, 4))) * 23
  
  GetR = CLng(r) 'Mod 99999999
End Function

Private Function IsSame(ByVal s As String) As Boolean
    Dim i As Integer
    If Len(s) = 1 Then
        IsSame = True
        Exit Function
    End If
    For i = 2 To Len(s)
        If Mid(s, i, 1) = Mid(s, 1, 1) Then
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
Attribute TestLicense.VB_HelpID = 505
Dim s As String
Dim iii As String
s = ""
    If Left(LicCode, 1) <> "{" And Right(LicCode, 1) <> "}" Then
        iii = "{" & LicCode & "}"
    Else
        iii = LicCode
    End If
    If IsGUID(iii) Then
        If VerifyWorkLic(GetR(iii)) Then
         TestLicense = LTWorkKey
        ElseIf VerifyDemoLic(GetR(iii)) Then
          TestLicense = LTDemoKey
        Else
          TestLicense = LTWrongKey
        End If
        
    Else
       TestLicense = LTBadFormat
    End If
    
End Function

