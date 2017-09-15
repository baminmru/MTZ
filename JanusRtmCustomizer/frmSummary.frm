VERSION 5.00
Begin VB.Form frmSummary 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Настройка внешнего вида"
   ClientHeight    =   2895
   ClientLeft      =   1620
   ClientTop       =   2235
   ClientWidth     =   6000
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   204
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmSummary.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2895
   ScaleWidth      =   6000
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdSaveLayout 
      Caption         =   "Сохранить установки"
      Height          =   315
      Left            =   2160
      TabIndex        =   6
      Top             =   2550
      Width           =   2055
   End
   Begin VB.CommandButton cmdLoadLayout 
      Caption         =   "Загрузить установки"
      Height          =   315
      Left            =   60
      TabIndex        =   5
      Top             =   2550
      Width           =   2055
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Height          =   315
      Left            =   4740
      TabIndex        =   7
      Top             =   2550
      Width           =   1175
   End
   Begin VB.Frame Frame1 
      Height          =   2475
      Left            =   30
      TabIndex        =   0
      Top             =   0
      Width           =   5910
      Begin VB.TextBox lblFormat 
         BackColor       =   &H8000000F&
         Height          =   465
         Left            =   1470
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   11
         Top             =   1890
         Width           =   4365
      End
      Begin VB.TextBox lblSort 
         BackColor       =   &H8000000F&
         Height          =   465
         Left            =   1470
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   10
         Top             =   1350
         Width           =   4365
      End
      Begin VB.TextBox lblGroups 
         BackColor       =   &H8000000F&
         Height          =   465
         Left            =   1470
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   9
         Top             =   810
         Width           =   4365
      End
      Begin VB.TextBox lblFields 
         BackColor       =   &H8000000F&
         Height          =   465
         Left            =   1470
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   8
         Top             =   270
         Width           =   4365
      End
      Begin VB.CommandButton cmdFormat 
         Caption         =   "Формат"
         Height          =   345
         Left            =   135
         TabIndex        =   4
         Top             =   1980
         Width           =   1245
      End
      Begin VB.CommandButton cmdSort 
         Caption         =   "Сортировка"
         Height          =   345
         Left            =   135
         TabIndex        =   3
         Top             =   1425
         Width           =   1245
      End
      Begin VB.CommandButton cmdGroup 
         Caption         =   "Группировка"
         Height          =   345
         Left            =   135
         TabIndex        =   2
         Top             =   870
         Width           =   1245
      End
      Begin VB.CommandButton cmdFields 
         Caption         =   "Поля"
         Height          =   345
         Left            =   135
         TabIndex        =   1
         Top             =   315
         Width           =   1245
      End
   End
End
Attribute VB_Name = "frmSummary"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_HelpID = 105
Option Explicit

Dim m_object As Object
Dim m_Name As String

Private Sub cmdFields_Click()
    Dim frm As frmShowfields
    Set frm = New frmShowfields
    
    If (Not m_object Is Nothing) Then
      If frm.ShowFields(m_object) Then
          LoadFieldNames
      End If
    End If
    
    Unload frm
    Set frm = Nothing
End Sub

Private Sub cmdFormat_Click()
    If (Not m_object Is Nothing) Then
      If m_object.View = jgexTable Then
          Dim frm As frmTableview
          Set frm = New frmTableview
          frm.FormatGrid m_object
          Unload frm
          Set frm = Nothing
      Else
          Dim frmc As frmCardView
          Set frmc = New frmCardView
          frmCardView.FormatGrid m_object
          Unload frmc
          Set frmc = Nothing
      End If
    End If
End Sub

Private Sub cmdGroup_Click()
    Dim frm As frmGroupBy
    
    If (Not m_object Is Nothing) Then
      Set frm = New frmGroupBy
      Call frm.GroupGrid(m_object)
      LoadGroupNames
      Unload frm
    End If
End Sub

