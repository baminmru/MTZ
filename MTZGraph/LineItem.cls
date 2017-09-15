VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "LineItem"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Private mvarFromX As Long
Private mvarFromY As Long
Private mvarToX As Long
Private mvarToY As Long

Private mvarCotrolIndex As Long

Friend Property Let CotrolIndex(ByVal vData As Long)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.CotrolIndex = 5
    mvarCotrolIndex = vData
End Property


Friend Property Get CotrolIndex() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.CotrolIndex
    CotrolIndex = mvarCotrolIndex
End Property



Public Property Let ToY(ByVal vData As Long)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.ToY = 5
    mvarToY = vData
End Property


Public Property Get ToY() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.ToY
    ToY = mvarToY
End Property



Public Property Let ToX(ByVal vData As Long)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.ToX = 5
    mvarToX = vData
End Property


Public Property Get ToX() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.ToX
    ToX = mvarToX
End Property



Public Property Let FromY(ByVal vData As Long)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.FromY = 5
    mvarFromY = vData
End Property


Public Property Get FromY() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.FromY
    FromY = mvarFromY
End Property



Public Property Let FromX(ByVal vData As Long)
'used when assigning a value to the property, on the left side of an assignment.
'Syntax: X.FromX = 5
    mvarFromX = vData
End Property


Public Property Get FromX() As Long
'used when retrieving value of a property, on the right side of an assignment.
'Syntax: Debug.Print X.FromX
    FromX = mvarFromX
End Property



