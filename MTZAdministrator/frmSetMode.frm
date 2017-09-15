VERSION 5.00
Object = "{BEEECC20-4D5F-4F8B-BFDC-5D9B6FBDE09D}#1.0#0"; "vsflex8.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frmSetMode 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Управление режимами работы типов объектов"
   ClientHeight    =   10335
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   12105
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   10335
   ScaleWidth      =   12105
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdExportField 
      Caption         =   "EXPORT FIELD"
      Height          =   315
      Left            =   10680
      TabIndex        =   9
      Top             =   60
      Visible         =   0   'False
      Width           =   1395
   End
   Begin MSComDlg.CommonDialog dlg 
      Left            =   10500
      Top             =   1080
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
   End
   Begin VB.CommandButton cmdExportPart 
      Caption         =   "EXCEL PART"
      Height          =   315
      Left            =   9480
      TabIndex        =   8
      Top             =   60
      Visible         =   0   'False
      Width           =   1155
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "Save"
      Height          =   315
      Left            =   8520
      TabIndex        =   7
      ToolTipText     =   "Сохранить"
      Top             =   60
      Width           =   855
   End
   Begin VB.CommandButton cmdRefresh 
      Caption         =   "Refresh"
      Height          =   315
      Left            =   7560
      TabIndex        =   6
      ToolTipText     =   "Обновить содержимое"
      Top             =   60
      Width           =   855
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "+"
      Height          =   315
      Left            =   7020
      TabIndex        =   5
      ToolTipText     =   "Добавить режим"
      Top             =   60
      Width           =   375
   End
   Begin VB.CommandButton cmdTObject 
      Caption         =   "..."
      Height          =   315
      Left            =   6600
      TabIndex        =   4
      ToolTipText     =   "Выбор типа документа"
      Top             =   60
      Width           =   375
   End
   Begin VB.TextBox txtTObject 
      Height          =   315
      Left            =   1380
      Locked          =   -1  'True
      TabIndex        =   3
      Top             =   60
      Width           =   5175
   End
   Begin VSFlex8Ctl.VSFlexGrid gr 
      Align           =   2  'Align Bottom
      Height          =   6735
      Left            =   0
      TabIndex        =   0
      Top             =   3600
      Width           =   12105
      _cx             =   21352
      _cy             =   11880
      Appearance      =   1
      BorderStyle     =   1
      Enabled         =   -1  'True
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New CYR"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MousePointer    =   0
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      BackColorFixed  =   -2147483633
      ForeColorFixed  =   -2147483630
      BackColorSel    =   8421376
      ForeColorSel    =   -2147483639
      BackColorBkg    =   -2147483636
      BackColorAlternate=   -2147483643
      GridColor       =   -2147483633
      GridColorFixed  =   -2147483632
      TreeColor       =   -2147483632
      FloodColor      =   192
      SheetBorder     =   -2147483642
      FocusRect       =   2
      HighLight       =   1
      AllowSelection  =   -1  'True
      AllowBigSelection=   -1  'True
      AllowUserResizing=   1
      SelectionMode   =   3
      GridLines       =   1
      GridLinesFixed  =   2
      GridLineWidth   =   1
      Rows            =   2
      Cols            =   1
      FixedRows       =   2
      FixedCols       =   0
      RowHeightMin    =   0
      RowHeightMax    =   0
      ColWidthMin     =   0
      ColWidthMax     =   0
      ExtendLastCol   =   0   'False
      FormatString    =   $"frmSetMode.frx":0000
      ScrollTrack     =   0   'False
      ScrollBars      =   3
      ScrollTips      =   0   'False
      MergeCells      =   1
      MergeCompare    =   0
      AutoResize      =   -1  'True
      AutoSizeMode    =   0
      AutoSearch      =   0
      AutoSearchDelay =   2
      MultiTotals     =   -1  'True
      SubtotalPosition=   1
      OutlineBar      =   1
      OutlineCol      =   0
      Ellipsis        =   1
      ExplorerBar     =   0
      PicturesOver    =   0   'False
      FillStyle       =   0
      RightToLeft     =   0   'False
      PictureType     =   0
      TabBehavior     =   0
      OwnerDraw       =   0
      Editable        =   2
      ShowComboButton =   1
      WordWrap        =   0   'False
      TextStyle       =   0
      TextStyleFixed  =   0
      OleDragMode     =   0
      OleDropMode     =   0
      DataMode        =   0
      VirtualData     =   -1  'True
      DataMember      =   ""
      ComboSearch     =   3
      AutoSizeMouse   =   -1  'True
      FrozenRows      =   0
      FrozenCols      =   0
      AllowUserFreezing=   0
      BackColorFrozen =   0
      ForeColorFrozen =   0
      WallPaperAlignment=   9
      AccessibleName  =   ""
      AccessibleDescription=   ""
      AccessibleValue =   ""
      AccessibleRole  =   24
   End
   Begin VSFlex8Ctl.VSFlexGrid grPart 
      Align           =   2  'Align Bottom
      Height          =   3195
      Left            =   0
      TabIndex        =   1
      Top             =   405
      Width           =   12105
      _cx             =   21352
      _cy             =   5636
      Appearance      =   1
      BorderStyle     =   1
      Enabled         =   -1  'True
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Courier New CYR"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MousePointer    =   0
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      BackColorFixed  =   -2147483633
      ForeColorFixed  =   -2147483630
      BackColorSel    =   8421376
      ForeColorSel    =   -2147483639
      BackColorBkg    =   -2147483636
      BackColorAlternate=   -2147483643
      GridColor       =   -2147483633
      GridColorFixed  =   -2147483632
      TreeColor       =   -2147483632
      FloodColor      =   192
      SheetBorder     =   -2147483642
      FocusRect       =   2
      HighLight       =   1
      AllowSelection  =   -1  'True
      AllowBigSelection=   -1  'True
      AllowUserResizing=   1
      SelectionMode   =   3
      GridLines       =   1
      GridLinesFixed  =   2
      GridLineWidth   =   1
      Rows            =   2
      Cols            =   1
      FixedRows       =   2
      FixedCols       =   0
      RowHeightMin    =   0
      RowHeightMax    =   0
      ColWidthMin     =   0
      ColWidthMax     =   0
      ExtendLastCol   =   0   'False
      FormatString    =   $"frmSetMode.frx":0048
      ScrollTrack     =   0   'False
      ScrollBars      =   3
      ScrollTips      =   0   'False
      MergeCells      =   1
      MergeCompare    =   0
      AutoResize      =   -1  'True
      AutoSizeMode    =   0
      AutoSearch      =   0
      AutoSearchDelay =   2
      MultiTotals     =   -1  'True
      SubtotalPosition=   1
      OutlineBar      =   1
      OutlineCol      =   0
      Ellipsis        =   1
      ExplorerBar     =   0
      PicturesOver    =   0   'False
      FillStyle       =   0
      RightToLeft     =   0   'False
      PictureType     =   0
      TabBehavior     =   0
      OwnerDraw       =   0
      Editable        =   2
      ShowComboButton =   1
      WordWrap        =   0   'False
      TextStyle       =   0
      TextStyleFixed  =   0
      OleDragMode     =   0
      OleDropMode     =   0
      DataMode        =   0
      VirtualData     =   -1  'True
      DataMember      =   ""
      ComboSearch     =   3
      AutoSizeMouse   =   -1  'True
      FrozenRows      =   0
      FrozenCols      =   0
      AllowUserFreezing=   0
      BackColorFrozen =   0
      ForeColorFrozen =   0
      WallPaperAlignment=   9
      AccessibleName  =   ""
      AccessibleDescription=   ""
      AccessibleValue =   ""
      AccessibleRole  =   24
   End
   Begin VB.Label Label1 
      Caption         =   "Тип объекта:"
      Height          =   255
      Left            =   60
      TabIndex        =   2
      Top             =   60
      Width           =   1275
   End
