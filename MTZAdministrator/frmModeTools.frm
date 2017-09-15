VERSION 5.00
Object = "{E684D8A3-716C-4E59-AA94-7144C04B0074}#1.1#0"; "GridEX20.ocx"
Begin VB.Form frmModeTools 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Настройка режимов "
   ClientHeight    =   6705
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8130
   Icon            =   "frmModeTools.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6705
   ScaleWidth      =   8130
   Begin VB.CommandButton cmdSave 
      Caption         =   "Сохранить"
      Height          =   315
      Left            =   6840
      TabIndex        =   9
      Top             =   6270
      Width           =   1175
   End
   Begin VB.CommandButton cmdAddMode 
      Caption         =   "+"
      Height          =   315
      Left            =   7740
      TabIndex        =   4
      Top             =   480
      Width           =   315
   End
   Begin VB.ComboBox cmbMode 
      Height          =   315
      Left            =   1680
      TabIndex        =   3
      Text            =   "Combo2"
      Top             =   480
      Width           =   6015
   End
   Begin VB.ComboBox cmbType 
      Height          =   315
      Left            =   1680
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   90
      Width           =   6375
   End
   Begin GridEX20.GridEX grPart 
      Height          =   2250
      Left            =   120
      TabIndex        =   6
      Top             =   1260
      Width           =   7935
      _ExtentX        =   13996
      _ExtentY        =   3969
      Version         =   "2.0"
      AllowRowSizing  =   -1  'True
      BoundColumnIndex=   ""
      ReplaceColumnIndex=   ""
      ColumnAutoResize=   -1  'True
      UseEvenOddColor =   -1  'True
      MethodHoldFields=   -1  'True
      SelectionStyle  =   1
      AllowColumnDrag =   0   'False
      GroupByBoxVisible=   0   'False
      DataMode        =   99
      ColumnHeaderHeight=   285
      FrozenColumns   =   1
      IntProp1        =   0
      IntProp2        =   0
      IntProp7        =   0
      ColumnsCount    =   5
      Column(1)       =   "frmModeTools.frx":0442
      Column(2)       =   "frmModeTools.frx":05A2
      Column(3)       =   "frmModeTools.frx":06B6
      Column(4)       =   "frmModeTools.frx":07CE
      Column(5)       =   "frmModeTools.frx":08E6
      FormatStylesCount=   6
      FormatStyle(1)  =   "frmModeTools.frx":09FE
      FormatStyle(2)  =   "frmModeTools.frx":0B5A
      FormatStyle(3)  =   "frmModeTools.frx":0C0A
      FormatStyle(4)  =   "frmModeTools.frx":0CBE
      FormatStyle(5)  =   "frmModeTools.frx":0D96
      FormatStyle(6)  =   "frmModeTools.frx":0E4E
      ImageCount      =   0
      PrinterProperties=   "frmModeTools.frx":0F2E
   End
   Begin GridEX20.GridEX grField 
      Height          =   2250
      Left            =   120
      TabIndex        =   8
      Top             =   3930
      Width           =   7935
      _ExtentX        =   13996
      _ExtentY        =   3969
      Version         =   "2.0"
      BoundColumnIndex=   ""
      ReplaceColumnIndex=   ""
      ColumnAutoResize=   -1  'True
      UseEvenOddColor =   -1  'True
      MethodHoldFields=   -1  'True
      SelectionStyle  =   1
      AllowColumnDrag =   0   'False
      GroupByBoxVisible=   0   'False
      DataMode        =   99
      ColumnHeaderHeight=   285
      FrozenColumns   =   1
      IntProp1        =   0
      IntProp2        =   0
      IntProp7        =   0
      ColumnsCount    =   3
      Column(1)       =   "frmModeTools.frx":1106
      Column(2)       =   "frmModeTools.frx":126E
      Column(3)       =   "frmModeTools.frx":1382
      FormatStylesCount=   6
      FormatStyle(1)  =   "frmModeTools.frx":149A
      FormatStyle(2)  =   "frmModeTools.frx":15F6
      FormatStyle(3)  =   "frmModeTools.frx":16A6
      FormatStyle(4)  =   "frmModeTools.frx":175A
      FormatStyle(5)  =   "frmModeTools.frx":1832
      FormatStyle(6)  =   "frmModeTools.frx":18EA
      ImageCount      =   0
      PrinterProperties=   "frmModeTools.frx":19CA
   End
   Begin VB.Label Label4 
      Caption         =   "Ограничение полей"
      Height          =   255
      Left            =   120
      TabIndex        =   7
      Top             =   3630
      Width           =   3855
   End
   Begin VB.Label Label3 
      Caption         =   "Ограничения разделов"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   960
      Width           =   5175
   End
   Begin VB.Label Label2 
      Caption         =   "Режим"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   480
      Width           =   1455
   End
   Begin VB.Label Label1 
      Caption         =   "Тип документа:"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   90
      Width           =   1455
   End
