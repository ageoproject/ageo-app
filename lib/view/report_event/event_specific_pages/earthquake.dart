import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/view/report_event/submit_button.dart';
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
      "color_code":"0xff60D160",
      "icon_path":"assets/images/report_event/event_specific_images/earthquake/falling_object_ic.png"
    },
    {
      "localization_ref":"monitor_event.earthquake.minor_damage",
      "type_of_damage":"Minor Damage",
      "color_code":"0xffFEE26C",
      "icon_path":"assets/images/report_event/event_specific_images/earthquake/minor_damage_ic.png"
    },
    {
      "localization_ref":"monitor_event.earthquake.moderate_damage",
      "type_of_damage":"Moderate Damage",
      "color_code":"0xffF87A4B",
      "icon_path":"assets/images/report_event/event_specific_images/earthquake/moderate_damage_ic.png"
    },
    {
      "localization_ref":"monitor_event.earthquake.total_damage",
      "type_of_damage":"Partial/Total collapse",
      "color_code":"0xffF64242",
      "icon_path":"assets/images/report_event/event_specific_images/earthquake/total_damage_ic.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    bool isMobile=MediaQuery.of(context).size.shortestSide<600;
    return GetBuilder<ReportEventController>(
      builder:(_)=> Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: _reportEventController.nextAndSubmitButtonHeight),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 8),
                    child: Column(
                      children: List.generate(_reportEventController.earthquakeDamage["earthquake_observed_damage"].length, (buildingIndex) {
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
                                          child: Text("${tr("monitor_event.earthquake.number_of_floors")}: ",style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
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
                                              value: _reportEventController.earthquakeDamage["earthquake_observed_damage"][buildingIndex]["number_of_floors_in_building"],
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
                                    child: Text("common_key.select_observe_damage",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Wrap(
                                    spacing: 12,
                                    runSpacing: 12,
                                    children: List<Widget>.generate(_typeOfEarthquakeDamage.length, (index) {
                                      return GestureDetector(
                                        onTap: (){
                                          _reportEventController.selectObservedDamageForEarthquake(index: buildingIndex, answer: _typeOfEarthquakeDamage[index]["type_of_damage"]!);
                                        },
                                        child: Container(
                                          height: 86,
                                          width: isMobile? (MediaQuery.of(context).size.width-40) : (MediaQuery.of(context).size.width/2)-40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            // border: Border.all(color: appTheme.inputFieldsBorderColor)
                                            border: _reportEventController.earthquakeDamage["earthquake_observed_damage"][buildingIndex]["observed_building_damage"]== _typeOfEarthquakeDamage[index]["type_of_damage"] ? Border.all(color: appTheme.primaryActionColor,width: 2) : Border.all(color: appTheme.inputFieldsBorderColor),
                                          ),
                                          // padding:const EdgeInsets.all(12),
                                          child: Row(
                                            children: [
                                              Container(
                                                width:20,
                                                decoration: BoxDecoration(
                                                  color: Color(int.parse(_typeOfEarthquakeDamage[index]["color_code"]!)),
                                                  borderRadius:const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(12.0,),
                                                child: Image.asset(_typeOfEarthquakeDamage[index]["icon_path"]!,),
                                              ),
                                              Expanded(child: Text(_typeOfEarthquakeDamage[index]["localization_ref"]!,style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr())
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: GestureDetector(
                      onTap: (){
                        _reportEventController.addNewBuilding();
                      },
                      child: Container(
                        height: 60,
                        width: 145,
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Visibility(
              // visible: _reportEventController.earthquakeDamage[0]["observed_damage"]["answer"]!=null,
              child: SubmitButton(),
            ),
          ),
        ],
      ),
    );
  }
}
