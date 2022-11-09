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
  final List<Map<String,String>> _typeOfFloodDamage=[
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
    return GetBuilder<ReportEventController>(
      builder:(_)=> Scaffold(
        body:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text("${tr("monitor_event.landslide.displaced_land")}: ",style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
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
                          value: _reportEventController.landslideDamage["volume_of_displacement"],
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

                Wrap(
                  children: List.generate(_typeOfFloodDamage.length, (index) {
                    return Padding(
                      padding:  EdgeInsets.only(bottom: 12.0,right: index%2==0?12:0),
                      child: GestureDetector(
                        onTap: (){
                          _reportEventController.selectObservedDamageForLandslide(value: _typeOfFloodDamage[index]["type_of_damage"]!);
                        },
                        child: Container(
                          height: 77,
                          width: 162,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            // border: Border.all(color: appTheme.inputFieldsBorderColor)
                            border: _reportEventController.landslideDamage["observed_damage"]["answer"].contains(_typeOfFloodDamage[index]["type_of_damage"]) ? Border.all(color: appTheme.primaryActionColor,width: 2) : Border.all(color: appTheme.inputFieldsBorderColor),
                          ),
                          padding:const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Image.asset(_typeOfFloodDamage[index]["icon_path"]!,),
                              const SizedBox(width: 12,),
                              Expanded(child: Text(_typeOfFloodDamage[index]["localization_ref"]!,style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr())
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
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
                        // initialValue:_studentProfile.user?.dob==null?"": _component.formatDateMonthYearInWords.format(DateTime.parse("${_studentProfile.user!.dob}")),
                        textInputAction: TextInputAction.next,
                        minLines: 4,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
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
        bottomNavigationBar: Visibility(
          // visible: _reportEventController.landslideDamage["observed_damage"]["answer"].isNotEmpty || _reportEventController.landslideDamage["observed_damage"]["other"]!="",
          child: SubmitButton(),
        ),
      ),
    );
  }
}
