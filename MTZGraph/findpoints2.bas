Attribute VB_Name = "findPoints"
Option Explicit
Public pts(0 To 1, 0 To 1) As Long, Algoritm As Integer, Arrows(0 To 1) As Integer


' ������� ������ ��� ����
' 1 ���� ����� ������� ����� ����������� ����� ������� � ��������������� ���������� �� � ������ pts
' 2 ���������� � ����� ������� ������ � ������ ������� �������, ����� � ������ Arrows
' 3 ���������� ������� ���� ����� ��� ��������� ���������� - ���������� ��������
Public Function findPoints( _
ByVal X1 As Double, ByVal Y1 As Double, ByVal w1 As Double, ByVal h1 As Double, _
ByVal X2 As Double, ByVal Y2 As Double, ByVal w2 As Double, ByVal h2 As Double, _
ByVal w11 As Double, ByVal h11 As Double, ByVal w21 As Double, ByVal h21 As Double)
Dim b As Double, a As Double
Dim x(0 To 8) As Double, y(0 To 8) As Double, ok(0 To 7) As Boolean

 

' ��� � ���� Algoritm =4
'
'   /---\
'   |   |
'   | |---|
'   \-| N |
'     |---|
'
'
If X1 = X2 And Y1 = Y2 Then
  Algoritm = 4
  pts(0, 0) = X1 - w1
  pts(0, 1) = Y1
  pts(1, 0) = X1
  pts(1, 1) = Y1 - h1
  Arrows(0) = 1
  Arrows(1) = 0
  findPoints = Algoritm
  Exit Function
End If

' ��������� ������� �� 0
If X1 = X2 Then
  X2 = X1 + 2
End If

a = (Y1 - Y2) / (X1 - X2)
b = (Y1 + Y2 - a * (X1 + X2)) / 2

' ���� ��� ����������� ������ ������� �������������� � ������ ����������� ��������

' ������ ������������� !!!
' ������ �������
x(0) = X1 + w11
y(0) = a * x(0) + b
If y(0) >= Y1 - h1 And y(0) <= Y1 + h11 Then
    ok(0) = True
End If

' ����� �������
x(1) = X1 - w1
y(1) = a * x(1) + b
If y(1) >= Y1 - h1 And y(1) <= Y1 + h11 Then
    ok(1) = True
End If

'����
ok(2) = False
If a <> 0 Then
  y(2) = Y1 - h1
  x(2) = (Y1 - h1 - b) / a
  If x(2) > X1 - w1 And x(2) < X1 + w11 Then
    ok(2) = True
  End If
End If

'���
ok(3) = False
If a <> 0 Then
  y(3) = Y1 + h11
  x(3) = (Y1 + h11 - b) / a
  If x(3) > X1 - w1 And x(3) < X1 + w11 Then
    ok(3) = True
  End If
End If


' ������ ������������� !!!
' ������ �������
x(4) = X2 + w21
y(4) = a * x(4) + b
If y(4) >= Y2 - h2 And y(4) <= Y2 + h21 Then
  ok(4) = True
End If

' ����� �������
x(5) = X2 - w2
y(5) = a * x(5) + b
If y(5) >= Y2 - h2 And y(5) <= Y2 + h21 Then
  ok(5) = True
End If

'����
ok(6) = False
If a <> 0 Then
  y(6) = Y2 - h2
  x(6) = (Y2 - h2 - b) / a
  If x(6) > X2 - w2 And x(6) < X2 + w21 Then
    ok(6) = True
  End If
End If
'���
ok(7) = False
If a <> 0 Then
  y(7) = Y2 + h21
  x(7) = (Y2 + h21 - b) / a
  If x(7) > X2 - w2 And x(7) < X2 + w21 Then
    ok(7) = True
  End If
End If

' ���� �������� ������� �����
Dim i As Integer, j As Integer, mi As Integer, mj As Integer, R As Double, mr As Double
mi = -1
mj = -1
mr = -1
For i = 0 To 3
  For j = 4 To 7
    ' ���� ����������� � ����� ���������
    If ok(i) And ok(j) Then
    
      ' ������� ������� ����������
      R = (x(i) - x(j)) * (x(i) - x(j)) + (y(i) - y(j)) * (y(i) - y(j))
      
      ' ���� ����������� ����������
      If mr > R Or mr < 0 Then
        mr = R
        mi = i
        mj = j
      End If
    End If
  Next
Next


If (mi < 2 And mj < 6) Or (mi > 1 And mj > 5) Then
  If (mi < 2 And mj < 6) Then
    Algoritm = 3
  Else
    Algoritm = -3
  End If
Else
  If (mi < 2) Then
    Algoritm = 2
  Else
    Algoritm = -2
  End If
End If

' ������ �����
pts(0, 0) = x(mi)
pts(0, 1) = y(mi)

' ����� �����
pts(1, 0) = x(mj)
pts(1, 1) = y(mj)


Select Case mi
Case 0
  Arrows(0) = 3 '  �� ������ �������  ->
Case 1
  Arrows(0) = 1 ' �� �����   <-
Case 2
  Arrows(0) = 2 ' �� ������   \/
Case 3
  Arrows(0) = 0 ' �� �������  /\
End Select

Select Case mj - 4
Case 0
  Arrows(1) = 1 ' � ������ ������� <-
Case 1
  Arrows(1) = 3 ' � �����  ->
Case 2
  Arrows(1) = 0 ' � ������    /\
Case 3
  Arrows(1) = 2 ' � �������   \/
End Select
findPoints = Algoritm
End Function
