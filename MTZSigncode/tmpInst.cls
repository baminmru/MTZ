VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "tmpInst"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private mvarID As String 'local copy
Private mvarObjType As String 'local copy
Private mvarName As String
Private mvarIsSingle As Long
Private mvarLockUserID As String

Public Property Let LockUserID(ByVal vData As String)
     mvarLockUserID = vData
End Property

Public Property Get LockUserID() As String
    LockUserID = mvarLockUserID
End Property


Public Property Let IsSingle(ByVal vData As String)
     mvarIsSingle = vData
End Property

Public Property Get IsSingle() As String
    IsSingle = mvarIsSingle
End Property


Public Property Let Name(ByVal vData As String)
     mvarName = vData
End Property

Public Property Get Name() As String
    Name = mvarName
End Property


Public Property Let ID(ByVal vData As String)
    mvarID = vData
End Property


Public Property Get ID() As String
    ID = mvarID
End Property

Public Property Let ObjType(ByVal vData As String)
    mvarObjType = vData
End Property

Public Property Get ObjType() As String
    ObjType = mvarObjType
End Property

