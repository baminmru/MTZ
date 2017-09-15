
/* --REPD*/

 create or replace package REPD as

procedure REPD_DELETE(acursession CHAR, aInstanceID CHAR);  
procedure REPD_HCL(acursession CHAR, aROWID CHAR, aIsLocked out integer);
procedure REPD_propagate(acursession CHAR, aROWID CHAR); 


procedure REPD_LOCKED_BRIEF  (
 aCURSESSION CHAR,
 aREPD_LOCKEDid CHAR,
 aBRIEF out varchar2
);
procedure REPD_LOCKED_DELETE  (
 aCURSESSION CHAR,
 aREPD_LOCKEDid CHAR,
 ainstanceid char
); 
procedure REPD_LOCKED_SAVE (
 aCURSESSION CHAR,
 aREPD_LOCKEDid CHAR,
aInstanceID CHAR 
,aLastTry
 DATE/* Последняя разработка *//* Последняя разработка */
,aSourceFile
 VARCHAR2/* Файл данных *//* Файл данных */
,aReplicaRowID CHAR/* Идентификатор строки реплики *//* Идентификатор строки реплики */
,aFirstTry
 DATE/* Первая обработка *//* Первая обработка */
,aStructType
 VARCHAR2 := null /* Тип строки *//* Тип строки */
,aObjectType
 VARCHAR2/* Тип объекта *//* Тип объекта */
,aThe_RowID CHAR := null /* Идетнификатор строки *//* Идетнификатор строки */
,aThe_InstanceID CHAR/* Объект *//* Объект */
,aReplicaPackID CHAR/* ReplicaPackID *//* ReplicaPackID */
,aPartCount
 NUMBER := null /* PartCount *//* PartCount */
,aPartNumber
 NUMBER := null /* PartNumber *//* PartNumber */
); 
procedure REPD_LOCKED_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure REPD_LOCKED_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure REPD_LOCKED_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure REPD_LOCKED_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure REPD_LOCKED_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure REPD_LOCKED_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure REPD_LOCKED_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure REPD_RequestQuery_BRIEF  (
 aCURSESSION CHAR,
 aREPD_RequestQueryid CHAR,
 aBRIEF out varchar2
);
procedure REPD_RequestQuery_DELETE  (
 aCURSESSION CHAR,
 aREPD_RequestQueryid CHAR,
 ainstanceid char
); 
procedure REPD_RequestQuery_SAVE (
 aCURSESSION CHAR,
 aREPD_RequestQueryid CHAR,
aInstanceID CHAR 
,aTheRowID CHAR := null /* TheRowID *//* TheRowID */
,aReqPartName
 VARCHAR2 := null /* ReqPartName *//* ReqPartName */
,aObjectID CHAR := null /* ObjectID *//* ObjectID */
,aSourceSrv CHAR/* SourceSrv *//* SourceSrv */
,aSendRecord CHAR := null /* SendRecord *//* SendRecord */
,aDestSrv CHAR := null /* DestSrv *//* DestSrv */
,aProvider CHAR/* Provider *//* Provider */
,aReqTypeName
 VARCHAR2 := null /* ReqTypeName *//* ReqTypeName */
); 
procedure REPD_RequestQuery_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure REPD_RequestQuery_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure REPD_RequestQuery_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure REPD_RequestQuery_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure REPD_RequestQuery_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure REPD_RequestQuery_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure REPD_RequestQuery_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure REPD_ResQueryRcv_BRIEF  (
 aCURSESSION CHAR,
 aREPD_ResQueryRcvid CHAR,
 aBRIEF out varchar2
);
procedure REPD_ResQueryRcv_DELETE  (
 aCURSESSION CHAR,
 aREPD_ResQueryRcvid CHAR,
 ainstanceid char
); 
procedure REPD_ResQueryRcv_SAVE (
 aCURSESSION CHAR,
 aREPD_ResQueryRcvid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aReceiveRec CHAR/* ReceiveRec *//* ReceiveRec */
); 
procedure REPD_ResQueryRcv_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure REPD_ResQueryRcv_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure REPD_ResQueryRcv_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure REPD_ResQueryRcv_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure REPD_ResQueryRcv_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure REPD_ResQueryRcv_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure REPD_ResQueryRcv_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure REPD_PROV_BRIEF  (
 aCURSESSION CHAR,
 aREPD_PROVid CHAR,
 aBRIEF out varchar2
);
procedure REPD_PROV_DELETE  (
 aCURSESSION CHAR,
 aREPD_PROVid CHAR,
 ainstanceid char
); 
procedure REPD_PROV_SAVE (
 aCURSESSION CHAR,
 aREPD_PROVid CHAR,
aInstanceID CHAR 
,aAssemblyName
 VARCHAR2/* AssemblyName *//* AssemblyName */
,aClassName
 VARCHAR2/* ClassName *//* ClassName */
,aName
 VARCHAR2/* Name *//* Name */
); 
procedure REPD_PROV_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure REPD_PROV_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure REPD_PROV_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure REPD_PROV_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure REPD_PROV_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure REPD_PROV_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure REPD_PROV_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure REPD_SRV_BRIEF  (
 aCURSESSION CHAR,
 aREPD_SRVid CHAR,
 aBRIEF out varchar2
);
procedure REPD_SRV_DELETE  (
 aCURSESSION CHAR,
 aREPD_SRVid CHAR,
 ainstanceid char
); 
procedure REPD_SRV_SAVE (
 aCURSESSION CHAR,
 aREPD_SRVid CHAR,
aInstanceID CHAR 
,aObj3 CHAR := null /* Obj3 *//* Obj3 */
,aname
 VARCHAR2/* Название *//* Название */
,aObj2 CHAR := null /* Obj2 *//* Obj2 */
,aObj1 CHAR := null /* Obj1 *//* Obj1 */
); 
procedure REPD_SRV_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure REPD_SRV_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure REPD_SRV_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure REPD_SRV_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure REPD_SRV_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure REPD_SRV_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure REPD_SRV_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure REPD_SNDTO_BRIEF  (
 aCURSESSION CHAR,
 aREPD_SNDTOid CHAR,
 aBRIEF out varchar2
);
procedure REPD_SNDTO_DELETE  (
 aCURSESSION CHAR,
 aREPD_SNDTOid CHAR,
 ainstanceid char
); 
procedure REPD_SNDTO_SAVE (
 aCURSESSION CHAR,
 aREPD_SNDTOid CHAR,
aInstanceID CHAR 
, aParentStructRowID CHAR 
,aDestSrv CHAR/* DestSrv *//* DestSrv */
,aLastScan
 DATE := null /* Last scan *//* Last scan */
,aConfig VARCHAR2 := null /* Config *//* Config */
,aLastReceive
 DATE := null /* Last Receive *//* Last Receive */
,aProvider CHAR/* Provider *//* Provider */
,aWork_Start
 DATE := null /* Начало работы (время) *//* Начало работы (время) */
,aWork_End
 DATE := null /* Окончание работы (время) *//* Окончание работы (время) */
,aThe_Interval
 NUMBER := null /* Интервал *//* Интервал */
); 
procedure REPD_SNDTO_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure REPD_SNDTO_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure REPD_SNDTO_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure REPD_SNDTO_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure REPD_SNDTO_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure REPD_SNDTO_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure REPD_SNDTO_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure REPD_SendQ_BRIEF  (
 aCURSESSION CHAR,
 aREPD_SendQid CHAR,
 aBRIEF out varchar2
);
procedure REPD_SendQ_DELETE  (
 aCURSESSION CHAR,
 aREPD_SendQid CHAR,
 ainstanceid char
); 
procedure REPD_SendQ_SAVE (
 aCURSESSION CHAR,
 aREPD_SendQid CHAR,
aInstanceID CHAR 
,aSourceSrv CHAR := null /* SourceSrv *//* SourceSrv */
,aConfig VARCHAR2 := null /* Config *//* Config */
,aSentDate
 DATE := null /* SentDate *//* SentDate */
,aDestSrv CHAR/* DestSrv *//* DestSrv */
,aProvider CHAR/* Provider *//* Provider */
,aAcknowelge
 NUMBER/* Acknowelge *//* Acknowelge */
,aSendSize
 NUMBER := null /* SendSize *//* SendSize */
,aCheckDate
 DATE/* CheckDate *//* CheckDate */
,aReplicaPackID CHAR/* ReplicaPackID *//* ReplicaPackID */
,aFileName
 VARCHAR2 := null /* FileName *//* FileName */
,aPartCount
 NUMBER := null /* Количество частей *//* Количество частей */
,aPartNumber
 NUMBER := null /* Часть *//* Часть */
,aSent
 NUMBER := null /* Sent *//* Sent */
); 
procedure REPD_SendQ_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure REPD_SendQ_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure REPD_SendQ_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure REPD_SendQ_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure REPD_SendQ_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure REPD_SendQ_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure REPD_SendQ_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


