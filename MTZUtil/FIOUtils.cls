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
Dim strLetter As String ' объявим переменную для буквы

'Parameters:
'[IN][OUT]  strОтчество , тип параметра: String  - ...
'Returns:
'  значение типа String
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
' variable = me.strLastName2(...параметры...)
Public Function strLastName2(strОтчество As String) As String
Attribute strLastName2.VB_HelpID = 90
  ' Функция предназнасена для обработки падежа ОТЧЕСТВА - КОМУ в запросах
  ' разделение между мужским отчеством и отчеством женщин
  
  strLetter = Right(strОтчество, 1) ' вырежем последнюю букву для анализа
  
  Select Case strLetter
  Case Is = "ч" ' мужик !!!
  strLastName2 = strОтчество & "у" ' просто прибавим у
  Case Is = "а" ' женское отчество
  ' Последнюю букву надо заменить на "е". Вечная проблема с женщинами
  strLastName2 = mID(strОтчество, 1, Len(strОтчество) - 1) & "е"
  
  End Select ' закончим конструкцию
End Function ' возвращаем значение strLastName2 в вызывающую программу

'Parameters:
'[IN][OUT]  strОтчество , тип параметра: String  - ...
'Returns:
'  значение типа String
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
' variable = me.strLastName1(...параметры...)
Public Function strLastName1(strОтчество As String) As String
Attribute strLastName1.VB_HelpID = 85
' Функция предназначена для обработки падежа ОТЧЕСТВА - КОГО в запросах
' разделение между мужским отчеством и отчеством женщин

strLetter = Right(strОтчество, 1) ' вырежем последнюю букву для анализа
' мужчина это или женщина
Select Case strLetter
Case Is = "ч" ' мужик !!!
strLastName1 = strОтчество & "а" ' просто прибавим а
Case Is = "а" ' женское отчество
' Последнюю букву надо заменить на "у". Вечная проблема с женщинами
strLastName1 = mID(strОтчество, 1, Len(strОтчество) - 1) & "у"

End Select ' закончим конструкцию
End Function ' возвращаем значение strLastName1 в вызывающую программу

'Parameters:
'[IN][OUT]  strОтчество , тип параметра: String  - ...
'Returns:
'  значение типа String
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
' variable = me.strLastName3(...параметры...)
Public Function strLastName3(strОтчество As String) As String
Attribute strLastName3.VB_HelpID = 95
' Функция предназначена для обработки падежа ОТЧЕСТВА - КЕМ в запросах
' разделение между мужским отчеством и отчеством женщин

strLetter = Right(strОтчество, 1) ' вырежем последнюю букву для анализа

Select Case strLetter
Case Is = "ч" ' мужик !!!
strLastName3 = strОтчество & "ем" ' просто прибавим "ем"
Case Is = "а" ' женское отчество
' Последнюю букву надо заменить на "ой". Вечная проблема с женщинами
strLastName3 = mID(strОтчество, 1, Len(strОтчество) - 1) & "ой"

End Select ' закончим конструкцию
End Function ' возвращаем значение strLastName3 в вызывающую программу

'Parameters:
'[IN][OUT]  strОтчество , тип параметра: String  - ...
'Returns:
'  значение типа String
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
' variable = me.strLastName4(...параметры...)
Public Function strLastName4(strОтчество As String) As String
Attribute strLastName4.VB_HelpID = 100
' Функция предназначена для обработки падежа ОТЧЕСТВА - О КОМ в запросах
' разделение между мужским отчеством и отчеством женщин

strLetter = Right(strОтчество, 1) ' вырежем последнюю букву для анализа
' хоть и оба оканчиваются на "е", но у женщин буква заменяет "а",
' а у мужчин просто прибавляется - опять нужно разделять на мужиков и ...
Select Case strLetter
Case Is = "ч" ' мужик !!!
strLastName4 = strОтчество & "е" ' просто прибавим е
Case Is = "а" ' женское отчество
' Последнюю букву надо заменить на "е". Вечная проблема с женщинами
strLastName4 = mID(strОтчество, 1, Len(strОтчество) - 1) & "е"

End Select ' закончим конструкцию
End Function ' возвращаем значение strLastName4 в вызывающую программу

'Parameters:
'[IN][OUT]  strОтчество , тип параметра: String  - ...
'Returns:
'  значение типа String
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
' variable = me.strLastName5(...параметры...)
Public Function strLastName5(strОтчество As String) As String
Attribute strLastName5.VB_HelpID = 105
' Функция предназначена для обработки падежа ОТЧЕСТВА - в лице ... в запросах
' разделение между мужским отчеством и отчеством женщин