End
Attribute VB_Name = "frmModeTools"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim pcol As SortableCollection
Dim fcol As SortableCollection
Dim i As Long

Private Sub cmbMode_Click()
grPart.ItemCount = 0
grField.ItemCount = 0
Set pcol = New SortableCollection
Set fcol = New SortableCollection
Dim i, j
Dim mi As ModeItem
For i = 1 To model.ObjectType.item(cmbType.ListIndex + 1).PART.Count
  Set mi = New ModeItem
  Set mi.Obj1 = model.ObjectType.item(cmbType.ListIndex + 1).PART.item(i)
  mi.SName = model.ObjectType.item(cmbType.ListIndex + 1).PART.item(i).Caption
  mi.B1 = True
  mi.B2 = True
  mi.B3 = True
  mi.B4 = True
  pcol.AddItem mi
  
  For j = 1 To model.ObjectType.item(cmbType.ListIndex + 1).PART.item(i).Field.Count
  Set mi = New ModeItem
  Set mi.Obj1 = model.ObjectType.item(cmbType.ListIndex + 1).PART.item(i)
  Set mi.Obj2 = model.ObjectType.item(cmbType.ListIndex + 1).PART.item(i).Field.item(j)
  mi.SName = model.ObjectType.item(cmbType.ListIndex + 1).PART.item(i).Caption & "\" & model.ObjectType.item(cmbType.ListIndex + 1).PART.item(i).Field.item(j).Caption
  mi.B1 = True
  mi.B2 = True
  mi.B3 = True
  fcol.AddItem mi
  Next
  CollectRows model.ObjectType.item(cmbType.ListIndex + 1).PART.item(i)
Next

' смотрим на ограничения режима и выставляем флажки
With model.ObjectType.item(cmbType.ListIndex + 1).OBJECTMODE.item(cmbMode.ListIndex + 1)
For i = 1 To .STRUCTRESTRICTION.Count
  For j = 1 To pcol.Count
    If pcol.item(j).Obj1 Is .STRUCTRESTRICTION.item(i).struct Then
      pcol.item(j).B1 = .STRUCTRESTRICTION.item(i).AllowRead
      pcol.item(j).B2 = .STRUCTRESTRICTION.item(i).AllowAdd
      pcol.item(j).B3 = .STRUCTRESTRICTION.item(i).AllowDelete
      pcol.item(j).B4 = .STRUCTRESTRICTION.item(i).AllowEdit
      Set pcol.item(j).Obj3 = .STRUCTRESTRICTION.item(i)
    End If
  Next
Next

For i = 1 To .FIELDRESTRICTION.Count
  For j = 1 To fcol.Count
    If fcol.item(j).Obj1 Is .FIELDRESTRICTION.item(i).ThePart And fcol.item(j).Obj2 Is .FIELDRESTRICTION.item(i).TheField Then
      fcol.item(j).B1 = .FIELDRESTRICTION.item(i).AllowRead
      fcol.item(j).B2 = .FIELDRESTRICTION.item(i).AllowModify
      Set fcol.item(j).Obj3 = .FIELDRESTRICTION.item(i)
    End If
  Next
Next
End With

pcol.Sort "SName"
fcol.Sort "SName"
grPart.ItemCount = pcol.Count
grField.ItemCount = fcol.Count
End Sub

Private Sub CollectRows(root As PART)
Dim i, j
Dim mi As ModeItem
For i = 1 To root.PART.Count
  Set mi = New ModeItem
  Set mi.Obj1 = root.PART.item(i)
  mi.SName = root.PART.item(i).Caption
  mi.B1 = True
  mi.B2 = True
  mi.B3 = True
  mi.B4 = True

  pcol.AddItem mi
  For j = 1 To root.PART.item(i).Field.Count
    Set mi = New ModeItem
    Set mi.Obj1 = root.PART.item(i)
    Set mi.Obj2 = root.PART.item(i).Field.item(j)
    mi.SName = root.PART.item(i).Caption & "\" & root.PART.item(i).Field.item(j).Caption
    mi.B1 = True
    mi.B2 = True
    mi.B3 = True
    mi.B4 = True

    fcol.AddItem mi
  Next
  CollectRows root.PART.item(i)
Next

End Sub

