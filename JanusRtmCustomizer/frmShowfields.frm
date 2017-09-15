VERSION 5.00
Begin VB.Form frmShowfields 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Настройка колонок"
   ClientHeight    =   3960
   ClientLeft      =   2175
   ClientTop       =   2145
   ClientWidth     =   7335
   Icon            =   "frmShowfields.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3960
   ScaleWidth      =   7335
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   315
      Left            =   6135
      TabIndex        =   6
      Top             =   300
      Width           =   1175
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Отмена"
      Height          =   315
      Left            =   6135
      TabIndex        =   7
      Top             =   690
      Width           =   1175
   End
   Begin VB.CommandButton cmdDown 
      Caption         =   "u"
      BeginProperty Font 
         Name            =   "Marlett"
         Size            =   8.25
         Charset         =   2
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   6135
      TabIndex        =   9
      Top             =   3540
      Width           =   315
   End
   Begin VB.CommandButton cmdUp 
      Caption         =   "t"
      BeginProperty Font 
         Name            =   "Marlett"
         Size            =   8.25
         Charset         =   2
         Weight          =   500
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   345
      Left            =   6135
      TabIndex        =   8
      Top             =   1470
      Width           =   315
   End
   Begin VB.CommandButton cmdRemove 
      Caption         =   "<- Удалить"
      Height          =   315
      Left            =   2475
      TabIndex        =   3
      Top             =   720
      Width           =   1175
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "Добавить ->"
      Height          =   315
      Left            =   2475
      TabIndex        =   2
      Top             =   330
      Width           =   1175
   End
   Begin VB.ListBox lstVisible 
      Height          =   3570
      Left            =   3660
      TabIndex        =   5
      Top             =   330
      Width           =   2415
   End
   Begin VB.ListBox lstAvail 
      Height          =   3570
      Left            =   30
      TabIndex        =   1
      Top             =   345
      Width           =   2415
   End
   Begin VB.Label lblcaption 
      Caption         =   "Отображаемые поля и порядок:"
      Height          =   255
      Index           =   1
      Left            =   3705
      TabIndex        =   4
      Top             =   30
      Width           =   2460
   End
   Begin VB.Label lblcaption 
      Caption         =   "Возможные поля:"
      Height          =   255
      Index           =   0
      Left            =   45
      TabIndex        =   0
      Top             =   75
      Width           =   1800
   End
End
Attribute VB_Name = "frmShowfields"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 85
Option Explicit
Option Compare Text
Private m_gr As Object
Dim m_OK As Boolean

'Parameters:
'[IN][OUT]  gr , тип параметра: Object  - ...
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'Example:
' dim variable as Boolean
' variable = me.ShowFields(...параметры...)
Public Function ShowFields(gr As Object) As Boolean
Attribute ShowFields.VB_HelpID = 90
Dim c As JSColumn
Dim strName As String
Dim i As Integer

    m_OK = False
    Set m_gr = gr
    For i = 1 To gr.Columns.Count
        Set c = gr.Columns.ItemByPosition(i)
        strName = c.Caption
        If Not c.Visible Then
            lstAvail.AddItem strName
            lstAvail.ItemData(lstAvail.NewIndex) = c.Index
        Else
            lstVisible.AddItem strName
            lstVisible.ItemData(lstVisible.NewIndex) = c.Index
        End If
    Next
    On Error Resume Next
    lstAvail.ListIndex = 0
    lstVisible.ListIndex = 0
    Show 1
    If m_OK Then
        ShowFields = True
        For i = 0 To lstAvail.ListCount - 1
            Set c = gr.Columns(lstAvail.ItemData(i))
            c.Visible = False
        Next
        For i = 0 To lstVisible.ListCount - 1
            Set c = gr.Columns(lstVisible.ItemData(i))
            c.Visible = True
            c.ColPosition = i + 1
        Next
    End If
    Unload Me
End Function