End
Attribute VB_Name = "frmSetMode"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private ObjType As objectType
Private colP As Collection, colF As Collection

Private Sub cmdAdd_Click()
  If txtTObject.Tag = "" Then Exit Sub
  Dim str As String
  str = Strings.left(Trim(InputBox("Введите имя режима работы (4 символа)")), 4)
  If str = "" Then Exit Sub
  
  With ObjType.OBJECTMODE.Add
    .Name = str
    .Save
    addPartGR str, .ID
  End With
End Sub

Private Sub addPartGR(Name As String, ID As String)
  Dim i As Long, j As Long
  For i = 1 To 4
    grPart.Cols = grPart.Cols + 1
    grPart.CELL(flexcpData, 0, grPart.Cols - 1) = ID
    grPart.CELL(flexcpText, 0, grPart.Cols - 1) = Name
  Next
  grPart.CELL(flexcpText, 1, grPart.Cols - 4) = "R"
  grPart.CELL(flexcpText, 1, grPart.Cols - 3) = "+"
  grPart.CELL(flexcpText, 1, grPart.Cols - 2) = "-"
  grPart.CELL(flexcpText, 1, grPart.Cols - 1) = "W"
  
  
  For j = 1 To 4
    For i = 2 To grPart.Rows - 1
      grPart.CELL(flexcpChecked, i, grPart.Cols - j) = flexChecked
    Next
  Next
  
  For i = 1 To 3
    gr.Cols = gr.Cols + 1
    gr.CELL(flexcpData, 0, gr.Cols - 1) = ID
    gr.CELL(flexcpText, 0, gr.Cols - 1) = Name
  Next
  gr.CELL(flexcpText, 1, gr.Cols - 3) = "R"
  gr.CELL(flexcpText, 1, gr.Cols - 2) = "W"
  gr.CELL(flexcpText, 1, gr.Cols - 1) = "M"
  
  For j = 1 To 3
    For i = 2 To gr.Rows - 1
      If Not gr.IsSubtotal(i) Then gr.CELL(flexcpChecked, i, gr.Cols - j) = flexChecked
    Next
  Next

  grPart.AutoSize 0, grPart.Cols - 1
  gr.AutoSize 0, gr.Cols - 1
