Attribute VB_Name = "Support"
Option Explicit

Public Manager As MTZManager.Main

Public Function FormatDT(ByVal value As Date, Optional bFull As Boolean = False) As String
Dim tmpDateTime As Date
    If Manager.GetSession.IsORACLE Then
        'TO_DATE('2005-08-15','YYYY-MM-DD')
        If bFull Then
            FormatDT = MakeORACLEDate(value)
        Else
            tmpDateTime = DateSerial(Year(value), Month(value), Day(value))
            FormatDT = MakeORACLEDate(tmpDateTime)
        End If
        
    Else
        'FormatDT = Format(value, "yyyy-mm-dd HH:MM:SS")
        'FormatDT = Format(value, "yyyy-mm-dd")
        If bFull Then
            FormatDT = MakeMSSQLDate(value)
            
        Else
            tmpDateTime = DateSerial(Year(value), Month(value), Day(value))
            FormatDT = MakeMSSQLDate(tmpDateTime)
        End If
    End If
End Function