Private Sub cmbType_Click()
cmbMode.Clear
model.ObjectType.item(cmbType.ListIndex + 1).OBJECTMODE.Sort = "Name"
For i = 1 To model.ObjectType.item(cmbType.ListIndex + 1).OBJECTMODE.Count
  cmbMode.AddItem model.ObjectType.item(cmbType.ListIndex + 1).OBJECTMODE.item(i).Name
Next
grPart.ItemCount = 0
grField.ItemCount = 0
End Sub

Private Sub cmdAddMode_Click()
  Dim s As String
  
  If cmbType.ListIndex = -1 Then Exit Sub
  s = ""
  s = InputBox("Названеи режима (4 символа)", "Новый режим")
  If s = "" Then Exit Sub
  With model.ObjectType.item(cmbType.ListIndex + 1).OBJECTMODE.Add
    .Name = Left(s, 4)
    .Save
  End With
  cmbType_Click
End Sub

Private Sub cmdSave_Click()
  Dim fr As FIELDRESTRICTION
  Dim sr As STRUCTRESTRICTION
  With model.ObjectType.item(cmbType.ListIndex + 1).OBJECTMODE.item(cmbMode.ListIndex + 1)
  For i = 1 To pcol.Count
    If Not pcol.item(i).Obj3 Is Nothing Then
      Set sr = pcol.item(i).Obj3
      sr.AllowRead = pcol.item(i).B1
      sr.AllowAdd = pcol.item(i).B2
      sr.AllowDelete = pcol.item(i).B3
      sr.AllowEdit = pcol.item(i).B4
      sr.Save
    Else
      Set sr = .STRUCTRESTRICTION.Add
      Set sr.struct = pcol.item(i).Obj1
      sr.AllowRead = pcol.item(i).B1
      sr.AllowAdd = pcol.item(i).B2
      sr.AllowDelete = pcol.item(i).B3
      sr.AllowEdit = pcol.item(i).B4
      sr.Save
    End If
  Next
  For i = 1 To fcol.Count
    If Not fcol.item(i).Obj3 Is Nothing Then
      Set fr = fcol.item(i).Obj3
      fr.AllowRead = fcol.item(i).B1
      fr.AllowModify = fcol.item(i).B2
      fr.Save
    Else
      Set fr = .FIELDRESTRICTION.Add
      Set fr.ThePart = fcol.item(i).Obj1
      Set fr.TheField = fcol.item(i).Obj2
      fr.AllowRead = fcol.item(i).B1
      fr.AllowModify = fcol.item(i).B2
      fr.Save
    End If
  Next
  End With
  MsgBox "Изменения сохранены"
End Sub

Private Sub Form_Load()
cmbType.Clear
cmbMode.Clear
grPart.ItemCount = 0
grField.ItemCount = 0
model.ObjectType.Sort = "the_comment"
For i = 1 To model.ObjectType.Count
  cmbType.AddItem model.ObjectType.item(i).the_comment & "(" & model.ObjectType.item(i).Name & ")"
Next
End Sub


Private Sub grField_AfterColEdit(ByVal ColIndex As Integer)
  If grField.RowIndex(grField.Row) <= 0 Then Exit Sub
  fcol.item(grField.RowIndex(grField.Row)).B1 = grField.Value(2)
  fcol.item(grField.RowIndex(grField.Row)).B2 = grField.Value(3)
End Sub

Private Sub grField_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
  Values(1) = fcol.item(RowIndex).SName
  Values(2) = fcol.item(RowIndex).B1
  Values(3) = fcol.item(RowIndex).B2

End Sub

Private Sub grPart_AfterColEdit(ByVal ColIndex As Integer)
  If grPart.RowIndex(grPart.Row) <= 0 Then Exit Sub
  pcol.item(grPart.RowIndex(grPart.Row)).B1 = grPart.Value(2)
  pcol.item(grPart.RowIndex(grPart.Row)).B2 = grPart.Value(3)
  pcol.item(grPart.RowIndex(grPart.Row)).B3 = grPart.Value(4)
  pcol.item(grPart.RowIndex(grPart.Row)).B4 = grPart.Value(5)

End Sub

Private Sub grPart_UnboundReadData(ByVal RowIndex As Long, ByVal Bookmark As Variant, ByVal Values As GridEX20.JSRowData)
  Values(1) = pcol.item(RowIndex).SName
  Values(2) = pcol.item(RowIndex).B1
  Values(3) = pcol.item(RowIndex).B2
  Values(4) = pcol.item(RowIndex).B3
  Values(5) = pcol.item(RowIndex).B4
End Sub
