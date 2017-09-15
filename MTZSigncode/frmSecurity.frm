VERSION 5.00
Begin VB.Form frmSecurity 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Настройка стиля защиты"
   ClientHeight    =   6735
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6615
   Icon            =   "frmSecurity.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   6735
   ScaleWidth      =   6615
   Begin VB.CommandButton cmdClearTypeStyle 
      Caption         =   "Сбросить умолчание для типа"
      Height          =   375
      Left            =   3240
      TabIndex        =   14
      Top             =   1800
      Width           =   3255
   End
   Begin VB.CommandButton cmdOpen 
      Caption         =   "Редактировать"
      Height          =   375
      Left            =   5040
      TabIndex        =   13
      Top             =   1320
      Width           =   1455
   End
   Begin VB.CommandButton cmdTypeDefault 
      Caption         =   "Умолчание для типа"
      Height          =   375
      Left            =   120
      TabIndex        =   12
      Top             =   1800
      Width           =   3015
   End
   Begin VB.CommandButton cmdEraseStyle 
      Caption         =   "Очистить стиль"
      Height          =   375
      Left            =   5040
      TabIndex        =   11
      Top             =   720
      Width           =   1455
   End
   Begin VB.CommandButton cmdAddStyle 
      Caption         =   "Добавить стиль "
      Height          =   375
      Left            =   5040
      TabIndex        =   7
      Top             =   240
      Width           =   1455
   End
   Begin VB.Frame Frame1 
      Caption         =   "Добавить записи"
      Height          =   4335
      Left            =   120
      TabIndex        =   2
      Top             =   2280
      Width           =   6375
      Begin VB.CommandButton cmdSellAllGrp 
         Caption         =   "выбрать все"
         Height          =   315
         Left            =   3300
         TabIndex        =   17
         Top             =   180
         Width           =   1335
      End
      Begin VB.CommandButton cmdClearAllGrp 
         Caption         =   "отменить все"
         Height          =   315
         Left            =   4710
         TabIndex        =   16
         Top             =   165
         Width           =   1335
      End
      Begin VB.ListBox cmbGroups 
         Height          =   1410
         Left            =   225
         Style           =   1  'Checkbox
         TabIndex        =   15
         Top             =   525
         Width           =   5865
      End
      Begin VB.CommandButton cmdUnselAll 
         Caption         =   "отменить все"
         Height          =   315
         Left            =   4770
         TabIndex        =   10
         Top             =   2145
         Width           =   1335
      End
      Begin VB.CommandButton cmdSelAll 
         Caption         =   "выбрать все"
         Height          =   315
         Left            =   3360
         TabIndex        =   9
         Top             =   2160
         Width           =   1335
      End
      Begin VB.CommandButton cmdAddRigth 
         Caption         =   "Добавить права в стиль"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   204
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   405
         Left            =   2595
         TabIndex        =   8
         Top             =   3795
         Width           =   3540
      End
      Begin VB.CheckBox chkAllow 
         Caption         =   "Разрешить"
         Height          =   255
         Left            =   240
         TabIndex        =   6
         Top             =   3720
         Width           =   1335
      End
      Begin VB.ListBox lstRights 
         Height          =   1185
         Left            =   240
         Sorted          =   -1  'True
         Style           =   1  'Checkbox
         TabIndex        =   4
         Top             =   2475
         Width           =   5895
      End
      Begin VB.Label Label3 
         Caption         =   "Права"
         Height          =   255
         Left            =   210
         TabIndex        =   5
         Top             =   2175
         Width           =   3615
      End
      Begin VB.Label Label1 
         Caption         =   "Группа"
         Height          =   375
         Left            =   240
         TabIndex        =   3
         Top             =   240
         Width           =   1215
      End
   End
   Begin VB.ListBox lstStyles 
      Height          =   1425
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   4815
   End
   Begin VB.Label Label2 
      Caption         =   "Стиль защиты"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   0
      Width           =   2655
   End
End
Attribute VB_Name = "frmSecurity"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim gcol As Collection


Private Sub cmdAddRigth_Click()
Dim ss As MTZSecurity.Application
If lstStyles.ListIndex = -1 Then Exit Sub
If cmbGroups.SelCount = 0 Then Exit Sub
If lstRights.SelCount = 0 Then Exit Sub


Set ss = Manager.GetInstanceObject(gcol.item(lstStyles.ListIndex + 1).ID)
If ss Is Nothing Then Exit Sub

Dim i As Long, j As Long
For j = 0 To cmbGroups.ListCount - 1
  If cmbGroups.Selected(j) Then
    For i = 0 To lstRights.ListCount - 1
      If lstRights.Selected(i) Then
       With ss.MTZSEC_RIGHT.Add
        If chkAllow.Value = vbChecked Then
          .Allow = Boolean_Da
        Else
          .Allow = Boolean_Net
        End If
        .ProtectedItem = lstRights.List(i)
        Set .TheGroup = usr.Groups.item(j + 1)
        .Save
       End With
      End If
    Next
  End If
Next


End Sub

Private Sub cmdAddStyle_Click()
Dim n As String
n = InputBox("Название стиля", "Новый стиль защиты")
If n <> "" Then

On Error GoTo bye
Manager.NewInstance CreateGUID2, "MTZSecurity", n
ReloadStyles
End If
Exit Sub
bye:
 MsgBox Err.Description, vbOKOnly + vbCritical, "Настройка стиля защиты"
End Sub

