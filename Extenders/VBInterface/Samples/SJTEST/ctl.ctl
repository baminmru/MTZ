VERSION 5.00
Begin VB.UserControl ctl 
   ClientHeight    =   6930
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6540
   ScaleHeight     =   6930
   ScaleWidth      =   6540
   Begin VB.ListBox List1 
      Height          =   2400
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   6255
   End
   Begin VB.Frame Frame1 
      Height          =   4215
      Left            =   120
      TabIndex        =   0
      Top             =   2640
      Width           =   6255
      Begin VB.Line Line1 
         X1              =   120
         X2              =   4440
         Y1              =   240
         Y2              =   3960
      End
      Begin VB.Line Line2 
         X1              =   360
         X2              =   2520
         Y1              =   1680
         Y2              =   600
      End
      Begin VB.Line Line3 
         X1              =   1440
         X2              =   3480
         Y1              =   3000
         Y2              =   1560
      End
      Begin VB.Line Line4 
         X1              =   1560
         X2              =   4200
         Y1              =   600
         Y2              =   2760
      End
      Begin VB.Line Line5 
         X1              =   480
         X2              =   2280
         Y1              =   1200
         Y2              =   3120
      End
      Begin VB.Line Line6 
         X1              =   600
         X2              =   3720
         Y1              =   2400
         Y2              =   1080
      End
      Begin VB.Line Line7 
         X1              =   2040
         X2              =   1800
         Y1              =   480
         Y2              =   3240
      End
      Begin VB.Line Line8 
         X1              =   360
         X2              =   3840
         Y1              =   1440
         Y2              =   1920
      End
      Begin VB.Line Line9 
         X1              =   1320
         X2              =   1320
         Y1              =   720
         Y2              =   2880
      End
      Begin VB.Line Line10 
         X1              =   2640
         X2              =   2400
         Y1              =   960
         Y2              =   2880
      End
      Begin VB.Line Line11 
         X1              =   840
         X2              =   600
         Y1              =   1200
         Y2              =   1800
      End
      Begin VB.Line Line12 
         X1              =   3120
         X2              =   3120
         Y1              =   1440
         Y2              =   2160
      End
      Begin VB.Line Line13 
         X1              =   1560
         X2              =   2160
         Y1              =   2640
         Y2              =   2760
      End
      Begin VB.Line Line14 
         X1              =   1680
         X2              =   2640
         Y1              =   840
         Y2              =   840
      End
   End
End
Attribute VB_Name = "ctl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Public Item As Object
Public Host As Object
Public ModalMode As Boolean
Public ParentForm As Object
Public TargetPlatformID As String

Private objJournalExtender As STDJournalExt.Application


Public Sub OnInit(aItem As Object, ConfigObjectID As String, Optional pForm As Object = Nothing)
Dim i As Long
    Set objJournalExtender = aItem.Application.Manager.GetInstanceObject(ConfigObjectID)
    Set Item = aItem
    List1.AddItem "Journal name=" + CStr(objJournalExtender.STDJournlaExtInfo.Item(1).TheName)
    List1.AddItem "Journal ID=" + CStr(objJournalExtender.STDJournlaExtInfo.Item(1).TheJournalRef.ID)
    
    For i = 1 To objJournalExtender.STDJournalExtParam.Count
        Dim sList As String
        sList = objJournalExtender.STDJournalExtParam.Item(i).ParamName
        sList = sList + ParseAndCall(Item, objJournalExtender.STDJournalExtParam.Item(i).fieldName)
        List1.AddItem sList
    Next
    
End Sub

Private Function ParseAndCall(ByRef objObject, ByVal CallString) As Variant
Dim tmpObj As Object
Dim v
Dim i As Long
    If Left(CallString, 1) = "." Then
        CallString = Right(CallString, Len(CallString) - 1)
    End If
    If InStr(CallString, ".") > 0 Then
        v = Split(CallString, ".")
        For i = LBound(v) To i = UBound(v) - 1
            Set tmpObj = CallByName(objObject, CStr(v(i)), VbGet, Nothing)
        Next
        ParseAndCall = CallByName(objObject, CStr(v(UBound(v))), VbGet, Nothing)
    Else
        ParseAndCall = CallByName(objObject, CallString, VbGet)
    End If
End Function

Public Sub OnTabClick()
    UserControl_Resize
End Sub

Public Sub OnClick(aItem As Object, Optional pForm As Object = Nothing)
    Debug.Print "...Dummy OnClick..." + vbCrLf
End Sub

Public Sub OnSave()
    Debug.Print "...Dummy onsave..." + vbCrLf
End Sub


Public Sub Save()
    Debug.Print "...Dummy save..." + vbCrLf
End Sub

Public Function IsChanged() As Boolean
  IsChanged = False
End Function

Public Sub CloseClass()
    Debug.Print "...Dummy CloseClass..." + vbCrLf
End Sub

Private Sub UserControl_Initialize()
    List1.Left = 0
    List1.Top = 0
    List1.Height = CLng(Height / 2)
    List1.Width = Width
    Frame1.Top = CLng(Height / 2)
    Frame1.Left = 0
    Frame1.Height = CLng(Height / 2)
    Frame1.Width = Width
End Sub

Private Sub UserControl_Resize()
    List1.Left = 0
    List1.Top = 0
    List1.Height = CLng(Height / 2)
    List1.Width = Width
    Frame1.Top = CLng(Height / 2)
    Frame1.Left = 0
    Frame1.Height = CLng(Height / 2)
    Frame1.Width = Width
End Sub