End Sub

Private Sub loadPartGR(m As OBJECTMODE)
  On Error Resume Next
  Dim i As Long, n As Long
  
  For i = 1 To m.STRUCTRESTRICTION.Count
    With m.STRUCTRESTRICTION.item(i)
      n = -1: n = colP.item(.struct.ID)
      If n > -1 Then
        If .AllowRead = Boolean_Net Then grPart.CELL(flexcpChecked, n, grPart.Cols - 4) = flexUnchecked
        If .AllowAdd = Boolean_Net Then grPart.CELL(flexcpChecked, n, grPart.Cols - 3) = flexUnchecked
        If .AllowDelete = Boolean_Net Then grPart.CELL(flexcpChecked, n, grPart.Cols - 2) = flexUnchecked
        If .AllowEdit = Boolean_Net Then grPart.CELL(flexcpChecked, n, grPart.Cols - 1) = flexUnchecked
      End If
    End With
  Next
  
  Dim fff As MTZMetaModel.Field
  For i = 1 To m.FIELDRESTRICTION.Count
    With m.FIELDRESTRICTION.item(i)
      n = -1: n = colF.item(.TheField.ID)
      If n > -1 Then
        If .AllowRead = Boolean_Net Then gr.CELL(flexcpChecked, n, gr.Cols - 3) = flexUnchecked
        If .AllowModify = Boolean_Net Then gr.CELL(flexcpChecked, n, gr.Cols - 2) = flexUnchecked
         If .MandatoryField = TriState_Net Then gr.CELL(flexcpChecked, n, gr.Cols - 1) = flexUnchecked
         If .MandatoryField = TriState_Ne_susestvenno Then
           Set fff = .TheField
           If fff.AllowNull = Boolean_Da Then
             gr.CELL(flexcpChecked, n, gr.Cols - 1) = flexUnchecked
           End If
         End If
      End If
    End With
  Next
End Sub

Private Sub loadPart(p As PART, level As Long)
  Dim j As Long
  grPart.Rows = grPart.Rows + 1
  grPart.CELL(flexcpData, grPart.Rows - 1, 0) = p.ID
  grPart.CELL(flexcpText, grPart.Rows - 1, 0) = p.Caption
  grPart.IsSubtotal(grPart.Rows - 1) = True
  grPart.RowOutlineLevel(grPart.Rows - 1) = level
  colP.Add grPart.Rows - 1, p.ID

  gr.Rows = gr.Rows + 1
  gr.CELL(flexcpBackColor, gr.Rows - 1, 0, gr.Rows - 1, gr.Cols - 1) = &HC0C0FF
  gr.IsSubtotal(gr.Rows - 1) = True
  gr.RowOutlineLevel(gr.Rows - 1) = level
  gr.CELL(flexcpText, gr.Rows - 1, 0) = p.Caption
  p.Field.Sort = "sequence"
  
  For j = 1 To p.Field.Count
    gr.Rows = gr.Rows + 1
    gr.CELL(flexcpData, gr.Rows - 1, 0) = p.Field.item(j).ID
    gr.CELL(flexcpText, gr.Rows - 1, 0) = p.Field.item(j).Caption
    colF.Add gr.Rows - 1, p.Field.item(j).ID
  Next
  
  For j = 1 To p.PART.Count
    loadPart p.PART.item(j), level + 1
  Next
End Sub

