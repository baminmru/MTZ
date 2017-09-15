


Option Explicit On

Imports System.xml
Imports MKSNManager

Namespace WFFR


public enum enumHACCPStep'��� ���� � ����� ��������
  HACCPStep_Operaciy=3'��������
  HACCPStep_Zaversenie_processa=1'���������� ��������
  HACCPStep_Kontrol_nay_tocka=4'����������� �����
  HACCPStep_Korrektiruusee_deystvie=5'�������������� ��������
  HACCPStep_Ostanov_processa=2'������� ��������
  HACCPStep_Process=6'�������
  HACCPStep_Nacalo_processa=0'������ ��������
end enum 
public enum enumHaccpIdent'�������������
  HaccpIdent_Kacestvo_poverhnosti=6'�������� �����������
  HaccpIdent_Zapah=2'�����
  HaccpIdent_Forma=3'�����
  HaccpIdent_Cvet=1'����
  HaccpIdent_Vkus=4'����
  HaccpIdent_Procee=100'������
  HaccpIdent_Zvuk=5'����
  HaccpIdent_Vnesniy_vid=0'������� ���
end enum 
public enum enumWFStepClass'��� ���� ��������
  WFStepClass_SimpleFunction=0'SimpleFunction
  WFStepClass_StartFunction=1'StartFunction
  WFStepClass_StopFunction=2'StopFunction
  WFStepClass_PeriodicFunction=3'PeriodicFunction
end enum 
public enum enumMonths'������
  Months_Noybr_=11'������
  Months_Fevral_=2'�������
  Months_Dekabr_=12'�������
  Months_Mart=3'����
  Months_Ynvar_=1'������
  Months_Sentybr_=9'��������
  Months_Iun_=6'����
  Months_Oktybr_=10'�������
  Months_May=5'���
  Months_Avgust=8'������
  Months_Iul_=7'����
  Months_Aprel_=4'������
end enum 
public enum enumTypeStyle'������� ��������� ���� ����
  TypeStyle_Interval=3'��������
  TypeStyle_Skalyrniy_tip=0'��������� ���
  TypeStyle_Ssilka=4'������
  TypeStyle_Perecislenie=2'������������
  TypeStyle_Viragenie=1'���������
end enum 
public enum enumAggregationType'������� ��������� �� ����
  AggregationType_MAX=5'MAX
  AggregationType_AVG=1'AVG
  AggregationType_SUM=3'SUM
  AggregationType_COUNT=2'COUNT
  AggregationType_MIN=4'MIN
  AggregationType_CUSTOM=6'CUSTOM
  AggregationType_none=0'none
end enum 
public enum enumVHAlignment'������������
  VHAlignment_Center_Center=4'Center Center
  VHAlignment_Center_Top=3'Center Top
  VHAlignment_Right_Top=6'Right Top
  VHAlignment_Right_Bottom=8'Right Bottom
  VHAlignment_Left_Bottom=2'Left Bottom
  VHAlignment_Right_Center=7'Right Center
  VHAlignment_Center_Bottom=5'Center Bottom
  VHAlignment_Left_Center=1'Left Center
  VHAlignment_Left_Top=0'Left Top
end enum 
public enum enumWFProcessState'��������� ��������
  WFProcessState_Active=2'Active
  WFProcessState_Pause=3'Pause
  WFProcessState_Processed=5'Processed
  WFProcessState_Done=4'Done
  WFProcessState_Prepare=1'Prepare
  WFProcessState_Initial=0'Initial
end enum 
public enum enumNumerationRule'������� ���������
  NumerationRule_Edinay_zona=0'������ ����
  NumerationRule_Po_godu=1'�� ����
  NumerationRule_Po_dnu=4'�� ���
  NumerationRule_Po_kvartalu=2'�� ��������
  NumerationRule_Po_mesycu=3'�� ������
  NumerationRule_Proizvol_nie_zoni=10'������������ ����
end enum 
public enum enumMenuActionType'������� �������� ��� ������ ������ ����
  MenuActionType_Otkrit__otcet=5'������� �����
  MenuActionType_Nicego_ne_delat_=0'������ �� ������
  MenuActionType_Vipolnit__metod=2'��������� �����
  MenuActionType_Otkrit__dokument=1'������� ��������
  MenuActionType_Zapustit__ARM=4'��������� ���
  MenuActionType_Otkrit__gurnal=3'������� ������
end enum 
public enum enumColumnSortType'������� ��������� ������ �������
  ColumnSortType_As_String=0'As String
  ColumnSortType_As_Numeric=1'As Numeric
  ColumnSortType_As_Date=2'As Date
end enum 
public enum enumAdditionType'��� ��������
  AdditionType_Ob_em=1'�����
  AdditionType_Plotnost_=2'���������
  AdditionType_Procee=3'������
  AdditionType_Ves=0'���
end enum 
public enum enumStructType'��� �������
  StructType_Derevo=2'������
  StructType_Kollekciy=1'���������
  StructType_Stroka_atributov=0'������ ���������
end enum 
public enum enumTargetType'������� ������ ����������, ���� ����� �������������� ���
  TargetType_SUBD=0'����
  TargetType_ARM=4'���
  TargetType_Dokumentaciy=3'������������
  TargetType_MODEL_=1'������
  TargetType_Prilogenie=2'����������
end enum 
public enum enumPartAddBehaivor'��������� ��� ���������� ������ �������
  PartAddBehaivor_AddForm=0'AddForm
  PartAddBehaivor_RunAction=2'RunAction
  PartAddBehaivor_RefreshOnly=1'RefreshOnly
end enum 
public enum enumFolderType'��� �����
  FolderType_Ishodysie=2'���������
  FolderType_Zaversennie=10'�����������
  FolderType_Kalendar_=5'���������
  FolderType_cls__=0' 
  FolderType_Vhodysie=1'��������
  FolderType_Otlogennie=9'����������
  FolderType_Gurnal=4'������
  FolderType_V_rabote=8'� ������
  FolderType_Cernoviki=7'���������
  FolderType_Otpravlennie=6'������������
  FolderType_Udalennie=3'���������
end enum 
public enum enumWFShortcutType'�������� �������, ������� ����� ��������� �������
  WFShortcutType_Function=1'Function
  WFShortcutType_Process=2'Process
  WFShortcutType_Document=0'Document
end enum 
public enum enumReferenceType'ReferenceType
  ReferenceType_Na_stroku_razdela=2'�� ������ �������
  ReferenceType_Skalyrnoe_pole_OPN_ne_ssilkaCLS=0'��������� ���� ( �� ������)
  ReferenceType_Na_ob_ekt_=1'�� ������ 
end enum 
public enum enumSex'������� / �������
  Sex_Mugskoy=1'�������
  Sex_Ne_susestvenno=0'�� �����������
  Sex_Genskiy=-1'�������
end enum 
public enum enumMesureFormat'������ ����������
  MesureFormat_Data=1'����
  MesureFormat_Tekst=5'�����
  MesureFormat_Ob_ekt=4'������
  MesureFormat_Spravocnik=2'����������
  MesureFormat_Cislo=0'�����
end enum 
public enum enumWFFuncParam'������� ����������� ��������� �������
  WFFuncParam_Dokument=5'��������
  WFFuncParam_Znacenie=0'��������
  WFFuncParam_Dokument_processa=4'�������� ��������
  WFFuncParam_Viragenie=2'���������
  WFFuncParam_Rol_=8'����
  WFFuncParam_Papka=3'�����
  WFFuncParam_Pole=7'����
  WFFuncParam_Znacenie_iz_parametra=1'�������� �� ���������
  WFFuncParam_Razdel=6'������
  WFFuncParam_Tip_dokumenta=9'��� ���������
end enum 
public enum enumYesNo'�� / ��� (0 ��� 1)
  YesNo_Da=1'��
  YesNo_Net=0'���
end enum 
public enum enumGeneratorStyle'GeneratorStyle
  GeneratorStyle_Odin_tip=0'���� ���
  GeneratorStyle_Vse_tipi_srazu=1'��� ���� �����
end enum 
public enum enumReportType'������� ������
  ReportType_Dvumernay_matrica=1'��������� �������
  ReportType_Tablica=0'�������
  ReportType_Eksport_po_WORD_sablonu=3'������� �� WORD �������
  ReportType_Tol_ko_rascet=2'������ ������
  ReportType_Eksport_po_Excel_sablonu=4'������� �� Excel �������
end enum 
public enum enumHACCPPStep'��� ���� � ����� ��������
  HACCPPStep_Sir_e=5'�����
  HACCPPStep_Transportirovka=7'���������������
  HACCPPStep_Operaciy=3'��������
  HACCPPStep_Zaversenie_processa=1'���������� ��������
  HACCPPStep_Nacalo_processa=0'������ ��������
  HACCPPStep_Ostanov_processa=2'������� ��������
  HACCPPStep_Vhod_iz=9'���� ��
  HACCPPStep_Vihod_v=8'����� �
  HACCPPStep_Hranenie=6'��������
  HACCPPStep_Resenie=4'�������
end enum 
public enum enumDayInWeek'���� ������
  DayInWeek_Ponedel_nik=1'�����������
  DayInWeek_Sreda=3'�����
  DayInWeek_Vtornik=2'�������
  DayInWeek_Pytnica=5'�������
  DayInWeek_Subbota=6'�������
  DayInWeek_Cetverg=4'�������
  DayInWeek_Voskresen_e=7'�����������
end enum 
public enum enumPlatType'��� �����������
  PlatType_Otpravitel_=0'�����������
  PlatType_Polucatel_=1'����������
  PlatType_Drugoy=2'������
end enum 
public enum enumPartType'PartType
  PartType_Kollekciy=1'���������
  PartType_Rassirenie=3'����������
  PartType_Stroka=0'������
  PartType_Derevo=2'������
end enum 
public enum enumEmployment'���������
  Employment_Polnay=0'������
  Employment_Casticnay=1'���������
  Employment_Ne_vagno=-1'�� �����
end enum 
public enum enumKONTR_TYPE'��� �����������
  KONTR_TYPE_Procee=5'������
  KONTR_TYPE_Perevozcik=4'����������
  KONTR_TYPE_Partner=2'�������
  KONTR_TYPE_Pokupatel_=0'����������
  KONTR_TYPE_Ucreditel_=3'����������
  KONTR_TYPE_Postavsik=1'���������
end enum 
public enum enumConditionType'�������� �������
  ConditionType_LSGT=2'<>
  ConditionType_GT=3'>
  ConditionType_EQ=1'=
  ConditionType_GTEQ=4'>=
  ConditionType_LSEQ=7'<=
  ConditionType_like=8'like
  ConditionType_LS=6'<
  ConditionType_none=0'none
end enum 
public enum enumVRTaskType'��� ������
  VRTaskType_V_opredelenniy_moment=0'� ������������ ������
  VRTaskType_Fonovay=2'�������
  VRTaskType_K_opredelennomu_vremeni=1'� ������������� �������
end enum 
public enum enumOnJournalRowClick'�������� ��� �������� ������ �������
  OnJournalRowClick_Otkrit__dokument=2'������� ��������
  OnJournalRowClick_Otkrit__stroku=1'������� ������
  OnJournalRowClick_Nicego_ne_delat_=0'������ �� ������
end enum 
public enum enumEducation'�����������
  Education_Srednee_special_noe=2'������� �����������
  Education_Srednee=1'�������
  Education_Ne_vagno=-1'�� �����
  Education_Vissee=4'������
  Education_Nepolnoe_srednee=0'�������� �������
  Education_Nepolnoe_vissee=3'�������� ������
  Education_Neskol_ko_vissih=5'��������� ������
end enum 
public enum enumDCType'�������/�����/������
  DCType_Ostatki=-1'�������
  DCType_Debit=0'�����
  DCType_Kredit=1'������
end enum 
public enum enumDevelopmentBase'��������� ����������
  DevelopmentBase_JAVA=2'JAVA
  DevelopmentBase_OTHER=3'OTHER
  DevelopmentBase_DOTNET=1'DOTNET
  DevelopmentBase_VB6=0'VB6
end enum 
public enum enumBoolean'�� / ���
  Boolean_Da=-1'��
  Boolean_Net=0'���
end enum 
public enum enumTriState'�� / ��� / �� ����������
  TriState_Net=0'���
  TriState_Ne_susestvenno=-1'�� �����������
  TriState_Da=1'��
end enum 
public enum enumCurrencyType'������ �������
  CurrencyType_Rubl_=0'�����
  CurrencyType_Evro=2'����
  CurrencyType_Dollar=1'������
end enum 
public enum enumWFFuncState'��������� ������� � ������ ��������
  WFFuncState_Processed=8'Processed
  WFFuncState_InWork=3'InWork
  WFFuncState_Pause=4'Pause
  WFFuncState_Ready=5'Ready
  WFFuncState_InControl=6'InControl
  WFFuncState_Prepare=1'Prepare
  WFFuncState_Active=2'Active
  WFFuncState_Done=7'Done
  WFFuncState_Initial=0'Initial
end enum 
public enum enumEmployment_'�������� ��� �������������
  Employment__Polnay=0'������
  Employment__Casticnay=1'���������
  Employment__Ne_vagno=-1'�� �����
end enum 
public enum enumKONTR_STATUS'��������� ��������
  KONTR_STATUS_Blokirovan=2'����������
  KONTR_STATUS_Aktiveniy=0'���������
  KONTR_STATUS_Pssivniy=1'��������
  KONTR_STATUS_Operacii_zapreseni=3'�������� ���������
end enum 
public enum enumExtentionType'��� ����������
  ExtentionType_OnFormExt=1'OnFormExt
  ExtentionType_CodeGenerator=7'CodeGenerator
  ExtentionType_JrnlAddExt=3'JrnlAddExt
  ExtentionType_VerifyRowExt=6'VerifyRowExt
  ExtentionType_StatusExt=0'StatusExt
  ExtentionType_ARMGenerator=8'ARMGenerator
  ExtentionType_DefaultExt=5'DefaultExt
  ExtentionType_CustomExt=2'CustomExt
  ExtentionType_JrnlRunExt=4'JrnlRunExt
end enum 
public enum enumReplicationType'������� ���������� ��������
  ReplicationType_Ves__dokument=0'���� ��������
  ReplicationType_Lokal_niy=2'���������
  ReplicationType_Postrocno=1'���������
end enum 
public enum enumInfoStoreType'��� ��������
  InfoStoreType_Gruppovoy=2'���������
  InfoStoreType_Personal_niy=1'������������
  InfoStoreType_cls__Obsiy=0' �����
end enum 

    Public Class Application
        Inherits MKSNManager.Document.Doc_Base


        Protected Overrides Function MyTypeName() As String
            MyTypeName = "WFFR"
        End Function

  Private m_WFFR_ShortCut As WFFR_ShortCut_col
        Public ReadOnly Property WFFR_ShortCut() As WFFR_ShortCut_col
            Get
                If m_WFFR_ShortCut Is Nothing Then
                    m_WFFR_ShortCut = New WFFR_ShortCut_col
                    m_WFFR_ShortCut.Application = Me
                    m_WFFR_ShortCut.Parent = Me
                    m_WFFR_ShortCut.Refresh()
                End If
                WFFR_ShortCut = m_WFFR_ShortCut
            End Get
        End Property
  Private m_WFFR_Fcomm As WFFR_Fcomm_col
        Public ReadOnly Property WFFR_Fcomm() As WFFR_Fcomm_col
            Get
                If m_WFFR_Fcomm Is Nothing Then
                    m_WFFR_Fcomm = New WFFR_Fcomm_col
                    m_WFFR_Fcomm.Application = Me
                    m_WFFR_Fcomm.Parent = Me
                    m_WFFR_Fcomm.Refresh()
                End If
                WFFR_Fcomm = m_WFFR_Fcomm
            End Get
        End Property
  Private m_WFFR_fparents As WFFR_fparents_col
        Public ReadOnly Property WFFR_fparents() As WFFR_fparents_col
            Get
                If m_WFFR_fparents Is Nothing Then
                    m_WFFR_fparents = New WFFR_fparents_col
                    m_WFFR_fparents.Application = Me
                    m_WFFR_fparents.Parent = Me
                    m_WFFR_fparents.Refresh()
                End If
                WFFR_fparents = m_WFFR_fparents
            End Get
        End Property
  Private m_WFFR_func As WFFR_func_col
        Public ReadOnly Property WFFR_func() As WFFR_func_col
            Get
                If m_WFFR_func Is Nothing Then
                    m_WFFR_func = New WFFR_func_col
                    m_WFFR_func.Application = Me
                    m_WFFR_func.Parent = Me
                    m_WFFR_func.Refresh()
                End If
                WFFR_func = m_WFFR_func
            End Get
        End Property

        Public Overrides Sub Dispose()
            WFFR_ShortCut.Dispose()
            WFFR_Fcomm.Dispose()
            WFFR_fparents.Dispose()
            WFFR_func.Dispose()
        End Sub

        Protected Overrides Function FindInCollections(ByVal Table As String, ByVal InstID As String) As MKSNManager.Document.DocRow_Base
        FindInCollections = Nothing
            dim mFindInCollections As MKSNManager.Document.DocRow_Base
            mFindInCollections = WFFR_ShortCut.FindObject(Table, InstID)
            if not mFindInCollections is nothing then return mFindInCollections
            mFindInCollections = WFFR_Fcomm.FindObject(Table, InstID)
            if not mFindInCollections is nothing then return mFindInCollections
            mFindInCollections = WFFR_fparents.FindObject(Table, InstID)
            if not mFindInCollections is nothing then return mFindInCollections
            mFindInCollections = WFFR_func.FindObject(Table, InstID)
            if not mFindInCollections is nothing then return mFindInCollections
        End Function

        Protected Overrides Sub XMLLoadCollections(ByVal node As System.Xml.XmlNode, Optional ByVal LoadMode As Integer = 0)
            Dim e_list As XmlNodeList
            On Error Resume Next
            e_list = node.SelectNodes("WFFR_ShortCut_COL")
            WFFR_ShortCut.XMLLoad(e_list, LoadMode)
            e_list = node.SelectNodes("WFFR_Fcomm_COL")
            WFFR_Fcomm.XMLLoad(e_list, LoadMode)
            e_list = node.SelectNodes("WFFR_fparents_COL")
            WFFR_fparents.XMLLoad(e_list, LoadMode)
            e_list = node.SelectNodes("WFFR_func_COL")
            WFFR_func.XMLLoad(e_list, LoadMode)
        End Sub

        Public Overrides Sub XMLSaveCollections(ByVal node As System.Xml.XmlElement, ByVal Xdom As System.Xml.XmlDocument)
            WFFR_ShortCut.XMLSave(node, Xdom)
            WFFR_Fcomm.XMLSave(node, Xdom)
            WFFR_fparents.XMLSave(node, Xdom)
            WFFR_func.XMLSave(node, Xdom)
        End Sub
Public Overrides Sub BatchUpdate()
  If Not Application.WorkOffline Then
    WFFR_ShortCut.BatchUpdate
    WFFR_Fcomm.BatchUpdate
    WFFR_fparents.BatchUpdate
    WFFR_func.BatchUpdate
  End If
End Sub
    End Class
End Namespace



