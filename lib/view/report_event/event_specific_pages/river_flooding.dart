import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/view/report_event/submit_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RiverFlooding extends StatelessWidget {
  RiverFlooding({Key? key}) : super(key: key);
  final ReportEventController _reportEventController=Get.find();
  final double _inputFieldBorderRadius = 4;
  final List<Map<String,String>> _typeOfRiverFloodingDamage=[
    {
      "localization_ref":"monitor_event.river_flood.building",
      "type_of_damage":"Buildings",
      "icon_path":"assets/images/report_event/event_specific_images/river_flooding/building_ic.png"
    },
    {
      "localization_ref":"monitor_event.river_flood.green_area",
      "type_of_damage":"Green area",
      "icon_path":"assets/images/report_event/event_specific_images/river_flooding/green_area_ic.png"
    },
    {
      "localization_ref":"monitor_event.river_flood.road",
      "type_of_damage":"Road",
      "icon_path":"assets/images/report_event/event_specific_images/river_flooding/road_ic.png"
    },
    {
      "localization_ref":"monitor_event.river_flood.railway",
      "type_of_damage":"Railway",
      "icon_path":"assets/images/report_event/event_specific_images/river_flooding/railways_ic.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    bool isMobile=MediaQuery.of(context).size.shortestSide<600;
    bool showSubmitButton =true;
    return GetBuilder<ReportEventController>(
        builder: (_)=>Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: _reportEventController.nextAndSubmitButtonHeight),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text("${tr("monitor_event.river_flood.water_level")}: ",style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
                          ),
                          Slider(
                            value: _reportEventController.riverFloodingWaterLevelSlider,
                            max: 5,
                            divisions: 5,
                            activeColor: appTheme.primaryActionColor,
                            inactiveColor: appTheme.toggleSelectionColor,
                            onChanged: (value){
                              _reportEventController.changeWaterLevelOfFlood(value: value);
                            },
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(6, (index) {
                                return Expanded(child: Image.asset("assets/images/report_event/event_specific_images/river_flooding/waterlevel_$index.png",height: 60,alignment: Alignment.bottomCenter));
                              })
                          ),
                        ],
                      ),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(right: 8.0),
                      //       child: Text("${tr("monitor_event.river_flood.water_level")}: ",style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
                      //     ),
                      //     Expanded(
                      //       child: Form(
                      //         key: _waterLevelKey,
                      //         child: TextFormField(
                      //           initialValue:_reportEventController.riverFloodingDamage["river_flooding_water_level"].toString(),
                      //           keyboardType:const TextInputType.numberWithOptions(signed: true, decimal: false),
                      //           inputFormatters: [
                      //             FilteringTextInputFormatter.digitsOnly
                      //           ],
                      //           maxLength: 4,
                      //           textInputAction: TextInputAction.done,
                      //           style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),
                      //           decoration: InputDecoration(
                      //             filled: true,
                      //             fillColor: Colors.white,
                      //             counterText: "",
                      //             errorMaxLines: 2,
                      //             contentPadding:const EdgeInsets.fromLTRB(10, 10, 0, 10),
                      //             enabledBorder: OutlineInputBorder(
                      //               borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                      //               borderRadius: BorderRadius.all(
                      //                 Radius.circular(_inputFieldBorderRadius),
                      //               ),
                      //             ),
                      //             disabledBorder: OutlineInputBorder(
                      //               borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                      //               borderRadius: BorderRadius.all(
                      //                 Radius.circular(_inputFieldBorderRadius),
                      //               ),
                      //             ),
                      //             focusedBorder: OutlineInputBorder(
                      //               borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                      //               borderRadius: BorderRadius.all(
                      //                 Radius.circular(_inputFieldBorderRadius),
                      //               ),
                      //             ),
                      //             border: OutlineInputBorder(
                      //               borderSide: BorderSide(color:appTheme.placeHolderTextColor),
                      //               borderRadius: BorderRadius.all(
                      //                 Radius.circular(_inputFieldBorderRadius),
                      //               ),
                      //             ),
                      //           ),
                      //           validator: (value){
                      //             if(value!.isEmpty){
                      //               return tr("monitor_event.river_flood.empty_water_level_error");
                      //             }else if(int.parse(value)<=0){
                      //               return tr("monitor_event.river_flood.invalid_water_level_error");
                      //             }else{
                      //               return null;
                      //             }
                      //           },
                      //           onChanged: (value)async{
                      //             if(_waterLevelKey.currentState!.validate()){
                      //               _reportEventController.changeWaterLevelOfFlood(value: value);
                      //               showSubmitButton=true;
                      //             }else{
                      //               showSubmitButton=false;
                      //             }
                      //             _reportEventController.update();
                      //             // await _showCalendar(selectedDate: DateTime.parse("${_studentProfile.user!.dob}"));
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top:18.0,bottom: 12),
                        child: Text("common_key.select_observe_damage",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
                      ),

                      Align(
                        alignment: Alignment.center,
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: List.generate(_typeOfRiverFloodingDamage.length, (index) {
                            return GestureDetector(
                              onTap: (){
                                _reportEventController.selectObservedDamageForFlood(value: _typeOfRiverFloodingDamage[index]["type_of_damage"]!);
                              },
                              child: Container(
                                height: 86,
                                width: isMobile? (MediaQuery.of(context).size.width-40) : (MediaQuery.of(context).size.width/2)-40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  // border: Border.all(color: appTheme.inputFieldsBorderColor)
                                  border: _reportEventController.riverFloodingDamage["river_flooding_observed_damage"].contains(_typeOfRiverFloodingDamage[index]["type_of_damage"]) ? Border.all(color: appTheme.primaryActionColor,width: 2) : Border.all(color: appTheme.inputFieldsBorderColor),
                                ),
                                padding:const EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    Image.asset(_typeOfRiverFloodingDamage[index]["icon_path"]!),
                                    const SizedBox(width: 12,),
                                    Expanded(child: Text(_typeOfRiverFloodingDamage[index]["localization_ref"]!,style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr())
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
                              initialValue: _reportEventController.riverFloodingDamage["river_flooding_other_observed_damage"],
                              textInputAction: TextInputAction.next,
                              minLines: 4,
                              maxLength: 1500,
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
                                _reportEventController.updateFloodComment(comment: value);
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
                // visible: _reportEventController.floodDamage["observed_damage"]["answer"].isNotEmpty || _reportEventController.floodDamage["observed_damage"]["other"]!="",
                visible: showSubmitButton,
                child: SubmitButton(),
              ),
            ),
          ],
        ),
    );
  }
}
