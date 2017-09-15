Attribute VB_Name = "ArisSymbolTypeDesc"
'Option Explicit
'
'List of all available symbol types
'
'Constants:
'
'ST_XML_PCDATA
'
'#PCDATA
'(672)
'
'ST_ABORTICON
'
'abort Icon
'(215)
'
'ST_ACTION
'
'Action
'(801)
'
'ST_ACT_1
'
'activity
'(177)
'
'ST_ACT_2
'
'activity
'(226)
'
'ST_ACTIV
'
'activity
'(410)
'
'ST_ACTIVITY
'
'activity
'(456)
'
'ST_ACT_GRAPH
'
'activity graph
'(803)
'
'ST_ACTOR
'
'Actor
'(172)
'
'ST_ACTOR2
'
'Actor
'(399)
'
'ST_ACTOR6
'
'Actor (Group)
'(684)
'
'ST_ACTOR7
'
'Actor (organizational unit)
'(685)
'
'ST_ACTOR4
'
'Actor (Person)
'(682)
'
'ST_ACTOR5
'
'Actor (Position)
'(683)
'
'ST_ACTOR3
'
'Actor (tech.)
'(681)
'
'ST_AGGREG
'
'Aggregation
'(154)
'
'ST_PLANE_PIC
'
'Airplane
'(364)
'
'ST_AIRPLANE
'
'Airplane
'(496)
'
'ST_OPR_AND_2
'
'AND operator
'(88)
'
'ST_OPR_AND_INST
'
'AND operator (inst.)
'(253)
'
'ST_OPR_AND_1
'
'AND rule
'(42)
'
'ST_OPR_AND_3
'
'AND rule
'(220)
'
'ST_AND
'
'AND rule
'(526)
'
'ST_AND_AND
'
'AND/AND rule
'(130)
'
'ST_OPR_AND_OR_INST
'
'AND/OR operator (inst.)
'(259)
'
'ST_AND_OR
'
'AND/OR rule
'(133)
'
'ST_OPR_AND_XOR_INST
'
'AND/XOR operator (inst.)
'(261)
'
'ST_AND_XOR
'
'AND/XOR rule
'(136)
'
'ST_XML_ANY
'
'ANY
'(674)
'
'ST_APPL_SYS
'
'Application System
'(107)
'
'ST_APPL_SYS_1
'
'Application System
'(629)
'
'ST_APPL_SYS_PIC
'
'Application System
'(669)
'
'ST_APPL_SYS_CLS
'
'Application system class
'(14)
'
'ST_APPL_SYS_TYPE
'
'Application system type
'(33)
'
'ST_ARGUM
'
'Argument
'(802)
'
'ST_ARIS_DGM
'
'aris diagram
'(248)
'
'ST_ARROW_IEF_1
'
'ARROW - IEF 1
'(162)
'
'ST_ARROW_IEF_2
'
'ARROW - IEF 2...
'(166)
'
'ST_ARROW_IEF_C
'
'ARROW - IEF c
'(163)
'
'ST_ARROW_IEF_CN
'
'ARROW - IEF cn
'(165)
'
'ST_ARROW_IEF_N
'
'ARROW - IEF n
'(164)
'
'ST_ARROW_CURLED
'
'arrow curled
'(98)
'
'ST_ARR_DIAM
'
'arrow Diamond
'(403)
'
'ST_ARROW_DOUBLE_PNT
'
'ARROW double point
'(81)
'
'ST_ARROW_DOUBLE_PNT_CND_1
'
'ARROW double point cond.
'(99)
'
'ST_ARROW_DOUBLE_PNT_CND_2
'
'ARROW double point cond.
'(100)
'
'ST_ARROW_EMPTY_CIRCLE
'
'ARROW empty circle
'(159)
'
'ST_ARROW_FILLED_CIRCLE
'
'ARROW filled circle
'(158)
'
'ST_ARROW_FILLED_PNT
'
'ARROW filled point
'(80)
'
'ST_ARR_GNRL
'
'arrow Generalizates
'(400)
'
'ST_ARROW_SMPL_BAR
'
'ARROW simple bar
'(79)
'
'ST_ARROW_SMPL_PNT
'
'ARROW simple point
'(61)
'
'ST_ARROW_SMPL_PNT_BLUE
'
'ARROW simple point blue
'(96)
'
'ST_ARTIFACT
'
'Artifact
'(797)
'
'ST_ACTIV_ASSIGN
'
'Assigned activity
'(411)
'
'ST_ASGNMNT
'
'Assignment
'(405)
'
'ST_ASSOC
'
'Association
'(146)
'
'ST_ASSOC_CLS
'
'Association Class
'(761)
'
'ST_ASSOC_INST
'
'Association instance
'(210)
'
'ST_ASS_ROLE
'
'Association role
'(786)
'
'ST_ASSUM
'
'Assumption or issue or recommendation
'(470)
'
'ST_ATTR_1
'
'Attribute
'(21)
'
'ST_ATTR_2
'
'Attribute
'(75)
'
'ST_ATTR_LINK
'
'Attribute link
'(788)
'
'ST_XML_ATTRTYPE
'
'Attribute type
'(677)
'
'ST_ATTR_TYPE_GRP
'
'Attribute type group
'(206)
'
'ST_ATTR_3
'
'Attributes
'(155)
'
'ST_AUTH_COND
'
'Authorization condition
'(533)
'
'ST_AUTOM_EV
'
'Automatic event
'(56)
'
'ST_AUTOM_FUNC
'
'Automatic function
'(55)
'
'ST_MODERATE
'
'Average
'(541)
'
'ST_AV_COV
'
'Average coverage
'(443)
'
'ST_BARCODE
'
'Bar Code
'(48)
'
'ST_BAR_CODE
'
'Bar Code
'(500)
'
'ST_BEGIN_1
'
'begin
'(563)
'
'ST_BITM
'
'Bitmap
'(290)
'
'ST_BLANK_ATTR
'
'Blank attribute
'(142)
'
'ST_BOOK_PIC
'
'Book
'(345)
'
'ST_INFO_CARR_BOOK
'
'Book
'(723)
'
'ST_BRANCH
'
'Branch
'(513)
'
'ST_BREAK
'
'Break
'(426)
'
'ST_IS_FUNC_BUILD_CLUSTER
'
'Building cluster
'(813)
'
'ST_BUS_AREA
'
'Business area
'(469)
'
'ST_BUS_COM
'
'Business component
'(537)
'
'ST_BUS_DOC
'
'Business document
'(535)
'
'ST_BUS_FUNC
'
'Business function
'(415)
'
'ST_BUS_GROUP
'
'Business Group
'(431)
'
'ST_BUS_ITEM
'
'Business Item
'(432)
'
'ST_BUSY_OBJ
'
'Business object
'(250)
'
'ST_BUS_PART
'
'Business participant
'(534)
'
'ST_BP
'
'Business Process
'(406)
'
'ST_BUS_PROC
'
'Business Process
'(538)
'
'ST_BUS_ROLE
'
'Business role
'(430)
'
'ST_BUS_ROLE_TYPE
'
'Business role type
'(433)
'
'ST_BUTTON
'
'Button
'(757)
'
'ST_CALL
'
'Call
'(560)
'
'ST_CALL_TURNED
'
'Call
'(624)
'
'ST_CAP_RES
'
'Capacity resource
'(429)
'
'ST_CRD_FILE
'
'Card File
'(27)
'
'ST_CD_PIC
'
'CD -ROM
'(337)
'
'ST_INFO_CARR_CD
'
'CD -ROM
'(697)
'
'ST_FLD_EX
'
'Cell sp.
'(117)
'
'ST_CHARAC
'
'characteristic
'(68)
'
'ST_CHARACT_PIC
'
'characteristic
'(382)
'
'ST_KAT
'
'characteristic
'(580)
'
'ST_KAT_AT
'
'characteristic
'(602)
'
'ST_CHARAC_INST
'
'characteristic occurrence
'(69)
'
'ST_CTRLBOX
'
'Check box
'(748)
'
'ST_CLS
'
'Class
'(152)
'
'ST_CLASS
'
'Class
'(520)
'
'ST_CLSFC_CRIT
'
'Classification criterion
'(139)
'
'ST_CLS_ROLE
'
'Classifier role
'(787)
'
'ST_CLS_IN_STATE
'
'Classifier-in-state
'(795)
'
'ST_CLST
'
'cluster
'(13)
'
'ST_CLUSTER
'
'cluster
'(507)
'
'ST_CLUSTER_2
'
'cluster
'(521)
'
'ST_CLST_INST
'
'cluster instance
'(235)
'
'ST_COLLABORATION
'
'Collaboration
'(796)
'
'ST_COLLAB_INST_SET
'
'Collaboration instance set
'(808)
'
'ST_COL
'
'Column
'(289)
'
'ST_COMBOBOX
'
'combo box
'(749)
'
'ST_COMMIT
'
'commit
'(564)
'
'ST_COMM
'
'Communication
'(388)
'
'ST_COM_STRUC
'
'Communication structure
'(579)
'
'ST_CPANY_PIC
'
'Company
'(392)
'
'ST_ENTERP_EXT
'
'Company -External
'(773)
'
'ST_ENTRP_INT
'
'Company -Internal
'(774)
'
'ST_CTITOR_PIC
'
'competitor
'(390)
'
'ST_CX_OBJ
'
'Complex object
'(307)
'
'ST_OBJ_CX
'
'Complex object type
'(324)
'
'ST_CMP
'
'component
'(397)
'
'ST_COMP_INST
'
'component instance
'(807)
'
'ST_COMPUT_PIC
'
'Computer
'(353)
'
'ST_COND_SECT
'
'Conditional Section
'(671)
'
'ST_CONNECTION
'
'Connection
'(179)
'
'ST_CONNEC
'
'connector
'(517)
'
'ST_CNSTR
'
'Constraint
'(147)
'
'ST_CONTR
'
'Control
'(284)
'
'ST_CTRL_ACTIV_AND
'
'Control activity AND
'(412)
'
'ST_CTRL_ACTIV_OR
'
'Control activity OR
'(413)
'
'ST_CTRL_ACTIV_XOR
'
'Control activity XOR
'(414)
'
'ST_CORE_COMPETENCE
'
'Core competence
'(714)
'
'ST_TYPE_OF_COST
'
'Cost category
'(224)
'
'ST_COST_CNT
'
'Cost Center
'(223)
'
'ST_COST_DRIVER
'
'Cost Driver
'(435)
'
'ST_COT_ATTR
'
'COT attribute
'(305)
'
'ST_COT_ATTR_INS
'
'COT attribute (instance)
'(306)
'
'ST_CRIT_FACT_2
'
'Critical factor
'(551)
'
'ST_CRIT_FACT
'
'Critical factor
'(186)
'
'ST_CRITIC_MEASURE
'
'Critical measurement point
'(471)
'
'ST_CSTOMER_PIC
'
'customer
'(384)
'
'ST_CUST_ACTIV
'
'customer activity
'(418)
'
'ST_CUST_PRCS
'
'customer Process
'(417)
'
'ST_DESC_ATTR
'
'D attribute (ERM)
'(8)
'
'ST_DESC_ATTR_INST_ERM
'
'd attribute instance (ERM)
'(240)
'
'ST_D_INTER
'
'D -Interaction
'(606)
'
'ST_DATA_COLLECT
'
'Data Collection
'(824)
'
'ST_DATA_STORE
'
'Data store
'(171)
'
'ST_MODEM
'
'Data transmission
'(52)
'
'ST_DATA_VAL
'
'Data Value
'(173)
'
'ST_DVALUE
'
'Data Value
'(387)
'
'ST_DATE
'
'Date
'(428)
'
'ST_DBMS
'
'DBMS
'(112)
'
'ST_DBMS_TYPE
'
'DBMS type
'(36)
'
'ST_DEC
'
'Decision
'(558)
'
'ST_DECISION
'
'Decision
'(462)
'
'ST_DEC_TURNED
'
'Decision
'(623)
'
'ST_DESC_FIELD
'
'Descriptive FIELD
'(189)
'
'ST_DIA_DWN_ARROW
'
'Diagonal arrow to lower right
'(449)
'
'ST_DIA_UP_ARROW
'
'Diagonal arrow to upper right
'(447)
'
'ST_DLG
'
'Dialog box
'(765)
'
'ST_DIM
'
'Dimension
'(570)
'
'ST_DISK_PIC
'
'Diskette
'(344)
'
'ST_DISKETTE
'
'Diskette
'(505)
'
'ST_INFO_CARR_FDD
'
'Diskette
'(722)
'
'ST_SALES_CHAN
'
'Distribution channel
'(771)
'
'ST_IS_FUNC_DISTRICT
'
'District
'(812)
'
'ST_DOCU_PIC
'
'document
'(340)
'
'ST_DOC_1
'
'document
'(499)
'
'ST_DOC
'
'document
'(29)
'
'ST_DOC_STORAGE
'
'document storage
'(482)
'
'ST_DOC_KNWLDG_1
'
'Documented Knowledge
'(453)
'
'ST_DOC_KNWLDG_2
'
'Documented Knowledge
'(454)
'
'ST_DOM
'
'domain
'(22)
'
'ST_DWN_ARROW
'
'down arrow
'(450)
'
'ST_LIST_DSGN
'
'Draft List
'(17)
'
'ST_DRIV_DEF
'
'Driver definition
'(296)
'
'ST_DD_COMBOBOX
'
'Drop-down combo box
'(750)
'
'ST_DL_COMBOBOX
'
'Drop-list combo box
'(751)
'
'ST_DUMMY
'
'DUMMY
'(780)
'
'ST_INFO_CARR_DVD
'
'DVD
'(736)
'
'ST_EMAIL_PIC
'
'E -Mail
'(352)
'
'ST_EMAIL
'
'E -Mail
'(489)
'
'ST_EMAIL_PIC2
'
'E -Mail
'(604)
'
'ST_EMAIL_1
'
'E -Mail
'(718)
'
'ST_INFO_CARR_EDI
'
'EDI
'(728)
'
'ST_EFCT
'
'Effect
'(300)
'
'ST_EDI
'
'Electronic data interchange
'(483)
'
'ST_ELECTRONIC_DOC
'
'Electronic document
'(484)
'
'ST_INFO_CARR_EDOC
'
'Electronic document
'(729)
'
'ST_ELECTRONIC_FOLDER
'
'Electronic folder
'(485)
'
'ST_INFO_CARR_EFOLDER
'
'Electronic folder
'(730)
'
'ST_ELEM_TYPE
'
'Element type
'(670)
'
'ST_MAK_TBL
'
'EMC Table
'(285)
'
'ST_EMPL_ROLE
'
'Employee role
'(536)
'
'ST_EMPL_INST
'
'Employee variable
'(252)
'
'ST_XML_EMPTY
'
'EMPTY
'(673)
'
'ST_END_1
'
'End
'(562)
'
'ST_END_1_TURNED
'
'End
'(626)
'
'ST_END
'
'End state
'(409)
'
'ST_ENT
'
'entity
'(236)
'
'ST_ENT_TYPE
'
'Entity type
'(5)
'
'ST_ET
'
'Entity type
'(522)
'
'ST_ENT_TYPE_1
'
'Entity type
'(404)
'
'ST_ENUM
'
'Enumeration
'(301)
'
'ST_XML_ENUM
'
'Enumeration
'(679)
'
'ST_XML_ENUMTYPE
'
'Enumeration attribute type
'(678)
'
'ST_COUNT_INST
'
'Enumeration list occurrence
'(294)
'
'ST_ENUM_LIT
'
'Enumeration literal
'(763)
'
'ST_ENUM_TYPE
'
'Enumeration type
'(303)
'
'ST_OPR_EQUAL
'
'Equals operator
'(65)
'
'ST_ERM_ATTR
'
'ERM attribute
'(529)
'
'ST_EERM_DOM
'
'ERM domain
'(57)
'
'ST_EVENT_PIC
'
'Event
'(356)
'
'ST_EV
'
'Event
'(1)
'
'ST_EV_INST
'
'Event instance
'(243)
'
'ST_EV_ACT_PAIR
'
'Event/Action
'(178)
'
'ST_UML_EXCEP
'
'Exception
'(793)
'
'ST_KNOWHOW
'
'Expertise
'(46)
'
'ST_EXPERT
'
'Expertise
'(506)
'
'ST_INFO_CARR_EXPERT
'
'Expertise
'(732)
'
'ST_EXT_ENT_TYPE
'
'Ext. entity type
'(101)
'
'ST_DD_LISTBOX
'
'Extended list box
'(743)
'
'ST_EXT_PT
'
'Extension Point
'(762)
'
'ST_PERS_EXT
'
'External Person
'(58)
'
'ST_EXTRANET
'
'Extranet
'(593)
'
'ST_INFO_CARR_EXTRA
'
'Extranet
'(735)
'
'ST_FACT_TAB
'
'Fact Table
'(572)
'
'ST_FAX
'
'Fax
'(51)
'
'ST_FAX_PIC
'
'Fax
'(350)
'
'ST_FAX_1
'
'Fax
'(486)
'
'ST_FLD
'
'FIELD
'(31)
'
'ST_FILE_PIC
'
'File
'(339)
'
'ST_FILE_1
'
'File
'(481)
'
'ST_FILE_PIC_2
'
'File
'(569)
'
'ST_FILE
'
'File
'(28)
'
'ST_FCABIN_PIC
'
'File cabinet
'(346)
'
'ST_INFO_CARR_FCABIN
'
'File cabinet
'(724)
'
'ST_FILE_BIN_PIC
'
'Filing basket
'(354)
'
'ST_INFO_CARR_FILE_BIN
'
'Filing basket
'(727)
'
'ST_FLTR_OBJ_TYPE
'
'Filter object type
'(233)
'
'ST_STATE_FINAL
'
'Final State
'(460)
'
'ST_FINAL_STATE
'
'Final State
'(176)
'
'ST_FIX
'
'Fixed Value
'(573)
'
'ST_FIX_AT
'
'Fixed Value
'(600)
'
'ST_FRGN_KEY_ATTR
'
'FK attribute (ERM)
'(10)
'
'ST_FRGN_KEY_ATTR_INST_ERM
'
'FK attribute instance (ERM)
'(242)
'
'ST_FLOW
'
'flow
'(823)
'
'ST_FOLD
'
'folder
'(47)
'
'ST_FOLDER
'
'folder
'(487)
'
'ST_FRGN_KEY
'
'Foreign Key
'(188)
'
'ST_FORK_LIFT_TRUCK
'
'Fork lift truck
'(498)
'
'ST_FRAME
'
'Frame
'(767)
'
'ST_FUNC
'
'Function
'(335)
'
'ST_FUNC_ACT
'
'Function (actual)
'(227)
'
'ST_FUNC_DP_AIDED
'
'Function (IT-supported)
'(274)
'
'ST_FUNC_PIC_2
'
'Function (manufacturing)
'(374)
'
'ST_FUNC_PIC
'
'Function (office)
'(355)
'
'ST_FUNC_TRG
'
'Function (target)
'(228)
'
'ST_FUNC_INST
'
'Function instance()
'(234)
'
'ST_IS_FUNC_BLOCK
'
'Functional block
'(814)
'
'ST_GNRL_RES
'
'General resource
'(246)
'
'ST_GEN_RESRC
'
'General resource
'(518)
'
'ST_GNRL_1
'
'Generalization
'(11)
'
'ST_GNRL_6
'
'Generalization
'(149)
'
'ST_GNRL_3
'
'Generalization
'(63)
'
'ST_GNRL_7
'
'Generalization
'(150)
'
'ST_GNRL_4
'
'Generalization
'(64)
'
'ST_GNRL_8
'
'Generalization
'(151)
'
'ST_GNRL_2
'
'Generalization
'(62)
'
'ST_GNRL_5
'
'Generalization
'(148)
'
'ST_OPR_GEN
'
'GENERATOR operator
'(67)
'
'ST_GOTO_CONNEC
'
'GoTo connector
'(468)
'
'ST_GOOD
'
'Good
'(540)
'
'ST_GOODS
'
'Goods shipment
'(591)
'
'ST_GRPH_UI
'
'Graphical user interface
'(114)
'
'ST_GRP_PIC
'
'Group
'(375)
'
'ST_GRP
'
'Group
'(209)
'
'ST_GRPH_UI_TYPE
'
'GUI type
'(38)
'
'ST_HAPPY_CUSTOMER
'
'Happy customer
'(477)
'
'ST_HDISK_PIC
'
'Hard disk
'(338)
'
'ST_HARD_DISK
'
'Hard disk
'(504)
'
'ST_INFO_CARR_HD
'
'Hard disk
'(698)
'
'ST_HW_CMP
'
'Hardware component
'(119)
'
'ST_HW_CMP_CLS
'
'Hardware component class
'(25)
'
'ST_HW_CMP_TYPE
'
'Hardware component type
'(26)
'
'ST_HEAD
'
'Heading
'(716)
'
'ST_HIERARC_TAB
'
'Hierarchy Table
'(576)
'
'ST_HIGH_COV
'
'High coverage
'(444)
'
'ST_IDENT
'
'Identifying
'(167)
'
'ST_IMPLEMENT
'
'implementation
'(597)
'
'ST_IMPROVE_QUAL
'
'Improvement potential(quality)
'(712)
'
'ST_IMPROVE_QUANT
'
'Improvement potential(quantity)
'(713)
'
'ST_IMPULSE
'
'Impulse
'(214)
'
'ST_IDX
'
'Index
'(181)
'
'ST_INFO_CUBE
'
'InfoCube
'(577)
'
'ST_INFO_ACT
'
'Information (actual)
'(231)
'
'ST_INFO_TRG
'
'Information (Target)
'(232)
'
'ST_INFO_CARR
'
'Information carrier
'(218)
'
'ST_INFO_FLW
'
'Information flow
'(385)
'
'ST_INFO_OBJ
'
'Information object
'(217)
'
'ST_INF_SERV
'
'Information service
'(531)
'
'ST_INF_SERV_PIC
'
'Information service
'(532)
'
'ST_STATE_INITIAL
'
'initial State
'(459)
'
'ST_INIT_STATE
'
'initial State
'(175)
'
'ST_INITIATIVE
'
'Initiative
'(553)
'
'ST_IN_PARA
'
'Input parameter
'(326)
'
'ST_IN_OUTPUT
'
'Input/Output
'(719)
'
'ST_INST
'
'instance
'(157)
'
'ST_INST_CYC
'
'Instantiation cycle
'(421)
'
'ST_INST_INTERV
'
'Instantiation Interval
'(420)
'
'ST_INST_PLAN
'
'Instantiation plan
'(422)
'
'ST_INTERCON
'
'Interaction continue
'(557)
'
'ST_INTERCON_TURNED
'
'Interaction continue
'(622)
'
'ST_INTER
'
'Interaction end
'(556)
'
'ST_INTER_TURNED
'
'Interaction end
'(621)
'
'ST_INTERACT_INST_SET
'
'Interaction instance set
'(809)
'
'ST_IF
'
'interface
'(401)
'
'ST_PERS_INT
'
'Internal Person
'(2)
'
'ST_INTERNET_PIC
'
'Internet
'(349)
'
'ST_INTERNET
'
'Internet
'(492)
'
'ST_INTERNET_PIC2
'
'Internet
'(605)
'
'ST_INFO_CARR_INTERN
'
'Internet
'(726)
'
'ST_INTRANET
'
'Intranet
'(592)
'
'ST_INFO_CARR_INTRANET
'
'Intranet
'(734)
'
'ST_IS_FUNC
'
'IS function
'(810)
'
'ST_IS_FUNC_SERVICE
'
'IS service
'(815)
'
'ST_IT_BLOCK
'
'IT block
'(819)
'
'ST_DP_FUNC
'
'IT function
'(185)
'
'ST_DP_FUNC_CLS
'
'IT function class
'(184)
'
'ST_DP_FUNC_TYPE
'
'IT function type
'(183)
'
'ST_IT_PROC
'
'IT Procedure
'(820)
'
'ST_IT_SOFTWARE
'
'IT software
'(818)
'
'ST_IT_SYS
'
'IT System
'(816)
'
'ST_JOIN
'
'Join
'(559)
'
'ST_JOIN_TURNED
'
'Join
'(633)
'
'ST_JUMP
'
'Jump
'(561)
'
'ST_JUMP_TURNED
'
'Jump
'(625)
'
'ST_KEY_ATTR
'
'K attribute (ERM)
'(9)
'
'ST_KEY_ATTR_INST_ERM
'
'K attribute instance (ERM)
'(241)
'
'ST_KPI_2
'
'Key figure
'(578)
'
'ST_KPI_2_AT
'
'Key figure
'(601)
'
'ST_KPI_ESTIMATED
'
'Key performance indicator (estimated)
'(709)
'
'ST_KPI_EXACT
'
'Key performance indicator (exact)
'(708)
'
'ST_KPI
'
'Key performance indicator instance
'(552)
'
'ST_KNWLDG_CAT_1
'
'Knowledge category
'(451)
'
'ST_KNWLDG_CAT_2
'
'Knowledge category
'(452)
'
'ST_LAG_IND
'
'Lagging indicator
'(545)
'
'ST_LAN
'
'LAN
'(488)
'
'ST_INFO_CARR_LAN
'
'LAN
'(731)
'
'ST_PRES
'
'Layout
'(293)
'
'ST_LEAD_IND
'
'Leading indicator
'(544)
'
'ST_LETT_PIC
'
'Letter
'(343)
'
'ST_INFO_CARR_LETTER
'
'Letter
'(721)
'
'ST_LINE_OF_WORK
'
'Line of work
'(213)
'
'ST_LINK_OBJ
'
'Link object
'(785)
'
'ST_LIST
'
'List
'(40)
'
'ST_LISTCTRL
'
'List Control
'(756)
'
'ST_LOCA_PIC
'
'location
'(362)
'
'ST_LOCA_PIC2
'
'location
'(371)
'
'ST_LOC_1
'
'location
'(12)
'
'ST_LOG
'
'Log
'(247)
'
'ST_LOOP
'
'Loop
'(778)
'
'ST_LOOP_TURNED
'
'Loop
'(779)
'
'ST_LLIMIT_END
'
'Loop limit (end)
'(515)
'
'ST_LLIMIT_START
'
'Loop limit (start)
'(514)
'
'ST_LOW_COV
'
'Low coverage
'(442)
'
'ST_MACH_PIC
'
'machine
'(367)
'
'ST_MACRO_PRCS
'
'Macro Process
'(267)
'
'ST_MAGN_TAPE
'
'Magnetic tape
'(180)
'
'ST_TAPE_PIC
'
'Magnetic tape
'(348)
'
'ST_MAGNET_TAPE
'
'Magnetic tape
'(502)
'
'ST_MAIL
'
'Mail
'(490)
'
'ST_MAIN_PRCS
'
'Main Process
'(70)
'
'ST_MAND_FIELD
'
'mandatory FIELD
'(190)
'
'ST_PRC_MAN
'
'Manual Processing
'(512)
'
'ST_MARKET_INST
'
'Marketing instrument
'(770)
'
'ST_XXX_TAB
'
'Master data table
'(581)
'
'ST_MATERIAL
'
'material
'(480)
'
'ST_MAT_CLS
'
'material Class
'(207)
'
'ST_MAT_FLW
'
'material flow
'(386)
'
'ST_MAT_TYPE
'
'Material type
'(193)
'
'ST_MAT_TYPE_PIC
'
'Material type
'(372)
'
'ST_MAT_TYPE_PIC2
'
'Material type
'(373)
'
'ST_MAT_RATE
'
'Maturity rating
'(472)
'
'ST_MAX_COV
'
'Maximum coverage
'(445)
'
'ST_STEP
'
'Measure
'(297)
'
'ST_UNIT
'
'Measurement Unit
'(302)
'
'ST_UNIT_NUM
'
'Measurement unit number
'(328)
'
'ST_UNIT_INST
'
'Measurement unit occurrence
'(295)
'
'ST_UNIT_TYPE
'
'Measurement unit type
'(304)
'
'ST_MEM_LOC
'
'Memory location
'(32)
'
'ST_MESSAGE
'
'Message
'(822)
'
'ST_MSG_FLW
'
'Message flow
'(389)
'
'ST_MSG_TYPE
'
'Message type
'(244)
'
'ST_MICRO_PRCS
'
'Micro Process
'(266)
'
'ST_MICROFICHE
'
'Microfiche
'(49)
'
'ST_MICROFICHE_1
'
'Microfiche
'(501)
'
'ST_MINUS
'
'Minus
'(103)
'
'ST_INFO_CARR_HANDY
'
'Mobile phone
'(733)
'
'ST_HANDY
'
'Mobile phone(WAP)
'(589)
'
'ST_MOD
'
'module
'(108)
'
'ST_MOD_CLS
'
'module Class
'(15)
'
'ST_MOD_TYPE
'
'Module type
'(41)
'
'ST_MONEY
'
'Money Transaction
'(590)
'
'ST_MULTIPLE_LISTBOX
'
'Multiple list box
'(742)
'
'ST_WANT
'
'Need
'(769)
'
'ST_OPR_NEG
'
'NEG operator
'(66)
'
'ST_NW
'
'network
'(128)
'
'ST_NW_CLS
'
'network Class
'(23)
'
'ST_NW_LINE
'
'network Connection
'(125)
'
'ST_NW_LINE_CAT
'
'Network connection category
'(123)
'
'ST_NW_LINE_TYPE
'
'Network connection type
'(124)
'
'ST_NW_NODE_2
'
'network Node
'(18)
'
'ST_NW_NODE_1
'
'network Node
'(122)
'
'ST_NW_NODE_CAT
'
'Network node category
'(120)
'
'ST_NW_NODE_TYPE
'
'Network node type
'(121)
'
'ST_NW_PROT
'
'network protocol
'(182)
'
'ST_NW_TYPE
'
'Network type
'(24)
'
'ST_UML_NODE
'
'Node
'(805)
'
'ST_UML_NODE_INST
'
'Node instance
'(806)
'
'ST_NOT_MARKED
'
'Not selected
'(547)
'
'ST_NOTE
'
'Note
'(395)
'
'ST_NOTE_PIC
'
'Notepad
'(347)
'
'ST_INFO_CARR_NOTE
'
'Notepad
'(725)
'
'ST_OBJ_ANALY_SHT
'
'OAS element
'(92)
'
'ST_OBJ_ANALY_SHT_TYPE
'
'OAS element type
'(91)
'
'ST_OBJ_ANALY_SHEET_VAL
'
'OAS Value
'(225)
'
'ST_OBJ
'
'object
'(402)
'
'ST_OBJECT_1
'
'object
'(634)
'
'ST_OBJECT_2
'
'object
'(635)
'
'ST_OBJECT_3
'
'object
'(636)
'
'ST_OBJECT_4
'
'object
'(637)
'
'ST_OBJECT_5
'
'object
'(638)
'
'ST_OBJECT_6
'
'object
'(639)
'
'ST_OBJECT_7
'
'object
'(640)
'
'ST_OBJECT_8
'
'object
'(641)
'
'ST_OBJECT_9
'
'object
'(642)
'
'ST_OBJECT_10
'
'object
'(643)
'
'ST_OBJECT_11
'
'object
'(644)
'
'ST_OBJECT_12
'
'object
'(645)
'
'ST_OBJECT_13
'
'object
'(646)
'
'ST_OBJECT_14
'
'object
'(647)
'
'ST_OBJECT_15
'
'object
'(648)
'
'ST_OBJECT_16
'
'object
'(649)
'
'ST_OBJECT_17
'
'object
'(651)
'
'ST_OBJECT_18
'
'object
'(652)
'
'ST_OBJECT_19
'
'object
'(653)
'
'ST_OBJECT_20
'
'object
'(654)
'
'ST_OBJECT_21
'
'object
'(655)
'
'ST_OBJECT_22
'
'object
'(656)
'
'ST_OBJECT_23
'
'object
'(657)
'
'ST_OBJECT_24
'
'object
'(658)
'
'ST_OBJECT_25
'
'object
'(659)
'
'ST_OBJECT_26
'
'object
'(660)
'
'ST_OBJECT_27
'
'object
'(661)
'
'ST_OBJECT_28
'
'object
'(662)
'
'ST_OBJECT_29
'
'object
'(663)
'
'ST_OBJECT_30
'
'object
'(668)
'
'ST_OBJECT_31
'
'object
'(650)
'
'ST_OBJECT_32
'
'object
'(664)
'
'ST_OBJECT_33
'
'object
'(665)
'
'ST_OBJECT_34
'
'object
'(666)
'
'ST_OBJECT_35
'
'object
'(667)
'
'ST_OBJECT_44
'
'object
'(694)
'
'ST_OBJECT_51
'
'object
'(703)
'
'ST_OBJECT_52
'
'object
'(704)
'
'ST_OBJECT_36
'
'object
'(686)
'
'ST_OBJECT_37
'
'object
'(687)
'
'ST_OBJECT_53
'
'object
'(705)
'
'ST_OBJECT_54
'
'object
'(706)
'
'ST_OBJECT_55
'
'object
'(707)
'
'ST_OBJ_STATE
'
'object State
'(457)
'
'ST_OBJ_TYPE
'
'Object type
'(461)
'
'ST_OBJ_TYPE_CLS
'
'Object type class
'(140)
'
'ST_TARGET_PIC
'
'objective
'(394)
'
'ST_OBJCTV
'
'objective
'(129)
'
'ST_OBJ_ATTR
'
'Objective attribute
'(74)
'
'ST_OFFICE_SYSTEM
'
'Office System
'(491)
'
'ST_OP_RES
'
'operating resource
'(198)
'
'ST_OP_RES_CLS
'
'Operating resource class
'(202)
'
'ST_OP_RES_TYPE
'
'Operating resource type
'(197)
'
'ST_OS
'
'operating System
'(115)
'
'ST_OS_TYPE
'
'Operating system type
'(35)
'
'ST_OP
'
'Operation
'(156)
'
'ST_OP_1
'
'Operation
'(455)
'
'ST_OPP_AREA
'
'Opportunity area
'(473)
'
'ST_OPR_OR_2
'
'OR operator
'(89)
'
'ST_OPR_OR_INST
'
'OR operator (inst.)
'(254)
'
'ST_OPR_OR_1
'
'OR rule
'(43)
'
'ST_OPR_OR_3
'
'OR rule
'(216)
'
'ST_OR
'
'OR rule
'(527)
'
'ST_OPR_OR_AND_INST
'
'OR/AND operator (inst.)
'(257)
'
'ST_OR_AND
'
'OR/AND rule
'(131)
'
'ST_OR_OR
'
'OR/OR rule
'(134)
'
'ST_OPR_OR_XOR_INST
'
'OR/XOR operator (inst.)
'(262)
'
'ST_OR_XOR
'
'OR/XOR rule
'(137)
'
'ST_ORDER_PIC
'
'Order
'(376)
'
'ST_ORG_CHRT
'
'organizational chart
'(59)
'
'ST_ORG_LVL
'
'organizational Level
'(60)
'
'ST_ORG_UNIT_2
'
'organizational Unit
'(144)
'
'ST_ORG_PIC
'
'organizational Unit
'(361)
'
'ST_ORG_UNIT_1
'
'organizational Unit
'(3)
'
'ST_ORG_UNIT_DEM
'
'organizational Unit(DEM)
'(416)
'
'ST_ORG_UNIT_CLST
'
'Organizational unit cluster
'(93)
'
'ST_ORG_UNIT_TYPE_2
'
'Organizational unit type
'(161)
'
'ST_ORG_TYPE_PIC
'
'Organizational unit type
'(393)
'
'ST_ORG_UNIT_TYPE_1
'
'Organizational unit type
'(4)
'
'ST_ORG_UNIT_TYPE_3
'
'Organizational unit type
'(628)
'
'ST_ORG_UNIT_TYPE_4
'
'Organizational unit type
'(630)
'
'ST_OUT_PARA
'
'Output parameter
'(327)
'
'ST_SUP
'
'Outstanding
'(539)
'
'ST_PACK
'
'Package
'(396)
'
'ST_PACK_PIC_2
'
'Package
'(588)
'
'ST_UML_PACK
'
'Package
'(760)
'
'ST_PACK_PIC
'
'Packaging material
'(363)
'
'ST_PACK_MAT_CLS
'
'Packaging material class
'(208)
'
'ST_PACK_MAT_TYPE
'
'Packaging material type
'(195)
'
'ST_PAGE
'
'Page
'(287)
'
'ST_UML_PARA
'
'parameter
'(759)
'
'ST_PARTITION
'
'Partition
'(804)
'
'ST_INFO_CARR_PDA
'
'PDA
'(695)
'
'ST_PERF_CHARAC
'
'Performance characteristic
'(269)
'
'ST_PERSON
'
'Person
'(495)
'
'ST_PERS_F_PIC
'
'Person (f)
'(359)
'
'ST_PERS_M_PIC
'
'Person (m)
'(358)
'
'ST_EMPL_TYPE
'
'Person type
'(145)
'
'ST_PERS_TYPE_PIC
'
'Person type
'(360)
'
'ST_PERSL
'
'Personnel
'(419)
'
'ST_PERSPEC
'
'Perspective
'(548)
'
'ST_PHYS_DOM
'
'Phys.domain
'(53)
'
'ST_PHYS_NW_LINE_EX
'
'Phys. network connection sp.
'(127)
'
'ST_PHYS_NW_NODE
'
'Phys.network Node
'(34)
'
'ST_PHYS_NW_NODE_EX
'
'Phys. network node sp.
'(126)
'
'ST_PICTURE
'
'Picture
'(758)
'
'ST_PIP
'
'pipelet
'(555)
'
'ST_PIP_TURNED
'
'pipelet
'(620)
'
'ST_PIP_ERROR
'
'Pipelet with error
'(598)
'
'ST_PIP_ERROR_TURNED
'
'Pipelet with error
'(627)
'
'ST_PLACEHOLDER
'
'Placeholder
'(701)
'
'ST_PLACEHOLDER_TURNED
'
'Placeholder
'(702)
'
'ST_PLUS
'
'Plus
'(102)
'
'ST_POLICY
'
'Policy
'(474)
'
'ST_WEAK
'
'poor
'(542)
'
'ST_POS
'
'Position
'(143)
'
'ST_POS_1
'
'Position
'(467)
'
'ST_JOB_DESC
'
'Position Description
'(510)
'
'ST_POS_TYPE
'
'Position type
'(299)
'
'ST_POS_TYPE_1
'
'Position type
'(631)
'
'ST_PCTITOR_PIC
'
'Pot.competitor
'(391)
'
'ST_PRIM_KEY
'
'Primary Key
'(187)
'
'ST_PRINT_PIC
'
'Printer
'(336)
'
'ST_PRINTER
'
'Printer
'(493)
'
'ST_INFO_CARR_PRINT
'
'Printer
'(696)
'
'ST_PRIVATE
'
'Private
'(596)
'
'ST_PROBLEM_AREA
'
'Problem area
'(475)
'
'ST_PRCS_1
'
'Process
'(72)
'
'ST_PRCS_2
'
'Process
'(170)
'
'ST_PRC
'
'Process
'(508)
'
'ST_PRCS_CMP
'
'Process component
'(438)
'
'ST_PRCS_CMP_GUI
'
'Process component pathfinder
'(439)
'
'ST_PRCS_IF
'
'Process interface
'(94)
'
'ST_PRCS_MOD
'
'Process module
'(772)
'
'ST_PRC2
'
'Processing (Process)
'(511)
'
'ST_PRDCT
'
'product
'(298)
'
'ST_PROD_PIC2
'
'product
'(380)
'
'ST_PROD_PIC
'
'product
'(377)
'
'ST_PERF_3
'
'Product/Service
'(265)
'
'ST_PROD_SERV
'
'Product/Service
'(524)
'
'ST_PERF_1
'
'Product/Service
'(263)
'
'ST_PERF_2
'
'Product/Service
'(264)
'
'ST_PERFORM
'
'Product/Service
'(465)
'
'ST_PRG_LIB
'
'Program library
'(111)
'
'ST_PROGMOD
'
'Program modification
'(738)
'
'ST_PRG_MOD
'
'Program module
'(110)
'
'ST_PRG_MOD_TYPE
'
'Program module type
'(109)
'
'ST_PRG_LNG
'
'Programming Language
'(113)
'
'ST_PRG_LNG_TYPE
'
'Programming language type
'(37)
'
'ST_PROJ_GUIDLINE
'
'Project guideline
'(251)
'
'ST_PROT
'
'Protected
'(595)
'
'ST_PSTATE_CH
'
'Pseudostate (choice)
'(800)
'
'ST_PSTATE_DH
'
'Pseudostate (deep history)
'(798)
'
'ST_PSTATE
'
'Pseudostate (initial)
'(790)
'
'ST_PSTATE_SH
'
'Pseudostate (shallow history)
'(799)
'
'ST_PUBLIC
'
'Public
'(594)
'
'ST_QUEST
'
'Question Mark
'(568)
'
'ST_OPTBOX
'
'Radio Button
'(747)
'
'ST_OPT_CTRL
'
'Radio button/Check box
'(746)
'
'ST_UML_RECEPT
'
'Reception
'(794)
'
'ST_CTRL_VAR
'
'Reference variable
'(268)
'
'ST_RFLCT
'
'Reflector
'(221)
'
'ST_RFLCT_O
'
'Reflector (o)
'(222)
'
'ST_REINT_RELSHP
'
'Reint.Relationship
'(238)
'
'ST_REINT_RELSHP_TYPE
'
'Reint. relationship type
'(7)
'
'ST_DECLINED
'
'Rejected
'(717)
'
'ST_REL
'
'Relation
'(20)
'
'ST_RELSHP
'
'Relationship
'(237)
'
'ST_RELSHP_TYPE
'
'Relationship type
'(6)
'
'ST_RELAT_TYPE
'
'Relationship type
'(519)
'
'ST_RICH_TEXTBOX
'
'Rich text box
'(740)
'
'ST_RIGHT_ARROW
'
'Right arrow
'(448)
'
'ST_RISK
'
'Risk
'(282)
'
'ST_RISK_1
'
'Risk
'(688)
'
'ST_RISK_PIC
'
'Risk
'(737)
'
'ST_RISK_CATEGORY
'
'Risk category
'(689)
'
'ST_ROBO_PIC
'
'Robot
'(368)
'
'ST_ROLL
'
'rollback
'(566)
'
'ST_RULE_PIC
'
'rule
'(357)
'
'ST_OPR_RULE
'
'rule
'(45)
'
'ST_OPR_RULE_INST
'
'Rule operator (inst.)
'(256)
'
'ST_SADT_CRTL
'
'SADT Control
'(86)
'
'ST_SADT_RES
'
'SADT resource
'(87)
'
'ST_SALES_PROD
'
'Sales product
'(775)
'
'ST_SAP_FUNC_1
'
'SAP function
'(73)
'
'ST_SAP_FUNC_2
'
'SAP function
'(76)
'
'ST_SAP_FUNC_3
'
'SAP function
'(77)
'
'ST_SAP_FUNC_4
'
'SAP function
'(78)
'
'ST_SAP_SERM_GEN
'
'SAP SERM gen.
'(275)
'
'ST_SAVE
'
'savepoint
'(565)
'
'ST_SCENARIO
'
'Scenario
'(71)
'
'ST_SCN_CMP
'
'Scenario component
'(436)
'
'ST_SCN_CMP_GUI
'
'Scenario component pathfinder
'(437)
'
'ST_SCRN
'
'Screen
'(39)
'
'ST_SCREEN
'
'Screen
'(479)
'
'ST_SCRN_2
'
'Screen
'(525)
'
'ST_SCRN_DSGN
'
'Screen design
'(16)
'
'ST_SCRN_TBL
'
'Screen Table
'(325)
'
'ST_SECT
'
'Section
'(288)
'
'ST_SECURE
'
'Security protocol
'(619)
'
'ST_MARKED
'
'Selected
'(546)
'
'ST_SEPRT
'
'Separator
'(292)
'
'ST_XML_SEQUENCE
'
'Sequence
'(675)
'
'ST_SERV_PIC
'
'service
'(378)
'
'ST_SERV
'
'service
'(530)
'
'ST_SHIFT
'
'Shift
'(425)
'
'ST_SHIFT_CYC
'
'Shift cycle
'(424)
'
'ST_SHIFT_PLAN
'
'Shift plan
'(423)
'
'ST_UML_SIGNAL
'
'Signal
'(792)
'
'ST_SMPL_DATA_TYPE
'
'Simple data type
'(434)
'
'ST_SINGLE_LISTBOX
'
'Single list box
'(741)
'
'ST_SOCKET
'
'Socket
'(821)
'
'ST_SOLU
'
'Solution
'(283)
'
'ST_SPINBOX_VERT
'
'Spin box
'(753)
'
'ST_SPINBOX_HORIZ
'
'Spin box
'(754)
'
'ST_SPLIT_1
'
'Split/Synchro
'(463)
'
'ST_SPLIT_2
'
'Split/Synchro
'(464)
'
'ST_DEF_COMBOBOX
'
'Standard combo box
'(752)
'
'ST_DEFTEXTBOX
'
'Standard text box
'(739)
'
'ST_START
'
'Start
'(554)
'
'ST_START_TURNED
'
'Start
'(632)
'
'ST_BEGIN
'
'Start State
'(408)
'
'ST_STATE_1
'
'State
'(458)
'
'ST_STATE2
'
'State
'(407)
'
'ST_STATE
'
'State
'(174)
'
'ST_STATE_MACH
'
'State machine
'(791)
'
'ST_STOP
'
'Stop
'(776)
'
'ST_STOP_TURNED
'
'Stop
'(777)
'
'ST_STRAT_OBJCTV
'
'Strategic objective
'(550)
'
'ST_STRATEGY
'
'Strategy
'(476)
'
'ST_STRATEGY_2
'
'Strategy
'(549)
'
'ST_STRCT_ELEMENT
'
'Structural element
'(466)
'
'ST_SUBCLS
'
'Subclass
'(153)
'
'ST_SUBPROG
'
'Subroutine
'(720)
'
'ST_SPROD_PIC
'
'Substitute product
'(381)
'
'ST_SSERV_PIC
'
'Substitute service
'(379)
'
'ST_SUBSYSY
'
'Subsystem
'(781)
'
'ST_SUB_SYS
'
'Subsystem
'(817)
'
'ST_SUBSYSY_INST
'
'Subsystem instance
'(782)
'
'ST_SUPPL_PIC
'
'Supplier
'(383)
'
'ST_DOM_SYS_ATTR
'
'System attribute domain
'(191)
'
'ST_SYS_FUNC_ACT
'
'System function (actual)
'(229)
'
'ST_SYS_FUNC_TRG
'
'System function (target)
'(230)
'
'ST_SYS_ORG_UNIT_2
'
'System organizational unit
'(168)
'
'ST_SYS_ORG_UNIT_1
'
'System organizational unit
'(95)
'
'ST_SYS_ORG_UNIT_TYPE_2
'
'System organizational unit type
'(169)
'
'ST_SYS_ORG_UNIT_TYPE_1
'
'System organizational unit type
'(97)
'
'ST_PIPLET
'
'T pipelet
'(567)
'
'ST_TAB
'
'Tab
'(764)
'
'ST_TBL
'
'Table
'(30)
'
'ST_TBL_EX
'
'Table sp.
'(116)
'
'ST_TRANS_FUNC_NO_CHANG
'
'Take over MTR
'(585)
'
'ST_APPND_FUNC_NO_CHANG
'
'Take over UR
'(575)
'
'ST_TASK
'
'Task
'(715)
'
'ST_TSK_PERF
'
'Task performer
'(212)
'
'ST_TECH_OP_SUPPLY_CLS
'
'Tech. operating supply class
'(205)
'
'ST_TECH_OP_SUPPLY
'
'Technical operating supply
'(201)
'
'ST_TECH_OP_SUPPLY_TYPE
'
'Technical operating supply type
'(194)
'
'ST_TECH_TERM
'
'Technical term
'(54)
'
'ST_TTERM
'
'Technical term
'(523)
'
'ST_TECH_TERM_INST
'
'Technical terms instance
'(239)
'
'ST_PHONE
'
'Telephone
'(50)
'
'ST_PHONE_PIC
'
'Telephone
'(351)
'
'ST_TELEPHONE
'
'Telephone
'(503)
'
'ST_TERMINAT
'
'Terminator
'(516)
'
'ST_TXT
'
'Text
'(291)
'
'ST_TXT_1
'
'Text
'(745)
'
'ST_TEXTBOX
'
'Text box
'(744)
'
'ST_TXT_TAB
'
'Text Table
'(582)
'
'ST_CMPL_PRCS_CMPL
'
'Tf being prc.cmpl.pnd.w.cmpl.
'(321)
'
'ST_CMPL_PRCS
'
'Tf being processed compl.pend.
'(313)
'
'ST_PRCS_CMPL
'
'Tf being processed with compl.
'(317)
'
'ST_ERROR
'
'Tf has error status
'(312)
'
'ST_WAIT
'
'Tf is waiting
'(311)
'
'ST_IDLE_CMPL
'
'Tf ready with complaint
'(316)
'
'ST_SUSPEN
'
'Tf suspended
'(310)
'
'ST_BE_ABORT_CMPL
'
'Tf suspended with complaint
'(320)
'
'ST_CMPL_BE_ABORT_CMPL
'
'Tf will ab.cmpl.pnd.w.cmpl.
'(322)
'
'ST_ABORT
'
'Tf will abort
'(308)
'
'ST_CMPL_BE_ABORT
'
'Tf will abort compl. pend.
'(315)
'
'ST_CANCEL_CMPL
'
'Tf will abort with complaint
'(319)
'
'ST_CMPL_BE_SUSPEN
'
'Tf will be ssp. compl.pend.
'(314)
'
'ST_BE_SUSPEN_CMPL
'
'Tf will be ssp. with compl.
'(318)
'
'ST_CMPL_BE_SUSPEN_CMPL
'
'Tf will be ssp.cmpl.pnd.w.cmpl.
'(323)
'
'ST_BE_SUSPEN
'
'Tf will be suspended
'(309)
'
'ST_THERM
'
'Thermometer
'(104)
'
'ST_KAT_TIME
'
'Time characteristic
'(586)
'
'ST_KAT_TIME_AT
'
'Time characteristic
'(603)
'
'ST_TIME_EST_HEAD
'
'Time evaluation header
'(286)
'
'ST_TPLAN_PIC
'
'Time planner
'(342)
'
'ST_INFO_CARR_TPLAN
'
'Time planner
'(700)
'
'ST_TOOL_PIC
'
'Tool
'(370)
'
'ST_TOOL_ACT
'
'Tool (actual)
'(711)
'
'ST_TOOL_TRG
'
'Tool (Target)
'(710)
'
'ST_TASK_FOLD
'
'Transaction folder
'(270)
'
'ST_TASK_FOLD_OK
'
'Transaction folder OK
'(272)
'
'ST_TASK_FOLD_OPEN
'
'Transaction folder open
'(271)
'
'ST_TASK_FOLD_HALT
'
'Transaction folder stopped
'(273)
'
'ST_TRANS_FUNC
'
'Transfer rule
'(584)
'
'ST_TRANS_STRUC
'
'Transfer structure
'(583)
'
'ST_TRANSP_PIC
'
'Transport System
'(366)
'
'ST_TRNSP_SYS_CLS
'
'Transport system class
'(204)
'
'ST_TRNSP_SYS_TYPE
'
'Transport system type
'(196)
'
'ST_TRNSP_SYS
'
'Transport systems
'(200)
'
'ST_TREECTRL
'
'tree Control
'(755)
'
'ST_VAN_PIC
'
'Truck
'(365)
'
'ST_TRUCK
'
'Truck
'(497)
'
'ST_UML_MOD
'
'UML model
'(783)
'
'ST_UNHAPPY_CUSTOMER
'
'Unhappy customer
'(478)
'
'ST_KAT_DIM
'
'Unit characteristic
'(571)
'
'ST_KAT_DIM_AT
'
'Unit characteristic
'(599)
'
'ST_UP_ARROW
'
'Up arrow
'(446)
'
'ST_APPND_FUNC
'
'Update rule
'(574)
'
'ST_USECASE
'
'Use case
'(398)
'
'ST_USECASE_INST
'
'Use case instance
'(784)
'
'ST_XML_VALUE
'
'Value
'(680)
'
'ST_VAL_ADD_CHN_SML_1
'
'Value-added chain
'(105)
'
'ST_VAL_ADD_CHN_SML_2
'
'Value-added chain
'(141)
'
'ST_POOR
'
'Very poor
'(543)
'
'ST_VIEW
'
'View
'(19)
'
'ST_VIEW_PHYS
'
'View (physical)
'(118)
'
'ST_VISU_GRP_1
'
'Visualization Group
'(440)
'
'ST_VISU_GRP_2
'
'Visualization Group
'(441)
'
'ST_WH_EQUIP
'
'Warehouse equipment
'(199)
'
'ST_STOCK
'
'Warehouse equipment
'(369)
'
'ST_WH_EQUIP_CLS
'
'Warehouse equipment class
'(203)
'
'ST_WH_EQUIP_TYPE
'
'Warehouse equipment type
'(192)
'
'ST_WASTE_BIN
'
'Waste bin
'(494)
'
'ST_WASTE_PIC
'
'Wastepaper basket
'(341)
'
'ST_INFO_CARR_WASTE
'
'Wastepaper basket
'(699)
'
'ST_WEBSITE
'
'Website
'(768)
'
'ST_WINDOW
'
'Window
'(766)
'
'ST_LOC_2
'
'Work location
'(211)
'
'ST_WORK_PLACE
'
'Workstation
'(509)
'
'ST_XML_XOR
'
'XOR
'(676)
'
'ST_OPR_XOR_2
'
'XOR operator
'(90)
'
'ST_OPR_XOR_INST
'
'XOR operator (inst.)
'(255)
'
'ST_OPR_XOR_1
'
'XOR rule
'(44)
'
'ST_OPR_XOR_3
'
'XOR rule
'(219)
'
'ST_XOR
'
'XOR rule
'(528)
'
'ST_OPR_XOR_AND_INST
'
'XOR/AND operator (inst.)
'(258)
'
'ST_XOR_AND
'
'XOR/AND rule
'(132)
'
'ST_OPR_XOR_OR_INST
'
'XOR/OR operator (inst.)
'(260)
'
'ST_XOR_OR
'
'XOR/OR rule
'(135)
'
'ST_XOR_XOR
'
'XOR/XOR rule
'(138)
'
'ST_Y_FUNC
'
'Y function
'(82)
'
'ST_Y_FUNC_LEFT
'
'Y function (left)
'(83)
'
'ST_Y_FUNC_RIGHT
'
'Y function (right)
'(84)
'
'ST_Y_FUNC_SML
'
'Y function (small)
'(85)
'
'ST_YEAR_PLAN
'
'Yearly plan
'(427)
'
'ST_IS_FUNC_ZONE
'
'Zone
'(811)
'
'Copyright (C) IDS Scheer AG, 1996 - 2003
