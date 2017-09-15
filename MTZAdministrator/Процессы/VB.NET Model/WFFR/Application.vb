


Option Explicit On

Imports System.xml
Imports MKSNManager

Namespace WFFR


public enum enumHACCPStep'Тип шага в ХАССП процессе
  HACCPStep_Operaciy=3'Операция
  HACCPStep_Zaversenie_processa=1'Завершение процесса
  HACCPStep_Kontrol_nay_tocka=4'Контрольная точка
  HACCPStep_Korrektiruusee_deystvie=5'Корректирующее действие
  HACCPStep_Ostanov_processa=2'Останов процесса
  HACCPStep_Process=6'Процесс
  HACCPStep_Nacalo_processa=0'Начало процесса
end enum 
public enum enumHaccpIdent'Идентификация
  HaccpIdent_Kacestvo_poverhnosti=6'Качество поверхности
  HaccpIdent_Zapah=2'Запах
  HaccpIdent_Forma=3'Форма
  HaccpIdent_Cvet=1'Цвет
  HaccpIdent_Vkus=4'Вкус
  HaccpIdent_Procee=100'Прочее
  HaccpIdent_Zvuk=5'Звук
  HaccpIdent_Vnesniy_vid=0'Внешний вид
end enum 
public enum enumWFStepClass'Тип шага процесса
  WFStepClass_SimpleFunction=0'SimpleFunction
  WFStepClass_StartFunction=1'StartFunction
  WFStepClass_StopFunction=2'StopFunction
  WFStepClass_PeriodicFunction=3'PeriodicFunction
end enum 
public enum enumMonths'Месяцы
  Months_Noybr_=11'Ноябрь
  Months_Fevral_=2'Февраль
  Months_Dekabr_=12'Декабрь
  Months_Mart=3'Март
  Months_Ynvar_=1'Январь
  Months_Sentybr_=9'Сентябрь
  Months_Iun_=6'Июнь
  Months_Oktybr_=10'Октябрь
  Months_May=5'Май
  Months_Avgust=8'Август
  Months_Iul_=7'Июль
  Months_Aprel_=4'Апрель
end enum 
public enum enumTypeStyle'Вариант трактовки типа поля
  TypeStyle_Interval=3'Интервал
  TypeStyle_Skalyrniy_tip=0'Скалярный тип
  TypeStyle_Ssilka=4'Ссылка
  TypeStyle_Perecislenie=2'Перечисление
  TypeStyle_Viragenie=1'Выражение
end enum 
public enum enumAggregationType'Вариант агрегации по полю
  AggregationType_MAX=5'MAX
  AggregationType_AVG=1'AVG
  AggregationType_SUM=3'SUM
  AggregationType_COUNT=2'COUNT
  AggregationType_MIN=4'MIN
  AggregationType_CUSTOM=6'CUSTOM
  AggregationType_none=0'none
end enum 
public enum enumVHAlignment'Выравнивание
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
public enum enumWFProcessState'Состояния процесса
  WFProcessState_Active=2'Active
  WFProcessState_Pause=3'Pause
  WFProcessState_Processed=5'Processed
  WFProcessState_Done=4'Done
  WFProcessState_Prepare=1'Prepare
  WFProcessState_Initial=0'Initial
end enum 
public enum enumNumerationRule'Правило нумерации
  NumerationRule_Edinay_zona=0'Единая зона
  NumerationRule_Po_godu=1'По году
  NumerationRule_Po_dnu=4'По дню
  NumerationRule_Po_kvartalu=2'По кварталу
  NumerationRule_Po_mesycu=3'По месяцу
  NumerationRule_Proizvol_nie_zoni=10'Произвольные зоны
end enum 
public enum enumMenuActionType'Вариант действия при выборе пункта меню
  MenuActionType_Otkrit__otcet=5'Открыть отчет
  MenuActionType_Nicego_ne_delat_=0'Ничего не делать
  MenuActionType_Vipolnit__metod=2'Выполнить метод
  MenuActionType_Otkrit__dokument=1'Открыть документ
  MenuActionType_Zapustit__ARM=4'Запустить АРМ
  MenuActionType_Otkrit__gurnal=3'Открыть журнал
end enum 
public enum enumColumnSortType'Вариант сортиовки данных колонки
  ColumnSortType_As_String=0'As String
  ColumnSortType_As_Numeric=1'As Numeric
  ColumnSortType_As_Date=2'As Date
end enum 
public enum enumAdditionType'Тип надбавки
  AdditionType_Ob_em=1'Объем
  AdditionType_Plotnost_=2'Плотность
  AdditionType_Procee=3'Прочее
  AdditionType_Ves=0'Вес
end enum 
public enum enumStructType'Тип раздела
  StructType_Derevo=2'Дерево
  StructType_Kollekciy=1'Коллекция
  StructType_Stroka_atributov=0'Строка атрибутов