strLetter = Right(strОтчество, 1) ' вырежем последнюю букву для анализа
' хоть и оба оканчиваются на "е", но у женщин буква заменяет "а",
' а у мужчин просто прибавляется - опять нужно разделять на мужиков и ...
Select Case strLetter
Case Is = "ч" ' мужик !!!
strLastName5 = strОтчество & "а" ' просто прибавим е
Case Is = "а" ' женское отчество
' Последнюю букву надо заменить на "ы". Вечная проблема с женщинами
strLastName5 = mID(strОтчество, 1, Len(strОтчество) - 1) & "ы"

End Select ' закончим конструкцию
End Function

'Parameters:
'[IN][OUT]  strФамилия , тип параметра: String  - ...
'Returns:
'  значение типа String
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
' variable = me.strFirstName1(...параметры...)
Public Function strFirstName1(strФамилия As String) As String
Attribute strFirstName1.VB_HelpID = 60
' Функция предназнасена для обработки падежа ФАМИЛИЯ - КОГО в запросах
' разделение между мужским отчеством и отчеством женщин

strLetter = Right(strФамилия, 1) ' вырежем последнюю букву для анализа

Select Case strLetter
Case Is = "н", "в" ' мужик !!!
strFirstName1 = strФамилия & "а" ' просто прибавим а
Case Is = "а" ' женская фамилия
' Последнюю букву надо заменить на "у". Вечная проблема с женщинами
strFirstName1 = mID(strФамилия, 1, Len(strФамилия) - 1) & "у"
Case Else
strFirstName1 = strФамилия ' если фамилия не подходит под условия
End Select ' закончим конструкцию
End Function ' возвращаем значение strФамилияКого в вызывающую программу

'Parameters:
'[IN][OUT]  strФамилия , тип параметра: String  - ...
'Returns:
'  значение типа String
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
' variable = me.strFirstName2(...параметры...)
Public Function strFirstName2(strФамилия As String) As String
Attribute strFirstName2.VB_HelpID = 65
' Функция предназнасена для обработки падежа ФАМИЛИЯ - КОМУ в запросах
' разделение между мужским отчеством и отчеством женщин

strLetter = Right(strФамилия, 1) ' вырежем последнюю букву для анализа

Select Case strLetter
Case Is = "н", "в" ' мужик !!!
strFirstName2 = strФамилия & "у" ' просто прибавим у
Case Is = "а" ' женская фамилия
' Последнюю букву надо заменить на "ой". Вечная проблема с женщинами
strFirstName2 = mID(strФамилия, 1, Len(strФамилия) - 1) & "ой"
Case Else
strFirstName2 = strФамилия ' если фамилия не подходит под условия

End Select ' закончим конструкцию
End Function ' возвращаем значение strФамилияКому в вызывающую программу

'Parameters:
'[IN][OUT]  strФамилия , тип параметра: String  - ...
'Returns:
'  значение типа String
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
' variable = me.strFirstName3(...параметры...)
Public Function strFirstName3(strФамилия As String) As String
Attribute strFirstName3.VB_HelpID = 70
' Функция предназнасена для обработки падежа ФАМИЛИЯ - КЕМ в запросах
' разделение между мужским отчеством и отчеством женщин

strLetter = Right(strФамилия, 1) ' вырежем последнюю букву для анализа

Select Case strLetter
Case Is = "н", "в" ' мужик !!!
strFirstName3 = strФамилия & "ым" ' просто прибавим "ым"
Case Is = "а" ' женская фамилия
' Последнюю букву надо заменить на "ой". Вечная проблема с женщинами
strFirstName3 = mID(strФамилия, 1, Len(strФамилия) - 1) & "ой"
Case Else
strFirstName3 = strФамилия ' если фамилия не подходит под условия

End Select ' закончим конструкцию
End Function ' возвращаем значение strФамилияКем в вызывающую программу

'Parameters:
'[IN][OUT]  strФамилия , тип параметра: String  - ...
'Returns:
'  значение типа String
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
' variable = me.strFirstName4(...параметры...)
Public Function strFirstName4(strФамилия As String) As String
Attribute strFirstName4.VB_HelpID = 75
' Функция предназнасена для обработки падежа ФАМИЛИЯ - О КОМ в запросах
' разделение между мужским отчеством и отчеством женщин

strLetter = Right(strФамилия, 1) ' вырежем последнюю букву для анализа

Select Case strLetter
Case Is = "н", "в" ' мужик !!!
strFirstName4 = strФамилия & "е" ' просто прибавим е
Case Is = "а" ' женская фамилия
' Последнюю букву надо заменить на "ой". Вечная проблема с женщинами
strFirstName4 = mID(strФамилия, 1, Len(strФамилия) - 1) & "ой"
Case Else
strFirstName4 = strФамилия ' если фамилия не подходит под условия

