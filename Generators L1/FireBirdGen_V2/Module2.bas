Attribute VB_Name = "Varible"
Private mTables As Boolean
Private mKernel As Boolean
Private mViews As Boolean
Private mFullText As Boolean
Private mFullTextClear As Boolean
Private mInit As Boolean
Private mProcs As Boolean
Private mMethod As Boolean
Private mManual As Boolean
Private mRights As Boolean
Private mMaintein As Boolean
Private mCheckFK As Boolean
Private mCreateFK As Boolean
Private mBRIEF As Boolean

Private mWN_VIEW As Boolean
Private mWN_SYSPROC As Boolean
Private mWN_PROC As Boolean
Private mWN_FUNC As Boolean

Private mLOCK_D As Boolean
Private mLOCK_S As Boolean

Private mSESSION_D As Boolean
Private mSESSION_S As Boolean

Private mNOTRAN As Boolean
Private mUNIQUE As Boolean
Private mCHILDDELETE As Boolean

Private mServer2005 As Boolean

Public Property Get OptSESSION_S() As Boolean
  OptSESSION_S = mSESSION_S
End Property
Public Property Let OptSESSION_S(v As Boolean)
  mSESSION_S = v
End Property

Public Property Get OptSERVER2005() As Boolean
  OptSERVER2005 = mServer2005
End Property
Public Property Let OptSERVER2005(v As Boolean)
  mServer2005 = v
End Property

Public Property Get OptSESSION_D() As Boolean
  OptSESSION_D = mSESSION_D
End Property
Public Property Let OptSESSION_D(v As Boolean)
  mSESSION_D = v
End Property

Public Property Get OptLOCK_S() As Boolean
  OptLOCK_S = mLOCK_S
End Property
Public Property Let OptLOCK_S(v As Boolean)
  mLOCK_S = v
End Property

Public Property Get OptLOCK_D() As Boolean
  OptLOCK_D = mLOCK_D
End Property
Public Property Let OptLOCK_D(v As Boolean)
  mLOCK_D = v
End Property

Public Property Get OptUNIQUE() As Boolean
  OptUNIQUE = mUNIQUE
End Property
Public Property Let OptUNIQUE(v As Boolean)
  mUNIQUE = v
End Property

Public Property Get OptCHILDDELETE() As Boolean
  OptCHILDDELETE = mCHILDDELETE
End Property
Public Property Let OptCHILDDELETE(v As Boolean)
  mCHILDDELETE = v
End Property

Public Property Get OptNOTRAN() As Boolean
  OptNOTRAN = mNOTRAN
End Property
Public Property Let OptNOTRAN(v As Boolean)
  mNOTRAN = v
End Property

Public Property Get OptWN_FUNC() As Boolean
  OptWN_FUNC = mWN_FUNC
End Property
Public Property Let OptWN_FUNC(v As Boolean)
  mWN_FUNC = v
End Property

Public Property Get OptWN_PROC() As Boolean
  OptWN_PROC = mWN_PROC
End Property
Public Property Let OptWN_PROC(v As Boolean)
  mWN_PROC = v
End Property

Public Property Get OptWN_SYSPROC() As Boolean
  OptWN_SYSPROC = mWN_SYSPROC
End Property
Public Property Let OptWN_SYSPROC(v As Boolean)
  mWN_SYSPROC = v
End Property

Public Property Get OptWN_VIEW() As Boolean
  OptWN_VIEW = mWN_VIEW
End Property
Public Property Let OptWN_VIEW(v As Boolean)
  mWN_VIEW = v
End Property

Public Property Get OptCreateFK() As Boolean
  OptCreateFK = mCreateFK
End Property
Public Property Let OptCreateFK(v As Boolean)
  mCreateFK = v
End Property

Public Property Get OptBRIEF() As Boolean
  OptBRIEF = mBRIEF
End Property
Public Property Let OptBRIEF(v As Boolean)
  mBRIEF = v
End Property

Public Property Get OptCheckFK() As Boolean
  OptCheckFK = mCheckFK
End Property
Public Property Let OptCheckFK(v As Boolean)
  mCheckFK = v
End Property

Public Property Get OptTables() As Boolean
  OptTables = mTables
End Property
Public Property Let OptTables(v As Boolean)
  mTables = v
End Property

Public Property Get OptMaintein() As Boolean
  OptMaintein = mMaintein
End Property
Public Property Let OptMaintein(v As Boolean)
  mMaintein = v
End Property

