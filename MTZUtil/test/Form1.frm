VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Тест преобразования"
   ClientHeight    =   4470
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7905
   LinkTopic       =   "Form1"
   ScaleHeight     =   4470
   ScaleWidth      =   7905
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtOEM 
      Height          =   855
      Left            =   4800
      MultiLine       =   -1  'True
      TabIndex        =   22
      Top             =   3480
      Width           =   2895
   End
   Begin VB.CommandButton Command9 
      Caption         =   "ANSI <"
      Height          =   375
      Left            =   3720
      TabIndex        =   21
      Top             =   3960
      Width           =   975
   End
   Begin VB.CommandButton Command8 
      Caption         =   "> OEM"
      Height          =   375
      Left            =   3720
      TabIndex        =   20
      Top             =   3480
      Width           =   975
   End
   Begin VB.TextBox txtANSI 
      Height          =   735
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   19
      Top             =   3480
      Width           =   3495
   End
   Begin VB.TextBox txtRes 
      Height          =   1095
      Left            =   4200
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   18
      Top             =   2160
      Width           =   3495
   End
   Begin VB.CommandButton cmdClone 
      Caption         =   "Просклонять"
      Height          =   375
      Left            =   6000
      TabIndex        =   17
      Top             =   1560
      Width           =   1695
   End
   Begin VB.TextBox txtO 
      Height          =   375
      Left            =   5400
      TabIndex        =   15
      Top             =   960
      Width           =   2295
   End
   Begin VB.TextBox txtI 
      Height          =   375
      Left            =   5400
      TabIndex        =   13
      Top             =   480
      Width           =   2295
   End
   Begin VB.TextBox txtF 
      Height          =   375
      Left            =   5400
      TabIndex        =   11
      Top             =   0
      Width           =   2295
   End
   Begin VB.TextBox txtOut 
      Height          =   855
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   10
      Top             =   2400
      Width           =   3735
   End
   Begin VB.CommandButton Command7 
      Caption         =   "Преобразовать в текст"
      Height          =   375
      Left            =   1320
      TabIndex        =   9
      Top             =   1920
      Width           =   2535
   End
   Begin VB.TextBox txtNumIn 
      Height          =   375
      Left            =   120
      TabIndex        =   8
      Top             =   1920
      Width           =   1095
   End
   Begin VB.CommandButton Command6 
      Caption         =   "создать файл с тестовыми данными"
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   0
      Width           =   3735
   End
   Begin VB.CommandButton Command5 
      Caption         =   "повторить 100 раз"
      Height          =   375
      Left            =   120
      TabIndex        =   6
      Top             =   1320
      Width           =   3735
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Arr->File"
      Height          =   375
      Left            =   3000
      TabIndex        =   5
      Top             =   840
      Width           =   855
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Hex->Arr"
      Height          =   375
      Left            =   2040
      TabIndex        =   4
      Top             =   840
      Width           =   855
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Arr->Hex"
      Height          =   375
      Left            =   1080
      TabIndex        =   3
      Top             =   840
      Width           =   855
   End
   Begin VB.CommandButton Command1 
      Caption         =   "File->Arr"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   840
      Width           =   855
   End
   Begin VB.TextBox txtpath 
      Height          =   375
      Left            =   1200
      TabIndex        =   0
      Top             =   360
      Width           =   2655
   End
   Begin VB.Label Label4 
      Caption         =   "Отчество"
      Height          =   255
      Left            =   4320
      TabIndex        =   16
      Top             =   1080
      Width           =   975
   End
   Begin VB.Label Label3 
      Caption         =   "Имя"
      Height          =   255
      Left            =   4320
      TabIndex        =   14
      Top             =   600
      Width           =   855
   End
   Begin VB.Label Label2 
      Caption         =   "Фамилия"
      Height          =   255
      Left            =   4320
      TabIndex        =   12
      Top             =   120
      Width           =   1095
   End
   Begin VB.Label Label1 
      Caption         =   "путь к файлу"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   1575
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim a() As Byte
Dim h As String
Dim t As Double
Dim sz As Long

Private Declare Function OemToChar Lib "user32" Alias "OemToCharA" (ByVal lpszSrc As String, ByVal lpszDst As String) As Long
Private Declare Function CharToOem Lib "user32" Alias "CharToOemA" (ByVal lpszSrc As String, ByVal lpszDst As String) As Long