End Select ' закончим конструкцию
End Function ' возвращаем значение strФамилияОКом в вызывающую программу

'Parameters:
'[IN][OUT]  strФамилия , тип параметра: String  - ...
'Returns:
'  значение типа String
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
' variable = me.strFirstName5(...параметры...)
Public Function strFirstName5(strФамилия As String) As String
Attribute strFirstName5.VB_HelpID = 80
' Функция предназнасена для обработки падежа ФАМИЛИЯ - в лице ... в запросах
' разделение между мужским отчеством и отчеством женщин

strLetter = Right(strФамилия, 1) ' вырежем последнюю букву для анализа

Select Case strLetter
Case Is = "н", "в" ' мужик !!!
strFirstName5 = strФамилия & "а" ' просто прибавим а
Case Is = "а" ' женская фамилия
' Последнюю букву надо заменить на "у". Вечная проблема с женщинами
strFirstName5 = mID(strФамилия, 1, Len(strФамилия) - 1) & "ой"
Case Else
strFirstName5 = strФамилия ' если фамилия не подходит под условия
End Select ' закончим конструкцию
End Function ' возвращаем значение strФамилияКого в вызывающую программу

'Parameters:
'[IN][OUT]  strИмя , тип параметра: String,
'[IN][OUT]   strОтчество , тип параметра: String  - ...
'Returns:
'  значение типа String
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
' variable = me.strName1(...параметры...)
Public Function strName1(strИмя As String, strОтчество As String) As String
Attribute strName1.VB_HelpID = 110
' Функция предназнасена для обработки падежа ИМЯ - КОГО в запросах
' разделение между мужским отчеством и отчеством женщин

strLetter = Right(strИмя, 1) ' вырежем последнюю букву для анализа

Select Case strLetter
Case Is = "а" ' заменим последнюю букву на "у"
strName1 = mID(strИмя, 1, Len(strИмя) - 1) & "у"
Case Is = "й" ' заменим последнюю букву на "я"
strName1 = mID(strИмя, 1, Len(strИмя) - 1) & "я"
Case Is = "я" ' заменим последнюю букву на "ю"
strName1 = mID(strИмя, 1, Len(strИмя) - 1) & "ю"
Case Is = "ь" ' сначала надо определить мужик или не мужик ?
If Right(strОтчество, 1) = "ч" Then ' мужик !!!
' и последнюю букву мужика заменим на "я"
strName1 = mID(strИмя, 1, Len(strИмя) - 1) & "я"
Else ' иначе это женцщина
strName1 = strИмя ' оставим все без изменений
End If
Case Else ' иначе всем остальным просто прибавим "а"
strName1 = strИмя & "а"

End Select ' закончим конструкцию Select
End Function ' возвращаем значение strИмяКого в вызывающую программу

'Parameters:
'[IN][OUT]  strИмя , тип параметра: String,
'[IN][OUT]   strОтчество , тип параметра: String  - ...
'Returns:
'  значение типа String
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
' variable = me.strName2(...параметры...)
Public Function strName2(strИмя As String, strОтчество As String) As String
Attribute strName2.VB_HelpID = 115
' Функция предназнасена для обработки падежа ИМЯ - КОМУ в запросах
' разделение между мужским отчеством и отчеством женщин

strLetter = Right(strИмя, 1) ' вырежем последнюю букву для анализа

Select Case strLetter
Case Is = "а" ' заменим последнюю букву на "е"
strName2 = mID(strИмя, 1, Len(strИмя) - 1) & "е"
Case Is = "й" ' заменим последнюю букву на "ю"
strName2 = mID(strИмя, 1, Len(strИмя) - 1) & "ю"
Case Is = "я" ' заменим последнюю букву на "и"
strName2 = mID(strИмя, 1, Len(strИмя) - 1) & "и"
Case Is = "ь" ' сначала надо определить мужик или не мужик ?
If Right(strОтчество, 1) = "ч" Then ' мужик !!!
' и последнюю букву мужика заменим на "ю"
strName2 = mID(strИмя, 1, Len(strИмя) - 1) & "ю"
Else ' это женщина и последнюю букву заменим на "и"
strName2 = mID(strИмя, 1, Len(strИмя) - 1) & "и"
End If
Case Else ' иначе всем остальным просто прибавим "у"
strName2 = strИмя & "у"

End Select ' закончим конструкцию Select
End Function ' возвращаем значение strName2 в вызывающую программу

