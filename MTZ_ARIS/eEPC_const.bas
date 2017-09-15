Attribute VB_Name = "eEPC_const"
Option Explicit
Public Const UML_Statechart_diagram_L_has_transition_to = 459
Public Const UML_Statechart_diagram_L_concerns = 192
Public Const E_Business_scenario_diagram_L_carries_out = 218
Public Const E_Business_scenario_diagram_L_has_output_of = 50
Public Const E_Business_scenario_diagram_L_is_input_for = 49
Public Const DTD_L_has = 121
Public Const DTD_L_has_any_number_of_times = 497
Public Const DTD_L_has_at_most_once = 499
Public Const DTD_L_is_described_by = 396
Public Const DTD_L_has_exactly_once = 500
Public Const eERM_L_is_subtype_of = 76
Public Const eERM_L_defines = 103
Public Const eERM_L_is_supertype_of = 77
Public Const eERM_L_is_primary_key_for = 80
Public Const eERM_L_is_describing_for = 78
Public Const Program_flow_chart__PF__L_occurs_before = 477
Public Const Value_added_chain_diagram_L_has_output_of = 50
Public Const Value_added_chain_diagram_L_is_predecessor_of = 118
Public Const Value_added_chain_diagram_L_is_input_for = 49
Public Const Organizational_chart_L_is_composed_of = 7
Public Const Organizational_chart_L_is_technical_superior_to = 8
Public Const Organizational_chart_L_is_of_type = 4
Public Const Organizational_chart_L_is_disciplinary_superior_to = 9
Public Const Organizational_chart_L_is_organization_manager_for = 395
Public Const eEPC_L_can_use = 125
Public Const eEPC_L_decides_on = 232
Public Const eEPC_L_is_input_for = 49
Public Const eEPC_L_leads_to = 117
Public Const eEPC_L_is_predecessor_of = 118
Public Const eEPC_L_is_technically_responsible_for = 10
Public Const eEPC_L_has_consulting_role_in = 355
Public Const eEPC_L_contributes_to = 233
Public Const eEPC_L_accepts = 435
Public Const eEPC_L_creates_output_to = 28
Public Const eEPC_L_creates = 44
Public Const eEPC_L_is_checked_by = 223
Public Const eEPC_L_is_IT_responsible_for = 148
Public Const eEPC_L_is_evaluated_by = 48
Public Const eEPC_L_activates = 43
Public Const eEPC_L_must_inform_about_result_of = 255
Public Const eEPC_L_must_be_informed_on_cancellation = 316
Public Const eEPC_L_must_be_informed_about = 266
Public Const eEPC_L_reads = 247
Public Const eEPC_L_is_carried_out_at = 258


Public Const E_Business_scenario_diagram = 147
Public Const Value_added_chain_diagram = 12
Public Const Program_flow_chart__PF_ = 139
Public Const eERM = 6
Public Const UML_Statechart_diagram = 130
Public Const DTD = 160
Public Const eEPC = 13
Public Const Organizational_chart = 1


