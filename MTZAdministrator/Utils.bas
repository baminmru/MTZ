Attribute VB_Name = "Utils"
Option Explicit

Public Enum enumGender
 MALE = 0
 FEMALE = 1
End Enum


Public Function DaysInMonth(ByVal M As Integer, ByVal y As Integer) As Integer
On Error GoTo DaysInMonthErr
    If M = 4 Or M = 6 Or M = 7 Or M = 9 Or M = 11 Then
        DaysInMonth = 30
    ElseIf M = 2 Then
        If y Mod 4 Then
            DaysInMonth = 28
        ElseIf y Mod 100 Then
            DaysInMonth = 29
        ElseIf y Mod 400 Then
            DaysInMonth = 28
        Else
            DaysInMonth = 29
        End If
    Else
        DaysInMonth = 31
    End If
    Exit Function
DaysInMonthErr:
End Function


Public Function MonthNameI(ByVal ID As Integer) As String
On Error GoTo MonthNameIErr
    Select Case ID
    Case 1:
            MonthNameI = "������"
    Case 2:
            MonthNameI = "�������"
    Case 3:
            MonthNameI = "����"
    Case 4:
            MonthNameI = "������"
    Case 5:
            MonthNameI = "���"
    Case 6:
            MonthNameI = "����"
    Case 7:
            MonthNameI = "����"
    Case 8:
            MonthNameI = "������"
    Case 9:
            MonthNameI = "��������"
    Case 10:
            MonthNameI = "�������"
    Case 11:
            MonthNameI = "������"
    Case 12:
            MonthNameI = "�������"
    Case Else
            MonthNameI = "???"
    End Select
    Exit Function
MonthNameIErr:

End Function


Public Function MonthName(ByVal ID As Integer) As String
On Error GoTo MonthNameErr
    Select Case ID
    Case 1:
            MonthName = "������"
    Case 2:
            MonthName = "�������"
    Case 3:
            MonthName = "�����"
    Case 4:
            MonthName = "������"
    Case 5:
            MonthName = "���"
    Case 6:
            MonthName = "����"
    Case 7:
            MonthName = "����"
    Case 8:
            MonthName = "�������"
    Case 9:
            MonthName = "��������"
    Case 10:
            MonthName = "�������"
    Case 11:
            MonthName = "������"
    Case 12:
            MonthName = "�������"
    Case Else
            MonthName = "???"
    End Select
    Exit Function
MonthNameErr:

End Function


Private Function hund2str(ByVal h As Integer) As String

    Select Case h
        Case 0: hund2str = ""
        Case 1: hund2str = "���"
        Case 2: hund2str = "������"
        Case 3: hund2str = "������"
        Case 4: hund2str = "���������"
        Case 5: hund2str = "�������"
        Case 6: hund2str = "��������"
        Case 7: hund2str = "�������"
        Case 8: hund2str = "���������"
        Case 9: hund2str = "���������"
        Case Else: hund2str = "�����!!!"
    End Select

End Function

Private Function dec2str(d As Integer) As String
    Select Case d
        Case 0: dec2str = ""
        Case 1: dec2str = "������"
        Case 2: dec2str = "��������"
        Case 3: dec2str = "��������"
        Case 4: dec2str = "�����"
        Case 5: dec2str = "���������"
        Case 6: dec2str = "����������"
        Case 7: dec2str = "���������"
        Case 8: dec2str = "�����������"
        Case 9: dec2str = "���������"
        Case Else: dec2str = "�������!!!"
    End Select
End Function

Private Function decdig2str(ByVal n As Integer) As String
    Select Case n
        Case 10: decdig2str = "������"
        Case 11: decdig2str = "�����������"
        Case 12: decdig2str = "����������"
        Case 13: decdig2str = "����������"
        Case 14: decdig2str = "������������"
        Case 15: decdig2str = "����������"
        Case 16: decdig2str = "�����������"
        Case 17: decdig2str = "����������"
        Case 18: decdig2str = "������������"
        Case 19: decdig2str = "������������"
        Case Else: decdig2str = "��� �����!!!"
    End Select
End Function

Private Function dig2str(ByVal d As Integer, ByVal sex As Integer)

If sex = MALE Then
    Select Case d
        Case 0: dig2str = ""
        Case 1: dig2str = "����"
        Case 2: dig2str = "���"
        Case 3: dig2str = "���"
        Case 4: dig2str = "������"
        Case 5: dig2str = "����"
        Case 6: dig2str = "�����"
        Case 7: dig2str = "����"
        Case 8: dig2str = "������"
        Case 9: dig2str = "������"
    End Select
Else
    Select Case d
        Case 0: dig2str = ""
        Case 1: dig2str = "����"
        Case 2: dig2str = "���"
        Case 3: dig2str = "���"
        Case 4: dig2str = "������"
        Case 5: dig2str = "����"
        Case 6: dig2str = "�����"
        Case 7: dig2str = "����"
        Case 8: dig2str = "������"
        Case 9: dig2str = "������"
    End Select
End If
End Function