Private Sub cmdRefresh_Click()
  grPart.Cols = 1
  grPart.Rows = 2
  gr.Cols = 1
  gr.Rows = 2

  Set colP = New Collection
  Set colF = New Collection

  If ObjType Is Nothing Then Exit Sub
  Dim i As Long, j As Long
  ObjType.PART.Sort = "sequence"
  For i = 1 To ObjType.PART.Count
    loadPart ObjType.PART.item(i), 1

  Next
  
  For i = 1 To ObjType.OBJECTMODE.Count
    addPartGR ObjType.OBJECTMODE.item(i).Name, ObjType.OBJECTMODE.item(i).ID
    loadPartGR ObjType.OBJECTMODE.item(i)
  Next

  grPart.FixedCols = 1
  gr.FixedCols = 1
  grPart.AutoSize 0, grPart.Cols - 1
  gr.AutoSize 0, gr.Cols - 1
End Sub

Private Sub cmdSave_Click()
  Dim i As Long, j As Long, z As Long: z = 1
  
  If ObjType Is Nothing Then Exit Sub
  Dim objMode As OBJECTMODE
  
  Dim defmodename As String
  
  For i = 1 To ObjType.OBJECTMODE.Count
    If ObjType.OBJECTMODE.item(i).DefaultMode = Boolean_Da Then
      defmodename = ObjType.OBJECTMODE.item(i).Name
      Exit For
    End If
  Next
  
  
  
  For i = 1 To ObjType.OBJECTMODE.Count
    ObjType.OBJECTMODE.Delete 1
  Next
  
  For j = 1 To grPart.Cols - 1 Step 4
    Set objMode = ObjType.OBJECTMODE.Add(grPart.CELL(flexcpData, 0, j))
    objMode.Name = grPart.CELL(flexcpText, 0, j)
    If objMode.Name = defmodename Then
      objMode.DefaultMode = Boolean_Da
    End If
    objMode.Save
    
    For i = 2 To grPart.Rows - 1
      With objMode.STRUCTRESTRICTION.Add
        Set .struct = model.FindRowObject("PART", grPart.CELL(flexcpData, i, 0))
        If grPart.CELL(flexcpChecked, i, j + 0) = flexChecked Then .AllowRead = Boolean_Da
        If grPart.CELL(flexcpChecked, i, j + 1) = flexChecked Then .AllowAdd = Boolean_Da
        If grPart.CELL(flexcpChecked, i, j + 2) = flexChecked Then .AllowDelete = Boolean_Da
        If grPart.CELL(flexcpChecked, i, j + 3) = flexChecked Then .AllowEdit = Boolean_Da
        .Save
      End With
    Next
    
    Dim f As MTZMetaModel.Field
    
    
    For i = 2 To gr.Rows - 1
      If Not gr.IsSubtotal(i) Then
        With objMode.FIELDRESTRICTION.Add
          Set .TheField = model.FindRowObject("FIELD", gr.CELL(flexcpData, i, 0))
          Set .ThePart = .TheField.Parent.Parent
          If gr.CELL(flexcpChecked, i, z + 0) = flexChecked Then .AllowRead = Boolean_Da Else .AllowRead = Boolean_Net
          If gr.CELL(flexcpChecked, i, z + 1) = flexChecked Then .AllowModify = Boolean_Da Else .AllowModify = Boolean_Net
          If gr.CELL(flexcpChecked, i, z + 2) = flexChecked Then .MandatoryField = TriState_Da Else .MandatoryField = TriState_Net
          .Save
        End With
      End If
    Next
    z = z + 3
  Next
  
  MsgBox "Режимы сохранены"
End Sub

Private Sub cmdTObject_Click()
  Dim ID As String, br As String
  If Not Manager.GetReferenceDialogEx2("objecttype", ID, br) Then Exit Sub
  txtTObject = br
  txtTObject.Tag = ID
  
  Set ObjType = model.FindRowObject("OBJECTTYPE", ID)
  
  cmdRefresh_Click
End Sub

Private Sub Form_Load()
  Dim Q As String
  Q = "delete from fieldrestriction where theField not in (select fieldid from field)"
  Session.GetData Q
  Q = "delete from fieldrestriction where thePart not in (select partid from part)"
  Session.GetData Q
  Q = "delete from structrestriction where struct not in (select partid from part)"
  Session.GetData Q
  
  grPart.MergeCol(0) = True
  grPart.MergeRow(0) = True
  grPart.MergeRow(1) = True
  
  gr.MergeCol(0) = True
  gr.MergeRow(0) = True
  gr.MergeRow(1) = True
End Sub
