VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Preprocessor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_HelpID = 450
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit
Private mOpenCode As String
Private mCloseCode As String
Private mOutput As String
Private mOut As String
Private mOutNL As String
'local variable(s) to hold property value(s)
Private mvarOpenCode As String 'local copy
Private mvarCloseCode As String 'local copy
Private mvarOuputClass As String 'local copy
Private mvarOutFunc As String 'local copy
Private mvarOutNLFunc As String 'local copy

'Parameters:
'[IN]   vData , тип параметра: String  - ...
'See Also:
'  CloseCode
'  Convert
'  OpenCode
'  OuputClass
'  OutFunc
'Example:
' dim value as Variant
' value = <значение>
' me.OutNLFunc = value
Public Property Let OutNLFunc(ByVal vData As String)
Attribute OutNLFunc.VB_HelpID = 480
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.OutNLFunc = 5
    mvarOutNLFunc = vData
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  CloseCode
'  Convert
'  OpenCode
'  OuputClass
'  OutFunc
'Example:
' dim variable as String
' variable = me.OutNLFunc
Public Property Get OutNLFunc() As String
    OutNLFunc = mvarOutNLFunc
End Property

'Parameters:
'[IN]   vData , тип параметра: String  - ...
'See Also:
'  CloseCode
'  Convert
'  OpenCode
'  OuputClass
'  OutNLFunc
'Example:
' dim value as Variant
' value = <значение>
' me.OutFunc = value
Public Property Let OutFunc(ByVal vData As String)
Attribute OutFunc.VB_HelpID = 475
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.OutFunc = 5
    mvarOutFunc = vData
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  CloseCode
'  Convert
'  OpenCode
'  OuputClass
'  OutNLFunc
'Example:
' dim variable as String
' variable = me.OutFunc
Public Property Get OutFunc() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.OutFunc
    OutFunc = mvarOutFunc
End Property

'Parameters:
'[IN]   vData , тип параметра: String  - ...
'See Also:
'  CloseCode
'  Convert
'  OpenCode
'  OutFunc
'  OutNLFunc
'Example:
' dim value as Variant
' value = <значение>
' me.OuputClass = value
Public Property Let OuputClass(ByVal vData As String)
Attribute OuputClass.VB_HelpID = 470
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.OuputClass = 5
    mvarOuputClass = vData
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  CloseCode
'  Convert
'  OpenCode
'  OutFunc
'  OutNLFunc
'Example:
' dim variable as String
' variable = me.OuputClass
Public Property Get OuputClass() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.OuputClass
    OuputClass = mvarOuputClass
End Property

'Parameters:
'[IN]   vData , тип параметра: String  - ...
'See Also:
'  Convert
'  OpenCode
'  OuputClass
'  OutFunc
'  OutNLFunc
'Example:
' dim value as Variant
' value = <значение>
' me.CloseCode = value
Public Property Let CloseCode(ByVal vData As String)
Attribute CloseCode.VB_HelpID = 455
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.CloseCode = 5
    mvarCloseCode = Left(vData & "~~", 2)
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  Convert
'  OpenCode
'  OuputClass
'  OutFunc
'  OutNLFunc
'Example:
' dim variable as String
' variable = me.CloseCode
Public Property Get CloseCode() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.CloseCode
    CloseCode = mvarCloseCode
End Property

'Parameters:
'[IN]   vData , тип параметра: String  - ...
'See Also:
'  CloseCode
'  Convert
'  OuputClass
'  OutFunc
'  OutNLFunc
'Example:
' dim value as Variant
' value = <значение>
' me.OpenCode = value
Public Property Let OpenCode(ByVal vData As String)
Attribute OpenCode.VB_HelpID = 465
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.OpenCode = 5
    mvarOpenCode = Left(vData & "~~", 2)
End Property

'Parameters:
' параметров нет
'Returns:
'  значение типа String
'See Also:
'  CloseCode
'  Convert
'  OuputClass
'  OutFunc
'  OutNLFunc
'Example:
' dim variable as String
' variable = me.OpenCode
Public Property Get OpenCode() As String
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.OpenCode
    OpenCode = mvarOpenCode