Public Property Get OptManual() As Boolean
  OptManual = mManual
End Property
Public Property Let OptManual(v As Boolean)
  mManual = v
End Property

Public Property Get OptRights() As Boolean
  OptRights = mRights
End Property
Public Property Let OptRights(v As Boolean)
  mRights = v
End Property

Public Property Get OptMethod() As Boolean
  OptMethod = mMethod
End Property
Public Property Let OptMethod(v As Boolean)
  mMethod = v
End Property

Public Property Get OptProcs() As Boolean
  OptProcs = mProcs
End Property
Public Property Let OptProcs(v As Boolean)
  mProcs = v
End Property

Public Property Get OptInit() As Boolean
  OptInit = mInit
End Property
Public Property Let OptInit(v As Boolean)
  mInit = v
End Property

Public Property Get OptFullText() As Boolean
  OptFullText = mFullText
End Property
Public Property Let OptFullText(v As Boolean)
  mFullText = v
End Property

Public Property Get OptFullTextClear() As Boolean
  OptFullTextClear = mFullTextClear
End Property
Public Property Let OptFullTextClear(v As Boolean)
  mFullTextClear = v
End Property

Public Property Get OptViews() As Boolean
  OptViews = mViews
End Property
Public Property Let OptViews(v As Boolean)
  mViews = v
End Property

Public Property Get OptKernel() As Boolean
  OptKernel = mKernel
End Property
Public Property Let OptKernel(v As Boolean)
  mKernel = v
End Property

Public Sub LoadSetting()
  OptFullText = GetSetting(App.Title, "SQLGEN", "FULLTEXT", vbChecked) = 1
  OptFullTextClear = GetSetting(App.Title, "SQLGEN", "FULLTEXTCLEAR", vbChecked) = 1
  OptInit = GetSetting(App.Title, "SQLGEN", "INIT", vbChecked) = 1
  OptKernel = GetSetting(App.Title, "SQLGEN", "KERNEL", vbChecked) = 1
  OptMethod = GetSetting(App.Title, "SQLGEN", "METHODS", vbChecked) = 1
  OptProcs = GetSetting(App.Title, "SQLGEN", "PROCS", vbChecked) = 1
  OptBRIEF = GetSetting(App.Title, "SQLGEN", "BRIEF", vbChecked) = 1
  OptTables = GetSetting(App.Title, "SQLGEN", "TABLES", vbChecked) = 1
  OptViews = GetSetting(App.Title, "SQLGEN", "VIEW", vbChecked) = 1
  OptMaintein = GetSetting(App.Title, "SQLGEN", "MAINTEIN", vbChecked) = 1
  OptManual = GetSetting(App.Title, "SQLGEN", "MANUAL", vbChecked) = 1
  OptRights = GetSetting(App.Title, "SQLGEN", "RIGHTS", vbChecked) = 1
  OptCheckFK = GetSetting(App.Title, "SQLGEN", "CHECKFK", vbChecked) = 1

  OptWN_VIEW = GetSetting(App.Title, "SQLGEN", "WN_VIEW", vbChecked) = 1
  OptWN_SYSPROC = GetSetting(App.Title, "SQLGEN", "WN_SYSPROC", vbChecked) = 1
  OptWN_PROC = GetSetting(App.Title, "SQLGEN", "WN_PROC", vbChecked) = 1
  OptWN_FUNC = GetSetting(App.Title, "SQLGEN", "WN_FUNC", vbChecked) = 1

  OptLOCK_D = GetSetting(App.Title, "SQLGEN", "LOCK_D", vbUnchecked) = 1
  OptLOCK_S = GetSetting(App.Title, "SQLGEN", "LOCK_S", vbUnchecked) = 1
    
  OptSESSION_D = GetSetting(App.Title, "SQLGEN", "SESSION_D", vbUnchecked) = 1
  OptSESSION_S = GetSetting(App.Title, "SQLGEN", "SESSION_S", vbUnchecked) = 1
    
  OptNOTRAN = GetSetting(App.Title, "SQLGEN", "NOTRAN", vbChecked) = 1
  OptUNIQUE = GetSetting(App.Title, "SQLGEN", "UNIQUE", vbChecked) = 1
  OptCHILDDELETE = GetSetting(App.Title, "SQLGEN", "CHILDDELETE", vbChecked) = 1
  
  OptSERVER2005 = GetSetting(App.Title, "SQLGEN", "SERVER2005", vbChecked) = 1
End Sub