Private Sub ReloadStyles()
On Error GoTo bye
  Dim rs As ADODB.Recordset
  Dim gm As GroupMap
  Set rs = Manager.ListInstances("", "MTZSecurity")
  Set gcol = New Collection
 lstStyles.Clear
  While Not rs.EOF
    lstStyles.AddItem rs!Name
    Set gm = New GroupMap
    gm.ID = rs!InstanceID
    gm.Name = rs!Name
    gcol.Add gm
    rs.MoveNext
  Wend
  rs.Close
  Set rs = Nothing
  
  Exit Sub
bye:
 MsgBox Err.Description, vbOKOnly + vbCritical, "Настройка стиля защиты"
End Sub


Private Sub cmdClearAllGrp_Click()
Dim i As Long
For i = 0 To cmbGroups.ListCount - 1
  cmbGroups.Selected(i) = False
Next

End Sub

Private Sub cmdClearTypeStyle_Click()
Dim f As frmTypeList

Set f = New frmTypeList
f.Show vbModal

If f.ok Then
On Error GoTo bye
  Call Session.SetDefaultSecurityStyle(f.TypeName, "")
End If
Exit Sub
bye:
 MsgBox Err.Description, vbOKOnly + vbCritical, "Настройка стиля защиты"
End Sub

Private Sub cmdEraseStyle_Click()
Dim ss As MTZSecurity.Application
If lstStyles.ListIndex = -1 Then Exit Sub
Set ss = Manager.GetInstanceObject(gcol.item(lstStyles.ListIndex + 1).ID)
If ss Is Nothing Then Exit Sub

If MsgBox("Удалить всеразрешения и запрещения для данного стиля?", vbYesNo + vbQuestion, "Настройка стиля защиты") = vbYes Then
  On Error GoTo bye
  While ss.MTZSEC_RIGHT.Count > 0
    ss.MTZSEC_RIGHT.item(1).Delete
    ss.MTZSEC_RIGHT.Refresh
    Me.Caption = ss.MTZSEC_RIGHT.Count
    DoEvents
  Wend
End If
Exit Sub
bye:
MsgBox Err.Description, vbOKOnly + vbExclamation, "Очистка стиля защиты"

End Sub

Private Sub cmdOpen_Click()

If lstStyles.ListIndex = -1 Then Exit Sub

Dim obj As Object
On Error GoTo bye
Set obj = Manager.GetInstanceGUI(gcol.item(lstStyles.ListIndex + 1).ID, Session.site)
obj.Show "", Manager.GetInstanceObject(gcol.item(lstStyles.ListIndex + 1).ID, Session.site), True

Exit Sub
bye:
 MsgBox Err.Description, vbOKOnly + vbCritical, "Настройка стиля защиты"
End Sub

Private Sub cmdSelAll_Click()
Dim i As Long
For i = 0 To lstRights.ListCount - 1
  lstRights.Selected(i) = True
Next
End Sub

Private Sub cmdSellAllGrp_Click()
Dim i As Long
For i = 0 To cmbGroups.ListCount - 1
  cmbGroups.Selected(i) = True
Next

End Sub

Private Sub cmdTypeDefault_Click()
Dim f As frmTypeList
If lstStyles.ListIndex = -1 Then Exit Sub

Set f = New frmTypeList
f.Show vbModal


If f.ok Then
On Error GoTo bye
  Call Session.SetDefaultSecurityStyle(f.TypeName, gcol.item(lstStyles.ListIndex + 1).ID)
End If
Exit Sub
bye:
 MsgBox Err.Description, vbOKOnly + vbCritical, "Настройка стиля защиты"
End Sub

Private Sub cmdUnselAll_Click()
  Dim i As Long
  For i = 0 To lstRights.ListCount - 1
    lstRights.Selected(i) = False
  Next
End Sub


Private Sub Form_Load()
Dim rs As ADODB.Recordset
Dim gm As GroupMap
On Error GoTo bye
Set rs = Manager.ListInstances("", "MTZSecurity")
Set gcol = New Collection
lstStyles.Clear
While Not rs.EOF
  lstStyles.AddItem rs!Name
  Set gm = New GroupMap
  gm.ID = rs!InstanceID
  gm.Name = rs!Name
  gcol.Add gm
  rs.MoveNext
Wend
rs.Close
Set rs = Nothing

lstRights.Clear


With lstRights
  .AddItem "DEFAULT"
  .AddItem "BRIEF"
  .AddItem "DELETE"
  .AddItem "LOCKINSTANCE"
  .AddItem "SECURE"
  .AddItem "EDIT"
  .AddItem "DELETEROW"
  .AddItem "CREATE"
  .AddItem "LOCKROW"
  .AddItem "CREATEROW"
  .AddItem "EDITROW"
  .AddItem "XMLSAVE"
  .AddItem "XMLLOAD"
  .AddItem "CUSTOMIZE"
  .AddItem "STATUS"
  .AddItem "OPEN"
  
End With

Dim i As Long, j As Long, k As Long
'For i = 1 To model.OBJECTTYPE.Count
'  lstRights.AddItem model.OBJECTTYPE.item(i).Name & ":"
'  For k = 1 To model.OBJECTTYPE.item(i).OBJECTMODE.Count
'    lstRights.AddItem model.OBJECTTYPE.item(i).Name & ":" & model.OBJECTTYPE.item(i).OBJECTMODE.item(k).Name
'  Next
'  For k = 1 To model.OBJECTTYPE.item(i).PART.Count
'   lstRights.AddItem "EDITROW:" & model.OBJECTTYPE.item(i).PART.item(k).Name
'  Next
'Next

cmbGroups.Clear

For i = 1 To usr.Groups.Count
  cmbGroups.AddItem usr.Groups.item(i).Name
Next
Exit Sub
bye:
 MsgBox Err.Description, vbOKOnly + vbCritical, "Настройка стиля защиты"

End Sub



