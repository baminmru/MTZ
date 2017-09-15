VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Генератор лицензий"
   ClientHeight    =   6030
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8760
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6030
   ScaleWidth      =   8760
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text2 
      Height          =   405
      Left            =   120
      TabIndex        =   13
      Text            =   "100"
      Top             =   1560
      Width           =   4335
   End
   Begin VB.TextBox txt2V 
      Height          =   495
      Left            =   4680
      TabIndex        =   12
      Top             =   1680
      Visible         =   0   'False
      Width           =   1575
   End
   Begin VB.TextBox txtV2 
      Height          =   495
      Left            =   4680
      TabIndex        =   11
      Top             =   480
      Visible         =   0   'False
      Width           =   1575
   End
   Begin VB.TextBox txtS 
      Height          =   495
      Left            =   4680
      TabIndex        =   10
      Top             =   1080
      Visible         =   0   'False
      Width           =   1575
   End
   Begin VB.CommandButton Command6 
      Caption         =   "S2V"
      Height          =   495
      Left            =   6480
      TabIndex        =   9
      Top             =   1440
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.CommandButton Command5 
      Caption         =   "V2S"
      Height          =   495
      Left            =   6480
      TabIndex        =   8
      Top             =   840
      Visible         =   0   'False
      Width           =   1815
   End
   Begin VB.TextBox txtARMID 
      Height          =   495
      Left            =   120
      TabIndex        =   7
      Text            =   "{00000000-0000-0000-0000-000000000000}"
      Top             =   600
      Width           =   4335
   End
   Begin VB.CommandButton Command4 
      Caption         =   "случайный номер+test"
      Height          =   375
      Left            =   2160
      TabIndex        =   5
      Top             =   3480
      Width           =   2055
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Test"
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   3480
      Width           =   1815
   End
   Begin VB.TextBox txtTest 
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   3000
      Width           =   4215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Демо ключи"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   2520
      Width           =   4335
   End
   Begin VB.TextBox Text1 
      Height          =   1965
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Top             =   3960
      Width           =   8355
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Стандартные ключи"
      Height          =   420
      Left            =   120
      TabIndex        =   0
      Top             =   2040
      Width           =   4305
   End
   Begin VB.Label Label2 
      Caption         =   "Число лицензионных кодов"
      Height          =   375
      Left            =   120
      TabIndex        =   14
      Top             =   1200
      Width           =   2415
   End
   Begin VB.Label Label1 
      Caption         =   "ARMID"
      Height          =   375
      Left            =   120
      TabIndex        =   6
      Top             =   240
      Width           =   3135
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Const LICCODER As String = "QWERTYUIPSDFGHJK"

Public Function VerifyLic(ByVal r As Long) As Boolean
  Dim i As Long, top As Long

  top = CLng(Sqr(Abs(r))) + 1

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
      VerifyLic = False
      Exit Function
    End If
    i = i + 2
  Wend
  VerifyLic = True
  Debug.Print r
End Function




Public Function VerifyDemoLic(ByVal r As Long) As Boolean
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



Public Function VerifyWorkLic(ByVal r As Long) As Boolean
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

Public Function GetR(ByVal s As String) As Long
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



Private Sub Command1_Click()
  Dim cnt As Long, id As String, ttl As Long
  cnt = 0
  ttl = 0
  Text1 = ""
  While cnt < 100
    id = CreateGUID2
    If VerifyWorkLic(GetR(txtARMID) * 7 + GetR(id)) Then
      Text1 = Text1 & vbCrLf & GUID2LIC(id)
      cnt = cnt + 1
    End If
    ttl = ttl + 1
  Wend
  Me.Caption = "Отобрано " & cnt & " из " & ttl & "(" & CLng((cnt * 10000) / ttl) / 100 & "%)"
End Sub

Private Sub Command2_Click()
  Dim cnt As Long, id As String, ttl As Long
  cnt = 0
  ttl = 0
  Text1 = ""
  While cnt < 100
    id = CreateGUID2
    If VerifyDemoLic(GetR(txtARMID) * 7 + GetR(id)) Then
      Text1 = Text1 & vbCrLf & GUID2LIC(id)
      cnt = cnt + 1
    End If
    ttl = ttl + 1
  Wend
  Me.Caption = "Отобрано " & cnt & " из " & ttl & "(" & CLng((cnt * 10000) / ttl) / 100 & "%)"

End Sub

Private Sub Command3_Click()
Dim s As String
Dim iii As String
s = ""
    iii = LIC2GUID(txtTest.Text)
'    If Left(txtTest.Text, 1) <> "{" And Right(txtTest.Text, 1) <> "}" Then
'        iii = "{" & txtTest.Text & "}"
'    Else
'        iii = txtTest.Text
'    End If
    
    If IsGUID(iii) Then
        If VerifyWorkLic(GetR(txtARMID) * 7 + GetR(iii)) Then
         s = s & "Стандартная лицензия"
        ElseIf VerifyDemoLic(GetR(txtARMID) * 7 + GetR(iii)) Then
          s = s & "Демо лицензия"
        Else
          s = s & "Неверный лицензионный код"
        End If
        
    Else
        s = "Неверный формат кода"
    End If
    MsgBox s
End Sub

Private Sub Command4_Click()
txtTest = GUID2LIC(CreateGUID2)
Command3_Click
End Sub


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
 Dim dd As Long, v As Long, rr As Long, s1 As String, i As Long, j As Long
 dd = Len(LICCODER)
 v = 0
 s1 = s
 s1 = Replace(s1, "A", "")
 For j = Len(s1) To 1 Step -1
    For i = 1 To dd
     If Mid(s1, j, 1) = Mid(LICCODER, i, 1) Then
      v = v * dd + (i - 1)
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

Private Sub Command5_Click()
txtS = MapV2S(Val("&H" & txtV2))

End Sub

Private Sub Command6_Click()
txt2V = Hex(MapS2V(txtS))
End Sub