procedure REPD_RecvQ_BRIEF  (
 aCURSESSION CHAR,
 aREPD_RecvQid CHAR,
 aBRIEF out varchar2
);
procedure REPD_RecvQ_DELETE  (
 aCURSESSION CHAR,
 aREPD_RecvQid CHAR,
 ainstanceid char
); 
procedure REPD_RecvQ_SAVE (
 aCURSESSION CHAR,
 aREPD_RecvQid CHAR,
aInstanceID CHAR 
,aTheRowID CHAR := null /* TheRowID *//* TheRowID */
,aReceived
 DATE/* Received *//* Received */
,aProvider CHAR/* Provider *//* Provider */
,aRecvSize
 NUMBER := null /* RecvSize *//* RecvSize */
,aSourceSrv CHAR/* SourceSrv *//* SourceSrv */
,aDestSrv CHAR := null /* DestSrv *//* DestSrv */
,aAcknowelge
 NUMBER/* Acknowelge *//* Acknowelge */
,aReplicaPackID CHAR := null /* ReplicaPackID *//* ReplicaPackID */
,aPartCount
 NUMBER := null /* Количество частей *//* Количество частей */
,aPartNumber
 NUMBER := null /* Часть *//* Часть */
,aFileName
 VARCHAR2/* FileName *//* FileName */
,aCompleted
 NUMBER := null /* Completed *//* Completed */
); 
procedure REPD_RecvQ_PARENT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aParentID out CHAR,
 aParentTable out varchar2
) ;
procedure REPD_RecvQ_ISLOCKED  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
) ;
procedure REPD_RecvQ_LOCK  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aLockMode integer 
);
procedure REPD_RecvQ_HCL(
 aCURSESSION CHAR,
 aRowID CHAR ,
 aIsLocked out integer
);
procedure REPD_RecvQ_UNLOCK (
 aCURSESSION CHAR,
 aRowID CHAR 
);
procedure REPD_RecvQ_SINIT  (
 aCURSESSION CHAR,
 aRowID CHAR ,
 aSecurityStyleID CHAR
);
procedure REPD_RecvQ_propagate(
 aCURSESSION CHAR,
 aRowID CHAR
);


end REPD;

/