Private Sub cmdLoadLayout_Click()
  Dim s As String

  If (Not m_object Is Nothing) Then
    s = GetSetting("MTZ", "CONFIG", "LAYOUTS", "")
    If s = "" Then Exit Sub
    Dim cnt As Long
    cnt = m_object.ItemCount
    m_object.LoadLayout s & m_Name & ".glt"
    m_object.ItemCount = cnt
  End If
End Sub

Private Sub cmdOK_Click()
    Call cmdSaveLayout_Click
    Hide
End Sub

Private Sub cmdSaveLayout_Click()
If (Not m_object Is Nothing) Then
  On Error GoTo bye
  Dim s As String
  s = GetSetting("MTZ", "CONFIG", "LAYOUTS", "")
  If s = "" Then Exit Sub
  Dim cnt As Long
  cnt = m_object.ItemCount
  m_object.ItemCount = 0
  m_object.SaveLayout s & m_Name & ".glt"
  m_object.ItemCount = cnt
  Exit Sub
bye:
    MsgBox Err.Description
End If
End Sub

Private Sub cmdSort_Click()
  If (Not m_object Is Nothing) Then
      Dim frm As frmSort
      Set frm = New frmSort
      
      frm.SortGrid m_object
      LoadSortNames
      
      Unload frm
      Set frm = Nothing
  End If
End Sub

'Parameters:
'[IN][OUT]  gr , тип параметра: Object,
'[IN]   name , тип параметра: String  - ...
'Example:
'  call me.ShowSummary(...параметры...)
Public Sub ShowSummary(gr As Object, ByVal name As String)
Attribute ShowSummary.VB_HelpID = 110
    Dim strTemp As String
    m_Name = name
    
    If (Not gr Is Nothing) Then
      Set m_object = gr
      LoadFieldNames
      LoadGroupNames
      LoadSortNames
    End If
    strTemp = "Фонты и остальное"
    If gr.View = jgexCard Then
        strTemp = strTemp & "/Карточка"
        cmdGroup.Enabled = False
    Else
        strTemp = strTemp & "/Таблица"
    End If
    strTemp = strTemp & "/Установки"
    lblFormat = strTemp
    Show 1
    Set m_object = Nothing
    Unload Me
End Sub

Private Sub LoadFieldNames()
If (Not m_object Is Nothing) Then
  Dim strTemp As String
  Dim c As JSColumn
  
      For Each c In m_object.Columns
          If c.Visible Then
              strTemp = strTemp & c.Caption & ", "
          End If
      Next
      strTemp = Left(strTemp, Len(strTemp) - 2)
      lblFields = strTemp
End If

End Sub

Private Sub LoadGroupNames()
If (Not m_object Is Nothing) Then
  Dim strTemp As String
  Dim c As JSColumn
  Dim gr As JSGroup
  
      For Each gr In m_object.Groups
          Set c = m_object.Columns(gr.ColIndex)
          strTemp = strTemp & c.Caption
          If gr.SortOrder = jgexSortAscending Then
              strTemp = strTemp & " (по возрастанию), "
          Else
              strTemp = strTemp & " (по убыванию), "
          End If
      Next
      If strTemp = "" Then
          strTemp = "Нет"
      Else
          strTemp = Left(strTemp, Len(strTemp) - 2)
      End If
      lblGroups = strTemp
End If
End Sub


Private Sub LoadSortNames()
If (Not m_object Is Nothing) Then
  Dim strTemp As String
  Dim c As JSColumn
  Dim sk As JSSortKey
  
      For Each sk In m_object.SortKeys
          Set c = m_object.Columns(sk.ColIndex)
          strTemp = strTemp & c.Caption
          If sk.SortOrder = jgexSortAscending Then
              strTemp = strTemp & " (по возрастанию), "
          Else
              strTemp = strTemp & " (по убыванию), "
          End If
      Next
      If strTemp = "" Then
          strTemp = "Нет"
      Else
          strTemp = Left(strTemp, Len(strTemp) - 2)
      End If
      lblSort = strTemp
End If
End Sub

