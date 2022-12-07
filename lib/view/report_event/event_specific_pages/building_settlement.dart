import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/view/report_event/submit_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildingSettlement extends StatelessWidget {
  BuildingSettlement({Key? key}) : super(key: key);
  final ReportEventController _reportEventController=Get.find();
  final double _imageContainerBorderRadius=12.0;
  // final double _inputFieldBorderRadius = 4;
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
      "localization_ref":"monitor_event.building_settlement.left_oblique",
      "type_of_damage":"Left Oblique",
      "icon_path":"assets/images/report_event/event_specific_images/building_settlement/left_oblique_ic.png"
    },
    {
      "localization_ref":"monitor_event.building_settlement.right_oblique",
      "type_of_damage":"Right Oblique",
      "icon_path":"assets/images/report_event/event_specific_images/building_settlement/right_oblique_ic.png"
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
    bool isMobile=MediaQuery.of(context).size.shortestSide<600;
    bool showSubmitButton =true;
    return GetBuilder<ReportEventController>(
      builder: (_)=> Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: _reportEventController.nextAndSubmitButtonHeight),
            child: SingleChildScrollView(
              child: Padding(
                padding:const EdgeInsets.symmetric(horizontal: 18,vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:0.0,bottom: 12),
                      child: Text("monitor_event.building_settlement.type_of_settlement",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
                    ),

                    Align(
                      alignment: isMobile ? Alignment.center :Alignment.centerLeft,
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: List.generate(_settlementTypeList.length, (index){
                          return GestureDetector(
                            onTap: (){
                              _reportEventController.selectTypeOfSettlementForBuildingSettlement(value: _settlementTypeList[index]["type_of_damage"]);
                            },
                            child: Container(
                              height: 162,
                              width: 162,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(_imageContainerBorderRadius),
                                // border: Border.all(color: appTheme.inputFieldsBorderColor)
                                border: _reportEventController.buildingSettlementDamage["building_settlement_type"]==_settlementTypeList[index]["type_of_damage"] ? Border.all(color: appTheme.primaryActionColor,width: 2) : Border.all(color: appTheme.inputFieldsBorderColor),
                              ),
                              padding:const EdgeInsets.all(12),
                              child: Image.asset(_settlementTypeList[index]["icon_path"]),
                            ),
                          );
                        }),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:20.0,bottom: 12),
                      child: Text("monitor_event.building_settlement.other_structures",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
                    ),

                    Align(
                      alignment: isMobile ? Alignment.center :Alignment.centerLeft,
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: List.generate(_otherStructureList.length, (index){
                          return GestureDetector(
                            onTap: (){
                              _reportEventController.selectOtherStructureForBuildingSettlement(value: _otherStructureList[index]["type_of_damage"]);
                            },
                            child: Container(
                              height: 86,
                              width: isMobile? (MediaQuery.of(context).size.width-40) : (MediaQuery.of(context).size.width/2)-40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(_imageContainerBorderRadius),
                                // border: Border.all(color: appTheme.inputFieldsBorderColor)
                                border: _reportEventController.buildingSettlementDamage["building_settlement_other_structures"]==_otherStructureList[index]["type_of_damage"] ? Border.all(color: appTheme.primaryActionColor,width: 2) : Border.all(color: appTheme.inputFieldsBorderColor),
                              ),
                              padding:const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Image.asset(_otherStructureList[index]["icon_path"]),
                                  const SizedBox(width: 12,),
                                  Expanded(child: Text(_otherStructureList[index]["localization_ref"]!,style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr())
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:20.0,bottom: 12),
                      child: Text("monitor_event.building_settlement.cracks_direction",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
                    ),

                    Align(
                      alignment: isMobile ? Alignment.center :Alignment.centerLeft,
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: List.generate(_cracksDirectionList.length, (index){
                          return GestureDetector(
                            onTap: (){
                              _reportEventController.selectDirectionOfCrackForBuildingSettlement(value: _cracksDirectionList[index]["type_of_damage"]);
                            },
                            child: Container(
                              height: 86,
                              width: isMobile? (MediaQuery.of(context).size.width-40) : (MediaQuery.of(context).size.width/2)-40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(_imageContainerBorderRadius),
                                // border: Border.all(color: appTheme.inputFieldsBorderColor)
                                border: _reportEventController.buildingSettlementDamage["building_settlement_crack_direction"].contains(_cracksDirectionList[index]["type_of_damage"]) ? Border.all(color: appTheme.primaryActionColor,width: 2) : Border.all(color: appTheme.inputFieldsBorderColor),
                              ),
                              padding:const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Image.asset(_cracksDirectionList[index]["icon_path"],),
                                  const SizedBox(width: 12,),
                                  Expanded(child: Text(_cracksDirectionList[index]["localization_ref"]!,style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr())
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text("${tr("monitor_event.building_settlement.crack_dimension")}: ",style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14.0),
                            child: Row(
                              children: List.generate(5, (index) {
                                return Expanded(
                                  child: Container(
                                    padding:const EdgeInsets.only(right: 8),
                                    height: 7*(index+1.0),
                                    child: Image.asset("assets/images/report_event/event_specific_images/building_settlement/circle_ic.png"),
                                  ),
                                );
                              })
                            ),
                          ),
                          Slider(
                            value: _reportEventController.buildingSettlementCrackDimensionSlider,
                            max: 15.5,
                            divisions: 31,
                            activeColor: appTheme.primaryActionColor,
                            inactiveColor: appTheme.toggleSelectionColor,
                            label: _reportEventController.buildingSettlementDamage["building_settlement_crack_dimension"],
                            onChanged: (value){
                              if(value>0.3){
                                _reportEventController.changeDimensionOfCrackForBuildingSettlement(value: value);
                              }else{
                                _reportEventController.changeDimensionOfCrackForBuildingSettlement(value: 0.3);
                              }
                            },
                          ),
                          Align(alignment: Alignment.center,child: Text("${_reportEventController.buildingSettlementDamage["building_settlement_crack_dimension"]}",style: TextStyle(color: appTheme.primaryTextColor,fontSize: 14,))),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 18.0),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: Padding(
                    //           padding: const EdgeInsets.only(right: 8.0),
                    //           child: Text("${tr("monitor_event.building_settlement.crack_dimension")}: ",style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 75,
                    //         child: Form(
                    //           key: _crackDimensionKey,
                    //           child: TextFormField(
                    //             initialValue:_reportEventController.buildingSettlementDamage["building_settlement_crack_dimension"].toString(),
                    //             keyboardType:const TextInputType.numberWithOptions(signed: true, decimal: false),
                    //             inputFormatters: [
                    //               FilteringTextInputFormatter.digitsOnly
                    //             ],
                    //             maxLength: 4,
                    //             textInputAction: TextInputAction.done,
                    //             style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),
                    //             decoration: InputDecoration(
                    //               filled: true,
                    //               counterText: "",
                    //               fillColor: Colors.white,
                    //               errorMaxLines: 2,
                    //               contentPadding:const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    //               enabledBorder: OutlineInputBorder(
                    //                 borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                    //                 borderRadius: BorderRadius.all(
                    //                   Radius.circular(_inputFieldBorderRadius),
                    //                 ),
                    //               ),
                    //               disabledBorder: OutlineInputBorder(
                    //                 borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                    //                 borderRadius: BorderRadius.all(
                    //                   Radius.circular(_inputFieldBorderRadius),
                    //                 ),
                    //               ),
                    //               focusedBorder: OutlineInputBorder(
                    //                 borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                    //                 borderRadius: BorderRadius.all(
                    //                   Radius.circular(_inputFieldBorderRadius),
                    //                 ),
                    //               ),
                    //               border: OutlineInputBorder(
                    //                 borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                    //                 borderRadius: BorderRadius.all(
                    //                   Radius.circular(_inputFieldBorderRadius),
                    //                 ),
                    //               ),
                    //             ),
                    //             validator: (value){
                    //               if(value!.isEmpty){
                    //                 return tr("monitor_event.building_settlement.empty_crack_dimension_error");
                    //               }else if(int.parse(value)<=0){
                    //                 return tr("monitor_event.building_settlement.invalid_crack_dimension_error");
                    //               }else{
                    //                 return null;
                    //               }
                    //             },
                    //             onChanged: (value)async{
                    //               if(_crackDimensionKey.currentState!.validate()){
                    //                 _reportEventController.changeDimensionOfCrackForBuildingSettlement(value: value);
                    //                 showSubmitButton=true;
                    //               }else{
                    //                 showSubmitButton=false;
                    //               }
                    //               _reportEventController.update();
                    //               // await _showCalendar(selectedDate: DateTime.parse("${_studentProfile.user!.dob}"));
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Visibility(
              // visible: _reportEventController.buildingSettlementDamage["type_of_settlement"]["answer"]!="" && _reportEventController.buildingSettlementDamage["other_structure"]["answer"]!="" && _reportEventController.buildingSettlementDamage["direction_of_cracks"]["answer"].isNotEmpty,
              visible: showSubmitButton,
              child: SubmitButton(),
            ),
          ),
        ],
      ),
    );
  }
}
