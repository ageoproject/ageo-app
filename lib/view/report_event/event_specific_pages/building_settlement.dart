import 'dart:io';
import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BuildingSettlement extends StatelessWidget {
  BuildingSettlement({Key? key}) : super(key: key);
  final ReportEventController _reportEventController=Get.find();
  final double _imageContainerBorderRadius=12.0;
  final double _inputFieldBorderRadius = 4;
  final List<Map<String,dynamic>> _settlementTypeList=[
    {
      "type_of_damage":"Outer Center Settlement",
      "icon_path":"assets/images/report_event/event_specific_images/building_settlement/outer_settled_ic.png"
    },
    {
      "type_of_damage":"Inner Center Settlement",
      "icon_path":"assets/images/report_event/event_specific_images/building_settlement/inner_settled_ic.png"
    },
    {
      "type_of_damage":"Left Settlement",
      "icon_path":"assets/images/report_event/event_specific_images/building_settlement/left_settled_ic.png"
    },
    {
      "type_of_damage":"Right Settlement",
      "icon_path":"assets/images/report_event/event_specific_images/building_settlement/right_settled_ic.png"
    },
  ];
  final List<Map<String,dynamic>> _otherStructureList=[
    {
      "localization_ref":"monitor_event.building_settlement.walls",
      "type_of_damage":"Walls",
      "icon_path":"assets/images/report_event/event_specific_images/building_settlement/walls_ic.png"
    },
    {
      "localization_ref":"monitor_event.building_settlement.stairs",
      "type_of_damage":"Stairs",
      "icon_path":"assets/images/report_event/event_specific_images/building_settlement/stairs_ic.png"
    }
  ];
  final List<Map<String,dynamic>> _cracksDirectionList=[
    {
      "localization_ref":"monitor_event.building_settlement.vertical",
      "type_of_damage":"Vertical",
      "icon_path":"assets/images/report_event/event_specific_images/building_settlement/vertical_ic.png"
    },
    {
      "localization_ref":"monitor_event.building_settlement.horizontal",
      "type_of_damage":"Horizontal",
      "icon_path":"assets/images/report_event/event_specific_images/building_settlement/horizontal_ic.png"
    },
    {
      "localization_ref":"monitor_event.building_settlement.oblique",
      "type_of_damage":"Oblique",
      "icon_path":"assets/images/report_event/event_specific_images/building_settlement/oblique_ic.png"
    },
    {
      "localization_ref":"monitor_event.building_settlement.starry",
      "type_of_damage":"Starry",
      "icon_path":"assets/images/report_event/event_specific_images/building_settlement/starry_ic.png"
    },{
      "localization_ref":"monitor_event.building_settlement.none",
      "type_of_damage":"None",
      "icon_path":"assets/images/report_event/event_specific_images/building_settlement/none_ic.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<ReportEventController>(
          builder: (_)=>Padding(
            padding:const EdgeInsets.symmetric(horizontal: 18,vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:0.0,bottom: 12),
                  child: Text("monitor_event.building_settlement.type_of_settlement",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Wrap(
                    children: List.generate(_settlementTypeList.length, (index){
                      return Padding(
                        padding:  EdgeInsets.only(bottom: 12.0,right: index%2==0?12:0),
                        child: GestureDetector(
                          onTap: (){
                            _reportEventController.selectTypeOfSettlementForBuildingSettlement(value: _settlementTypeList[index]["type_of_damage"]);
                          },
                          child: Container(
                            height: 162,
                            width: 162,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(_imageContainerBorderRadius),
                              // border: Border.all(color: appTheme.inputFieldsBorderColor)
                              border: _reportEventController.buildingSettlementDamage["type_of_settlement"]["answer"]==_settlementTypeList[index]["type_of_damage"] ? Border.all(color: appTheme.primaryActionColor,width: 2) : Border.all(color: appTheme.inputFieldsBorderColor),
                            ),
                            padding:const EdgeInsets.all(12),
                            child: Image.asset(_settlementTypeList[index]["icon_path"]),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:0.0,bottom: 12),
                  child: Text("monitor_event.building_settlement.other_structures",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Wrap(
                    children: List.generate(_otherStructureList.length, (index){
                      return Padding(
                        padding:  EdgeInsets.only(bottom: 12.0,right: index%2==0?12:0),
                        child: GestureDetector(
                          onTap: (){
                            _reportEventController.selectOtherStructureForBuildingSettlement(value: _otherStructureList[index]["type_of_damage"]);
                          },
                          child: Container(
                            height: 162,
                            width: 162,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(_imageContainerBorderRadius),
                              // border: Border.all(color: appTheme.inputFieldsBorderColor)
                              border: _reportEventController.buildingSettlementDamage["other_structure"]["answer"]==_otherStructureList[index]["type_of_damage"] ? Border.all(color: appTheme.primaryActionColor,width: 2) : Border.all(color: appTheme.inputFieldsBorderColor),
                            ),
                            padding:const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Image.asset(_otherStructureList[index]["icon_path"],height: 110,),
                                const SizedBox(height: 12,),
                                Expanded(child: Text(_otherStructureList[index]["localization_ref"]!,style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr())
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:0.0,bottom: 12),
                  child: Text("monitor_event.building_settlement.cracks_direction",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
                ),

                Align(
                  alignment: Alignment.center,
                  child: Wrap(
                    children: List.generate(_cracksDirectionList.length, (index){
                      return Padding(
                        padding:  EdgeInsets.only(bottom: 12.0,right: index%2==0?12:0),
                        child: GestureDetector(
                          onTap: (){
                            _reportEventController.selectDirectionOfCrackForBuildingSettlement(value: _cracksDirectionList[index]["type_of_damage"]);
                          },
                          child: Container(
                            height: 162,
                            width: 162,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(_imageContainerBorderRadius),
                              // border: Border.all(color: appTheme.inputFieldsBorderColor)
                              border: _reportEventController.buildingSettlementDamage["direction_of_cracks"]["answer"].contains(_cracksDirectionList[index]["type_of_damage"]) ? Border.all(color: appTheme.primaryActionColor,width: 2) : Border.all(color: appTheme.inputFieldsBorderColor),
                            ),
                            padding:const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Image.asset(_cracksDirectionList[index]["icon_path"],height: 110,),
                                const SizedBox(height: 12,),
                                Expanded(child: Text(_cracksDirectionList[index]["localization_ref"]!,style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr())
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text("${tr("monitor_event.building_settlement.crack_direction")}: ",style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
                      ),
                      Expanded(
                        child: TextFormField(
                          initialValue:_reportEventController.buildingSettlementDamage["direction_of_cracks"]["dimension_of_crack"],
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textInputAction: TextInputAction.next,
                          style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            errorMaxLines: 2,
                            contentPadding:const EdgeInsets.fromLTRB(10, 10, 0, 10),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                              borderRadius: BorderRadius.all(
                                Radius.circular(_inputFieldBorderRadius),
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                              borderRadius: BorderRadius.all(
                                Radius.circular(_inputFieldBorderRadius),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                              borderRadius: BorderRadius.all(
                                Radius.circular(_inputFieldBorderRadius),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                              borderRadius: BorderRadius.all(
                                Radius.circular(_inputFieldBorderRadius),
                              ),
                            ),
                          ),
                          onChanged: (value)async{
                            _reportEventController.changeDimensionOfCrackForBuildingSettlement(value: value);
                            // await _showCalendar(selectedDate: DateTime.parse("${_studentProfile.user!.dob}"));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Visibility(
        // visible: _reportEventController.buildingSettlementDamage["type_of_settlement"]["answer"]!="" && _reportEventController.buildingSettlementDamage["other_structure"]["answer"]!="" && _reportEventController.buildingSettlementDamage["direction_of_cracks"]["answer"].isNotEmpty,
        child: SizedBox(
          height: Platform.isIOS? 66:40,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: appTheme.primaryActionColor,
            ),
            onPressed: (){
              // _reportEventController.changeActiveTab(value: "damage");
            },
            child: const Text("common_key.submit_btn",style: TextStyle(color: Colors.white,fontSize: 16),).tr(),
          ),
        ),
      ),
    );
  }
}
