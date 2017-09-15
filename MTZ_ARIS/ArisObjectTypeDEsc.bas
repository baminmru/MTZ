Attribute VB_Name = "ArisObjectTypeDEsc"
'Option Explicit
'
'List of all available object types
'
'OT_ACTION
'Action
'(284)
'
'OT_ACTIVITY
'Activity
'(100)
'
'OT_ACTIV
'Activity
'(197)
'
'OT_ACTIV_CAT
'Activity category
'(199)
'
'OT_ACT_GRAPH
'Activity graph
'(287)
'
'OT_ACTOR
'Actor
'(97)
'
'OT_AGGREG
'Aggregation
'(91)
'
'OT_ANALY_FUNC_ATTR
'Analyzer function attribute
'(1)
'
'OT_ANALY_RULE
'Analyzer Rule
'(3)
'
'OT_APPL_SYS
'Application System
'(64)
'
'OT_APPL_SYS_CLS
'Application system class
'(7)
'
'OT_APPL_SYS_TYPE
'Application system type
'(6)
'
'OT_ARGUM
'Argument
'(285)
'
'OT_ARTIFACT
'Artifact
'(289)
'
'OT_ASS_CLS
'Assembly Class
'(52)
'
'OT_ASSOC
'Association
'(87)
'
'OT_ASSOC_CLS
'Association Class
'(264)
'
'OT_ASSOC_INST
'Association instance
'(129)
'
'OT_ASSOC_ROLE
'Association Role
'(275)
'
'OT_ASSUM
'
'Assumption or issue or recommendation
'(233)
'
'OT_ATTR
'
'Attribute
'(8)
'
'OT_ATTR_LINK
'
'Attribute link
'(277)
'
'OT_XML_ATTRTYPE
'
'Attribute type
'(252)
'
'OT_ATTR_TYPE_GRP
'
'Attribute type group
'(111)
'
'OT_ATTR_RUMB
'
'Attributes
'(92)
'
'OT_AUTH_CON
'
'Authorization condition
'(242)
'
'OT_BAAN_SESS
'
'Baan Session
'(211)
'
'OT_BITM
'
'Bitmap
'(167)
'
'OT_BREAK
'
'Break
'(218)
'
'OT_BUS_FUNC
'
'Business function
'(200)
'
'OT_BUS_FUNC_CAT
'
'Business function category
'(201)
'
'OT_BUS_GROUP
'
'Business Group
'(222)
'
'OT_BUS_ITEM
'
'Business Item
'(223)
'
'OT_BMODEL
'
'Business model
'(205)
'
'OT_BUSY_OBJ
'
'Business object
'(150)
'
'OT_BP
'
'Business Process
'(195)
'
'OT_BP_CAT
'
'Business process category
'(198)
'
'OT_BUS_ROLE
'
'Business Role
'(221)
'
'OT_BUS_ROLE_TYPE
'
'Business role type
'(224)
'
'OT_BUTTON
'
'Button
'(263)
'
'OT_CHARACT
'
'characteristic
'(34)
'
'OT_CHARACT_INST
'
'characteristic occurrence
'(35)
'
'OT_CLS
'
'Class
'(90)
'
'OT_CLASSFC_CRIT
'
'Classification criterion
'(33)
'
'OT_CLS_ROLE
'
'Classifier Role
'(276)
'
'OT_CLS_IN_STATE
'
'Classifier-in-state
'(283)
'
'OT_CLST_INST
'
'cluster instance
'(138)
'
'OT_CLST
'
'Cluster/Data model
'(14)
'
'OT_COLLABORATION
'
'Collaboration
'(286)
'
'OT_COLLAB_INST_SET
'
'Collaboration instance set
'(291)
'
'OT_COL
'
'Column
'(166)
'
'OT_COMBOBOX
'
'Combo box
'(259)
'
'OT_COMM
'
'Communication
'(130)
'
'OT_COMM_ELMT
'
'Communication element
'(48)
'
'OT_FIRM
'
'Company
'(204)
'
'OT_CX_OBJ
'
'Complex object
'(181)
'
'OT_OBJ_CX
'
'Complex object type
'(182)
'
'OT_CMP
'
'component
'(188)
'
'OT_COMP_INST
'
'component instance
'(290)
'
'OT_COND_SECT
'
'Conditional Section
'(248)
'
'OT_CONNECTOR
'
'Connector
'(102)
'
'OT_CNSTR
'
'Constraint
'(88)
'
'OT_XML_CONTENTS
'
'Contents
'(249)
'
'OT_CONTR
'
'Control
'(161)
'
'OT_COST_TYPE
'
'Cost category
'(132)
'
'OT_COST_DRIVER
'
'Cost Driver
'(226)
'
'OT_COT_ATTR
'
'COT attribute
'(179)
'
'OT_COT_ATTR_INS
'
'COT attribute (instance)
'(180)
'
'OT_CRIT_FACT
'
'Critical factor
'(108)
'
'OT_MEASURE
'
'Critical measurement point
'(234)
'
'OT_DATA_STORE
'
'Data store
'(96)
'
'OT_DATA_VAL
'
'Data Value
'(98)
'
'OT_DATE
'
'Date
'(220)
'
'OT_DBMS
'
'DBMS
'(69)
'
'OT_DBMS_TYPE
'
'DBMS type
'(15)
'
'OT_SALES_CHAN
'
'Distribution channel
'(269)
'
'OT_DOC_KNWLDG
'
'Documented Knowledge
'(231)
'
'OT_DOM
'
'domain
'(16)
'
'OT_DOM_PHYS
'
'domain (physical)
'(47)
'
'OT_LST_DSGN
'
'Draft List
'(30)
'
'OT_DRIV_DEF
'
'Driver definition
'(173)
'
'OT_DYN_BASE_TYPE
'
'Dynamic base type
'(84)
'
'OT_DYN_COND
'
'Dynamic condition
'(194)
'
'OT_ELEM_TYPE
'
'Element type
'(247)
'
'OT_MAK_TAB
'
'EMC Table
'(162)
'
'OT_EMPL_BAAN
'
'Employee (Baan)
'(208)
'
'OT_EMPL_INST
'
'Employee variable
'(151)
'
'OT_ENT
'
'Entity
'(139)
'
'OT_ENT_TYPE
'
'Entity type
'(17)
'
'OT_ENUM
'
'Enumeration
'(175)
'
'OT_XML_ENUMTYPE
'
'Enumeration attribute type
'(253)
'
'OT_COUNT_INST
'
'Enumeration list occurrence
'(171)
'
'OT_ENUM_LIT
'
'Enumeration literal
'(266)
'
'OT_ENUM_TYPE
'
'Enumeration type
'(177)
'
'OT_ERM_ATTR
'
'ERM attribute
'(19)
'
'OT_ERM_ATTR_INST
'
'ERM attribute instance
'(142)
'
'OT_ERM_DOM
'
'ERM domain
'(20)
'
'OT_EVT
'
'Event
'(18)
'
'OT_EV_INST
'
'Event instance
'(143)
'
'OT_EV_ACT_PAIR
'
'Event/action pair
'(101)
'
'OT_UML_EXCEPT
'
'Exception
'(281)
'
'OT_EXT_PT
'
'Extension Point
'(265)
'
'OT_FLD
'
'FIELD
'(21)
'
'OT_FLD_SPEC
'
'FIELD (specimen)
'(74)
'
'OT_FLTR_OBJ_TYPE
'
'Filter object type
'(135)
'
'OT_FUNC
'
'Function
'(22)
'
'OT_FUNC_INST
'
'Function instance()
'(137)
'
'OT_FUNC_CLUSTER
'
'Functional cluster
'(294)
'
'OT_GNRL_RES
'
'General resource
'(145)
'
'OT_GNRL_TYPE
'
'Generalization type
'(23)
'
'OT_GRPH_UI
'
'Graphical user interface
'(71)
'
'OT_GRPH_UI_TYPE
'
'Graphical user interface type
'(9)
'
'OT_GRP
'
'Group
'(128)
'
'OT_HW_CMP
'
'Hardware component
'(76)
'
'OT_HW_CMP_CLS
'
'Hardware component class
'(25)
'
'OT_HW_CMP_TYPE
'
'Hardware component type
'(24)
'
'OT_C3_IMPROVE
'
'Improvement potential
'(254)
'
'OT_IDX
'
'Index
'(103)
'
'OT_INFO_CARR
'
'Information carrier
'(27)
'
'OT_INFO_FLW
'
'Information flow
'(26)
'
'OT_INST_CYC
'
'Instantiation cycle
'(213)
'
'OT_INSTAN_INTERVALL
'
'Instantiation Interval
'(212)
'
'OT_INST_PLAN
'
'Instantiation plan
'(214)
'
'OT_INTERACT_INST_SET
'
'Interaction instance set
'(292)
'
'OT_IF
'
'Interface
'(190)
'
'OT_IS_FUNC
'
'IS function
'(293)
'
'OT_IS_SERVICE
'
'IS service
'(295)
'
'OT_DP_FUNC
'
'IT function
'(107)
'
'OT_DP_FUNC_CLS
'
'IT function class
'(106)
'
'OT_DP_FUNC_TYPE
'
'IT function type
'(105)
'
'OT_KPI
'
'Key performance indicator instance
'(244)
'
'OT_KNWLDG_CAT
'
'Knowledge category
'(230)
'
'OT_PRES
'
'Layout
'(170)
'
'OT_LNK_ATTR
'
'Link attribute
'(61)
'
'OT_LINK_OBJ
'
'Link object
'(274)
'
'OT_LST
'
'List
'(29)
'
'OT_LISTCTRL
'
'List Control
'(262)
'
'OT_LOC
'
'location
'(54)
'
'OT_LOOP_START
'
'Loop start
'(241)
'
'OT_MACRO_PROC
'
'Macro Process
'(155)
'
'OT_MAIN_PRCS
'
'Main Process
'(28)
'
'OT_MARKET_INST
'
'Marketing instrument
'(268)
'
'OT_MAT
'
'material
'(240)
'
'OT_MAT_CLS
'
'material Class
'(124)
'
'OT_MAT_FLW
'
'material flow
'(83)
'
'OT_MAT_TYPE
'
'Material type
'(126)
'
'OT_MATU_RAT
'
'Maturity rating
'(235)
'
'OT_UNIT
'
'Measurement unit
'(176)
'
'OT_UNIT_NUM
'
'Measurement unit number
'(185)
'
'OT_UNIT_INST
'
'Measurement unit occurrence
'(172)
'
'OT_UNIT_TYPE
'
'Measurement unit type
'(178)
'
'OT_MEM_LOC
'
'Memory location
'(53)
'
'OT_MSG_FLW
'
'Message flow
'(136)
'
'OT_MSG_TYPE
'
'Message type
'(144)
'
'OT_MICRO_PROC
'
'Micro Process
'(154)
'
'OT_MOD
'
'module
'(65)
'
'OT_MOD_CLS
'
'module Class
'(38)
'
'OT_MOD_TYPE
'
'Module type
'(37)
'
'OT_WANT
'
'Need
'(267)
'
'OT_NW
'
'Network
'(85)
'
'OT_NW_CLS
'
'Network Class
'(42)
'
'OT_NW_LINE
'
'Network Connection
'(82)
'
'OT_NW_LINE_CLS
'
'Network connection class
'(80)
'
'OT_NW_LINE_TYPE
'
'Network connection type
'(81)
'
'OT_NW_NODE
'
'Network Node
'(79)
'
'OT_NW_NODE_CLS
'
'Network node class
'(77)
'
'OT_NW_NODE_TYPE
'
'Network node type
'(40)
'
'OT_NW_PROT
'
'Network protocol
'(104)
'
'OT_NW_TYPE
'
'Network type
'(39)
'
'OT_NOTE
'
'Note
'(186)
'
'OT_OBJ_INST
'
'object instance
'(94)
'
'OT_OBJ_TYPE_CLS
'
'Object type class
'(36)
'
'OT_OBJECTIVE
'
'Objective
'(86)
'
'OT_OP_RES
'
'operating resource
'(120)
'
'OT_OP_RES_CLS
'
'Operating resource class
'(112)
'
'OT_OP_RES_TYPE
'
'Operating resource type
'(116)
'
'OT_OS
'
'operating System
'(72)
'
'OT_OS_TYPE
'
'Operating system type
'(10)
'
'OT_OP
'
'Operation
'(93)
'
'OT_OPPORTUN
'
'Opportunity area
'(236)
'
'OT_OPT_PHASE
'
'Optimization phase
'(207)
'
'OT_ORG_CHRT
'
'organizational chart
'(60)
'
'OT_ORG_LVL
'
'organizational Level
'(59)
'
'OT_ORG_UNIT
'
'organizational unit
'(43)
'
'OT_ORG_UNIT_DEM
'
'organizational unit(DEM)
'(203)
'
'OT_ORG_UNIT_CLST
'
'Organizational unit cluster
'(2)
'
'OT_ORG_UNIT_TYPE
'
'Organizational unit type
'(44)
'
'OT_ORG_UNIT_TPYE_DEM
'
'Organizational unit type (DEM)
'(202)
'
'OT_PACK
'
'Package
'(187)
'
'OT_PACK_MAT_CLS
'
'Packaging material class
'(125)
'
'OT_PACK_MAT_TYPE
'
'Packaging material type
'(127)
'
'OT_PAGE
'
'Page
'(164)
'
'OT_PARA
'
'parameter
'(184)
'
'OT_PARTITION
'
'Partition
'(288)
'
'OT_PERF_CHARACT
'
'Performance characteristic
'(157)
'
'OT_PERS
'
'Person
'(46)
'
'OT_PERS_TYPE
'
'Person type
'(78)
'
'OT_PERSPECT
'
'Perspective
'(243)
'
'OT_POLICY
'
'Policy
'(237)
'
'OT_POS
'
'Position
'(45)
'
'OT_PROBLEM_AREA
'
'Problem area
'(238)
'
'OT_PRCS
'
'Process
'(95)
'
'OT_PRCS_CMP
'
'Process component
'(228)
'
'OT_PRDCT
'
'Product
'(174)
'
'OT_PERF
'
'Product/Service
'(153)
'
'OT_PRG_LIB
'
'Program library
'(68)
'
'OT_PRG_MOD
'
'Program module
'(67)
'
'OT_PRG_MOD_TYPE
'
'Program module type
'(66)
'
'OT_PRG_LNG
'
'Programming Language
'(70)
'
'OT_PRG_LNG_TYPE
'
'Programming language type
'(49)
'
'OT_QUALIF
'
'Qualifier
'(56)
'
'OT_CASUALOBJ
'
'Quick object
'(246)
'
'OT_OPT_CTRL
'
'Radio button/Check box
'(258)
'
'OT_UML_RECEPT
'
'Reception
'(282)
'
'OT_CTRL_VAR
'
'Reference variable
'(156)
'
'OT_REL
'
'Relation
'(51)
'
'OT_RELSHP
'
'Relationship
'(140)
'
'OT_RELSHP_TYPE
'
'Relationship type
'(11)
'
'OT_RESPON_CODE
'
'Responsibility Code
'(209)
'
'OT_RISK
'
'Risk
'(159)
'
'OT_RISK_CATEGORY
'
'Risk category
'(256)
'
'OT_ROLE
'
'Role
'(192)
'
'OT_RULE
'
'Rule
'(50)
'
'OT_RULE_INST
'
'Rule instance
'(152)
'
'OT_SADT_CTRL_UNIT
'
'SADT control unit
'(63)
'
'OT_SADT_RES
'
'SADT resource
'(62)
'
'OT_SCN_CMP
'
'Scenario component
'(227)
'
'OT_SCRN
'
'Screen
'(31)
'
'OT_SCRN_DSGN
'
'Screen design
'(32)
'
'OT_SCRN_TBL
'
'Screen Table
'(183)
'
'OT_SECT
'
'Section
'(165)
'
'OT_SECUREPROT
'
'Security protocol
'(245)
'
'OT_SEPRT
'
'Separator
'(169)
'
'OT_XML_SEQUENCE
'
'Sequence
'(250)
'
'OT_SHIFT
'
'Shift
'(217)
'
'OT_SHIFT_CYC
'
'Shift cycle
'(216)
'
'OT_SHIFT_PLAN
'
'Shift plan
'(215)
'
'OT_UML_SIGNAL
'
'Signal
'(280)
'
'OT_SIMPLE_DATA_TYPE
'
'Simple data type
'(225)
'
'OT_SOCKET
'
'Socket
'(296)
'
'OT_SOLU
'
'Solution
'(160)
'
'OT_SP_GEN_OPR
'
'Sp./gen. operator
'(89)
'
'OT_SPINBOX
'
'Spin box
'(260)
'
'OT_STATE
'
'State
'(99)
'
'OT_STATE2
'
'State
'(196)
'
'OT_STATE_MACH
'
'State machine
'(279)
'
'OT_STAT_COND
'
'Static condition
'(193)
'
'OT_VAL_STAT_COND
'
'Static condition value
'(206)
'
'OT_STAT
'
'Strategy
'(239)
'
'OT_STRCT_ELMT
'
'Structural element
'(232)
'
'OT_SUBSYS
'
'Subsystem
'(270)
'
'OT_SUBSYS_INST
'
'Subsystem instance
'(271)
'
'OT_SYS_ATTR
'
'System attribute
'(109)
'
'OT_DOM_SYS_ATTR
'
'System attribute domain
'(110)
'
'OT_SYS_ATTR_DOM_TYPE
'
'System attribute domain type
'(41)
'
'OT_SYS_ORG_UNIT
'
'System organizational unit
'(12)
'
'OT_SYS_ORG_UNIT_TYPE
'
'System organizational unit type
'(13)
'
'OT_TBL
'
'Table
'(55)
'
'OT_TBL_SPEC
'
'Tables (specimen)
'(73)
'
'OT_TECH_OP_SUPPLY_CLS
'
'Tech. operating supply class
'(115)
'
'OT_TECH_OP_SUPPLY
'
'Technical operating supply
'(123)
'
'OT_TECH_OP_SUPPLY_TYPE
'
'Technical operating supply type
'(119)
'
'OT_TECH_TRM
'
'Technical term
'(58)
'
'OT_TECH_TERM_INST
'
'Technical terms instance
'(141)
'
'OT_TXT
'
'Text
'(168)
'
'OT_TEXTBOX
'
'Text box
'(257)
'
'OT_TIME_EST_HEAD
'
'Time evaluation header
'(163)
'
'OT_C3_TOOL
'
'Tool
'(255)
'
'OT_TASK_FOLD
'
'Transaction folder
'(158)
'
'OT_TRNSP_SYS
'
'Transport System
'(122)
'
'OT_TRNSP_SYS_CLS
'
'Transport system class
'(114)
'
'OT_TRNSP_SYS_TYPE
'
'Transport system type
'(118)
'
'OT_TREECTRL
'
'tree Control
'(261)
'
'OT_UML_MOD
'
'UML model
'(272)
'
'OT_USECASE
'
'Use case
'(189)
'
'OT_USECASE_INST
'
'Use case instance
'(273)
'
'OT_SERV_PRG
'
'Utility
'(210)
'
'OT_VERS
'
'Version
'(191)
'
'OT_VIEW
'
'View
'(57)
'
'OT_VIEW_PHYS
'
'View (physical)
'(75)
'
'OT_VISU_GRP
'
'Visualization Group
'(229)
'
'OT_WH_EQUIP
'
'Warehouse equipment
'(121)
'
'OT_WH_EQUIP_CLS
'
'Warehouse equipment class
'(113)
'
'OT_WH_EQUIP_TYPE
'
'Warehouse equipment type
'(117)
'
'OT_XML_XOR
'
'XOR
'(251)
'
'OT_YEAR_PLAN
'
'Yearly plan
'(219)
'
'