Private Function male2str(ByVal d As Currency, ByVal root As String) As String
 Dim tmp As String, buf As String, s As String
 Dim mode As Integer, n As Integer
 Dim s2 As String, d1 As Long
 's2 = Format(d, "0000000000000000.00")
 s2 = Format(d, "0000000000000000.00")
 'n = CLng(Right(s2, 2))
 n = CLng(Mid(s2, 15, 2))
 'n = d Mod 100
 buf = UCase(root)
 If (Left$(buf, 4) = "����") Then
    If (n >= 20) Then n = n Mod 10
    If (n = 1) Then
          tmp = "�"
    ElseIf (n > 1 And n < 5) Then
          tmp = "�"
    Else
          tmp = "��"
    End If
    s = LCase(Left$(root, 4))
 Else
     If (n >= 20) Then n = n Mod 10
     If (n = 1) Then
          tmp = ""
      ElseIf (n < 5 And n > 1) Then
          tmp = "�"
      Else
          tmp = "��"
      End If
      s = root
  End If
 male2str = s + tmp
End Function

' ������������ �� ��� ������ ������
Private Function num2str(ByVal numb As Integer, ByVal gender As Integer) As String
     Dim out As String, tmp As String, dest As String
     Dim hund As Integer, dec As Integer, dig As Integer
     Dim num As String
     num = Format(numb, "000")
     dest = " "
     hund = Val(Left(num, 1))
     If (hund >= 1) Then
      tmp = hund2str(hund)
      dest = dest + tmp
     End If
     dec = Val(Mid(num, 2, 1))
     If (dec >= 1) Then
         If (dec = 1) Then
              tmp = decdig2str(Val(Right(num, 2)))
              dest = dest + " " + tmp
              num2str = dest
              Exit Function
         Else
             tmp = dec2str(dec)
             dest = dest + " " + tmp
         End If
      End If
      tmp = dig2str(Val(Right(num, 1)), gender)
      dest = dest + " " + tmp
      num2str = dest
End Function

Public Function parseNumber(numberof As Currency, ByVal gender As enumGender) As String
     Dim trl As Currency
     Dim numb As String
     Dim rems As Integer, tail As Currency
     Dim name As String, tmp As String, dest As String
     Dim i As Integer
     
     If numberof = 0 Then
        parseNumber = "����"
        Exit Function
     End If
     numb = CStr(IIf(numberof < 0, -numberof, numberof))
     For i = 1 To Len(numb)
        If Mid(numb, i, 1) = "." Then Exit For
     Next
     numb = Format(CCur(Left(numb, i)), "000000000000000")
     dest = ""
     rems = Val(Mid(numb, 1, 3))
     If (rems >= 1) Then
         tmp = num2str(rems, MALE)
         name = male2str(rems, " ��������")
         dest = dest + tmp + name
     End If
     rems = Val(Mid(numb, 4, 3))
     If (rems >= 1) Then
         tmp = num2str(rems, MALE)
         name = male2str(rems, " ��������")
         dest = dest + tmp + name
     End If
     rems = Val(Mid(numb, 7, 3))
     If (rems >= 1) Then
         tmp = num2str(rems, MALE)
         name = male2str(rems, " �������")
         dest = dest + tmp + name
     End If
     rems = Val(Mid(numb, 10, 3))
     If (rems >= 1) Then
        tmp = num2str(rems, FEMALE)
        name = Thou2str(rems Mod 100)
        dest = dest + tmp + name
     End If
      rems = Val(Right(numb, 3))
      If (rems >= 1) Then
        tmp = num2str(rems, gender)
        dest = dest + tmp
      End If
      dest = Trim(dest)
      parseNumber = UCase(Left(dest, 1)) + LCase(Mid(dest, 2, Len(dest) - 1))
End Function

Private Function Thou2str(ByVal n As Integer) As String
    Dim n1 As Integer
    n1 = n
    If (n1 >= 10 And n1 < 20) Then
        n1 = 0
    ElseIf (n1 >= 20) Then
        n1 = n1 Mod 10
    End If
    
    Select Case n1
      Case 1: Thou2str = " ������"
      Case 2 To 4: Thou2str = " ������"
      Case Else: Thou2str = " �����"
    End Select
End Function

Public Function Kop2str(ByVal n As Integer) As String
    Dim n1 As Integer
    n1 = n
    If (n1 >= 10 And n1 < 20) Then
        n1 = 0
    ElseIf (n1 >= 20) Then
        n1 = n1 Mod 10
    End If
    
    Select Case n1
      Case 1: Kop2str = " �������"
      Case 2 To 4: Kop2str = " �������"
      Case Else: Kop2str = " ������"
    End Select
End Function

Public Function DayOfWeek(ByVal d As Date) As Integer

    Dim c4 As Long, century As Long, yr As Long, dw As Long, y2 As Long, m2 As Long, d2 As Long
    y2 = Year(d)
    m2 = Month(d)
    d2 = Day(d)

    If m2 < 3 Then
        m2 = m2 + 10
        y2 = y2 - 1
    Else
        m2 = m2 - 2
    End If

    century = y2 \ 100
    
    
    yr = y2 Mod 100
    
    dw = ((26 * m2 - 2) \ 10 + d2 + yr + (yr \ 4) + (century \ 4) - (2 * century)) Mod 7

    If dw < 0 Then dw = dw + 7

    If dw = 0 Then dw = 7

    DayOfWeek = dw
End Function
