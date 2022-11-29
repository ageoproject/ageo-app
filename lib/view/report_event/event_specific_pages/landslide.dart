import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/view/report_event/submit_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Landslide extends StatelessWidget {
  Landslide({Key? key}) : super(key: key);
  final ReportEventController _reportEventController=Get.find();
  final double _inputFieldBorderRadius = 4;
  final List<Map<String,String>> _typeOfLandslideDamage=[
    {
      "localization_ref":"monitor_event.landslide.building",
      "type_of_damage":"Building",
      "icon_path":"assets/images/report_event/event_specific_images/landslide/building_ic.png"
    },
    {
      "localization_ref":"monitor_event.landslide.green_area",
      "type_of_damage":"Green area",
      "icon_path":"assets/images/report_event/event_specific_images/landslide/green_tree_ic.png"
    },
    {
      "localization_ref":"monitor_event.landslide.road",
      "type_of_damage":"Road",
      "icon_path":"assets/images/report_event/event_specific_images/landslide/road_ic.png"
    },
    {
      "localization_ref":"monitor_event.landslide.railway",
      "type_of_damage":"Railway",
      "icon_path":"assets/images/report_event/event_specific_images/landslide/railways_ic.png"
    },
    {
      "localization_ref":"monitor_event.landslide.water_lines",
      "type_of_damage":"Water Lines",
      "icon_path":"assets/images/report_event/event_specific_images/landslide/water_lines_ic.png"
    },
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text("${tr("monitor_event.landslide.displaced_land")}:",style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
                          ),
                        ),
                        Container(
                          width:90,
                          decoration:BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: appTheme.inputFieldsBorderColor),
                              borderRadius: BorderRadius.circular(4)
                          ),
                          padding:const EdgeInsets.only(left: 4),
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton<String>(
                              value: _reportEventController.landslideDamage["landslide_displaced_land_volume"],
                              underline:const SizedBox(),
                              isExpanded: true,
                              items: ["10%","20%","30%","40%","50%","60%","70%","80%","90%","100%"].map((String value) {
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
                                  _reportEventController.changeVolumeOfDisplacedLand(value: value);
                                  // _reportEventController.changeNumberOfBuilding(index: buildingIndex, numberOfBuilding: value);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:18.0,bottom: 12),
                      child: Text("common_key.select_observe_damage",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: List.generate(_typeOfLandslideDamage.length, (index) {
                          return GestureDetector(
                            onTap: (){
                              _reportEventController.selectObservedDamageForLandslide(value: _typeOfLandslideDamage[index]["type_of_damage"]!);
                            },
                            child: Container(
                              height: 86,
                              width: isMobile? (MediaQuery.of(context).size.width-40) : (MediaQuery.of(context).size.width/2)-40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                // border: Border.all(color: appTheme.inputFieldsBorderColor)
                                border: _reportEventController.landslideDamage["landslide_observed_damage"].contains(_typeOfLandslideDamage[index]["type_of_damage"]) ? Border.all(color: appTheme.primaryActionColor,width: 2) : Border.all(color: appTheme.inputFieldsBorderColor),
                              ),
                              padding:const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Image.asset(_typeOfLandslideDamage[index]["icon_path"]!),
                                  const SizedBox(width: 12,),
                                  Expanded(child: Text(_typeOfLandslideDamage[index]["localization_ref"]!,style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr())
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

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
                            initialValue: _reportEventController.landslideDamage["landslide_other_observed_damage"],
                            textInputAction: TextInputAction.next,
                            minLines: 4,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            maxLength: 1500,
                            style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),
                            decoration: InputDecoration(
                              hintText: tr("common_question_page.comment_hint"),
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
                              _reportEventController.updateLandslideComment(comment: value);
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
              // visible: _reportEventController.landslideDamage["landslide_observed_damage"].isNotEmpty || _reportEventController.landslideDamage["landslide_other_observed_damage"]!="",
              child: SubmitButton(),
            ),
          ),
        ],
      ),
    );
  }
}
