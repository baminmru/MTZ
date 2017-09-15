VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   375
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   1575
   End
   Begin VB.Image Image1 
      Height          =   2295
      Left            =   120
      Stretch         =   -1  'True
      Top             =   720
      Width           =   4215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim VS As Visio.Application
Dim vd As Visio.Document
Dim WithEvents vp As Visio.Page
Attribute vp.VB_VarHelpID = -1
Dim vl As Visio.Layer
Dim shapeobj As Visio.Shape
Dim rshape As Visio.Shape
Dim oshape As Visio.Shape

Private Sub Command1_Click()
Set VS = New Visio.Application
VS.Visible = False
Set vd = VS.Documents.Add("")
If vd.Pages.Count = 0 Then
  vd.Pages.Add.Name = "My test"
End If
Set vp = vd.Pages.Item(1)
If vp.Layers.Count = 0 Then
vp.Layers.Add "L1"
End If

'Draw two rectangles.


Set vl = vp.Layers.Item(1)

With vl

  Set shapeobj = vp.DrawRectangle(3, 3, 5, 6)
  shapeobj.Text = "Прямоугольник"
  'shapeobj.Cell
  .Add shapeobj, False
  Set rshape = shapeobj
  
  
  Set shapeobj = vp.DrawLine(3, 3, 5, 6)
  shapeobj.Text = "Линия"
  .Add shapeobj, False
  
  Set shapeobj = vp.DrawOval(5, 5, 6, 7)
  shapeobj.Text = "Овал"
  .Add shapeobj, False
  Set oshape = shapeobj
  
  'rshape.Section(1).Row(1).Cell(1).GlueToPos oshape, 0, 0
  'rshape.Connects.Count\
  
    VS.ActiveWindow.DeselectAll
    VS.ActiveWindow.Select rshape, visSelect
    VS.ActiveWindow.Select oshape, visSelect
    VS.Application.ActiveWindow.Selection.ConnectShapes
    
    vp.Shapes(4).CellsSRC(visSectionObject, visRowLine, visLineEndArrow).FormulaU = "13"
  Dim i As Integer
  Dim xypts(1 To 5 * 2) As Double

  For i = 1 To 5
        'Set x components to 1,2,3,4,5
        xypts(i * 2 - 1) = i
        'Set y components to f(i)
        xypts(i * 2) = i * i - 7 * i + 10
  Next i

  Set shapeobj = vp.DrawSpline(xypts, 0.7, visSplineAbrupt)
  shapeobj.Text = "Сплайн"
  .Add shapeobj, False


For i = 1 To 5
        'Set x components to 1,2,3,4,5
        xypts(i * 2 - 1) = i
        'Set y components to f(i)
        xypts(i * 2) = -i * i + 7 * i - 10
  Next i
  Set shapeobj = vp.DrawPolyline(xypts, visPolylineData)
  shapeobj.Text = "Полилиния"
  .Add shapeobj, False
   
  
  
End With

vd.SaveAs App.Path & "\test.vsd"
 Call vl.Page.Export(App.Path & "\test.jpg")
Image1.Picture = LoadPicture(App.Path & "\test.jpg")
vd.Close
VS.Quit

End Sub

Private Sub vp_ConnectionsAdded(ByVal Connects As Visio.IVConnects)
Debug.Print Connects.Item(1).Index
End Sub

