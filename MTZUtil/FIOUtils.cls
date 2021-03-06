VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "FIOUtils"
Attribute VB_GlobalNameSpace = True
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 55

Option Explicit
Dim strLetter As String ' ������� ���������� ��� �����

'Parameters:
'[IN][OUT]  str�������� , ��� ���������: String  - ...
'Returns:
'  �������� ���� String
'See Also:
'  strFirstName1
'  strFirstName2
'  strFirstName3
'  strFirstName4
'  strFirstName5
'  strLastName1
'  strLastName3
'  strLastName4
'  strLastName5
'  strName1
'  strName2
'  strName3
'  strName4
'  strName5
'Example:
' dim variable as String
' variable = me.strLastName2(...���������...)
Public Function strLastName2(str�������� As String) As String
Attribute strLastName2.VB_HelpID = 90
  ' ������� ������������� ��� ��������� ������ �������� - ���� � ��������
  ' ���������� ����� ������� ��������� � ��������� ������
  
  strLetter = Right(str��������, 1) ' ������� ��������� ����� ��� �������
  
  Select Case strLetter
  Case Is = "�" ' ����� !!!
  strLastName2 = str�������� & "�" ' ������ �������� �
  Case Is = "�" ' ������� ��������
  ' ��������� ����� ���� �������� �� "�". ������ �������� � ���������
  strLastName2 = mID(str��������, 1, Len(str��������) - 1) & "�"
  
  End Select ' �������� �����������
End Function ' ���������� �������� strLastName2 � ���������� ���������

'Parameters:
'[IN][OUT]  str�������� , ��� ���������: String  - ...
'Returns:
'  �������� ���� String
'See Also:
'  strFirstName1
'  strFirstName2
'  strFirstName3
'  strFirstName4
'  strFirstName5
'  strLastName2
'  strLastName3
'  strLastName4
'  strLastName5
'  strName1
'  strName2
'  strName3
'  strName4
'  strName5
'Example:
' dim variable as String
' variable = me.strLastName1(...���������...)
Public Function strLastName1(str�������� As String) As String
Attribute strLastName1.VB_HelpID = 85
' ������� ������������� ��� ��������� ������ �������� - ���� � ��������
' ���������� ����� ������� ��������� � ��������� ������

strLetter = Right(str��������, 1) ' ������� ��������� ����� ��� �������
' ������� ��� ��� �������
Select Case strLetter
Case Is = "�" ' ����� !!!
strLastName1 = str�������� & "�" ' ������ �������� �
Case Is = "�" ' ������� ��������
' ��������� ����� ���� �������� �� "�". ������ �������� � ���������
strLastName1 = mID(str��������, 1, Len(str��������) - 1) & "�"

End Select ' �������� �����������
End Function ' ���������� �������� strLastName1 � ���������� ���������

'Parameters:
'[IN][OUT]  str�������� , ��� ���������: String  - ...
'Returns:
'  �������� ���� String
'See Also:
'  strFirstName1
'  strFirstName2
'  strFirstName3
'  strFirstName4
'  strFirstName5
'  strLastName1
'  strLastName2
'  strLastName4
'  strLastName5
'  strName1
'  strName2
'  strName3
'  strName4
'  strName5
'Example:
' dim variable as String
' variable = me.strLastName3(...���������...)
Public Function strLastName3(str�������� As String) As String
Attribute strLastName3.VB_HelpID = 95
' ������� ������������� ��� ��������� ������ �������� - ��� � ��������
' ���������� ����� ������� ��������� � ��������� ������

strLetter = Right(str��������, 1) ' ������� ��������� ����� ��� �������

Select Case strLetter
Case Is = "�" ' ����� !!!
strLastName3 = str�������� & "��" ' ������ �������� "��"
Case Is = "�" ' ������� ��������
' ��������� ����� ���� �������� �� "��". ������ �������� � ���������
strLastName3 = mID(str��������, 1, Len(str��������) - 1) & "��"

End Select ' �������� �����������
End Function ' ���������� �������� strLastName3 � ���������� ���������

'Parameters:
'[IN][OUT]  str�������� , ��� ���������: String  - ...
'Returns:
'  �������� ���� String
'See Also:
'  strFirstName1
'  strFirstName2
'  strFirstName3
'  strFirstName4
'  strFirstName5
'  strLastName1
'  strLastName2
'  strLastName3
'  strLastName5
'  strName1
'  strName2
'  strName3
'  strName4
'  strName5
'Example:
' dim variable as String
' variable = me.strLastName4(...���������...)
Public Function strLastName4(str�������� As String) As String
Attribute strLastName4.VB_HelpID = 100
' ������� ������������� ��� ��������� ������ �������� - � ��� � ��������
' ���������� ����� ������� ��������� � ��������� ������

strLetter = Right(str��������, 1) ' ������� ��������� ����� ��� �������
' ���� � ��� ������������ �� "�", �� � ������ ����� �������� "�",
' � � ������ ������ ������������ - ����� ����� ��������� �� ������� � ...
Select Case strLetter
Case Is = "�" ' ����� !!!
strLastName4 = str�������� & "�" ' ������ �������� �
Case Is = "�" ' ������� ��������
' ��������� ����� ���� �������� �� "�". ������ �������� � ���������
strLastName4 = mID(str��������, 1, Len(str��������) - 1) & "�"

End Select ' �������� �����������
End Function ' ���������� �������� strLastName4 � ���������� ���������

'Parameters:
'[IN][OUT]  str�������� , ��� ���������: String  - ...
'Returns:
'  �������� ���� String
'See Also:
'  strFirstName1
'  strFirstName2
'  strFirstName3
'  strFirstName4
'  strFirstName5
'  strLastName1
'  strLastName2
'  strLastName3
'  strLastName4
'  strName1
'  strName2
'  strName3
'  strName4
'  strName5
'Example:
' dim variable as String
' variable = me.strLastName5(...���������...)
Public Function strLastName5(str�������� As String) As String
Attribute strLastName5.VB_HelpID = 105
' ������� ������������� ��� ��������� ������ �������� - � ���� ... � ��������
' ���������� ����� ������� ��������� � ��������� ������

strLetter = Right(str��������, 1) ' ������� ��������� ����� ��� �������
' ���� � ��� ������������ �� "�", �� � ������ ����� �������� "�",
' � � ������ ������ ������������ - ����� ����� ��������� �� ������� � ...
Select Case strLetter
Case Is = "�" ' ����� !!!
strLastName5 = str�������� & "�" ' ������ �������� �
Case Is = "�" ' ������� ��������
' ��������� ����� ���� �������� �� "�". ������ �������� � ���������
strLastName5 = mID(str��������, 1, Len(str��������) - 1) & "�"

End Select ' �������� �����������
End Function

'Parameters:
'[IN][OUT]  str������� , ��� ���������: String  - ...
'Returns:
'  �������� ���� String
'See Also:
'  strFirstName2
'  strFirstName3
'  strFirstName4
'  strFirstName5
'  strLastName1
'  strLastName2
'  strLastName3
'  strLastName4
'  strLastName5
'  strName1
'  strName2
'  strName3
'  strName4
'  strName5
'Example:
' dim variable as String
' variable = me.strFirstName1(...���������...)
Public Function strFirstName1(str������� As String) As String
Attribute strFirstName1.VB_HelpID = 60
' ������� ������������� ��� ��������� ������ ������� - ���� � ��������
' ���������� ����� ������� ��������� � ��������� ������

strLetter = Right(str�������, 1) ' ������� ��������� ����� ��� �������

Select Case strLetter
Case Is = "�", "�" ' ����� !!!
strFirstName1 = str������� & "�" ' ������ �������� �
Case Is = "�" ' ������� �������
' ��������� ����� ���� �������� �� "�". ������ �������� � ���������
strFirstName1 = mID(str�������, 1, Len(str�������) - 1) & "�"
Case Else
strFirstName1 = str������� ' ���� ������� �� �������� ��� �������
End Select ' �������� �����������
End Function ' ���������� �������� str����������� � ���������� ���������

'Parameters:
'[IN][OUT]  str������� , ��� ���������: String  - ...
'Returns:
'  �������� ���� String
'See Also:
'  strFirstName1
'  strFirstName3
'  strFirstName4
'  strFirstName5
'  strLastName1
'  strLastName2
'  strLastName3
'  strLastName4
'  strLastName5
'  strName1
'  strName2
'  strName3
'  strName4
'  strName5
'Example:
' dim variable as String
' variable = me.strFirstName2(...���������...)
Public Function strFirstName2(str������� As String) As String
Attribute strFirstName2.VB_HelpID = 65
' ������� ������������� ��� ��������� ������ ������� - ���� � ��������
' ���������� ����� ������� ��������� � ��������� ������

strLetter = Right(str�������, 1) ' ������� ��������� ����� ��� �������

Select Case strLetter
Case Is = "�", "�" ' ����� !!!
strFirstName2 = str������� & "�" ' ������ �������� �
Case Is = "�" ' ������� �������
' ��������� ����� ���� �������� �� "��". ������ �������� � ���������
strFirstName2 = mID(str�������, 1, Len(str�������) - 1) & "��"
Case Else
strFirstName2 = str������� ' ���� ������� �� �������� ��� �������

End Select ' �������� �����������
End Function ' ���������� �������� str����������� � ���������� ���������

'Parameters:
'[IN][OUT]  str������� , ��� ���������: String  - ...
'Returns:
'  �������� ���� String
'See Also:
'  strFirstName1
'  strFirstName2
'  strFirstName4
'  strFirstName5
'  strLastName1
'  strLastName2
'  strLastName3
'  strLastName4
'  strLastName5
'  strName1
'  strName2
'  strName3
'  strName4
'  strName5
'Example:
' dim variable as String
' variable = me.strFirstName3(...���������...)
Public Function strFirstName3(str������� As String) As String
Attribute strFirstName3.VB_HelpID = 70
' ������� ������������� ��� ��������� ������ ������� - ��� � ��������
' ���������� ����� ������� ��������� � ��������� ������

strLetter = Right(str�������, 1) ' ������� ��������� ����� ��� �������

Select Case strLetter
Case Is = "�", "�" ' ����� !!!
strFirstName3 = str������� & "��" ' ������ �������� "��"
Case Is = "�" ' ������� �������
' ��������� ����� ���� �������� �� "��". ������ �������� � ���������
strFirstName3 = mID(str�������, 1, Len(str�������) - 1) & "��"
Case Else
strFirstName3 = str������� ' ���� ������� �� �������� ��� �������

End Select ' �������� �����������
End Function ' ���������� �������� str���������� � ���������� ���������

'Parameters:
'[IN][OUT]  str������� , ��� ���������: String  - ...
'Returns:
'  �������� ���� String
'See Also:
'  strFirstName1
'  strFirstName2
'  strFirstName3
'  strFirstName5
'  strLastName1
'  strLastName2
'  strLastName3
'  strLastName4
'  strLastName5
'  strName1
'  strName2
'  strName3
'  strName4
'  strName5
'Example:
' dim variable as String
' variable = me.strFirstName4(...���������...)
Public Function strFirstName4(str������� As String) As String
Attribute strFirstName4.VB_HelpID = 75
' ������� ������������� ��� ��������� ������ ������� - � ��� � ��������
' ���������� ����� ������� ��������� � ��������� ������

strLetter = Right(str�������, 1) ' ������� ��������� ����� ��� �������

Select Case strLetter
Case Is = "�", "�" ' ����� !!!
strFirstName4 = str������� & "�" ' ������ �������� �
Case Is = "�" ' ������� �������
' ��������� ����� ���� �������� �� "��". ������ �������� � ���������
strFirstName4 = mID(str�������, 1, Len(str�������) - 1) & "��"
Case Else
strFirstName4 = str������� ' ���� ������� �� �������� ��� �������

End Select ' �������� �����������
End Function ' ���������� �������� str����������� � ���������� ���������

'Parameters:
'[IN][OUT]  str������� , ��� ���������: String  - ...
'Returns:
'  �������� ���� String
'See Also:
'  strFirstName1
'  strFirstName2
'  strFirstName3
'  strFirstName4
'  strLastName1
'  strLastName2
'  strLastName3
'  strLastName4
'  strLastName5
'  strName1
'  strName2
'  strName3
'  strName4
'  strName5
'Example:
' dim variable as String
' variable = me.strFirstName5(...���������...)
Public Function strFirstName5(str������� As String) As String
Attribute strFirstName5.VB_HelpID = 80
' ������� ������������� ��� ��������� ������ ������� - � ���� ... � ��������
' ���������� ����� ������� ��������� � ��������� ������

strLetter = Right(str�������, 1) ' ������� ��������� ����� ��� �������

Select Case strLetter
Case Is = "�", "�" ' ����� !!!
strFirstName5 = str������� & "�" ' ������ �������� �
Case Is = "�" ' ������� �������
' ��������� ����� ���� �������� �� "�". ������ �������� � ���������
strFirstName5 = mID(str�������, 1, Len(str�������) - 1) & "��"
Case Else
strFirstName5 = str������� ' ���� ������� �� �������� ��� �������
End Select ' �������� �����������
End Function ' ���������� �������� str����������� � ���������� ���������

'Parameters:
'[IN][OUT]  str��� , ��� ���������: String,
'[IN][OUT]   str�������� , ��� ���������: String  - ...
'Returns:
'  �������� ���� String
'See Also:
'  strFirstName1
'  strFirstName2
'  strFirstName3
'  strFirstName4
'  strFirstName5
'  strLastName1
'  strLastName2
'  strLastName3
'  strLastName4
'  strLastName5
'  strName2
'  strName3
'  strName4
'  strName5
'Example:
' dim variable as String
' variable = me.strName1(...���������...)
Public Function strName1(str��� As String, str�������� As String) As String
Attribute strName1.VB_HelpID = 110
' ������� ������������� ��� ��������� ������ ��� - ���� � ��������
' ���������� ����� ������� ��������� � ��������� ������

strLetter = Right(str���, 1) ' ������� ��������� ����� ��� �������

Select Case strLetter
Case Is = "�" ' ������� ��������� ����� �� "�"
strName1 = mID(str���, 1, Len(str���) - 1) & "�"
Case Is = "�" ' ������� ��������� ����� �� "�"
strName1 = mID(str���, 1, Len(str���) - 1) & "�"
Case Is = "�" ' ������� ��������� ����� �� "�"
strName1 = mID(str���, 1, Len(str���) - 1) & "�"
Case Is = "�" ' ������� ���� ���������� ����� ��� �� ����� ?
If Right(str��������, 1) = "�" Then ' ����� !!!
' � ��������� ����� ������ ������� �� "�"
strName1 = mID(str���, 1, Len(str���) - 1) & "�"
Else ' ����� ��� ��������
strName1 = str��� ' ������� ��� ��� ���������
End If
Case Else ' ����� ���� ��������� ������ �������� "�"
strName1 = str��� & "�"

End Select ' �������� ����������� Select
End Function ' ���������� �������� str������� � ���������� ���������

'Parameters:
'[IN][OUT]  str��� , ��� ���������: String,
'[IN][OUT]   str�������� , ��� ���������: String  - ...
'Returns:
'  �������� ���� String
'See Also:
'  strFirstName1
'  strFirstName2
'  strFirstName3
'  strFirstName4
'  strFirstName5
'  strLastName1
'  strLastName2
'  strLastName3
'  strLastName4
'  strLastName5
'  strName1
'  strName3
'  strName4
'  strName5
'Example:
' dim variable as String
' variable = me.strName2(...���������...)
Public Function strName2(str��� As String, str�������� As String) As String
Attribute strName2.VB_HelpID = 115
' ������� ������������� ��� ��������� ������ ��� - ���� � ��������
' ���������� ����� ������� ��������� � ��������� ������

strLetter = Right(str���, 1) ' ������� ��������� ����� ��� �������

Select Case strLetter
Case Is = "�" ' ������� ��������� ����� �� "�"
strName2 = mID(str���, 1, Len(str���) - 1) & "�"
Case Is = "�" ' ������� ��������� ����� �� "�"
strName2 = mID(str���, 1, Len(str���) - 1) & "�"
Case Is = "�" ' ������� ��������� ����� �� "�"
strName2 = mID(str���, 1, Len(str���) - 1) & "�"
Case Is = "�" ' ������� ���� ���������� ����� ��� �� ����� ?
If Right(str��������, 1) = "�" Then ' ����� !!!
' � ��������� ����� ������ ������� �� "�"
strName2 = mID(str���, 1, Len(str���) - 1) & "�"
Else ' ��� ������� � ��������� ����� ������� �� "�"
strName2 = mID(str���, 1, Len(str���) - 1) & "�"
End If
Case Else ' ����� ���� ��������� ������ �������� "�"
strName2 = str��� & "�"

End Select ' �������� ����������� Select
End Function ' ���������� �������� strName2 � ���������� ���������

'Parameters:
'[IN][OUT]  str��� , ��� ���������: String,
'[IN][OUT]   str�������� , ��� ���������: String  - ...
'Returns:
'  �������� ���� String
'See Also:
'  strFirstName1
'  strFirstName2
'  strFirstName3
'  strFirstName4
'  strFirstName5
'  strLastName1
'  strLastName2
'  strLastName3
'  strLastName4
'  strLastName5
'  strName1
'  strName2
'  strName4
'  strName5
'Example:
' dim variable as String
' variable = me.strName3(...���������...)
Public Function strName3(str��� As String, str�������� As String) As String
Attribute strName3.VB_HelpID = 120
' ������� ������������� ��� ��������� ������ ��� - ��� � ��������
' ���������� ����� ������� ��������� � ��������� ������

strLetter = Right(str���, 1) ' ������� ��������� ����� ��� �������

Select Case strLetter
Case Is = "�" ' ������� ��������� ����� �� "��"
strName3 = mID(str���, 1, Len(str���) - 1) & "��"
Case Is = "�" ' ������� ��������� ����� �� "��"
strName3 = mID(str���, 1, Len(str���) - 1) & "��"
Case Is = "�" ' ������� ��������� ����� �� "��"
strName3 = mID(str���, 1, Len(str���) - 1) & "��"
Case Is = "�" ' ������� ���� ���������� ����� ��� �� ����� ?
If Right(str��������, 1) = "�" Then ' ����� !!!
' � ��������� ����� ������ ������� �� "��"
strName3 = mID(str���, 1, Len(str���) - 1) & "��"
Else ' ����� ��� ��������
strName3 = str��� & "�" ' ������ �������� "�"
End If
Case Else ' ����� ���� ��������� ������ �������� "��"
strName3 = str��� & "��"

End Select ' �������� ����������� Select
End Function ' ���������� �������� strName3 � ���������� ���������

'Parameters:
'[IN][OUT]  str��� , ��� ���������: String,
'[IN][OUT]   str�������� , ��� ���������: String  - ...
'Returns:
'  �������� ���� String
'See Also:
'  strFirstName1
'  strFirstName2
'  strFirstName3
'  strFirstName4
'  strFirstName5
'  strLastName1
'  strLastName2
'  strLastName3
'  strLastName4
'  strLastName5
'  strName1
'  strName2
'  strName3
'  strName5
'Example:
' dim variable as String
' variable = me.strName4(...���������...)
Public Function strName4(str��� As String, str�������� As String) As String
Attribute strName4.VB_HelpID = 125
' ������� ������������� ��� ��������� ������ ��� - � ��� � ��������
' ���������� ����� ������� ��������� � ��������� ������

strLetter = Right(str���, 1) ' ������� ��������� ����� ��� �������

Select Case strLetter
Case Is = "�" ' ������� ��������� ����� �� "�"
strName4 = mID(str���, 1, Len(str���) - 1) & "�"
Case Is = "�" ' ������� ��������� ����� �� "�"
strName4 = mID(str���, 1, Len(str���) - 1) & "�"
Case Is = "�" ' ������� ��������� ����� �� "�"
strName4 = mID(str���, 1, Len(str���) - 1) & "�"
Case Is = "�" ' ������� ���� ���������� ����� ��� �� ����� ?
If Right(str��������, 1) = "�" Then ' ����� !!!
' � ��������� ����� ������ ������� �� "�"
strName4 = mID(str���, 1, Len(str���) - 1) & "�"
Else ' ����� ��� �������� � ����� ������� �� "�"
strName4 = mID(str���, 1, Len(str���) - 1) & "�"
End If
Case Else ' ����� ���� ��������� ������ �������� "�"
strName4 = str��� & "�"

End Select ' �������� ����������� Select
End Function ' ���������� �������� strName4 � ���������� ���������

'Parameters:
'[IN][OUT]  str��� , ��� ���������: String,
'[IN][OUT]   str�������� , ��� ���������: String  - ...
'Returns:
'  �������� ���� String
'See Also:
'  strFirstName1
'  strFirstName2
'  strFirstName3
'  strFirstName4
'  strFirstName5
'  strLastName1
'  strLastName2
'  strLastName3
'  strLastName4
'  strLastName5
'  strName1
'  strName2
'  strName3
'  strName4
'Example:
' dim variable as String
' variable = me.strName5(...���������...)
Public Function strName5(str��� As String, str�������� As String) As String
Attribute strName5.VB_HelpID = 130
' ������� ������������� ��� ��������� ������ ��� - ���� � ��������
' ���������� ����� ������� ��������� � ��������� ������

strLetter = Right(str���, 1) ' ������� ��������� ����� ��� �������

Select Case strLetter
Case Is = "�" ' ������� ��������� ����� �� "�"
strName5 = mID(str���, 1, Len(str���) - 1) & "�"
Case Is = "�" ' ������� ��������� ����� �� "�"
strName5 = mID(str���, 1, Len(str���) - 1) & "�"
Case Is = "�" ' ������� ��������� ����� �� "�"
strName5 = mID(str���, 1, Len(str���) - 1) & "�"
Case Is = "�" ' ������� ���� ���������� ����� ��� �� ����� ?
  If Right(str��������, 1) = "�" Then ' ����� !!!
    ' � ��������� ����� ������ ������� �� "�"
    strName5 = mID(str���, 1, Len(str���) - 1) & "�"
  Else ' ����� ��� ��������
    strName5 = str��� ' ������� ��� ��� ���������
  End If
Case Else ' ����� ���� ��������� ������ �������� "�"
  strName5 = str��� & "�"

End Select ' �������� ����������� Select
End Function ' ���������� �������� str������� � ���������� ���������
