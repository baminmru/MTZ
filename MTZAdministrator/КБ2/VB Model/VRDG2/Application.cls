VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Application"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit


'корневой интерфейс документа (Договор)
Private m_Logger As MTZUtil.Logger
Private m_MTZSession As MTZSession.Session
Private m_Manager As MTZManager.Main
Private findCash As Collection
Private m_ID As String
Private m_SecureStyleID As String
Private m_StatusID As String
Private m_Name As String
Private Const m_TypeName As String = "VRDG2"
Private m_WorkOffline As Boolean
Private m_AutoLoadPart As Boolean


Enum enumHACCPStep 'Тип шага в ХАССП процессе
  HACCPStep_Operaciy = 3 'Операция
  HACCPStep_Zaversenie_processa = 1 'Завершение процесса
  HACCPStep_Kontrol_nay_tocka = 4 'Контрольная точка
  HACCPStep_Korrektiruusee_deystvie = 5 'Корректирующее действие
  HACCPStep_Ostanov_processa = 2 'Останов процесса
  HACCPStep_Process = 6 'Процесс
  HACCPStep_Nacalo_processa = 0 'Начало процесса
End Enum
Enum enumPCB_FileType 'Тип файла
  PCB_FileType_Proekt_PP = 0 'Проект ПП
  PCB_FileType_HZ = 1 'ХЗ
End Enum
Enum enumHaccpIdent 'Идентификация
  HaccpIdent_Kacestvo_poverhnosti = 6 'Качество поверхности
  HaccpIdent_Zapah = 2 'Запах
  HaccpIdent_Forma = 3 'Форма
  HaccpIdent_Cvet = 1 'Цвет
  HaccpIdent_Vkus = 4 'Вкус
  HaccpIdent_Procee = 100 'Прочее
  HaccpIdent_Zvuk = 5 'Звук
  HaccpIdent_Vnesniy_vid = 0 'Внешний вид
End Enum
Enum enumtypeFace 'Физическое лицо \ Юрифическое лицо
  typeFace_FizLico = 0 'ФизЛицо
  typeFace_UrLico = 1 'ЮрЛицо
End Enum
Enum enumWFStepClass 'Тип шага процесса
  WFStepClass_SimpleFunction = 0 'SimpleFunction
  WFStepClass_StartFunction = 1 'StartFunction
  WFStepClass_StopFunction = 2 'StopFunction
  WFStepClass_PeriodicFunction = 3 'PeriodicFunction
End Enum
Enum enumMonths 'Месяцы
  Months_Noybr_ = 11 'Ноябрь
  Months_Fevral_ = 2 'Февраль
  Months_Dekabr_ = 12 'Декабрь
  Months_Mart = 3 'Март
  Months_Ynvar_ = 1 'Январь
  Months_Sentybr_ = 9 'Сентябрь
  Months_Iun_ = 6 'Июнь
  Months_Oktybr_ = 10 'Октябрь
  Months_May = 5 'Май
  Months_Avgust = 8 'Август
  Months_Iul_ = 7 'Июль
  Months_Aprel_ = 4 'Апрель
End Enum
Enum enumTypeStyle 'Вариант трактовки типа поля
  TypeStyle_Interval = 3 'Интервал
  TypeStyle_Skalyrniy_tip = 0 'Скалярный тип
  TypeStyle_Ssilka = 4 'Ссылка
  TypeStyle_Perecislenie = 2 'Перечисление
  TypeStyle_Viragenie = 1 'Выражение
  TypeStyle_Element_oformleniy = 5 'Элемент оформления
End Enum
Enum enumAggregationType 'Вариант агрегации по полю
  AggregationType_MAX = 5 'MAX
  AggregationType_AVG = 1 'AVG
  AggregationType_SUM = 3 'SUM
  AggregationType_COUNT = 2 'COUNT
  AggregationType_MIN = 4 'MIN
  AggregationType_CUSTOM = 6 'CUSTOM
  AggregationType_none = 0 'none
End Enum
Enum enumVHAlignment 'Выравнивание
  VHAlignment_Center_Center = 4 'Center Center
  VHAlignment_Center_Top = 3 'Center Top
  VHAlignment_Right_Top = 6 'Right Top
  VHAlignment_Right_Bottom = 8 'Right Bottom
  VHAlignment_Left_Bottom = 2 'Left Bottom
  VHAlignment_Right_Center = 7 'Right Center
  VHAlignment_Center_Bottom = 5 'Center Bottom
  VHAlignment_Left_Center = 1 'Left Center
  VHAlignment_Left_Top = 0 'Left Top
End Enum
Enum enumtypePackage 'Тип отправления
  typePackage_Vse = -1 'Все
  typePackage_Tovar = 1 'Товар
  typePackage_Dokumenti = 0 'Документы
End Enum
Enum enumPCB_HoleType 'Тип отверстия
  PCB_HoleType_Gluhoe = 2 'Глухое
  PCB_HoleType_Metalizirovannoe = 0 'Метализированное
  PCB_HoleType_Nemetallizirovannoe = 1 'Неметаллизированное
End Enum
Enum enumWEBS_PageType '
  WEBS_PageType_Ne_susestvenno = 0 'Не существенно
  WEBS_PageType_Ob_ekt = 1 'Объект
  WEBS_PageType_Razdel = 3 'Раздел
  WEBS_PageType_Tablica = 2 'Таблица
End Enum
Enum enumWFProcessState 'Состояния процесса
  WFProcessState_Active = 2 'Active
  WFProcessState_Pause = 3 'Pause
  WFProcessState_Processed = 5 'Processed
  WFProcessState_Done = 4 'Done
  WFProcessState_Prepare = 1 'Prepare
  WFProcessState_Initial = 0 'Initial
End Enum
Enum enumNumerationRule 'Правило нумерации
  NumerationRule_Edinay_zona = 0 'Единая зона
  NumerationRule_Po_godu = 1 'По году
  NumerationRule_Po_dnu = 4 'По дню
  NumerationRule_Po_kvartalu = 2 'По кварталу
  NumerationRule_Po_mesycu = 3 'По месяцу
  NumerationRule_Proizvol_nie_zoni = 10 'Произвольные зоны
End Enum
Enum enumMenuActionType 'Вариант действия при выборе пункта меню
  MenuActionType_Otkrit__otcet = 5 'Открыть отчет
  MenuActionType_Nicego_ne_delat_ = 0 'Ничего не делать
  MenuActionType_Vipolnit__metod = 2 'Выполнить метод
  MenuActionType_Otkrit__dokument = 1 'Открыть документ
  MenuActionType_Zapustit__ARM = 4 'Запустить АРМ
  MenuActionType_Otkrit__gurnal = 3 'Открыть журнал
End Enum
Enum enumColumnSortType 'Вариант сортиовки данных колонки
  ColumnSortType_As_String = 0 'As String
  ColumnSortType_As_Numeric = 1 'As Numeric
  ColumnSortType_As_Date = 2 'As Date
End Enum
Enum enumAdditionType 'Тип надбавки
  AdditionType_Ob_em = 1 'Объем
  AdditionType_Plotnost_ = 2 'Плотность
  AdditionType_Procee = 3 'Прочее
  AdditionType_Ves = 0 'Вес
End Enum
Enum enumTypeSempling 'Тип выборки
  TypeSempling_Klienti = -1 'Клиенты
  TypeSempling_Adresati_operatorov = 0 'Адресаты операторов
  TypeSempling_Spisok_adresov_SPb = 2 'Список адресов СПб
  TypeSempling_Spisok_adresatov = 1 'Список адресатов
End Enum
Enum enumStructType 'Тип раздела
  StructType_Derevo = 2 'Дерево
  StructType_Kollekciy = 1 'Коллекция
  StructType_Stroka_atributov = 0 'Строка атрибутов
End Enum
Enum enumTargetType 'Вариант уровня приложения, куда может генерироваться код
  TargetType_SUBD = 0 'СУБД
  TargetType_ARM = 4 'АРМ
  TargetType_Dokumentaciy = 3 'Документация
  TargetType_MODEL_ = 1 'МОДЕЛЬ
  TargetType_Prilogenie = 2 'Приложение
End Enum
Enum enumDeliveryOn '
  DeliveryOn_Gorod = 4 'Город
  DeliveryOn_Strana = 1 'Страна
  DeliveryOn_Megdunarodnay = 0 'Международная
  DeliveryOn_Strana2 = 2 'Страна2
  DeliveryOn_Sub_ekt = 3 'Субъект
End Enum
Enum enumtypeOperatorSystem '
  typeOperatorSystem_Menedger = 2 'Менеджер
  typeOperatorSystem_Procee = 0 'Прочее
  typeOperatorSystem_Operator = 1 'Оператор
End Enum
Enum enumstateNomen '
  stateNomen_Pereadresaciy = 6 'Переадресация
  stateNomen_Oformlyetsy = 0 'Оформляется
  stateNomen_Dostavleno = 4 'Доставлено
  stateNomen_V_processe = 3 'В процессе
  stateNomen_Vozvrat = 5 'Возврат
  stateNomen_Prinyto = 2 'Принято