Private Sub cmdAdd_Click()
Dim ColIndex As Integer
Dim ColText As String
Dim lngListindex As Long

Dim c As JSColumn
    lstAvail.SetFocus
    If lstAvail.ListIndex = -1 Then Exit Sub
    lngListindex = lstAvail.ListIndex
    
    ColIndex = lstAvail.ItemData(lngListindex)
    ColText = lstAvail.Text
    lstAvail.RemoveItem lngListindex
    lstVisible.AddItem ColText
    lstVisible.ItemData(lstVisible.NewIndex) = ColIndex
    If lstAvail.ListCount - 1 >= lngListindex Then
        lstAvail.ListIndex = lngListindex
    Else
        lstAvail.ListIndex = lngListindex - 1
    End If
    lstVisible.ListIndex = lstVisible.NewIndex
    EnableButtons
    
End Sub


Private Sub EnableButtons()

    cmdAdd.Enabled = (lstAvail.ListIndex <> -1)
    cmdRemove.Enabled = (lstVisible.ListIndex <> -1)
    cmdUp.Enabled = (lstVisible.ListIndex > 0)
    cmdDown.Enabled = (lstVisible.ListIndex < lstVisible.ListCount - 1)
    
End Sub

Private Sub cmdCancel_Click()
    Hide
End Sub

Private Sub cmdDown_Click()
Dim ColIndex As Long
Dim ColText As String
Dim lngListindex As Long


    If lstVisible.ListIndex = -1 Or lstVisible.ListIndex = lstVisible.ListCount - 1 Then Exit Sub
    With lstVisible
        lngListindex = .ListIndex
        ColText = .Text
        ColIndex = .ItemData(lngListindex)
        .RemoveItem lngListindex
        lngListindex = lngListindex + 1
        .AddItem ColText, lngListindex
        .ItemData(.NewIndex) = ColIndex
        .ListIndex = .NewIndex
        .SetFocus
    End With
    EnableButtons

End Sub

Private Sub cmdOK_Click()
    m_OK = True
    Hide
End Sub

Private Sub cmdRemove_Click()
Dim ColIndex As Integer
Dim ColText As String
Dim lngListindex As Long

Dim c As JSColumn
    lstVisible.SetFocus
    If lstVisible.ListIndex = -1 Then Exit Sub
    lngListindex = lstVisible.ListIndex
    
    ColIndex = lstVisible.ItemData(lngListindex)
    ColText = lstVisible.Text
    lstVisible.RemoveItem lngListindex
    lstAvail.AddItem ColText
    lstAvail.ItemData(lstAvail.NewIndex) = ColIndex
    If lstVisible.ListCount - 1 >= lngListindex Then
        lstVisible.ListIndex = lngListindex
    Else
        lstVisible.ListIndex = lngListindex - 1
    End If
    lstAvail.ListIndex = lstAvail.NewIndex
    EnableButtons
    
End Sub


Private Sub cmdUp_Click()
Dim ColIndex As Long
Dim ColText As String
Dim lngListindex As Long


    If lstVisible.ListIndex <= 0 Then Exit Sub
    With lstVisible
        lngListindex = .ListIndex
        ColText = .Text
        ColIndex = .ItemData(lngListindex)
        .RemoveItem lngListindex
        If lngListindex > 0 Then lngListindex = lngListindex - 1
        .AddItem ColText, lngListindex
        .ItemData(.NewIndex) = ColIndex
        .ListIndex = .NewIndex
        .SetFocus
    End With
    EnableButtons
    
End Sub

Private Sub lstAvail_DblClick()

    cmdAdd_Click
    
End Sub


Private Sub lstVisible_Click()
    EnableButtons
    
End Sub

Private Sub lstVisible_DblClick()
    'cmdRemove_Click
    Set fmFieldInfo.c = m_gr.Columns.Item(lstVisible.ItemData(lstVisible.ListIndex))
    fmFieldInfo.Show vbModal
End Sub


