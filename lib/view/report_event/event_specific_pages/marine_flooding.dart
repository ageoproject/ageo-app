import 'dart:io';

import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/view/report_event/event_specific_pages/visit_frequency_slider.dart';
import 'package:ageo/view/report_event/submit_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MarineFlooding extends StatelessWidget {
  MarineFlooding({Key? key}) : super(key: key);
  final ReportEventController _reportEventController=Get.find();
  final double _inputFieldBorderRadius = 4;
  final GlobalKey<FormState> _waterLevelKey = GlobalKey<FormState>();
  final List<Map<String,String>> _typeOfMarineFloodingDamage=[
    {
      "localization_ref":"monitor_event.marine_flood.wave_overtopping",
      "type_of_damage":"Wave overtopping",
      "icon_path":"assets/images/report_event/event_specific_images/marine_flooding/wave_overtopping_ic.png"
    },
    {
      "localization_ref":"monitor_event.marine_flood.wave_overflow",
      "type_of_damage":"Wave overflow",
      "icon_path":"assets/images/report_event/event_specific_images/marine_flooding/wave_overflow_ic.png"
    },
    {
      "localization_ref":"monitor_event.marine_flood.breach",
      "type_of_damage":"Breach",
      "icon_path":"assets/images/report_event/event_specific_images/marine_flooding/breach_ic.png"
    },
    {
      "localization_ref":"monitor_event.marine_flood.cobbles_and_thrown",
      "type_of_damage":"Cobbles / sand thrown by waves",
      "icon_path":"assets/images/report_event/event_specific_images/marine_flooding/cobbles_sand_ic.png"
    },
  ];
  final List<Map<String,String>> _typeOfEnvironment=[
    {
      "localization_ref":"monitor_event.marine_flood.natural_area",
      "type_of_damage":"Natural area",
    },
    {
      "localization_ref":"monitor_event.marine_flood.natural_area_with_coastal_defence",
      "type_of_damage":"Natural area with coastal defence",
    },
    {
      "localization_ref":"monitor_event.marine_flood.low_lying",
      "type_of_damage":"Low - lying area onshore",
    },
    {
      "localization_ref":"monitor_event.marine_flood.coastal_path",
      "type_of_damage":"Coastal path",
    },
    {
      "localization_ref":"monitor_event.marine_flood.roads_and_parking",
      "type_of_damage":"Roads and parking",
    },
    {
      "localization_ref":"monitor_event.marine_flood.harbour",
      "type_of_damage":"Harbour",
    },
    {
      "localization_ref":"monitor_event.marine_flood.residential_area",
      "type_of_damage":"Residential area",
    },
    {
      "localization_ref":"monitor_event.marine_flood.urbanized_artificialized_area",
      "type_of_damage":"Other urbanized / artificialized area",
    },

  ];

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    bool isMobile=MediaQuery.of(context).size.shortestSide<600;
    bool showSubmitButton =true;
    return GetBuilder<ReportEventController>(
      builder:(_)=> Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: _reportEventController.nextAndSubmitButtonHeight),
            child: SingleChildScrollView(
              keyboardDismissBehavior: Platform.isAndroid? ScrollViewKeyboardDismissBehavior.manual :ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding:const EdgeInsets.symmetric(horizontal: 18,vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text("monitor_event.marine_flood.type_of_submersion",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: List.generate(_typeOfMarineFloodingDamage.length, (index) {
                          return GestureDetector(
                            onTap: (){
                              _reportEventController.changeMarineFloodingSubmersionType(value: _typeOfMarineFloodingDamage[index]["type_of_damage"]!);
                            },
                            child: Container(
                              height: 86,
                              width: isMobile? (MediaQuery.of(context).size.width-40) : (MediaQuery.of(context).size.width/2)-40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                // border: Border.all(color: appTheme.inputFieldsBorderColor)
                                border: _reportEventController.marineFloodingDamage["marine_flooding_submersion_type"]==(_typeOfMarineFloodingDamage[index]["type_of_damage"]) ? Border.all(color: appTheme.primaryActionColor,width: 2) : Border.all(color: appTheme.inputFieldsBorderColor),
                              ),
                              padding:const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Image.asset(_typeOfMarineFloodingDamage[index]["icon_path"]!),
                                  const SizedBox(width: 12,),
                                  Expanded(child: Text(_typeOfMarineFloodingDamage[index]["localization_ref"]!,style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr())
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
                            child: Text("${tr("monitor_event.marine_flood.water_level")}: ",style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
                          ),
                          Slider(
                            value: _reportEventController.waterLevelSlider,
                            max: 3,
                            divisions: 3,
                            activeColor: appTheme.primaryActionColor,
                            inactiveColor: appTheme.toggleSelectionColor,
                            onChanged: (value){
                              _reportEventController.changeMarineFloodingWaterLevel(value: value.toInt());
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(4, (index) {
                              return Expanded(child: Image.asset("assets/images/report_event/event_specific_images/marine_flooding/waterlevel_${index+1}.png",height: 60,alignment: Alignment.bottomCenter));
                            })
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 18.0),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.only(right: 8.0),
                    //         child: Text("${tr("monitor_event.marine_flood.water_level")}: ",style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
                    //       ),
                    //       Expanded(
                    //         child: Form(
                    //           key: _waterLevelKey,
                    //           child: TextFormField(
                    //             initialValue:_reportEventController.marineFloodingDamage["marine_flooding_water_level"].toString(),
                    //             keyboardType:const TextInputType.numberWithOptions(signed: true, decimal: false),
                    //             inputFormatters: [
                    //               FilteringTextInputFormatter.digitsOnly
                    //             ],
                    //             maxLength: 4,
                    //             textInputAction: TextInputAction.done,
                    //             style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),
                    //             decoration: InputDecoration(
                    //               filled: true,
                    //               fillColor: Colors.white,
                    //               counterText: "",
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
                    //                 return tr("monitor_event.marine_flood.empty_water_level_error");
                    //               }else if(int.parse(value)<=0){
                    //                 return tr("monitor_event.marine_flood.invalid_water_level_error");
                    //               }else{
                    //                 return null;
                    //               }
                    //             },
                    //             onChanged: (value)async{
                    //               if(_waterLevelKey.currentState!.validate()){
                    //                 _reportEventController.changeMarineFloodingWaterLevel(value: value);
                    //                 showSubmitButton=true;
                    //               }else{
                    //                 showSubmitButton=false;
                    //               }
                    //               _reportEventController.update();
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    Padding(
                      padding: const EdgeInsets.only(top:18.0,bottom: 12),
                      child: Text("monitor_event.marine_flood.type_of_environment",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
                    ),
                    Column(
                      children: List.generate(_typeOfEnvironment.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: GestureDetector(
                            onTap: (){
                              _reportEventController.changeMarineFloodingEnvironmentType(value: _typeOfEnvironment[index]["type_of_damage"]!);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: _reportEventController.marineFloodingDamage["marine_flooding_environment_type"].contains(_typeOfEnvironment[index]["type_of_damage"])?appTheme.toggleSelectionColor:Colors.white,
                                borderRadius: BorderRadius.circular(_inputFieldBorderRadius),
                                border: Border.all(color: appTheme.inputFieldsBorderColor),
                              ),
                              padding:const EdgeInsets.symmetric(vertical: 12,horizontal: 14),
                              child: Row(
                                children: [
                                  Container(
                                    height:18,
                                    padding: const EdgeInsets.only(right: 25),
                                    child: Checkbox(
                                      value: _reportEventController.marineFloodingDamage["marine_flooding_environment_type"].contains(_typeOfEnvironment[index]["type_of_damage"]),
                                      checkColor: appTheme.primaryActionColor,
                                      side: BorderSide(color: appTheme.inputFieldsBorderColor),
                                      fillColor: MaterialStateProperty.all(Colors.white),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                                      onChanged: (value){
                                        _reportEventController.changeMarineFloodingEnvironmentType(value: _typeOfEnvironment[index]["type_of_damage"]!);
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: Text("${_typeOfEnvironment[index]["localization_ref"]}",style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr(),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),

                    VisitFrequencySlider(eventType: _reportEventController.selectedEventType.toString(),),
                    // Column(
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.only(right: 8.0),
                    //       child: Text("${tr("monitor_event.frequency_of_visits.text")}:",style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
                    //     ),
                    //
                    //     Container(
                    //       width:110,
                    //       decoration:BoxDecoration(
                    //           color: Colors.white,
                    //           border: Border.all(color: appTheme.inputFieldsBorderColor),
                    //           borderRadius: BorderRadius.circular(4)
                    //       ),
                    //       padding:const EdgeInsets.only(left: 4),
                    //       child: ButtonTheme(
                    //         alignedDropdown: true,
                    //         child: DropdownButton<String>(
                    //           value: _reportEventController.marineFloodingDamage["marine_flooding_visit_frequency"],
                    //           underline:const SizedBox(),
                    //           isExpanded: true,
                    //           items: ["Daily","1st time","Yearly","Monthly","Weekly"].map((String value) {
                    //             return DropdownMenuItem<String>(
                    //               key: Key(value),
                    //               value: value,
                    //               //child: new Text(value),
                    //               child: Padding(
                    //                 padding: const EdgeInsets.all(0.0),
                    //                 child: Text("monitor_event.frequency_of_visits.$value",style: TextStyle(color: appTheme.primaryTextColor,fontSize: 14,)).tr(),
                    //               ),
                    //             );
                    //           }).toList(),
                    //           onChanged: (value) {
                    //             if(value!=null) {
                    //               _reportEventController.changeMarineFloodingVisitFrequency(value: value);
                    //               // _reportEventController.changeNumberOfBuilding(index: buildingIndex, numberOfBuilding: value);
                    //             }
                    //           },
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("common_key.other",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color:appTheme.primaryTextColor),).tr(),
                          ),
                          TextFormField(
                            initialValue: _reportEventController.marineFloodingDamage["marine_flooding_free_comments"],
                            textInputAction: TextInputAction.newline,
                            minLines: 4,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            maxLength: 1500,
                            style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),
                            decoration: InputDecoration(
                              hintText: tr("common_key.new_add_comment"),
                              hintStyle: TextStyle(fontSize: 14,color: appTheme.placeHolderTextColor),
                              filled: true,
                              fillColor: Colors.white,
                              errorMaxLines: 2,
                              contentPadding:const EdgeInsets.fromLTRB(10, 10, 0, 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:appTheme.inputFieldsBorderColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(_inputFieldBorderRadius),
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:appTheme.inputFieldsBorderColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(_inputFieldBorderRadius),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:appTheme.inputFieldsBorderColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(_inputFieldBorderRadius),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color:appTheme.inputFieldsBorderColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(_inputFieldBorderRadius),
                                ),
                              ),
                            ),
                            onChanged: (value){
                              _reportEventController.changeMarineFloodingComment(value: value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Visibility(
              visible: showSubmitButton,
              child: SubmitButton(),
            ),
          ),
        ],
      ),
    );
  }
}