Public Function eEPC_Hardware_component_type(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(24, caption, LocaleID)
Set eEPC_Hardware_component_type = mdl.CreateObjOcc(26, cls, GetX(mdl), GetY(mdl), False)
End Function

Public Function eEPC_AND_OR_rule(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(50, caption, LocaleID)
Set eEPC_AND_OR_rule = mdl.CreateObjOcc(133, cls, GetX(mdl), GetY(mdl), False)
End Function

Public Function eEPC_Service(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(153, caption, LocaleID)
Set eEPC_Service = mdl.CreateObjOcc(530, cls, GetX(mdl), GetY(mdl), False)
End Function

Public Function eEPC_OR_AND_rule(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(50, caption, LocaleID)
Set eEPC_OR_AND_rule = mdl.CreateObjOcc(131, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Component(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(188, caption, LocaleID)
Set eEPC_Component = mdl.CreateObjOcc(397, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_CD_ROM(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_CD_ROM = mdl.CreateObjOcc(697, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Printer(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Printer = mdl.CreateObjOcc(696, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Entity_type(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(17, caption, LocaleID)
Set eEPC_Entity_type = mdl.CreateObjOcc(5, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_IT_function_type(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(105, caption, LocaleID)
Set eEPC_IT_function_type = mdl.CreateObjOcc(183, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Document(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Document = mdl.CreateObjOcc(29, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Intranet(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Intranet = mdl.CreateObjOcc(734, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Product_Service(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(153, caption, LocaleID)
Set eEPC_Product_Service = mdl.CreateObjOcc(465, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Module_type(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(37, caption, LocaleID)
Set eEPC_Module_type = mdl.CreateObjOcc(41, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_IT_function(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(107, caption, LocaleID)
Set eEPC_IT_function = mdl.CreateObjOcc(185, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Information_service(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(153, caption, LocaleID)
Set eEPC_Information_service = mdl.CreateObjOcc(531, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_D_attribute__ERM_(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(19, caption, LocaleID)
Set eEPC_D_attribute__ERM_ = mdl.CreateObjOcc(8, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Organizational_unit(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(43, caption, LocaleID)
Set eEPC_Organizational_unit = mdl.CreateObjOcc(3, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Cluster(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(14, caption, LocaleID)
Set eEPC_Cluster = mdl.CreateObjOcc(13, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Electronic_folder(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Electronic_folder = mdl.CreateObjOcc(730, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Fax(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Fax = mdl.CreateObjOcc(51, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Workstation(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(54, caption, LocaleID)
Set eEPC_Workstation = mdl.CreateObjOcc(509, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Business_object(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(150, caption, LocaleID)
Set eEPC_Business_object = mdl.CreateObjOcc(250, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Hard_disk(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Hard_disk = mdl.CreateObjOcc(698, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Person_type(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(78, caption, LocaleID)
Set eEPC_Person_type = mdl.CreateObjOcc(145, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Reint__relationship_type(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(11, caption, LocaleID)
Set eEPC_Reint__relationship_type = mdl.CreateObjOcc(7, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Operating_resource(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(120, caption, LocaleID)
Set eEPC_Operating_resource = mdl.CreateObjOcc(198, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Authorization_condition(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(242, caption, LocaleID)
Set eEPC_Authorization_condition = mdl.CreateObjOcc(533, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Group(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(128, caption, LocaleID)
Set eEPC_Group = mdl.CreateObjOcc(209, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_OR_rule(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(50, caption, LocaleID)
Set eEPC_OR_rule = mdl.CreateObjOcc(43, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_General_resource(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(145, caption, LocaleID)
Set eEPC_General_resource = mdl.CreateObjOcc(246, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_LAN(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_LAN = mdl.CreateObjOcc(731, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Notepad(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Notepad = mdl.CreateObjOcc(725, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_XOR_OR_rule(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(50, caption, LocaleID)
Set eEPC_XOR_OR_rule = mdl.CreateObjOcc(135, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_ARIS_diagram(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_ARIS_diagram = mdl.CreateObjOcc(248, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Complex_object_type(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(182, caption, LocaleID)
Set eEPC_Complex_object_type = mdl.CreateObjOcc(324, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Module(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(65, caption, LocaleID)
Set eEPC_Module = mdl.CreateObjOcc(108, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Attributes(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(19, caption, LocaleID)
Set eEPC_Attributes = mdl.CreateObjOcc(155, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_FK_attribute__ERM_(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(19, caption, LocaleID)
Set eEPC_FK_attribute__ERM_ = mdl.CreateObjOcc(10, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Function__target_(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(22, caption, LocaleID)
Set eEPC_Function__target_ = mdl.CreateObjOcc(228, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Process_module(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(22, caption, LocaleID)
Set eEPC_Process_module = mdl.CreateObjOcc(772, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_DVD(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_DVD = mdl.CreateObjOcc(736, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Wastepaper_basket(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Wastepaper_basket = mdl.CreateObjOcc(699, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Folder(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Folder = mdl.CreateObjOcc(47, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Key_performance_indicator_instance(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(244, caption, LocaleID)
Set eEPC_Key_performance_indicator_instance = mdl.CreateObjOcc(552, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Diskette(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Diskette = mdl.CreateObjOcc(722, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Cost_driver(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(226, caption, LocaleID)
Set eEPC_Cost_driver = mdl.CreateObjOcc(435, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Draft_list(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(30, caption, LocaleID)
Set eEPC_Draft_list = mdl.CreateObjOcc(17, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_System_function__actual_(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(22, caption, LocaleID)
Set eEPC_System_function__actual_ = mdl.CreateObjOcc(229, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Use_case(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(22, caption, LocaleID)
Set eEPC_Use_case = mdl.CreateObjOcc(398, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Extranet(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Extranet = mdl.CreateObjOcc(735, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Application_system_type(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(6, caption, LocaleID)
Set eEPC_Application_system_type = mdl.CreateObjOcc(33, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Filing_basket(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Filing_basket = mdl.CreateObjOcc(727, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Operation(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(22, caption, LocaleID)
Set eEPC_Operation = mdl.CreateObjOcc(455, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Mobile_phone(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Mobile_phone = mdl.CreateObjOcc(733, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Rule(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(50, caption, LocaleID)
Set eEPC_Rule = mdl.CreateObjOcc(45, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Technical_term(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(58, caption, LocaleID)
Set eEPC_Technical_term = mdl.CreateObjOcc(54, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Telephone(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Telephone = mdl.CreateObjOcc(50, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_COT_attribute(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(179, caption, LocaleID)
Set eEPC_COT_attribute = mdl.CreateObjOcc(305, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Screen(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(31, caption, LocaleID)
Set eEPC_Screen = mdl.CreateObjOcc(39, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_List(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(29, caption, LocaleID)
Set eEPC_List = mdl.CreateObjOcc(40, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Screen_design(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(32, caption, LocaleID)
Set eEPC_Screen_design = mdl.CreateObjOcc(16, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Internet(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Internet = mdl.CreateObjOcc(726, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Knowledge_category(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(230, caption, LocaleID)
Set eEPC_Knowledge_category = mdl.CreateObjOcc(451, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Book(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Book = mdl.CreateObjOcc(723, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Card_file(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Card_file = mdl.CreateObjOcc(27, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Microfiche(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Microfiche = mdl.CreateObjOcc(49, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_EDI(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_EDI = mdl.CreateObjOcc(728, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Application_system_class(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(7, caption, LocaleID)
Set eEPC_Application_system_class = mdl.CreateObjOcc(14, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_System_function__target_(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(22, caption, LocaleID)
Set eEPC_System_function__target_ = mdl.CreateObjOcc(230, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Log(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Log = mdl.CreateObjOcc(247, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_XOR_AND_rule(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(50, caption, LocaleID)
Set eEPC_XOR_AND_rule = mdl.CreateObjOcc(132, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Objective(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(86, caption, LocaleID)
Set eEPC_Objective = mdl.CreateObjOcc(129, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Letter(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Letter = mdl.CreateObjOcc(721, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Element_type(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(247, caption, LocaleID)
Set eEPC_Element_type = mdl.CreateObjOcc(670, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Electronic_document(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Electronic_document = mdl.CreateObjOcc(729, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Attribute_type_group(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(111, caption, LocaleID)
Set eEPC_Attribute_type_group = mdl.CreateObjOcc(206, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Position_description(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(78, caption, LocaleID)
Set eEPC_Position_description = mdl.CreateObjOcc(510, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_OR_XOR_rule(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(50, caption, LocaleID)
Set eEPC_OR_XOR_rule = mdl.CreateObjOcc(137, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Documented_knowledge(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(231, caption, LocaleID)
Set eEPC_Documented_knowledge = mdl.CreateObjOcc(453, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Application_system(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(64, caption, LocaleID)
Set eEPC_Application_system = mdl.CreateObjOcc(107, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Location(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(54, caption, LocaleID)
Set eEPC_Location = mdl.CreateObjOcc(12, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Internal_person(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(46, caption, LocaleID)
Set eEPC_Internal_person = mdl.CreateObjOcc(2, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_File_cabinet(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_File_cabinet = mdl.CreateObjOcc(724, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Object_state(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(153, caption, LocaleID)
Set eEPC_Object_state = mdl.CreateObjOcc(457, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_File(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_File = mdl.CreateObjOcc(28, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_E_mail(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_E_mail = mdl.CreateObjOcc(718, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Position(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(45, caption, LocaleID)
Set eEPC_Position = mdl.CreateObjOcc(143, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Function__actual_(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(22, caption, LocaleID)
Set eEPC_Function__actual_ = mdl.CreateObjOcc(227, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Position_type(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(44, caption, LocaleID)
Set eEPC_Position_type = mdl.CreateObjOcc(299, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Expertise(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Expertise = mdl.CreateObjOcc(732, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Bar_code(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Bar_code = mdl.CreateObjOcc(48, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Relationship_type(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(11, caption, LocaleID)
Set eEPC_Relationship_type = mdl.CreateObjOcc(6, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Information__actual_(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(17, caption, LocaleID)
Set eEPC_Information__actual_ = mdl.CreateObjOcc(231, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Magnetic_tape(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Magnetic_tape = mdl.CreateObjOcc(180, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_XOR_rule(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(50, caption, LocaleID)
Set eEPC_XOR_rule = mdl.CreateObjOcc(44, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_External_person(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(46, caption, LocaleID)
Set eEPC_External_person = mdl.CreateObjOcc(58, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Process_interface(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(22, caption, LocaleID)
Set eEPC_Process_interface = mdl.CreateObjOcc(94, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_AND_XOR_rule(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(50, caption, LocaleID)
Set eEPC_AND_XOR_rule = mdl.CreateObjOcc(136, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Information_carrier(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Information_carrier = mdl.CreateObjOcc(218, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Organizational_unit_type(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(44, caption, LocaleID)
Set eEPC_Organizational_unit_type = mdl.CreateObjOcc(4, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Package(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(187, caption, LocaleID)
Set eEPC_Package = mdl.CreateObjOcc(396, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Event(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(18, caption, LocaleID)
Set eEPC_Event = mdl.CreateObjOcc(1, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Cost_category(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(132, caption, LocaleID)
Set eEPC_Cost_category = mdl.CreateObjOcc(224, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Class(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(90, caption, LocaleID)
Set eEPC_Class = mdl.CreateObjOcc(152, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Time_planner(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(27, caption, LocaleID)
Set eEPC_Time_planner = mdl.CreateObjOcc(700, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Information__target_(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(17, caption, LocaleID)
Set eEPC_Information__target_ = mdl.CreateObjOcc(232, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_K_attribute__ERM_(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(19, caption, LocaleID)
Set eEPC_K_attribute__ERM_ = mdl.CreateObjOcc(9, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Employee_variable(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(151, caption, LocaleID)
Set eEPC_Employee_variable = mdl.CreateObjOcc(252, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_Function(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(22, caption, LocaleID)
Set eEPC_Function = mdl.CreateObjOcc(335, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eEPC_AND_rule(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(50, caption, LocaleID)
Set eEPC_AND_rule = mdl.CreateObjOcc(42, cls, GetX(mdl), GetY(mdl), False)
End Function


Public Function Organizational_chart_Position_type(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(44, caption, LocaleID)
Set Organizational_chart_Position_type = mdl.CreateObjOcc(299, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function Organizational_chart_Organizational_unit(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(43, caption, LocaleID)
Set Organizational_chart_Organizational_unit = mdl.CreateObjOcc(144, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function Organizational_chart_Position(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(45, caption, LocaleID)
Set Organizational_chart_Position = mdl.CreateObjOcc(143, cls, GetX(mdl), GetY(mdl), False)
End Function

Public Function DTD_Attribute_type(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(252, caption, LocaleID)
Set DTD_Attribute_type = mdl.CreateObjOcc(677, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function DTD_Element_type(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(247, caption, LocaleID)
Set DTD_Element_type = mdl.CreateObjOcc(670, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function DTD_Enumeration_attribute_type(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(253, caption, LocaleID)
Set DTD_Enumeration_attribute_type = mdl.CreateObjOcc(678, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function DTD_Sequence(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(250, caption, LocaleID)
Set DTD_Sequence = mdl.CreateObjOcc(675, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function DTD_Enumeration(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(175, caption, LocaleID)
Set DTD_Enumeration = mdl.CreateObjOcc(679, cls, GetX(mdl), GetY(mdl), False)
End Function

Public Function eERM_Entity_type(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(17, caption, LocaleID)
Set eERM_Entity_type = mdl.CreateObjOcc(5, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eERM_Reint__relationship_type(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(11, caption, LocaleID)
Set eERM_Reint__relationship_type = mdl.CreateObjOcc(7, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eERM_Generalization(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(23, caption, LocaleID)
Set eERM_Generalization = mdl.CreateObjOcc(11, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eERM_K_attribute__ERM_(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(19, caption, LocaleID)
Set eERM_K_attribute__ERM_ = mdl.CreateObjOcc(9, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eERM_D_attribute__ERM_(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(19, caption, LocaleID)
Set eERM_D_attribute__ERM_ = mdl.CreateObjOcc(8, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function eERM_Relationship_type(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(11, caption, LocaleID)
Set eERM_Relationship_type = mdl.CreateObjOcc(6, cls, GetX(mdl), GetY(mdl), False)
End Function


Public Function Program_flow_chart__PF__Branch(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(50, caption, LocaleID)
Set Program_flow_chart__PF__Branch = mdl.CreateObjOcc(513, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function Program_flow_chart__PF__Processing__Process_(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(22, caption, LocaleID)
Set Program_flow_chart__PF__Processing__Process_ = mdl.CreateObjOcc(511, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function Program_flow_chart__PF__Connector(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(50, caption, LocaleID)
Set Program_flow_chart__PF__Connector = mdl.CreateObjOcc(517, cls, GetX(mdl), GetY(mdl), False)
End Function


Public Function Value_added_chain_diagram_Value_added_chain(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(22, caption, LocaleID)
Set Value_added_chain_diagram_Value_added_chain = mdl.CreateObjOcc(105, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function Value_added_chain_diagram_Technical_term(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(58, caption, LocaleID)
Set Value_added_chain_diagram_Technical_term = mdl.CreateObjOcc(54, cls, GetX(mdl), GetY(mdl), False)
End Function


Public Function E_Business_scenario_diagram_Employee_role(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(78, caption, LocaleID)
Set E_Business_scenario_diagram_Employee_role = mdl.CreateObjOcc(536, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function E_Business_scenario_diagram_Business_process(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(22, caption, LocaleID)
Set E_Business_scenario_diagram_Business_process = mdl.CreateObjOcc(538, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function E_Business_scenario_diagram_Business_participant(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(44, caption, LocaleID)
Set E_Business_scenario_diagram_Business_participant = mdl.CreateObjOcc(534, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function E_Business_scenario_diagram_Business_document(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(14, caption, LocaleID)
Set E_Business_scenario_diagram_Business_document = mdl.CreateObjOcc(535, cls, GetX(mdl), GetY(mdl), False)
End Function

Public Function UML_Statechart_diagram_Split_Synchro(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(50, caption, LocaleID)
Set UML_Statechart_diagram_Split_Synchro = mdl.CreateObjOcc(463, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function UML_Statechart_diagram_Pseudostate__initial_(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(50, caption, LocaleID)
Set UML_Statechart_diagram_Pseudostate__initial_ = mdl.CreateObjOcc(790, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function UML_Statechart_diagram_Constraint(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(88, caption, LocaleID)
Set UML_Statechart_diagram_Constraint = mdl.CreateObjOcc(147, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function UML_Statechart_diagram_Pseudostate__choice_(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(50, caption, LocaleID)
Set UML_Statechart_diagram_Pseudostate__choice_ = mdl.CreateObjOcc(800, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function UML_Statechart_diagram_Final_state(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(153, caption, LocaleID)
Set UML_Statechart_diagram_Final_state = mdl.CreateObjOcc(460, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function UML_Statechart_diagram_Pseudostate__deep_history_(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(50, caption, LocaleID)
Set UML_Statechart_diagram_Pseudostate__deep_history_ = mdl.CreateObjOcc(798, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function UML_Statechart_diagram_Initial_state(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(153, caption, LocaleID)
Set UML_Statechart_diagram_Initial_state = mdl.CreateObjOcc(459, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function UML_Statechart_diagram_Pseudostate__shallow_history_(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(50, caption, LocaleID)
Set UML_Statechart_diagram_Pseudostate__shallow_history_ = mdl.CreateObjOcc(799, cls, GetX(mdl), GetY(mdl), False)
End Function
Public Function UML_Statechart_diagram_State(cat As Group, mdl As model, ByVal caption As String) As ObjOcc
On Error Resume Next
Dim cls As ObjDef
Set cls = cat.CreateObjDef(153, caption, LocaleID)
Set UML_Statechart_diagram_State = mdl.CreateObjOcc(458, cls, GetX(mdl), GetY(mdl), False)
End Function