End Enum
Enum enumPartAddBehaivor 'Поведение при добавлении строки раздела
  PartAddBehaivor_AddForm = 0 'AddForm
  PartAddBehaivor_RunAction = 2 'RunAction
  PartAddBehaivor_RefreshOnly = 1 'RefreshOnly
End Enum
Enum enumFolderType 'Тип папки
  FolderType_Ishodysie = 2 'Исходящие
  FolderType_Zaversennie = 10 'Завершенные
  FolderType_Kalendar_ = 5 'Календарь
  FolderType_cls__ = 0 '
  FolderType_Vhodysie = 1 'Входящие
  FolderType_Otlogennie = 9 'Отложенные
  FolderType_Gurnal = 4 'Журнал
  FolderType_V_rabote = 8 'В работе
  FolderType_Cernoviki = 7 'Черновики
  FolderType_Otpravlennie = 6 'Отправленные
  FolderType_Udalennie = 3 'Удаленные
End Enum
Enum enummsgState 'Состояние заявки
  msgState_Sostoynie_zayvki = 0 'Состояние заявки
  msgState_Soobseno_abonentu = 1 'Сообщено абоненту
  msgState_Abonent_ne_otvetil = 2 'Абонент не ответил
  msgState_Promegutocniy_otvet = 3 'Промежуточный ответ
End Enum
Enum enumWFShortcutType 'Варианты ярлыков, которые может размещать процесс
  WFShortcutType_Function = 1 'Function
  WFShortcutType_Process = 2 'Process
  WFShortcutType_Document = 0 'Document
End Enum
Enum enumReferenceType 'ReferenceType
  ReferenceType_Na_stroku_razdela = 2 'На строку раздела
  ReferenceType_Na_istocnik_dannih = 3 'На источник данных
  ReferenceType_Skalyrnoe_pole_OPN_ne_ssilkaCLS = 0 'Скалярное поле ( не ссылка)
  ReferenceType_Na_ob_ekt_ = 1 'На объект
End Enum
Enum enumSex 'Мужской / Женский
  Sex_Mugskoy = 1 'Мужской
  Sex_Ne_susestvenno = 0 'Не существенно
  Sex_Genskiy = -1 'Женский
End Enum
Enum enumMesureFormat 'Формат индикатора
  MesureFormat_Data = 1 'Дата
  MesureFormat_Tekst = 5 'Текст
  MesureFormat_Ob_ekt = 4 'Объект
  MesureFormat_Spravocnik = 2 'Справочник
  MesureFormat_Cislo = 0 'Число
End Enum
Enum enumWFFuncParam 'Вариант расшифровки параметра функции
  WFFuncParam_Dokument = 5 'Документ
  WFFuncParam_Znacenie = 0 'Значение
  WFFuncParam_Dokument_processa = 4 'Документ процесса
  WFFuncParam_Viragenie = 2 'Выражение
  WFFuncParam_Rol_ = 8 'Роль
  WFFuncParam_Papka = 3 'Папка
  WFFuncParam_Pole = 7 'Поле
  WFFuncParam_Znacenie_iz_parametra = 1 'Значение из параметра
  WFFuncParam_Razdel = 6 'Раздел
  WFFuncParam_Tip_dokumenta = 9 'Тип документа
End Enum
Enum enumYesNo 'Да / Нет (0 или 1)
  YesNo_Da = 1 'Да
  YesNo_Net = 0 'Нет
End Enum
Enum enumtypeOrder '
  typeOrder_Bezadresniy_zakaz = 0 'Безадресный заказ
  typeOrder_Adresniy_zakaz = 1 'Адресный заказ
End Enum
Enum enummsgResult 'Результат
  msgResult_Vipolneno = 2 'Выполнено
  msgResult_V_rabote = 1 'В работе
  msgResult_Rezul_tat = 0 'Результат
End Enum
Enum enumGeneratorStyle 'GeneratorStyle
  GeneratorStyle_Odin_tip = 0 'Один тип
  GeneratorStyle_Vse_tipi_srazu = 1 'Все типы сразу
End Enum
Enum enumReportType 'Вариант отчета
  ReportType_Dvumernay_matrica = 1 'Двумерная матрица
  ReportType_Tablica = 0 'Таблица
  ReportType_Eksport_po_WORD_sablonu = 3 'Экспорт по WORD шаблону
  ReportType_Tol_ko_rascet = 2 'Только расчет
  ReportType_Eksport_po_Excel_sablonu = 4 'Экспорт по Excel шаблону
End Enum
Enum enumHACCPPStep 'Тип шага в ХАССП процессе
  HACCPPStep_Sir_e = 5 'Сырье
  HACCPPStep_Transportirovka = 7 'Транспортировка
  HACCPPStep_Operaciy = 3 'Операция
  HACCPPStep_Zaversenie_processa = 1 'Завершение процесса
  HACCPPStep_Nacalo_processa = 0 'Начало процесса
  HACCPPStep_Ostanov_processa = 2 'Останов процесса
  HACCPPStep_Vhod_iz = 9 'Вход из
  HACCPPStep_Vihod_v = 8 'Выход в
  HACCPPStep_Hranenie = 6 'Хранение
  HACCPPStep_Resenie = 4 'Решение
End Enum
Enum enumtypeDocOrder 'Тип документов для печати заказчику
  typeDocOrder_Nalicniy_OPNPKO_PLS_kasDOTcekCLS = 1 'Наличный (ПКО + кас.чек)
  typeDocOrder_Nalicniy_OPNtovarniy_cek_PLS_kasDOTcekCLS = 0 'Наличный (товарный чек + кас.чек)
  typeDocOrder_Beznalicniy_rascet = 3 'Безналичный расчет
End Enum
Enum enumPCB_LayerP 'Представление поля
  PCB_LayerP_Negativ = 2 'Негатив
  PCB_LayerP_Ne_imeet_znaceniy = 0 'Не имеет значения
  PCB_LayerP_Pozitiv = 1 'Позитив
End Enum
Enum enumDayInWeek 'День недели
  DayInWeek_Ponedel_nik = 1 'Понедельник
  DayInWeek_Sreda = 3 'Среда
  DayInWeek_Vtornik = 2 'Вторник
  DayInWeek_Pytnica = 5 'Пятница
  DayInWeek_Subbota = 6 'Суббота
  DayInWeek_Cetverg = 4 'Четверг
  DayInWeek_Voskresen_e = 7 'Воскресенье
End Enum
Enum enumPlatType 'Тип плательщика
  PlatType_Otpravitel_ = 0 'Отправитель
  PlatType_Polucatel_ = 1 'Получатель
  PlatType_Drugoy = 2 'Другой
End Enum
Enum enumPartType 'PartType
  PartType_Kollekciy = 1 'Коллекция
  PartType_Rassirenie = 3 'Расширение
  PartType_Stroka = 0 'Строка
  PartType_Derevo = 2 'Дерево
  PartType_Rassirenie_s_dannimi = 4 'Расширение с данными
End Enum
Enum enumEmployment 'Занятость
  Employment_Polnay = 0 'Полная
  Employment_Casticnay = 1 'Частичная
  Employment_Ne_vagno = -1 'Не важно
End Enum
Enum enumtypeClient 'Тип заказчика
  typeClient_Razoviy = 0 'Разовый
End Enum
Enum enumtypeNomen 'Тип номенкатуры
  typeNomen_Listovki = 2 'Листовки
  typeNomen_Tovar = 1 'Товар
  typeNomen_GazetiCOMA_gurnaliCOMA_brosuri = 4 'Газеты, журналы, брошюры
  typeNomen_Pis_mo = 3 'Письмо
  typeNomen_Dokument = 0 'Документ
End Enum
Enum enumKONTR_TYPE 'Тип контрагента
  KONTR_TYPE_Procee = 5 'Прочее
  KONTR_TYPE_Perevozcik = 4 'Перевозчик
  KONTR_TYPE_Partner = 2 'Партнер
  KONTR_TYPE_Pokupatel_ = 0 'Покупатель
  KONTR_TYPE_Ucreditel_ = 3 'Учредитель
  KONTR_TYPE_Postavsik = 1 'Поставщик
End Enum
Enum enumtypePersonPay '
  typePersonPay_Otpravitel_ = 0 'Отправитель
  typePersonPay_Polucatel_ = 1 'Получатель
End Enum
Enum enumJournalLinkType 'Для связи журналов друг с другом
  JournalLinkType_Ssilka_na_stroku = 2 'Ссылка на строку
  JournalLinkType_Ssilka_na_ob_ekt = 1 'Ссылка на объект
  JournalLinkType_Svyzka_InstanceID_OPNv_peredlah_ob_ektaCLS = 3 'Связка InstanceID (в передлах объекта)
  JournalLinkType_Svyzka_ParentStructRowID__OPNv_peredlah_ob_ektaCLS = 4 'Связка ParentStructRowID  (в передлах объекта)
  JournalLinkType_Net = 0 'Нет
End Enum
Enum enumConditionType 'Варианты условий
  ConditionType_LSGT = 2 '<>
  ConditionType_GT = 3 '>
  ConditionType_EQ = 1 '=
  ConditionType_GTEQ = 4 '>=
  ConditionType_LSEQ = 7 '<=
  ConditionType_like = 8 'like
  ConditionType_LS = 6 '<
  ConditionType_none = 0 'none
End Enum
Enum enumtypePay 'Сдельная \ Ставка
  typePay_Stavka = 1 'Ставка
  typePay_Sdel_nay = 0 'Сдельная
End Enum
Enum enumPCB_TaskType 'Тип задачи
  PCB_TaskType_Dostavka = 4 'Доставка
  PCB_TaskType_Izgotovlenie_PP = 1 'Изготовление ПП
  PCB_TaskType_Postavka_komplektuusih = 2 'Поставка комплектующих
  PCB_TaskType_Montag_PP = 0 'Монтаж ПП
  PCB_TaskType_Proektirovanie_PP = 3 'Проектирование ПП
End Enum
Enum enumVRTaskType 'Тип задачи
  VRTaskType_V_opredelenniy_moment = 0 'В определенный момент
  VRTaskType_Fonovay = 2 'Фоновая
  VRTaskType_K_opredelennomu_vremeni = 1 'К определенному времени
End Enum
Enum enumtypeReceiv '
  typeReceiv_PTS = 1 'ПТС
  typeReceiv_SVS = 0 'СВС
End Enum
Enum enumPCB_CustomerType 'Статус заказчика
  PCB_CustomerType_Real_niy = 1 'Реальный
  PCB_CustomerType_Potencial_niy = 0 'Потенциальный
End Enum
Enum enumOnJournalRowClick 'действие при открытии строки журнала
  OnJournalRowClick_Otkrit__dokument = 2 'Открыть документ
  OnJournalRowClick_Otkrit__stroku = 1 'Открыть строку
  OnJournalRowClick_Nicego_ne_delat_ = 0 'Ничего не делать
End Enum
Enum enumtypeRowCheque 'Тип строки чека
  typeRowCheque_PO = 1 'ПО
  typeRowCheque_Procee = 0 'Прочее
  typeRowCheque_Prostoe_PO = 4 'Простое ПО
  typeRowCheque_dopDOTusluga_PO = 2 'доп.услуга ПО
  typeRowCheque_dopDOTusluga_zakaza = 3 'доп.услуга заказа
  typeRowCheque_Tovar = 5 'Товар
End Enum
Enum enumPCB_clear 'Тип задачи
  PCB_clear_Zadaca_1 = 1 'Задача 1
  PCB_clear_Zadaca_2 = 0 'Задача 2
End Enum
Enum enumtypeTariff '
  typeTariff_Usluga = 1 'Услуга
  typeTariff_Dostavka = 0 'Доставка
End Enum
Enum enumEducation 'Образование
  Education_Srednee_special_noe = 2 'Среднее специальное
  Education_Srednee = 1 'Среднее
  Education_Ne_vagno = -1 'Не важно
  Education_Vissee = 4 'Высшее
  Education_Nepolnoe_srednee = 0 'Неполное среднее
  Education_Nepolnoe_vissee = 3 'Неполное высшее
  Education_Neskol_ko_vissih = 5 'Несколько высших
End Enum
Enum enumDCType 'Остатки/Дебит/Кредит
  DCType_Ostatki = -1 'Остатки
  DCType_Debit = 0 'Дебит
  DCType_Kredit = 1 'Кредит
End Enum
Enum enumDevelopmentBase 'Платформа разработки
  DevelopmentBase_JAVA = 2 'JAVA
  DevelopmentBase_OTHER = 3 'OTHER
  DevelopmentBase_DOTNET = 1 'DOTNET
  DevelopmentBase_VB6 = 0 'VB6
End Enum
Enum enumBoolean 'Да / Нет
  Boolean_Da = -1 'Да
  Boolean_Net = 0 'Нет
End Enum
Enum enumTriState 'Да / Нет / Не определено
  TriState_Net = 0 'Нет
  TriState_Ne_susestvenno = -1 'Не существенно
  TriState_Da = 1 'Да
End Enum
Enum enumtypeTRF 'Тип тарифа СС
  typeTRF_Tarif_podrydcika = 0 'Тариф подрядчика
  typeTRF_Tarif_klienta = 1 'Тариф клиента
  typeTRF_Obsiy_tarif = -1 'Общий тариф
End Enum
Enum enumCurrencyType 'Валюта платежа
  CurrencyType_Rubl_ = 0 'Рубль
  CurrencyType_Evro = 2 'Евро
  CurrencyType_Dollar = 1 'Доллар
End Enum
Enum enumWFFuncState 'Состояние функции в бизнес процессе
  WFFuncState_Processed = 8 'Processed
  WFFuncState_InWork = 3 'InWork
  WFFuncState_Pause = 4 'Pause
  WFFuncState_Ready = 5 'Ready
  WFFuncState_InControl = 6 'InControl
  WFFuncState_Prepare = 1 'Prepare
  WFFuncState_Active = 2 'Active
  WFFuncState_Done = 7 'Done
  WFFuncState_Initial = 0 'Initial
End Enum
Enum enumtypeCourier 'Договор \ ТрудКнижка
  typeCourier_Trudovay_knigka = 1 'Трудовая книжка
  typeCourier_Dogovor_podryda = 0 'Договор подряда
End Enum
Enum enumEmployment_ 'осталось для совместимости
  Employment__Polnay = 0 'Полная
  Employment__Casticnay = 1 'Частичная
  Employment__Ne_vagno = -1 'Не важно
End Enum
Enum enumKONTR_STATUS 'Состояние партнера
  KONTR_STATUS_Blokirovan = 2 'Блокирован
  KONTR_STATUS_Aktiveniy = 0 'Активеный
  KONTR_STATUS_Pssivniy = 1 'Пссивный
  KONTR_STATUS_Operacii_zapreseni = 3 'Операции запрещены
End Enum
Enum enumExtentionType 'Тип расширения
  ExtentionType_OnFormExt = 1 'OnFormExt
  ExtentionType_CodeGenerator = 7 'CodeGenerator
  ExtentionType_JrnlAddExt = 3 'JrnlAddExt
  ExtentionType_VerifyRowExt = 6 'VerifyRowExt
  ExtentionType_StatusExt = 0 'StatusExt
  ExtentionType_ARMGenerator = 8 'ARMGenerator
  ExtentionType_DefaultExt = 5 'DefaultExt
  ExtentionType_CustomExt = 2 'CustomExt
  ExtentionType_JrnlRunExt = 4 'JrnlRunExt
End Enum
Enum enumReplicationType 'Вариант репликации докуента
  ReplicationType_Ves__dokument = 0 'Весь документ
  ReplicationType_Lokal_niy = 2 'Локальный
  ReplicationType_Postrocno = 1 'Построчно
End Enum
Enum enumInfoStoreType 'Тип каталога
  InfoStoreType_Gruppovoy = 2 'Групповой
  InfoStoreType_Personal_niy = 1 'Персональный
  InfoStoreType_cls__Obsiy = 0 ' Общий
End Enum
Private m_VRDGCommon As VRDGCommon_col
Private m_VRDGReport As VRDGReport_col
Private m_VRDGContractChanges As VRDGContractChanges_col
Private m_VRDG_1CLINK As VRDG_1CLINK_col
Private m_VRDGContractVersion As VRDGContractVersion_col
Private m_VRDGContractSpesial As VRDGContractSpesial_col
Private m_IsLocked As LockStyle







'Название типа
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. TypeName
Public Property Get TypeName() As String
  TypeName = m_TypeName
End Property


'Отладочный компонент
'Parameters:
' параметров нет
'Returns:
'  объект класса MTZUtil.Logger
'  ,или Nothing
'See Also:
'Example:
' dim variable as MTZUtil.Logger
' Set variable = me. Logger
Public Property Get Logger() As MTZUtil.Logger
  If m_Logger Is Nothing Then
    Set m_Logger = New MTZUtil.Logger
    m_Logger.CreateLog TypeName & "_" & id, TypeName
  End If
  Set Logger = m_Logger
End Property


'Получить Название документа
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. Name
Public Property Get Name() As String
  Name = m_Name
End Property


'Задать название документа
'Parameters:
'[IN][OUT]  n , тип параметра: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. Name = value
Public Property Let Name(n As String)
  m_Name = n
End Property


'Получить корневой объект системы - менеджер документов
'Parameters:
' параметров нет
'Returns:
'  объект класса MTZManager.Main
'  ,или Nothing
'See Also:
'Example:
' dim variable as MTZManager.Main
' Set variable = me. Manager
Public Property Get Manager() As MTZManager.Main
  Set Manager = m_Manager
End Property


'Задать менеджер документов
'Parameters:
'[IN][OUT]  m , тип параметра: MTZManager.Main  - ...
'See Also:
'Example:
' dim value as Variant
' set value = new Variant
' set me. Manager = value
Public Property Set Manager(m As MTZManager.Main)
  If Not m_Manager Is Nothing Then Exit Property
  Set m_Manager = m
  Logger.Message "Manager defined"
End Property


'Получить текущую сессию пользователя
'Parameters:
' параметров нет
'Returns:
'  объект класса MTZSession.Session
'  ,или Nothing
'See Also:
'Example:
' dim variable as MTZSession.Session
' Set variable = me. MTZSession
Public Property Get MTZSession() As MTZSession.Session
  Set MTZSession = m_MTZSession
End Property


'Задть текущую сессию пользователя
'Parameters:
'[IN][OUT]  m , тип параметра: MTZSession.Session  - ...
'See Also:
'Example:
' dim value as Variant
' set value = new Variant
' set me. MTZSession = value
Public Property Set MTZSession(m As MTZSession.Session)
  If Not m_MTZSession Is Nothing Then Exit Property
  Set m_MTZSession = m
  Logger.Message "Session defined"
  m_AutoLoadPart = True
End Property


'Признак - работа без соединения с базой
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. WorkOffline
Public Property Get WorkOffline() As Boolean
    WorkOffline = m_WorkOffline
End Property


'Получить значение признака работы без соединения
'Parameters:
'[IN][OUT]  v , тип параметра: boolean  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. WorkOffline = value
Public Property Let WorkOffline(v As Boolean)
  If MTZSession Is Nothing Then
    m_WorkOffline = False
  Else
    m_WorkOffline = v
  End If
End Property


'Получить признак автоматической загрузки всеех полей
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. AutoLoadPart
Public Property Get AutoLoadPart() As Boolean
    AutoLoadPart = m_AutoLoadPart
End Property


'Признак загрузки всех полей (не только идентификатора)
'Parameters:
'[IN][OUT]  v , тип параметра: boolean  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. AutoLoadPart = value
Public Property Let AutoLoadPart(v As Boolean)
    m_AutoLoadPart = v
End Property


'Идентификатор документа
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. ID
Public Property Get id() As String
  id = m_ID
End Property


'Задать идентификатор документа
'Parameters:
'[IN][OUT]  v , тип параметра: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. ID = value
Public Property Let id(v As String)
  m_ID = v
End Property


'Родительский объект в иерархии документа
'Parameters:
' параметров нет
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. Parent
Public Property Get Parent() As Object
  Set Parent = Nothing
End Property


'Корневой объект в иерархии документа
'Parameters:
' параметров нет
'Returns:
'  объект класса Application
'  ,или Nothing
'See Also:
'Example:
' dim variable as Application
' Set variable = me. Application
Public Property Get Application() As Application
  Set Application = Me
End Property


'Добавить в оптимизтор поиска строку раздела документа
'Parameters:
'[IN]   Key , тип параметра: string,
'[IN]   Item , тип параметра: Object  - ...
'See Also:
'Example:
'  call me.AddToCash({параметры})
Public Sub AddToCash(ByVal key As String, ByVal Item As Object)
  On Error Resume Next
  findCash.Add Item, key
End Sub


'Исключить из оптимизатора сторку раздела документа
'Parameters:
'[IN]   Key , тип параметра: string  - ...
'See Also:
'Example:
'  call me.RemoveFromCash({параметры})
Public Sub RemoveFromCash(ByVal key As String)
  On Error Resume Next
  findCash.Remove key
End Sub

'Задать идентификатор стиля защиты
'Parameters:
'[IN]   newID , тип параметра: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. SecureStyleID = value
Public Property Let SecureStyleID(ByVal newID As String)
  Secure newID
  GetStatus
End Property

'Получить идентификатор стиля защиты
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. SecureStyleID
Public Property Get SecureStyleID() As String
  GetStatus
  SecureStyleID = m_SecureStyleID
End Property

'Задать идентификатор сосотяния документа
'Parameters:
'[IN]   newID , тип параметра: string  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. StatusID = value
Public Property Let StatusID(ByVal newID As String)
    SetStatus newID
    GetStatus
End Property

'Получить идентификатор состояния
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. StatusID
Public Property Get StatusID() As String
  GetStatus
  StatusID = m_StatusID
End Property

'Получить название состояния
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
' variable = me. StatusName
Public Property Get StatusName() As String
  GetStatus
  StatusName = ""
If StatusID = "{334E26DD-9135-49C4-8A28-095243B5AC74}" Then StatusName = "Подписан": Exit Property
If StatusID = "{C994F8FE-A120-4AAA-B260-1F4F06D29823}" Then StatusName = "В Архиве": Exit Property
If StatusID = "{DB6E7901-B667-4F32-BA25-614074776B8D}" Then StatusName = "Оформляется": Exit Property
If StatusID = "{C1D87871-5D23-4CF7-9CA0-B197BC56DC8B}" Then StatusName = "Исполнен": Exit Property
If StatusID = "{8B235B8F-AA9D-4B09-9FF1-D39D03B82F8C}" Then StatusName = "Оформлен": Exit Property
End Property

'Даные раздела Общая информация
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса VRDGCommon_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as VRDGCommon_col
' Set variable = me. VRDGCommon (...параметры...)
Public Property Get VRDGCommon(Optional ByVal Refresh As Boolean = True) As VRDGCommon_col
 If m_VRDGCommon Is Nothing Then
   Set m_VRDGCommon = New VRDGCommon_col
   Set m_VRDGCommon.Parent = Me
   Set m_VRDGCommon.Application = Me.Application
   If Refresh Then m_VRDGCommon.Refresh
 End If
 Set VRDGCommon = m_VRDGCommon
End Property

'Даные раздела Отчеты
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса VRDGReport_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as VRDGReport_col
' Set variable = me. VRDGReport (...параметры...)
Public Property Get VRDGReport(Optional ByVal Refresh As Boolean = True) As VRDGReport_col
 If m_VRDGReport Is Nothing Then
   Set m_VRDGReport = New VRDGReport_col
   Set m_VRDGReport.Parent = Me
   Set m_VRDGReport.Application = Me.Application
   If Refresh Then m_VRDGReport.Refresh
 End If
 Set VRDGReport = m_VRDGReport
End Property

'Даные раздела Дополнительные соглашения
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса VRDGContractChanges_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as VRDGContractChanges_col
' Set variable = me. VRDGContractChanges (...параметры...)
Public Property Get VRDGContractChanges(Optional ByVal Refresh As Boolean = True) As VRDGContractChanges_col
 If m_VRDGContractChanges Is Nothing Then
   Set m_VRDGContractChanges = New VRDGContractChanges_col
   Set m_VRDGContractChanges.Parent = Me
   Set m_VRDGContractChanges.Application = Me.Application
   If Refresh Then m_VRDGContractChanges.Refresh
 End If
 Set VRDGContractChanges = m_VRDGContractChanges
End Property

'Даные раздела Связь с 1С
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса VRDG_1CLINK_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as VRDG_1CLINK_col
' Set variable = me. VRDG_1CLINK (...параметры...)
Public Property Get VRDG_1CLINK(Optional ByVal Refresh As Boolean = True) As VRDG_1CLINK_col
 If m_VRDG_1CLINK Is Nothing Then
   Set m_VRDG_1CLINK = New VRDG_1CLINK_col
   Set m_VRDG_1CLINK.Parent = Me
   Set m_VRDG_1CLINK.Application = Me.Application
   If Refresh Then m_VRDG_1CLINK.Refresh
 End If
 Set VRDG_1CLINK = m_VRDG_1CLINK
End Property

'Даные раздела Версия договора
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса VRDGContractVersion_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as VRDGContractVersion_col
' Set variable = me. VRDGContractVersion (...параметры...)
Public Property Get VRDGContractVersion(Optional ByVal Refresh As Boolean = True) As VRDGContractVersion_col
 If m_VRDGContractVersion Is Nothing Then
   Set m_VRDGContractVersion = New VRDGContractVersion_col
   Set m_VRDGContractVersion.Parent = Me
   Set m_VRDGContractVersion.Application = Me.Application
   If Refresh Then m_VRDGContractVersion.Refresh
 End If
 Set VRDGContractVersion = m_VRDGContractVersion
End Property

'Даные раздела Специальные условие
'Parameters:
'[IN]   Refresh , тип параметра: boolean = true  - ...
'Returns:
'  объект класса VRDGContractSpesial_col
'  ,или Nothing
'See Also:
'Example:
' dim variable as VRDGContractSpesial_col
' Set variable = me. VRDGContractSpesial (...параметры...)
Public Property Get VRDGContractSpesial(Optional ByVal Refresh As Boolean = True) As VRDGContractSpesial_col
 If m_VRDGContractSpesial Is Nothing Then
   Set m_VRDGContractSpesial = New VRDGContractSpesial_col
   Set m_VRDGContractSpesial.Parent = Me
   Set m_VRDGContractSpesial.Application = Me.Application
   If Refresh Then m_VRDGContractSpesial.Refresh
 End If
 Set VRDGContractSpesial = m_VRDGContractSpesial
End Property

'Деструктор
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CloseClass()
Public Sub CloseClass()
 On Error Resume Next
 Set findCash = Nothing

  If Not m_VRDGCommon Is Nothing Then
    m_VRDGCommon.CloseClass
    Set m_VRDGCommon = Nothing
  End If
  If Not m_VRDGReport Is Nothing Then
    m_VRDGReport.CloseClass
    Set m_VRDGReport = Nothing
  End If
  If Not m_VRDGContractChanges Is Nothing Then
    m_VRDGContractChanges.CloseClass
    Set m_VRDGContractChanges = Nothing
  End If
  If Not m_VRDG_1CLINK Is Nothing Then
    m_VRDG_1CLINK.CloseClass
    Set m_VRDG_1CLINK = Nothing
  End If
  If Not m_VRDGContractVersion Is Nothing Then
    m_VRDGContractVersion.CloseClass
    Set m_VRDGContractVersion = Nothing
  End If
  If Not m_VRDGContractSpesial Is Nothing Then
    m_VRDGContractSpesial.CloseClass
    Set m_VRDGContractSpesial = Nothing
  End If
  If Not m_Manager Is Nothing Then
    Set m_Manager = Nothing
  End If
  If Not m_MTZSession Is Nothing Then
    Set m_MTZSession = Nothing
  End If
  If Not m_Logger Is Nothing Then
    m_Logger.Message "Application.CloseClass"
    Set m_Logger = Nothing
  End If
End Sub

'Поиск  строки раздела по ключу и названию раздела во всех документах
'Parameters:
'[IN]   StrID , тип параметра: String,
'[IN]   RowID , тип параметра: String  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as Object
' Set variable = me.FindRowObject(...параметры...)
Public Function FindRowObject(ByVal StrID As String, ByVal RowID As String) As Object
  Dim obj As Object
  Dim Rowobj As Object
  Dim i As Long
Dim m_FindObject As Object

If StrID = "" Then Exit Function
If RowID = "" Then Exit Function
If findCash Is Nothing Then
 Set findCash = New Collection
End If
On Error Resume Next
Set m_FindObject = findCash.Item(StrID & RowID)
If Not m_FindObject Is Nothing Then
  If m_FindObject.Application Is Nothing Then
    Set m_FindObject = Nothing
    findCash.Remove StrID & RowID
  Else
   Set FindRowObject = m_FindObject
   Exit Function
  End If
End If

  Dim rpl As RowParentList
  Set rpl = MTZSession.TheFinder.RowParents(StrID, RowID)
  If rpl.Count > 0 Then

 If rpl.Item(1).RowID = id Then
    Set Rowobj = Me
    For i = 2 To rpl.Count
     Set Rowobj = Rowobj.FindObject(rpl.Item(i).PartName, rpl.Item(i).RowID)
    Next

' reference from another object
 Else
   Set obj = Manager.GetInstanceObject(rpl.Item(1).RowID)
   If obj Is Nothing Then Exit Function
   Set Rowobj = obj.FindRowObject(StrID, RowID)
 End If

  Else
' use old search style
 Set Rowobj = FindObject(StrID, RowID)
 If Rowobj Is Nothing Then
   Set obj = Manager.FindInstanceByRow(StrID, RowID)
   If obj Is Nothing Then Exit Function
   Set Rowobj = obj.FindObject(StrID, RowID)
 End If
  End If
  If Rowobj Is Nothing Then Exit Function
  Set FindRowObject = Rowobj
  Set Rowobj = Nothing
  Set obj = Nothing
End Function


'Поиск строки только в текщем документе
'Parameters:
'[IN]   StrID , тип параметра: string,
'[IN]   InstID , тип параметра: string  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me.FindObject(...параметры...)
Public Function FindObject(ByVal StrID As String, ByVal InstID As String) As Object
 Dim m_FindObject As Object
 Static inFindObject As Boolean
 If StrID = "" Then Exit Function
 If InstID = "" Then Exit Function
 If inFindObject Then Exit Function
 inFindObject = True
  If findCash Is Nothing Then
  Set findCash = New Collection
 End If
 On Error Resume Next
 Set m_FindObject = findCash.Item(StrID & InstID)
 If Not m_FindObject Is Nothing Then
   If m_FindObject.Application Is Nothing Then
     Set m_FindObject = Nothing
     findCash.Remove StrID & InstID
   End If
 End If

 If m_FindObject Is Nothing Then
   Set m_FindObject = VRDGCommon.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = VRDGReport.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = VRDGContractChanges.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = VRDG_1CLINK.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = VRDGContractVersion.FindObject(StrID, InstID)
 End If
 If m_FindObject Is Nothing Then
   Set m_FindObject = VRDGContractSpesial.FindObject(StrID, InstID)
 End If
 If findCash.Item(StrID & InstID) Is Nothing Then
   findCash.Add m_FindObject, StrID & InstID
 End If
 Set FindObject = m_FindObject
 Set m_FindObject = Nothing
 inFindObject = False
End Function


'Оптимизировать объем занятой памяти
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Compact()
Public Sub Compact()

VRDGCommon.Compact
VRDGReport.Compact
VRDGContractChanges.Compact
VRDG_1CLINK.Compact
VRDGContractVersion.Compact
VRDGContractSpesial.Compact
End Sub

'Задать стиль защиты документа
'Parameters:
'[IN]   SecurityStyleID , тип параметра: string  - ...
'See Also:
'Example:
'  call me.Secure({параметры})
Public Sub Secure(ByVal SecurityStyleID As String)
  If Application.WorkOffline Then Exit Sub
  On Error GoTo bye
  m_SecureStyleID = Application.MTZSession.Secure("INSTANCE", id, SecurityStyleID)
  Exit Sub
bye:
  Err.Raise Err.Number, "APPLICATION.Secure", Err.Description
End Sub

'Распространить стиль защиты на все строки документа
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Propagate()
Public Sub Propagate()
  If Application.WorkOffline Then Exit Sub
  On Error GoTo bye
  Application.MTZSession.Propagate "INSTANCE", id
  Exit Sub
bye:
  Err.Raise Err.Number, "APPLICATION.Propagate", Err.Description
End Sub

'Сохранить изменения (новое имя)
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.Save()
Public Sub Save()
  If Application.WorkOffline Then Exit Sub
  On Error GoTo bye
  Application.MTZSession.NewInstance id, TypeName, Name
  Exit Sub
bye:
  Err.Raise Err.Number, "APPLICATION.Save", Err.Description
End Sub

'Задать состояние
'Parameters:
'[IN]   StatusID , тип параметра: string  - ...
'See Also:
'Example:
'  call me.SetStatus({параметры})
Private Sub SetStatus(ByVal StatusID As String)
  If Application.WorkOffline Then Exit Sub
  On Error GoTo bye
  Application.MTZSession.SetStatus id, StatusID
  Exit Sub
bye:
  Err.Raise Err.Number, "APPLICATION.SetStatus", Err.Description
End Sub

'Получтиь актуальное состояние
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.GetStatus()
Private Sub GetStatus()
If Application.WorkOffline Then Exit Sub
Dim rs As ADODB.Recordset
On Error GoTo bye
Set rs = Application.MTZSession.GetRow("INSTANCE", id)
m_StatusID = rs!Status & ""
m_SecureStyleID = rs!SecurityStyleID & ""
Exit Sub
bye:
  Err.Raise Err.Number, "APPLICATION.SetStatus", Err.Description
End Sub


'Загрузить данные из XML
'Parameters:
'[IN][OUT]   node , тип параметра: IXMLDOMNode,
'[IN]   LoadMode , тип параметра: integer=0  - ...
'See Also:
'Example:
'  call me.XMLLoad({параметры})
Public Sub XMLLoad(node As IXMLDOMNode, Optional ByVal LoadMode As Integer = 0)
 On Error Resume Next
  Dim anode As IXMLDOMElement
  Dim e_list As IXMLDOMNodeList
 On Error Resume Next
  Set anode = node.firstChild
  If m_TypeName <> anode.Attributes.getNamedItem("TYPENAME").nodeValue Then Exit Sub
  m_IsLocked = anode.Attributes.getNamedItem("IsLocked").nodeValue
  If m_IsLocked > 2 Then m_IsLocked = 0
  If LoadMode <> 2 Then
    m_ID = anode.Attributes.getNamedItem("ID").nodeValue
    SetStatus anode.Attributes.getNamedItem("STATUSID").nodeValue
    Secure anode.Attributes.getNamedItem("SECURITYSTYLEID").nodeValue
    WorkOffline = anode.Attributes.getNamedItem("WorkOffline").nodeValue
    If WorkOffline And m_IsLocked = LockSession Then m_IsLocked = NoLock
  End If
  m_Name = anode.Attributes.getNamedItem("NAME").nodeValue
Set e_list = anode.selectNodes("VRDGCOMMON_COL")
  VRDGCommon.XMLLoad e_list, LoadMode
Set e_list = anode.selectNodes("VRDGREPORT_COL")
  VRDGReport.XMLLoad e_list, LoadMode
Set e_list = anode.selectNodes("VRDGCONTRACTCHANGES_COL")
  VRDGContractChanges.XMLLoad e_list, LoadMode
Set e_list = anode.selectNodes("VRDG_1CLINK_COL")
  VRDG_1CLINK.XMLLoad e_list, LoadMode
Set e_list = anode.selectNodes("VRDGCONTRACTVERSION_COL")
  VRDGContractVersion.XMLLoad e_list, LoadMode
Set e_list = anode.selectNodes("VRDGCONTRACTSPESIAL_COL")
  VRDGContractSpesial.XMLLoad e_list, LoadMode
End Sub



'Сохранить данные в XML
'Parameters:
'[IN][OUT]  node , тип параметра: IXMLDOMElement,
'[IN][OUT]   xdom , тип параметра: DomDocument  - ...
'See Also:
'Example:
'  call me.XMLSave({параметры})
Public Sub XMLSave(node As IXMLDOMElement, xdom As DOMDocument)
  Dim anode As IXMLDOMElement
  Set anode = xdom.createElement("APPLICATION")
  anode.setAttribute "ID", m_ID
  anode.setAttribute "TYPENAME", m_TypeName
  anode.setAttribute "NAME", m_Name
  anode.setAttribute "STATUSID", m_StatusID
  anode.setAttribute "SECURITYSTYLEID", m_SecureStyleID
  anode.setAttribute "IsLocked", m_IsLocked
  anode.setAttribute "WorkOffline", WorkOffline
  node.appendChild anode
  VRDGCommon.XMLSave anode, xdom
  VRDGReport.XMLSave anode, xdom
  VRDGContractChanges.XMLSave anode, xdom
  VRDG_1CLINK.XMLSave anode, xdom
  VRDGContractVersion.XMLSave anode, xdom
  VRDGContractSpesial.XMLSave anode, xdom
End Sub


'Краткое название
'Parameters:
' параметров нет
'Returns:
'  значение типа string
'See Also:
'Example:
' dim variable as string
'  variable = me.Brief()
Public Function Brief() As String
 Brief = Name
End Function

'Загрузка корня объекта в дерево
'Parameters:
'[IN][OUT]   tree , тип параметра: object,
'[IN]   pkey , тип параметра: string,
'[IN]   mode , тип параметра: string,
'[IN][OUT]   optional Mask , тип параметра: string ="",
'[IN][OUT]   optional CollectionName , тип параметра: string=""   - ...
'See Also:
'Example:
'  call me.FillTree({параметры})
Public Sub FillTree(tree As Object, ByVal pkey As String, ByVal mode As String, Optional Mask As String = "", Optional CollectionName As String = "")
 Dim node As Object, key As String
If CollectionName = "" Then
 key = CreateGUID2() & id
 If pkey = "" Then
   Set node = tree.nodes.Add(, 0, key, Brief)
 Else
   Set node = tree.nodes.Add(pkey, 4, key, Brief)
 End If
 node.Tag = "object"
Else
 key = ""
End If
  If mode = "main" Then
If CollectionName = "" Or CollectionName = "VRDGCommon" Then
  If Mask <> "" Then
    If Application.MTZSession.IsDescendant(Mask, "VRDGCommon") Then
       If key = "" Then
         Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGCommon", "Общая информация")
       Else
         Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGCommon", "Общая информация")
       End If
       node.Tag = "VRDGCommon"
       ' node for <+> item
       tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    End If
  Else
    If key = "" Then
      Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGCommon", "Общая информация")
    Else
      Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGCommon", "Общая информация")
    End If
    node.Tag = "VRDGCommon"
    ' node for <+> item
    tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
  End If
End If
If CollectionName = "" Or CollectionName = "VRDGReport" Then
  If Mask <> "" Then
    If Application.MTZSession.IsDescendant(Mask, "VRDGReport") Then
       If key = "" Then
         Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGReport", "Отчеты")
       Else
         Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGReport", "Отчеты")
       End If
       node.Tag = "VRDGReport"
       ' node for <+> item
       tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    End If
  Else
    If key = "" Then
      Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGReport", "Отчеты")
    Else
      Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGReport", "Отчеты")
    End If
    node.Tag = "VRDGReport"
    ' node for <+> item
    tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
  End If
End If
If CollectionName = "" Or CollectionName = "VRDGContractChanges" Then
  If Mask <> "" Then
    If Application.MTZSession.IsDescendant(Mask, "VRDGContractChanges") Then
       If key = "" Then
         Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGContractChanges", "Дополнительные соглашения")
       Else
         Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGContractChanges", "Дополнительные соглашения")
       End If
       node.Tag = "VRDGContractChanges"
       ' node for <+> item
       tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    End If
  Else
    If key = "" Then
      Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGContractChanges", "Дополнительные соглашения")
    Else
      Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGContractChanges", "Дополнительные соглашения")
    End If
    node.Tag = "VRDGContractChanges"
    ' node for <+> item
    tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
  End If
End If
If CollectionName = "" Or CollectionName = "VRDG_1CLINK" Then
  If Mask <> "" Then
    If Application.MTZSession.IsDescendant(Mask, "VRDG_1CLINK") Then
       If key = "" Then
         Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDG_1CLINK", "Связь с 1С")
       Else
         Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDG_1CLINK", "Связь с 1С")
       End If
       node.Tag = "VRDG_1CLINK"
       ' node for <+> item
       tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    End If
  Else
    If key = "" Then
      Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDG_1CLINK", "Связь с 1С")
    Else
      Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDG_1CLINK", "Связь с 1С")
    End If
    node.Tag = "VRDG_1CLINK"
    ' node for <+> item
    tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
  End If
End If
If CollectionName = "" Or CollectionName = "VRDGContractVersion" Then
  If Mask <> "" Then
    If Application.MTZSession.IsDescendant(Mask, "VRDGContractVersion") Then
       If key = "" Then
         Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGContractVersion", "Версия договора")
       Else
         Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGContractVersion", "Версия договора")
       End If
       node.Tag = "VRDGContractVersion"
       ' node for <+> item
       tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    End If
  Else
    If key = "" Then
      Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGContractVersion", "Версия договора")
    Else
      Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGContractVersion", "Версия договора")
    End If
    node.Tag = "VRDGContractVersion"
    ' node for <+> item
    tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
  End If
End If
If CollectionName = "" Or CollectionName = "VRDGContractSpesial" Then
  If Mask <> "" Then
    If Application.MTZSession.IsDescendant(Mask, "VRDGContractSpesial") Then
       If key = "" Then
         Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGContractSpesial", "Специальные условие")
       Else
         Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGContractSpesial", "Специальные условие")
       End If
       node.Tag = "VRDGContractSpesial"
       ' node for <+> item
       tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    End If
  Else
    If key = "" Then
      Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGContractSpesial", "Специальные условие")
    Else
      Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGContractSpesial", "Специальные условие")
    End If
    node.Tag = "VRDGContractSpesial"
    ' node for <+> item
    tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
  End If
End If
  End If
  If mode = "read" Then
If CollectionName = "" Or CollectionName = "VRDGCommon" Then
  If Mask <> "" Then
    If Application.MTZSession.IsDescendant(Mask, "VRDGCommon") Then
       If key = "" Then
         Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGCommon", "Общая информация")
       Else
         Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGCommon", "Общая информация")
       End If
       node.Tag = "VRDGCommon"
       ' node for <+> item
       tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    End If
  Else
    If key = "" Then
      Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGCommon", "Общая информация")
    Else
      Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGCommon", "Общая информация")
    End If
    node.Tag = "VRDGCommon"
    ' node for <+> item
    tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
  End If
End If
If CollectionName = "" Or CollectionName = "VRDGReport" Then
  If Mask <> "" Then
    If Application.MTZSession.IsDescendant(Mask, "VRDGReport") Then
       If key = "" Then
         Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGReport", "Отчеты")
       Else
         Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGReport", "Отчеты")
       End If
       node.Tag = "VRDGReport"
       ' node for <+> item
       tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    End If
  Else
    If key = "" Then
      Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGReport", "Отчеты")
    Else
      Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGReport", "Отчеты")
    End If
    node.Tag = "VRDGReport"
    ' node for <+> item
    tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
  End If
End If
If CollectionName = "" Or CollectionName = "VRDGContractChanges" Then
  If Mask <> "" Then
    If Application.MTZSession.IsDescendant(Mask, "VRDGContractChanges") Then
       If key = "" Then
         Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGContractChanges", "Дополнительные соглашения")
       Else
         Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGContractChanges", "Дополнительные соглашения")
       End If
       node.Tag = "VRDGContractChanges"
       ' node for <+> item
       tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    End If
  Else
    If key = "" Then
      Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGContractChanges", "Дополнительные соглашения")
    Else
      Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGContractChanges", "Дополнительные соглашения")
    End If
    node.Tag = "VRDGContractChanges"
    ' node for <+> item
    tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
  End If
End If
If CollectionName = "" Or CollectionName = "VRDG_1CLINK" Then
  If Mask <> "" Then
    If Application.MTZSession.IsDescendant(Mask, "VRDG_1CLINK") Then
       If key = "" Then
         Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDG_1CLINK", "Связь с 1С")
       Else
         Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDG_1CLINK", "Связь с 1С")
       End If
       node.Tag = "VRDG_1CLINK"
       ' node for <+> item
       tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    End If
  Else
    If key = "" Then
      Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDG_1CLINK", "Связь с 1С")
    Else
      Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDG_1CLINK", "Связь с 1С")
    End If
    node.Tag = "VRDG_1CLINK"
    ' node for <+> item
    tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
  End If
End If
If CollectionName = "" Or CollectionName = "VRDGContractVersion" Then
  If Mask <> "" Then
    If Application.MTZSession.IsDescendant(Mask, "VRDGContractVersion") Then
       If key = "" Then
         Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGContractVersion", "Версия договора")
       Else
         Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGContractVersion", "Версия договора")
       End If
       node.Tag = "VRDGContractVersion"
       ' node for <+> item
       tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    End If
  Else
    If key = "" Then
      Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGContractVersion", "Версия договора")
    Else
      Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGContractVersion", "Версия договора")
    End If
    node.Tag = "VRDGContractVersion"
    ' node for <+> item
    tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
  End If
End If
If CollectionName = "" Or CollectionName = "VRDGContractSpesial" Then
  If Mask <> "" Then
    If Application.MTZSession.IsDescendant(Mask, "VRDGContractSpesial") Then
       If key = "" Then
         Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGContractSpesial", "Специальные условие")
       Else
         Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGContractSpesial", "Специальные условие")
       End If
       node.Tag = "VRDGContractSpesial"
       ' node for <+> item
       tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    End If
  Else
    If key = "" Then
      Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGContractSpesial", "Специальные условие")
    Else
      Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGContractSpesial", "Специальные условие")
    End If
    node.Tag = "VRDGContractSpesial"
    ' node for <+> item
    tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
  End If
End If
  End If
  If mode = "" Then
If CollectionName = "" Or CollectionName = "VRDGCommon" Then
  If Mask <> "" Then
    If Application.MTZSession.IsDescendant(Mask, "VRDGCommon") Then
    If key = "" Then
       Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGCommon", "Общая информация")
    Else
       Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGCommon", "Общая информация")
    End If
       node.Tag = "VRDGCommon"
       ' node for <+> item
       tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    End If
  Else
    If key = "" Then
       Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGCommon", "Общая информация")
    Else
       Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGCommon", "Общая информация")
    End If
    node.Tag = "VRDGCommon"
    ' node for <+> item
    tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
  End If
End If
If CollectionName = "" Or CollectionName = "VRDGReport" Then
  If Mask <> "" Then
    If Application.MTZSession.IsDescendant(Mask, "VRDGReport") Then
    If key = "" Then
       Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGReport", "Отчеты")
    Else
       Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGReport", "Отчеты")
    End If
       node.Tag = "VRDGReport"
       ' node for <+> item
       tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    End If
  Else
    If key = "" Then
       Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGReport", "Отчеты")
    Else
       Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGReport", "Отчеты")
    End If
    node.Tag = "VRDGReport"
    ' node for <+> item
    tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
  End If
End If
If CollectionName = "" Or CollectionName = "VRDGContractChanges" Then
  If Mask <> "" Then
    If Application.MTZSession.IsDescendant(Mask, "VRDGContractChanges") Then
    If key = "" Then
       Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGContractChanges", "Дополнительные соглашения")
    Else
       Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGContractChanges", "Дополнительные соглашения")
    End If
       node.Tag = "VRDGContractChanges"
       ' node for <+> item
       tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    End If
  Else
    If key = "" Then
       Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGContractChanges", "Дополнительные соглашения")
    Else
       Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGContractChanges", "Дополнительные соглашения")
    End If
    node.Tag = "VRDGContractChanges"
    ' node for <+> item
    tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
  End If
End If
If CollectionName = "" Or CollectionName = "VRDG_1CLINK" Then
  If Mask <> "" Then
    If Application.MTZSession.IsDescendant(Mask, "VRDG_1CLINK") Then
    If key = "" Then
       Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDG_1CLINK", "Связь с 1С")
    Else
       Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDG_1CLINK", "Связь с 1С")
    End If
       node.Tag = "VRDG_1CLINK"
       ' node for <+> item
       tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    End If
  Else
    If key = "" Then
       Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDG_1CLINK", "Связь с 1С")
    Else
       Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDG_1CLINK", "Связь с 1С")
    End If
    node.Tag = "VRDG_1CLINK"
    ' node for <+> item
    tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
  End If
End If
If CollectionName = "" Or CollectionName = "VRDGContractVersion" Then
  If Mask <> "" Then
    If Application.MTZSession.IsDescendant(Mask, "VRDGContractVersion") Then
    If key = "" Then
       Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGContractVersion", "Версия договора")
    Else
       Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGContractVersion", "Версия договора")
    End If
       node.Tag = "VRDGContractVersion"
       ' node for <+> item
       tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    End If
  Else
    If key = "" Then
       Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGContractVersion", "Версия договора")
    Else
       Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGContractVersion", "Версия договора")
    End If
    node.Tag = "VRDGContractVersion"
    ' node for <+> item
    tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
  End If
End If
If CollectionName = "" Or CollectionName = "VRDGContractSpesial" Then
  If Mask <> "" Then
    If Application.MTZSession.IsDescendant(Mask, "VRDGContractSpesial") Then
    If key = "" Then
       Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGContractSpesial", "Специальные условие")
    Else
       Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGContractSpesial", "Специальные условие")
    End If
       node.Tag = "VRDGContractSpesial"
       ' node for <+> item
       tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
    End If
  Else
    If key = "" Then
       Set node = tree.nodes.Add(, 0, CreateGUID2() & id & "VRDGContractSpesial", "Специальные условие")
    Else
       Set node = tree.nodes.Add(key, 4, CreateGUID2() & id & "VRDGContractSpesial", "Специальные условие")
    End If
    node.Tag = "VRDGContractSpesial"
    ' node for <+> item
    tree.nodes.Add(node.key, 4, CreateGUID2(), "Expanding ...").Tag = "ToDelete"
  End If
End If
  End If

End Sub


'Раскрытие объекта при выборе узла в дереве
'Parameters:
'[IN][OUT]  tree , тип параметра: object,
'[IN]   key , тип параметра: string,
'[IN]   mode , тип параметра: string,
'[IN][OUT]   optional Mask , тип параметра: string =""  - ...
'See Also:
'Example:
'  call me.Expand({параметры})
Public Sub Expand(tree As Object, ByVal key As String, ByVal mode As String, Optional Mask As String = "")
 Dim id As String, struct As String, child As String
 Dim Item As Object, i As Long, nid As String, tmpid As String
 Dim tidx As Long, tid As String 'only for tree styled structure
 id = Mid(key, 39, 38)
 On Error Resume Next
 struct = Right(tree.nodes.Item(key).Parent.Parent.key, Len(tree.nodes.Item(key).Parent.Parent.key) - 76)
 child = Right(key, Len(key) - 76)
 If Trim(struct) = "" Then
   Set Item = Manager.GetInstanceObject(id)
   If Item Is Nothing Then Exit Sub
   If Not Item Is Me Then
     Item.Expand tree, key, mode, Mask
     Exit Sub
   End If
 Else
    Set Item = FindRowObject(struct, id)
    If Item Is Nothing Then Exit Sub
    Call Item.Expand(tree, key, mode, Mask)
    Exit Sub
 End If
 tree.nodes.Item(key).Sorted = True
If mode = "main" Then
 Select Case child
 Case "VRDGCommon"
    Item.VRDGCommon.Refresh
    For i = 1 To Item.VRDGCommon.Count
    nid = CreateGUID2() & Item.VRDGCommon.Item(i).id
    tree.nodes.Add(key, 4, nid, Item.VRDGCommon.Item(i).Brief(True)).Tag = "Row"
    Next
 Case "VRDGReport"
    Item.VRDGReport.Refresh
    For i = 1 To Item.VRDGReport.Count
    nid = CreateGUID2() & Item.VRDGReport.Item(i).id
    tree.nodes.Add(key, 4, nid, Item.VRDGReport.Item(i).Brief(True)).Tag = "Row"
    Next
 Case "VRDGContractChanges"
    Item.VRDGContractChanges.Refresh
    For i = 1 To Item.VRDGContractChanges.Count
    nid = CreateGUID2() & Item.VRDGContractChanges.Item(i).id
    tree.nodes.Add(key, 4, nid, Item.VRDGContractChanges.Item(i).Brief(True)).Tag = "Row"
    Next
 Case "VRDG_1CLINK"
    Item.VRDG_1CLINK.Refresh
    For i = 1 To Item.VRDG_1CLINK.Count
    nid = CreateGUID2() & Item.VRDG_1CLINK.Item(i).id
    tree.nodes.Add(key, 4, nid, Item.VRDG_1CLINK.Item(i).Brief(True)).Tag = "Row"
    Next
 Case "VRDGContractVersion"
    Item.VRDGContractVersion.Refresh
    For i = 1 To Item.VRDGContractVersion.Count
    nid = CreateGUID2() & Item.VRDGContractVersion.Item(i).id
    tree.nodes.Add(key, 4, nid, Item.VRDGContractVersion.Item(i).Brief(True)).Tag = "Row"
    Next
 Case "VRDGContractSpesial"
    Item.VRDGContractSpesial.Refresh
    For i = 1 To Item.VRDGContractSpesial.Count
    nid = CreateGUID2() & Item.VRDGContractSpesial.Item(i).id
    tree.nodes.Add(key, 4, nid, Item.VRDGContractSpesial.Item(i).Brief(True)).Tag = "Row"
    Next