End Property




Private Sub BeforConvert()
  mOutput = mvarOuputClass
  If mvarOuputClass = "" Then
    mOut = mvarOutFunc
    mOutNL = mvarOutNLFunc
  Else
    mOut = mOutput & "." & mvarOutFunc
    mOutNL = mOutput & "." & mvarOutNLFunc
  End If
  mOpenCode = mvarOpenCode
  mCloseCode = mvarCloseCode
End Sub


Private Function DoubleQuoter(ByVal s As String) As String
  DoubleQuoter = Replace(s, """", """""")
End Function

'Parameters:
'[IN]   s , тип параметра: String  - ...
'Returns:
'  значение типа String
'See Also:
'  CloseCode
'  OpenCode
'  OuputClass
'  OutFunc
'  OutNLFunc
'Example:
' dim variable as String
' variable = me.Convert(<параметры>)
Public Function Convert(ByVal s As String) As String
Attribute Convert.VB_HelpID = 460
Dim Lines() As String
Dim Scr As Boolean
Dim res As String, i As Long
BeforConvert
Lines = Split(s, vbCrLf)
Scr = False
For i = 0 To UBound(Lines)
  'Debug.Print Lines(i)
  res = res & ConvertLine(Lines(i), Scr)
Next
Convert = res
End Function


Private Function ConvertLine(ByVal s As String, ByRef Scr As Boolean) As String
Dim res As String, pos As Long, epos As Long, spos As Long
If Not Scr Then
    If InStr(1, s, mOpenCode, vbTextCompare) = 0 Then
      res = res & mOutNL & " """ & DoubleQuoter(s) & """" & vbCrLf
    Else
      spos = 1
      pos = 1
      While pos > 0
        pos = InStr(spos, s, mOpenCode, vbTextCompare)
        If pos = 0 Then GoTo done1
        Scr = True
        epos = InStr(pos + 1, s, mCloseCode, vbTextCompare)
       
        If epos = 0 Then
          epos = Len(s) + 1
        Else
          Scr = False
        End If
        
        If pos - spos > 0 Then
          res = res & mOut & " """ & DoubleQuoter(Mid(s, spos, pos - spos)) & """" & vbCrLf
        End If
        If epos - 2 - pos > 0 Then
          res = res & vbCrLf & Mid(s, pos + 2, epos - pos - 2) & vbCrLf
        End If
        spos = epos + 2
      Wend
done1:
      If Not Scr Then
        If spos <= Len(s) Then
          res = res & mOutNL & " """ & DoubleQuoter(Mid(s, spos, Len(s) - spos + 1)) & """" & vbCrLf
        End If
      End If

    End If
  Else
    If InStr(1, s, mCloseCode, vbTextCompare) = 0 Then
      res = res & s & vbCrLf
    Else
      spos = 1
      pos = -1
      While pos <> 0
        pos = InStr(spos, s, mCloseCode, vbTextCompare)
        If pos = 0 Then GoTo Done2
        Scr = False
        epos = InStr(pos + 2, s, mOpenCode, vbTextCompare)
        If epos = 0 Then
          epos = Len(s) + 1
        Else
          Scr = True
        End If
        If pos - spos - 2 > 0 Then
          res = res & Mid(s, spos, pos - spos) & vbCrLf
        
        'Else
        '  res = res & vbCrLf
        End If
        If Mid(s, pos + 2, epos - pos - 2) <> "" Then
          res = res & mOutNL & " """ & DoubleQuoter(Mid(s, pos + 2, epos - pos - 2)) & """" & vbCrLf
        End If
        spos = epos + 2
      Wend
Done2:
      If Scr Then
        If spos <= Len(s) Then
          res = res & Mid(s, spos, Len(s) - spos + 1) & vbCrLf
        End If
      End If
    End If
  
  End If
  ConvertLine = res
End Function


Private Sub Class_Initialize()
  mvarOpenCode = "<%"
  mvarCloseCode = "%>"
  mvarOuputClass = "Response"
  mvarOutFunc = "Out"
  mvarOutNLFunc = "OutNL"
End Sub