end enum 
public enum enumTargetType'Вариант уровня приложения, куда может генерироваться код
  TargetType_SUBD=0'СУБД
  TargetType_ARM=4'АРМ
  TargetType_Dokumentaciy=3'Документация
  TargetType_MODEL_=1'МОДЕЛЬ
  TargetType_Prilogenie=2'Приложение
end enum 
public enum enumPartAddBehaivor'Поведение при добавлении строки раздела
  PartAddBehaivor_AddForm=0'AddForm
  PartAddBehaivor_RunAction=2'RunAction
  PartAddBehaivor_RefreshOnly=1'RefreshOnly
end enum 
public enum enumFolderType'Тип папки
  FolderType_Ishodysie=2'Исходящие
  FolderType_Zaversennie=10'Завершенные
  FolderType_Kalendar_=5'Календарь
  FolderType_cls__=0' 
  FolderType_Vhodysie=1'Входящие
  FolderType_Otlogennie=9'Отложенные
  FolderType_Gurnal=4'Журнал
  FolderType_V_rabote=8'В работе
  FolderType_Cernoviki=7'Черновики
  FolderType_Otpravlennie=6'Отправленные
  FolderType_Udalennie=3'Удаленные
end enum 
public enum enumWFShortcutType'Варианты ярлыков, которые может размещать процесс
  WFShortcutType_Function=1'Function
  WFShortcutType_Process=2'Process
  WFShortcutType_Document=0'Document
end enum 
public enum enumReferenceType'ReferenceType
  ReferenceType_Na_stroku_razdela=2'На строку раздела
  ReferenceType_Skalyrnoe_pole_OPN_ne_ssilkaCLS=0'Скалярное поле ( не ссылка)
  ReferenceType_Na_ob_ekt_=1'На объект 
end enum 
public enum enumSex'Мужской / Женский
  Sex_Mugskoy=1'Мужской
  Sex_Ne_susestvenno=0'Не существенно
  Sex_Genskiy=-1'Женский
end enum 
public enum enumMesureFormat'Формат индикатора
  MesureFormat_Data=1'Дата
  MesureFormat_Tekst=5'Текст
  MesureFormat_Ob_ekt=4'Объект
  MesureFormat_Spravocnik=2'Справочник
  MesureFormat_Cislo=0'Число
end enum 
public enum enumWFFuncParam'Вариант расшифровки параметра функции
  WFFuncParam_Dokument=5'Документ
  WFFuncParam_Znacenie=0'Значение
  WFFuncParam_Dokument_processa=4'Документ процесса
  WFFuncParam_Viragenie=2'Выражение
  WFFuncParam_Rol_=8'Роль
  WFFuncParam_Papka=3'Папка
  WFFuncParam_Pole=7'Поле
  WFFuncParam_Znacenie_iz_parametra=1'Значение из параметра
  WFFuncParam_Razdel=6'Раздел
  WFFuncParam_Tip_dokumenta=9'Тип документа
end enum 
public enum enumYesNo'Да / Нет (0 или 1)
  YesNo_Da=1'Да
  YesNo_Net=0'Нет
end enum 
public enum enumGeneratorStyle'GeneratorStyle
  GeneratorStyle_Odin_tip=0'Один тип
  GeneratorStyle_Vse_tipi_srazu=1'Все типы сразу
end enum 
public enum enumReportType'Вариант отчета
  ReportType_Dvumernay_matrica=1'Двумерная матрица
  ReportType_Tablica=0'Таблица
  ReportType_Eksport_po_WORD_sablonu=3'Экспорт по WORD шаблону
  ReportType_Tol_ko_rascet=2'Только расчет
  ReportType_Eksport_po_Excel_sablonu=4'Экспорт по Excel шаблону
end enum 
public enum enumHACCPPStep'Тип шага в ХАССП процессе
  HACCPPStep_Sir_e=5'Сырье
  HACCPPStep_Transportirovka=7'Транспортировка
  HACCPPStep_Operaciy=3'Операция
  HACCPPStep_Zaversenie_processa=1'Завершение процесса
  HACCPPStep_Nacalo_processa=0'Начало процесса
  HACCPPStep_Ostanov_processa=2'Останов процесса
  HACCPPStep_Vhod_iz=9'Вход из
  HACCPPStep_Vihod_v=8'Выход в
  HACCPPStep_Hranenie=6'Хранение
  HACCPPStep_Resenie=4'Решение
end enum 
public enum enumDayInWeek'День недели
  DayInWeek_Ponedel_nik=1'Понедельник
  DayInWeek_Sreda=3'Среда
  DayInWeek_Vtornik=2'Вторник
  DayInWeek_Pytnica=5'Пятница
  DayInWeek_Subbota=6'Суббота
  DayInWeek_Cetverg=4'Четверг
  DayInWeek_Voskresen_e=7'Воскресенье