End Select
End If ' mode="main"
If mode = "read" Then
 Select Case child
 Case "VRDGCommon"
    Item.VRDGCommon.Refresh
    For i = 1 To Item.VRDGCommon.Count
    nid = CreateGUID2() & Item.VRDGCommon.Item(i).id
    tree.nodes.Add(key, 4, nid, Item.VRDGCommon.Item(i).Brief(True)).Tag = "Row"
    Next
 Case "VRDGReport"
    Item.VRDGReport.Refresh
    For i = 1 To Item.VRDGReport.Count
    nid = CreateGUID2() & Item.VRDGReport.Item(i).id
    tree.nodes.Add(key, 4, nid, Item.VRDGReport.Item(i).Brief(True)).Tag = "Row"
    Next
 Case "VRDGContractChanges"
    Item.VRDGContractChanges.Refresh
    For i = 1 To Item.VRDGContractChanges.Count
    nid = CreateGUID2() & Item.VRDGContractChanges.Item(i).id
    tree.nodes.Add(key, 4, nid, Item.VRDGContractChanges.Item(i).Brief(True)).Tag = "Row"
    Next
 Case "VRDG_1CLINK"
    Item.VRDG_1CLINK.Refresh
    For i = 1 To Item.VRDG_1CLINK.Count
    nid = CreateGUID2() & Item.VRDG_1CLINK.Item(i).id
    tree.nodes.Add(key, 4, nid, Item.VRDG_1CLINK.Item(i).Brief(True)).Tag = "Row"
    Next
 Case "VRDGContractVersion"
    Item.VRDGContractVersion.Refresh
    For i = 1 To Item.VRDGContractVersion.Count
    nid = CreateGUID2() & Item.VRDGContractVersion.Item(i).id
    tree.nodes.Add(key, 4, nid, Item.VRDGContractVersion.Item(i).Brief(True)).Tag = "Row"
    Next
 Case "VRDGContractSpesial"
    Item.VRDGContractSpesial.Refresh
    For i = 1 To Item.VRDGContractSpesial.Count
    nid = CreateGUID2() & Item.VRDGContractSpesial.Item(i).id
    tree.nodes.Add(key, 4, nid, Item.VRDGContractSpesial.Item(i).Brief(True)).Tag = "Row"
    Next
End Select
End If ' mode="read"
If mode = "" Then
 Select Case child
 Case "VRDGCommon"
    Item.VRDGCommon.Refresh
    For i = 1 To Item.VRDGCommon.Count
    nid = CreateGUID2() & Item.VRDGCommon.Item(i).id
    tree.nodes.Add(key, 4, nid, Item.VRDGCommon.Item(i).Brief(True)).Tag = "Row"
    Next
 Case "VRDGReport"
    Item.VRDGReport.Refresh
    For i = 1 To Item.VRDGReport.Count
    nid = CreateGUID2() & Item.VRDGReport.Item(i).id
    tree.nodes.Add(key, 4, nid, Item.VRDGReport.Item(i).Brief(True)).Tag = "Row"
    Next
 Case "VRDGContractChanges"
    Item.VRDGContractChanges.Refresh
    For i = 1 To Item.VRDGContractChanges.Count
    nid = CreateGUID2() & Item.VRDGContractChanges.Item(i).id
    tree.nodes.Add(key, 4, nid, Item.VRDGContractChanges.Item(i).Brief(True)).Tag = "Row"
    Next
 Case "VRDG_1CLINK"
    Item.VRDG_1CLINK.Refresh
    For i = 1 To Item.VRDG_1CLINK.Count
    nid = CreateGUID2() & Item.VRDG_1CLINK.Item(i).id
    tree.nodes.Add(key, 4, nid, Item.VRDG_1CLINK.Item(i).Brief(True)).Tag = "Row"
    Next
 Case "VRDGContractVersion"
    Item.VRDGContractVersion.Refresh
    For i = 1 To Item.VRDGContractVersion.Count
    nid = CreateGUID2() & Item.VRDGContractVersion.Item(i).id
    tree.nodes.Add(key, 4, nid, Item.VRDGContractVersion.Item(i).Brief(True)).Tag = "Row"
    Next
 Case "VRDGContractSpesial"
    Item.VRDGContractSpesial.Refresh
    For i = 1 To Item.VRDGContractSpesial.Count
    nid = CreateGUID2() & Item.VRDGContractSpesial.Item(i).id
    tree.nodes.Add(key, 4, nid, Item.VRDGContractSpesial.Item(i).Brief(True)).Tag = "Row"
    Next
 End Select
End If ' mode=""
End Sub

'Получить дочерний раздел по имени
'Parameters:
'[IN][OUT]   Item , тип параметра: object,
'[IN]   CollectionName , тип параметра: string  - ...
'Returns:
'  объект любого класса Visual Basic
'  ,или Nothing
'See Also:
'Example:
' dim variable as object
' Set variable = me. ItemCollection(...параметры...)
Public Property Get ItemCollection(Item As Object, ByVal CollectionName As String) As Object
  Set ItemCollection = CallByName(Item, CollectionName, VbGet)
End Property

'может ли быть изменено
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. CanChange
Public Property Get CanChange() As Boolean
   If Application.WorkOffline Then
     CanChange = CanChangeOffline
   Else
     CanChange = CanChangeONLine
   End If
End Property

'может ли быть изменено в режиме Offline
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. CanChangeOffline
Public Property Get CanChangeOffline() As Boolean
  Dim test As Boolean
  If Not Parent Is Nothing Then
   test = Parent.CanChangeOffline
  End If
  If Not test Then
   test = (IsLocked = LockPermanent)
  End If
   CanChangeOffline = test
End Property

'может ли быть изменено в режиме ONline
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me. CanChangeONLine
Public Property Get CanChangeONLine() As Boolean
  Dim test As Boolean
  If Not Parent Is Nothing Then
   test = Parent.CanChangeONLine
  End If
  If Not test Then
   test = (IsLocked < ExternalLockSession)
  End If
   CanChangeONLine = test
End Property

'Задать тип блокировки
'Parameters:
'[IN][OUT]  newIsLocked , тип параметра: LockStyle  - ...
'See Also:
'Example:
' dim value as Variant
' value = ...значение...
' me. IsLocked = value
Friend Property Let IsLocked(newIsLocked As LockStyle)
  m_IsLocked = newIsLocked
End Property

'Текущий тип блокировки
'Parameters:
' параметров нет
'Returns:
'  объект класса LockStyle
'  ,или Nothing
'See Also:
'Example:
' dim variable as LockStyle
' Set variable = me. IsLocked
Public Property Get IsLocked() As LockStyle
  If m_IsLocked <> LockSession And m_IsLocked <> LockPermanent Then CheckLock
  IsLocked = m_IsLocked
End Property

'Проверить блокировку
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.CheckLock()
Private Sub CheckLock()
Static LastCheckTime As Date
If Application.WorkOffline Then Exit Sub
If Now - LastCheckTime < CDbl(CDate("00:00:10")) Then Exit Sub
On Error Resume Next
m_IsLocked = Application.MTZSession.IsLocked("INSTANCE", id)
LastCheckTime = Now
End Sub

'Заблокировать
'Parameters:
'[IN]   Permanent , тип параметра: boolean=false   - ...
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
' variable = me.LockResource(...параметры...)
Public Function LockResource(Optional ByVal Permanent As Boolean = False) As Boolean
If Application.WorkOffline Then Exit Function
  Dim OK
 OK = Application.MTZSession.LockResource("INSTANCE", id, Permanent)
  If OK Then
    If Permanent Then m_IsLocked = LockPermanent Else m_IsLocked = LockSession
  Else
    m_IsLocked = NoLock
  End If
bye:
End Function

'Снять блокировку ресурса
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
'  variable = me.UnLockResource()
Public Function UnLockResource() As Boolean
If Application.WorkOffline Then Exit Function
On Error GoTo bye
Application.MTZSession.UnLockResource "INSTANCE", id
m_IsLocked = NoLock
bye:
End Function

'Возможно блокирование
'Parameters:
' параметров нет
'Returns:
' Boolean, семантика результата:
'   true  -
'   false -
'See Also:
'Example:
' dim variable as boolean
'  variable = me.CanLock()
Public Function CanLock() As Boolean
If Application.WorkOffline Then Exit Function
On Error Resume Next
CanLock = Application.MTZSession.CanLock("INSTANCE", id)
End Function

'Массовое обновление строк
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.BatchUpdate()
Public Sub BatchUpdate()
If Not Application.WorkOffline Then
    VRDGCommon.BatchUpdate
    VRDGReport.BatchUpdate
    VRDGContractChanges.BatchUpdate
    VRDG_1CLINK.BatchUpdate
    VRDGContractVersion.BatchUpdate
    VRDGContractSpesial.BatchUpdate
End If
End Sub

'Загрузка всех данных из базы
'Parameters:
' параметров нет
'See Also:
'Example:
'  call me.LoadAll()
Public Sub LoadAll()
Dim prevAutoLoad As Boolean
If Not Application.WorkOffline Then
prevAutoLoad = Application.AutoLoadPart
Application.AutoLoadPart = True
    VRDGCommon.LoadAll
    VRDGReport.LoadAll
    VRDGContractChanges.LoadAll
    VRDG_1CLINK.LoadAll
    VRDGContractVersion.LoadAll
    VRDGContractSpesial.LoadAll
Application.AutoLoadPart = prevAutoLoad
End If
End Sub



