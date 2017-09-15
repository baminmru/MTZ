
/* --VRD*/

 create or replace package VRD as

procedure VRD_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure VRD_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure VRD_propagate(acursession CHAR, aROWID CHAR); 


procedure VRDContractStage_BRIEF  (
 aCURSESSION CHAR,
 aVRDContractStageid CHAR,
 aBRIEF out varchar2
);
procedure VRDContractStage_DELETE  (
 aCURSESSION CHAR,
 aVRDContractStageid CHAR,
 ainstanceid char
); 
procedure VRDContractStage_SAVE (
 aCURSESSION CHAR,
 aVRDContractStageid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
); 
procedure VRDContractStage_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDContractStage_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDContractStage_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDContractStage_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDContractStage_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDContractStage_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDContractStage_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRDRreportType_BRIEF  (
 aCURSESSION CHAR,
 aVRDRreportTypeid CHAR,
 aBRIEF out varchar2
);
procedure VRDRreportType_DELETE  (
 aCURSESSION CHAR,
 aVRDRreportTypeid CHAR,
 ainstanceid char
); 
procedure VRDRreportType_SAVE (
 aCURSESSION CHAR,
 aVRDRreportTypeid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
); 
procedure VRDRreportType_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDRreportType_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDRreportType_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDRreportType_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDRreportType_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDRreportType_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDRreportType_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRDPrjType_BRIEF  (
 aCURSESSION CHAR,
 aVRDPrjTypeid CHAR,
 aBRIEF out varchar2
);
procedure VRDPrjType_DELETE  (
 aCURSESSION CHAR,
 aVRDPrjTypeid CHAR,
 ainstanceid char
); 
procedure VRDPrjType_SAVE (
 aCURSESSION CHAR,
 aVRDPrjTypeid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
); 
procedure VRDPrjType_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDPrjType_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDPrjType_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDPrjType_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDPrjType_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDPrjType_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDPrjType_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRDStream_BRIEF  (
 aCURSESSION CHAR,
 aVRDStreamid CHAR,
 aBRIEF out varchar2
);
procedure VRDStream_DELETE  (
 aCURSESSION CHAR,
 aVRDStreamid CHAR,
 ainstanceid char
); 
procedure VRDStream_SAVE (
 aCURSESSION CHAR,
 aVRDStreamid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Назввание *//* Назввание */
); 
procedure VRDStream_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDStream_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDStream_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDStream_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDStream_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDStream_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDStream_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRDInterest_BRIEF  (
 aCURSESSION CHAR,
 aVRDInterestid CHAR,
 aBRIEF out varchar2
);
procedure VRDInterest_DELETE  (
 aCURSESSION CHAR,
 aVRDInterestid CHAR,
 ainstanceid char
); 
procedure VRDInterest_SAVE (
 aCURSESSION CHAR,
 aVRDInterestid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
); 
procedure VRDInterest_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDInterest_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDInterest_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDInterest_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDInterest_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDInterest_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDInterest_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRDDocType_BRIEF  (
 aCURSESSION CHAR,
 aVRDDocTypeid CHAR,
 aBRIEF out varchar2
);
procedure VRDDocType_DELETE  (
 aCURSESSION CHAR,
 aVRDDocTypeid CHAR,
 ainstanceid char
); 
procedure VRDDocType_SAVE (
 aCURSESSION CHAR,
 aVRDDocTypeid CHAR,
aInstanceID CHAR 
,aName
 VARCHAR2/* Название *//* Название */
); 
procedure VRDDocType_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDDocType_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDDocType_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDDocType_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDDocType_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDDocType_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDDocType_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRDLoyalty_BRIEF  (
 aCURSESSION CHAR,
 aVRDLoyaltyid CHAR,
 aBRIEF out varchar2
);
procedure VRDLoyalty_DELETE  (
 aCURSESSION CHAR,
 aVRDLoyaltyid CHAR,
 ainstanceid char
); 
procedure VRDLoyalty_SAVE (
 aCURSESSION CHAR,
 aVRDLoyaltyid CHAR,
aInstanceID CHAR 
,athe_Level
 VARCHAR2/* Степень *//* Степень */
); 
procedure VRDLoyalty_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDLoyalty_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDLoyalty_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDLoyalty_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDLoyalty_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDLoyalty_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDLoyalty_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure VRDMarket_BRIEF  (
 aCURSESSION CHAR,
 aVRDMarketid CHAR,
 aBRIEF out varchar2
);
procedure VRDMarket_DELETE  (
 aCURSESSION CHAR,
 aVRDMarketid CHAR,
 ainstanceid char
); 
procedure VRDMarket_SAVE (
 aCURSESSION CHAR,
 aVRDMarketid CHAR,
aInstanceID CHAR 
, aParentRowid CHAR :=null
,aName
 VARCHAR2/* Название *//* Название */
); 
procedure VRDMarket_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure VRDMarket_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure VRDMarket_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure VRDMarket_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure VRDMarket_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure VRDMarket_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure VRDMarket_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end VRD;

/