end enum 
public enum enumPlatType'Тип плательщика
  PlatType_Otpravitel_=0'Отправитель
  PlatType_Polucatel_=1'Получатель
  PlatType_Drugoy=2'Другой
end enum 
public enum enumPartType'PartType
  PartType_Kollekciy=1'Коллекция
  PartType_Rassirenie=3'Расширение
  PartType_Stroka=0'Строка
  PartType_Derevo=2'Дерево
end enum 
public enum enumEmployment'Занятость
  Employment_Polnay=0'Полная
  Employment_Casticnay=1'Частичная
  Employment_Ne_vagno=-1'Не важно
end enum 
public enum enumKONTR_TYPE'Тип контрагента
  KONTR_TYPE_Procee=5'Прочее
  KONTR_TYPE_Perevozcik=4'Перевозчик
  KONTR_TYPE_Partner=2'Партнер
  KONTR_TYPE_Pokupatel_=0'Покупатель
  KONTR_TYPE_Ucreditel_=3'Учредитель
  KONTR_TYPE_Postavsik=1'Поставщик
end enum 
public enum enumConditionType'Варианты условий
  ConditionType_LSGT=2'<>
  ConditionType_GT=3'>
  ConditionType_EQ=1'=
  ConditionType_GTEQ=4'>=
  ConditionType_LSEQ=7'<=
  ConditionType_like=8'like
  ConditionType_LS=6'<
  ConditionType_none=0'none
end enum 
public enum enumVRTaskType'Тип задачи
  VRTaskType_V_opredelenniy_moment=0'В определенный момент
  VRTaskType_Fonovay=2'Фоновая
  VRTaskType_K_opredelennomu_vremeni=1'К определенному времени
end enum 
public enum enumOnJournalRowClick'действие при открытии строки журнала
  OnJournalRowClick_Otkrit__dokument=2'Открыть документ
  OnJournalRowClick_Otkrit__stroku=1'Открыть строку
  OnJournalRowClick_Nicego_ne_delat_=0'Ничего не делать
end enum 
public enum enumEducation'Образование
  Education_Srednee_special_noe=2'Среднее специальное
  Education_Srednee=1'Среднее
  Education_Ne_vagno=-1'Не важно
  Education_Vissee=4'Высшее
  Education_Nepolnoe_srednee=0'Неполное среднее
  Education_Nepolnoe_vissee=3'Неполное высшее
  Education_Neskol_ko_vissih=5'Несколько высших
end enum 
public enum enumDCType'Остатки/Дебит/Кредит
  DCType_Ostatki=-1'Остатки
  DCType_Debit=0'Дебит
  DCType_Kredit=1'Кредит
end enum 
public enum enumDevelopmentBase'Платформа разработки
  DevelopmentBase_JAVA=2'JAVA
  DevelopmentBase_OTHER=3'OTHER
  DevelopmentBase_DOTNET=1'DOTNET
  DevelopmentBase_VB6=0'VB6
end enum 
public enum enumBoolean'Да / Нет
  Boolean_Da=-1'Да
  Boolean_Net=0'Нет
end enum 
public enum enumTriState'Да / Нет / Не определено
  TriState_Net=0'Нет
  TriState_Ne_susestvenno=-1'Не существенно
  TriState_Da=1'Да
end enum 
public enum enumCurrencyType'Валюта платежа
  CurrencyType_Rubl_=0'Рубль
  CurrencyType_Evro=2'Евро
  CurrencyType_Dollar=1'Доллар
end enum 
public enum enumWFFuncState'Состояние функции в бизнес процессе
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
public enum enumEmployment_'осталось для совместимости
  Employment__Polnay=0'Полная
  Employment__Casticnay=1'Частичная
  Employment__Ne_vagno=-1'Не важно
end enum 
public enum enumKONTR_STATUS'Состояние партнера
  KONTR_STATUS_Blokirovan=2'Блокирован
  KONTR_STATUS_Aktiveniy=0'Активеный
  KONTR_STATUS_Pssivniy=1'Пссивный
  KONTR_STATUS_Operacii_zapreseni=3'Операции запрещены
end enum 
public enum enumExtentionType'Тип расширения
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
public enum enumReplicationType'Вариант репликации докуента
  ReplicationType_Ves__dokument=0'Весь документ
  ReplicationType_Lokal_niy=2'Локальный
  ReplicationType_Postrocno=1'Построчно
end enum 
public enum enumInfoStoreType'Тип каталога
  InfoStoreType_Gruppovoy=2'Групповой
  InfoStoreType_Personal_niy=1'Персональный
  InfoStoreType_cls__Obsiy=0' Общий
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