Private Function W2OEM(ByVal s As String) As String
 
  Dim es As String
  es = Space(Len(s))
  Call CharToOem(s, es)
  W2OEM = es
End Function

Private Function OEM2W(ByVal s As String) As String
 
  Dim es As String
  es = Space(Len(s))
  Call OemToChar(s, es)
  OEM2W = es
End Function

Private Sub cmdClone_Click()
Dim s As String

s = "Кого: " & strFirstName1(txtF)
s = s & " " & strName1(txtI, txtO)
s = s & " " & strLastName1(txtO) & vbCrLf
s = s & "Кому: " & strFirstName2(txtF)
s = s & " " & strName2(txtI, txtO)
s = s & " " & strLastName2(txtO) & vbCrLf
s = s & "Кем: " & strFirstName3(txtF)
s = s & " " & strName3(txtI, txtO)
s = s & " " & strLastName3(txtO) & vbCrLf
s = s & "О ком: " & strFirstName4(txtF)
s = s & " " & strName4(txtI, txtO)
s = s & " " & strLastName4(txtO) & vbCrLf
s = s & "В лице: " & strFirstName5(txtF)
s = s & " " & strName5(txtI, txtO)
s = s & " " & strLastName5(txtO) & vbCrLf
txtRes = s
End Sub

Private Sub Command1_Click()
  Erase a
  t = Timer
  a = FileToArray(txtpath)
  sz = UBound(a) - LBound(a) + 1
  t = Timer - t
  Me.Caption = t & " sz:" & sz
End Sub

Private Sub Command2_Click()
  h = ""
  t = Timer
  h = ArrayToHex(a)
  sz = UBound(a) - LBound(a) + 1
  t = Timer - t
  Me.Caption = t & " sz:" & sz & " slen:" & Len(h)
End Sub

Private Sub Command3_Click()
  Erase a
  t = Timer
  a = HexToArray(h)
  sz = UBound(a) - LBound(a) + 1
  t = Timer - t
  Me.Caption = t & " sz:" & sz & " slen:" & Len(h)
End Sub

Private Sub Command4_Click()
  t = Timer
  sz = UBound(a) - LBound(a) + 1
  Call ArrayToFile(txtpath.Text & ".out", a)
  t = Timer - t
  Me.Caption = t & " sz:" & sz

End Sub

Private Sub Command5_Click()
  Dim i As Long
  Erase a
  h = ""
  t = Timer
  For i = 1 To 100
    a = FileToArray(txtpath)
    h = ""
    t = Timer
    h = ArrayToHex(a)
    Erase a
    a = HexToArray(h)
    h = ""
    Call ArrayToFile(txtpath.Text & ".out", a)
    Me.Caption = i
  Next
  t = Timer - t
  Me.Caption = t
End Sub

Private Sub Command6_Click()
Dim ff As Long, j As Byte, i As Long
  ff = FreeFile
  Open App.Path & "\demo.bin" For Binary As #ff
  For i = 1 To 4096
    On Error Resume Next
    For j = 0 To 254
      Put #ff, , j
    Next
  Next
  Close #ff
  MsgBox "Файл создан"
End Sub

Private Sub Command7_Click()
  Dim v As Currency, s As String, v1 As Currency
  Dim cop As Integer
  v = Val(txtNumIn.Text)
  v = Round(v, 2)
  cop = v * 100 Mod 100
  s = txtNumIn & " (" & Num2Str.parseNumber(v, MALE)
  s = s & " " & Num2Str.CurName2Str(v, "рубль")
  s = s & " " & Right("00" & cop, 2) & " " & Num2Str.Kop2str(cop) & ")"
  v = v * 18 / 118
  v = Round(v, 2)
  cop = v * 100 Mod 100
  v1 = CLng(v * 100) \ 100
  s = s & ", в том числе НДС 18%  " & v & " (" & Num2Str.parseNumber(v1, MALE)
  s = s & " " & Num2Str.CurName2Str(v, "рубль")
  s = s & " " & Right("00" & cop, 2) & " " & Num2Str.Kop2str(cop) & ")"
  
  txtOut = s
End Sub



Private Sub Command8_Click()
txtOEM.Text = W2OEM(txtANSI.Text)
End Sub

Private Sub Command9_Click()
txtANSI.Text = OEM2W(txtOEM.Text)
End Sub

Private Sub Form_Load()
txtpath = App.Path & "\demo.bin"
End Sub
