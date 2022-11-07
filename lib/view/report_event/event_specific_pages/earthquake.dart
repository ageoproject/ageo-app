import 'dart:io';

import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Earthquake extends StatelessWidget {
  Earthquake({Key? key}) : super(key: key);
  final ReportEventController _reportEventController=Get.find();
  final List<Map<String,String>> _typeOfEarthquakeDamage=[
    {
      "localization_ref":"monitor_event.earthquake.falling_object",
      "type_of_damage":"Falling Object",
      "icon_path":"assets/images/report_event/event_specific_images/earthquake/falling_object_ic.png"
    },
    {
      "localization_ref":"monitor_event.earthquake.minor_damage",
      "type_of_damage":"Minor Damage",
      "icon_path":"assets/images/report_event/event_specific_images/earthquake/minor_damage_ic.png"
    },
    {
      "localization_ref":"monitor_event.earthquake.moderate_damage",
      "type_of_damage":"Moderate Damage",
      "icon_path":"assets/images/report_event/event_specific_images/earthquake/moderate_damage_ic.png"
    },
    {
      "localization_ref":"monitor_event.earthquake.total_damage",
      "type_of_damage":"Partial/Total collapse",
      "icon_path":"assets/images/report_event/event_specific_images/earthquake/falling_object_ic.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return GetBuilder<ReportEventController>(
      builder:(_)=> Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: List.generate(_reportEventController.earthquakeDamage.length, (buildingIndex) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: appTheme.inputFieldsBorderColor)
                        ),
                        padding:const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Text("${tr("monitor_event.earthquake.number_of_floors")}: ",style: TextStyle(fontSize: 12,color: appTheme.iconColor),),
                                    ),
                                    Container(
                                      width:80,
                                      decoration:BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(color: appTheme.inputFieldsBorderColor),
                                          borderRadius: BorderRadius.circular(4)
                                      ),
                                      padding:const EdgeInsets.only(left: 4),
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButton<String>(
                                          value: _reportEventController.earthquakeDamage[buildingIndex]["number_of_floors"],
                                          underline:const SizedBox(),
                                          isExpanded: true,
                                          items: _reportEventController.numberOfBuilding.map((String value) {
                                            return DropdownMenuItem<String>(
                                              key: Key(value),
                                              value: value,
                                              //child: new Text(value),
                                              child: Padding(
                                                padding: const EdgeInsets.all(0.0),
                                                child: Text(value,style: TextStyle(color: appTheme.primaryTextColor,fontSize: 14,)),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            if(value!=null) {
                                              _reportEventController.changeNumberOfBuilding(index: buildingIndex, numberOfBuilding: value);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible:buildingIndex!=0,
                                  child: IconButton(
                                    icon: Icon(Icons.delete_outline,color: appTheme.iconColor,),
                                    onPressed: (){
                                      _reportEventController.deleteBuilding(index: buildingIndex);
                                    },
                                  ),
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top:18.0,bottom: 12),
                                child: Text("monitor_event.earthquake.select_observe_damage",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
                              ),
                            ),
                            Wrap(
                              children: List<Widget>.generate(_typeOfEarthquakeDamage.length, (index) {
                                return Padding(
                                  padding:  EdgeInsets.only(bottom: 12.0,right: index%2==0?12:0),
                                  child: GestureDetector(
                                    onTap: (){
                                      _reportEventController.selectObservedDamage(index: buildingIndex, answer: _typeOfEarthquakeDamage[index]["type_of_damage"]!);
                                    },
                                    child: Container(
                                      height: 77,
                                      width: 162,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        // border: Border.all(color: appTheme.inputFieldsBorderColor)
                                        border: _reportEventController.earthquakeDamage[buildingIndex]["observed_damage"]["answer"]== _typeOfEarthquakeDamage[index]["type_of_damage"] ? Border.all(color: appTheme.primaryActionColor,width: 2) : Border.all(color: appTheme.inputFieldsBorderColor),
                                      ),
                                      padding:const EdgeInsets.all(12),
                                      child: Row(
                                        children: [
                                          Image.asset(_typeOfEarthquakeDamage[index]["icon_path"]!,),
                                          const SizedBox(width: 12,),
                                          Expanded(child: Text(_typeOfEarthquakeDamage[index]["localization_ref"]!,style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr())
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:18.0),
                child: GestureDetector(
                  onTap: (){
                    _reportEventController.addNewBuilding();
                  },
                  child: Container(
                    height: 60,
                    width: 132,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: appTheme.inputFieldsBorderColor),
                    ),
                    padding:const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Image.asset("assets/images/report_event/event_specific_images/landslide/add_ic.png",height: 19,),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text("monitor_event.earthquake.add_building",style: TextStyle(fontSize: 14,color: appTheme.placeHolderTextColor),).tr(),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Visibility(
          visible: _reportEventController.earthquakeDamage[0]["observed_damage"]["answer"]!=null,
          child: SizedBox(
            height: Platform.isIOS? 66:40,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: appTheme.primaryActionColor,
              ),
              onPressed: (){
                // _reportEventController.changeActiveTab(value: "damage");
              },
              child: const Text("common_key.next_btn",style: TextStyle(color: Colors.white,fontSize: 16),).tr(),
            ),
          ),
        ),
      ),
    );
  }
}