'Parameters:
'[IN][OUT]  strИмя , тип параметра: String,
'[IN][OUT]   strОтчество , тип параметра: String  - ...
'Returns:
'  значение типа String
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
' variable = me.strName3(...параметры...)
Public Function strName3(strИмя As String, strОтчество As String) As String
Attribute strName3.VB_HelpID = 120
' Функция предназнасена для обработки падежа ИМЯ - КЕМ в запросах
' разделение между мужским отчеством и отчеством женщин

strLetter = Right(strИмя, 1) ' вырежем последнюю букву для анализа

Select Case strLetter
Case Is = "а" ' заменим последнюю букву на "ой"
strName3 = mID(strИмя, 1, Len(strИмя) - 1) & "ой"
Case Is = "й" ' заменим последнюю букву на "ем"
strName3 = mID(strИмя, 1, Len(strИмя) - 1) & "ем"
Case Is = "я" ' заменим последнюю букву на "ей"
strName3 = mID(strИмя, 1, Len(strИмя) - 1) & "ей"
Case Is = "ь" ' сначала надо определить мужик или не мужик ?
If Right(strОтчество, 1) = "ч" Then ' мужик !!!
' и последнюю букву мужика заменим на "ем"
strName3 = mID(strИмя, 1, Len(strИмя) - 1) & "ем"
Else ' иначе это женцщина
strName3 = strИмя & "ю" ' просто прибавим "ю"
End If
Case Else ' иначе всем остальным просто прибавим "ом"
strName3 = strИмя & "ом"

End Select ' закончим конструкцию Select
End Function ' возвращаем значение strName3 в вызывающую программу

'Parameters:
'[IN][OUT]  strИмя , тип параметра: String,
'[IN][OUT]   strОтчество , тип параметра: String  - ...
'Returns:
'  значение типа String
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
' variable = me.strName4(...параметры...)
Public Function strName4(strИмя As String, strОтчество As String) As String
Attribute strName4.VB_HelpID = 125
' Функция предназнасена для обработки падежа ИМЯ - О КОМ в запросах
' разделение между мужским отчеством и отчеством женщин

strLetter = Right(strИмя, 1) ' вырежем последнюю букву для анализа

Select Case strLetter
Case Is = "а" ' заменим последнюю букву на "е"
strName4 = mID(strИмя, 1, Len(strИмя) - 1) & "е"
Case Is = "й" ' заменим последнюю букву на "е"
strName4 = mID(strИмя, 1, Len(strИмя) - 1) & "е"
Case Is = "я" ' заменим последнюю букву на "и"
strName4 = mID(strИмя, 1, Len(strИмя) - 1) & "и"
Case Is = "ь" ' сначала надо определить мужик или не мужик ?
If Right(strОтчество, 1) = "ч" Then ' мужик !!!
' и последнюю букву мужика заменим на "е"
strName4 = mID(strИмя, 1, Len(strИмя) - 1) & "е"
Else ' иначе это женцщина и букву заменим на "и"
strName4 = mID(strИмя, 1, Len(strИмя) - 1) & "и"
End If
Case Else ' иначе всем остальным просто прибавим "а"
strName4 = strИмя & "е"

End Select ' закончим конструкцию Select
End Function ' возвращаем значение strName4 в вызывающую программу

'Parameters:
'[IN][OUT]  strИмя , тип параметра: String,
'[IN][OUT]   strОтчество , тип параметра: String  - ...
'Returns:
'  значение типа String
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
' variable = me.strName5(...параметры...)
Public Function strName5(strИмя As String, strОтчество As String) As String
Attribute strName5.VB_HelpID = 130
' Функция предназнасена для обработки падежа ИМЯ - КОГО в запросах
' разделение между мужским отчеством и отчеством женщин

strLetter = Right(strИмя, 1) ' вырежем последнюю букву для анализа

Select Case strLetter
Case Is = "а" ' заменим последнюю букву на "у"
strName5 = mID(strИмя, 1, Len(strИмя) - 1) & "ы"
Case Is = "й" ' заменим последнюю букву на "я"
strName5 = mID(strИмя, 1, Len(strИмя) - 1) & "я"
Case Is = "я" ' заменим последнюю букву на "и"
strName5 = mID(strИмя, 1, Len(strИмя) - 1) & "и"
Case Is = "ь" ' сначала надо определить мужик или не мужик ?
  If Right(strОтчество, 1) = "ч" Then ' мужик !!!
    ' и последнюю букву мужика заменим на "я"
    strName5 = mID(strИмя, 1, Len(strИмя) - 1) & "я"
  Else ' иначе это женцщина
    strName5 = strИмя ' оставим все без изменений
  End If
Case Else ' иначе всем остальным просто прибавим "а"
  strName5 = strИмя & "а"

End Select ' закончим конструкцию Select
End Function ' возвращаем значение strИмяКого в вызывающую программу
