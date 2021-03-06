VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Num2Str"
Attribute VB_GlobalNameSpace = True
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 315
Attribute VB_Ext_KEY = "SavedWithClassBuilder" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit
  


Public Enum enumGender
  MALE = 0
  FEMALE = 1
End Enum


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

Private Function dig2str(ByVal d As Integer, ByVal sex As enumGender)

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

Private Function Male2Str(ByVal d As Currency, ByVal root As String) As String
 Dim tmp As String, buf As String, s As String
 Dim mode As Integer, n As Integer
 Dim s2 As String, d1 As Long
 
 s2 = Format(d, "0000000000000000.00")
 
 n = CLng(mID(s2, 15, 2))
  buf = UCase(root)
  If (n >= 20) Then n = n Mod 10
  If (n = 1) Then
       tmp = ""
   ElseIf (n < 5 And n > 1) Then
       tmp = "�"
   Else
       tmp = "��"
   End If
   s = root
  Male2Str = s + tmp
End Function
' ��������� �������� ������
'Parameters:
'[IN]   d , ��� ���������: Currency - �����,
'[IN]   root , ��� ���������: String  - ������ ����������� ��������
'Returns:
'  �������� ���� String
'See Also:
'  Kop2str
'  parseNumber
'Example:
' dim variable as String
' variable = me.CurName2Str(...���������...)
Public Function CurName2Str(ByVal d As Currency, ByVal root As String) As String
Attribute CurName2Str.VB_HelpID = 320
 Dim tmp As String, buf As String, s As String
 Dim mode As Integer, n As Integer
 Dim s2 As String, d1 As Long
 's2 = Format(d, "0000000000000000.00")
 s2 = Format(d, "0000000000000000.00")
 'n = CLng(Right(s2, 2))
 n = CLng(mID(s2, 15, 2))
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
 ElseIf (Left$(buf, 4) = "����") Then
     If (n >= 20) Then n = n Mod 10
     If (n = 1) Then
          tmp = ""
      ElseIf (n < 5 And n > 1) Then
          tmp = "�"
      Else
          tmp = "��"
      End If
      s = root
  Else
    s = root
  End If
 CurName2Str = s + tmp
End Function

' ������������ �� ��� ������ ������
Private Function Num2Str(ByVal numb As Integer, ByVal Gender As enumGender) As String
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
     dec = Val(mID(num, 2, 1))
     If (dec >= 1) Then
         If (dec = 1) Then
              tmp = decdig2str(Val(Right(num, 2)))
              dest = dest + " " + tmp
              Num2Str = dest
              Exit Function
         Else
             tmp = dec2str(dec)
             dest = dest + " " + tmp
         End If
      End If
      tmp = dig2str(Val(Right(num, 1)), Gender)
      dest = dest + " " + tmp
      Num2Str = dest
End Function
'����� � ������
'Parameters:
'[IN][OUT]  numberof , ��� ���������: Currency - �����,
'[IN]   Gender , ��� ���������: enumGender  - �����
'Returns:
'  �������� ���� String
'See Also:
'  CurName2Str
'  Kop2str
'Example:
' dim variable as String
' variable = me.parseNumber(...���������...)
Public Function parseNumber(numberof As Currency, ByVal Gender As enumGender) As String
Attribute parseNumber.VB_HelpID = 330
     Dim trl As Currency
     Dim numb As String
     Dim rems As Integer, tail As Currency
     Dim Name As String, tmp As String, dest As String
     Dim i As Integer
     
     If numberof = 0 Then
        parseNumber = "����"
        Exit Function
     End If
     numb = CStr(IIf(numberof < 0, -numberof, numberof))
     For i = 1 To Len(numb)
        If mID(numb, i, 1) = "." Or mID(numb, i, 1) = "," Then Exit For
     Next
     numb = Format(CCur(Left(numb, i)), "000000000000000")
     dest = ""
     rems = Val(mID(numb, 1, 3))
     If (rems >= 1) Then
         tmp = Num2Str(rems, MALE)
         Name = Male2Str(rems, " ��������")
         dest = dest + tmp + Name
     End If
     rems = Val(mID(numb, 4, 3))
     If (rems >= 1) Then
         tmp = Num2Str(rems, MALE)
         Name = Male2Str(rems, " ��������")
         dest = dest + tmp + Name
     End If
     rems = Val(mID(numb, 7, 3))
     If (rems >= 1) Then
         tmp = Num2Str(rems, MALE)
         Name = Male2Str(rems, " �������")
         dest = dest + tmp + Name
     End If
     rems = Val(mID(numb, 10, 3))
     If (rems >= 1) Then
        tmp = Num2Str(rems, FEMALE)
        Name = Thou2str(rems Mod 100)
        dest = dest + tmp + Name
     End If
      rems = Val(Right(numb, 3))
      If (rems >= 1) Then
        tmp = Num2Str(rems, Gender)
        dest = dest + tmp
      End If
      dest = Trim(dest)
      parseNumber = UCase(Left(dest, 1)) + LCase(mID(dest, 2, Len(dest) - 1))
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
'������� � ������
'Parameters:
'[IN]   n , ��� ���������: Integer  - ����� ������
'Returns:
'  �������� ���� String
'See Also:
'  CurName2Str
'  parseNumber
'Example:
' dim variable as String
' variable = me.Kop2str(...���������...)
Public Function Kop2str(ByVal n As Integer) As String
Attribute Kop2str.VB_HelpID = 325
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

