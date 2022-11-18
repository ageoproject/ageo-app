import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/view/report_event/submit_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Sinkhole extends StatelessWidget {
  Sinkhole({Key? key}) : super(key: key);
  final ReportEventController _reportEventController=Get.find();
  final double _inputFieldBorderRadius = 4;
  final List<Map<String,String>> _typeOfSinkholeDamage=[
    {
      "localization_ref":"monitor_event.sinkhole.green_area",
      "type_of_damage":"Green area",
      "icon_path":"assets/images/report_event/event_specific_images/sinkhole/green_area_ic.png"
    },
    {
      "localization_ref":"monitor_event.sinkhole.road",
      "type_of_damage":"Road",
      "icon_path":"assets/images/report_event/event_specific_images/sinkhole/road_ic.png"
    },
    {
      "localization_ref":"monitor_event.sinkhole.urban",
      "type_of_damage":"Urban",
      "icon_path":"assets/images/report_event/event_specific_images/sinkhole/urban_ic.png"
    }
  ];
  final List<Map<String,String>> _typeOfInfrastructure=[
    {
      "localization_ref":"monitor_event.sinkhole.water",
      "type_of_damage":"Water",
      "icon_path":"assets/images/report_event/event_specific_images/sinkhole/water_ic.png"
    },
    {
      "localization_ref":"monitor_event.sinkhole.sanitation",
      "type_of_damage":"Sanitation",
      "icon_path":"assets/images/report_event/event_specific_images/sinkhole/sanitation_ic.png"
    },
    {
      "localization_ref":"monitor_event.sinkhole.electricity",
      "type_of_damage":"Electricity",
      "icon_path":"assets/images/report_event/event_specific_images/sinkhole/electricity_ic.png"
    },
    {
      "localization_ref":"monitor_event.sinkhole.gas",
      "type_of_damage":"Gas",
      "icon_path":"assets/images/report_event/event_specific_images/sinkhole/gas_ic.png"
    },
    {
      "localization_ref":"monitor_event.sinkhole.comm_line",
      "type_of_damage":"Communication lines",
      "icon_path":"assets/images/report_event/event_specific_images/sinkhole/communication_ic.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    bool isMobile=MediaQuery.of(context).size.shortestSide<600;
    return GetBuilder<ReportEventController>(
      builder: (_)=>Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: _reportEventController.screenBottomPadding),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text("${tr("monitor_event.sinkhole.sinkhole_dimension")}: ",style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
                        ),
                        Expanded(
                          child: TextFormField(
                            initialValue:_reportEventController.sinkholeDamage["sinkhole_dimension"].toString(),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            maxLength: 4,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              counterText: "",
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
                              if(value!=""){
                                _reportEventController.changeDimensionOfSinkhole(value: value);
                              }else{
                                _reportEventController.changeDimensionOfSinkhole(value: "0");
                              }
                              // await _showCalendar(selectedDate: DateTime.parse("${_studentProfile.user!.dob}"));
                            },
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
                        children: List.generate(_typeOfSinkholeDamage.length, (index) {
                          return GestureDetector(
                            onTap: (){
                              _reportEventController.selectObservedDamageForSinkhole(value: _typeOfSinkholeDamage[index]["type_of_damage"]!);
                            },
                            child: Container(
                              height: 86,
                              width: isMobile? (MediaQuery.of(context).size.width-40) : (MediaQuery.of(context).size.width/2)-40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                // border: Border.all(color: appTheme.inputFieldsBorderColor)
                                border: _reportEventController.sinkholeDamage["sinkhole_observed_damage"]==_typeOfSinkholeDamage[index]["type_of_damage"] ? Border.all(color: appTheme.primaryActionColor,width: 2) : Border.all(color: appTheme.inputFieldsBorderColor),
                              ),
                              padding:const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Image.asset(_typeOfSinkholeDamage[index]["icon_path"]!,),
                                  const SizedBox(width: 12,),
                                  Expanded(child: Text(_typeOfSinkholeDamage[index]["localization_ref"]!,style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr())
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
                            initialValue: _reportEventController.sinkholeDamage["sinkhole_other_observed_damage"],
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
                              _reportEventController.addOtherObserveDamageForSinkhole(comment: value);
                            },
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:18.0,bottom: 12),
                      child: Text("monitor_event.sinkhole.affected_infrastructure",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: List.generate(_typeOfInfrastructure.length, (index) {
                          return GestureDetector(
                            onTap: (){
                              _reportEventController.selectInfrastructureDamageForSinkhole(value: _typeOfInfrastructure[index]["type_of_damage"]!);
                            },
                            child: Container(
                              height: 86,
                              width: isMobile? (MediaQuery.of(context).size.width-40) : (MediaQuery.of(context).size.width/2)-40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                // border: Border.all(color: appTheme.inputFieldsBorderColor)
                                border: _reportEventController.sinkholeDamage["sinkhole_affected_infrastructure"].contains(_typeOfInfrastructure[index]["type_of_damage"]) ? Border.all(color: appTheme.primaryActionColor,width: 2) : Border.all(color: appTheme.inputFieldsBorderColor),
                              ),
                              padding:const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Image.asset(_typeOfInfrastructure[index]["icon_path"]!,),
                                  const SizedBox(width: 12,),
                                  Expanded(child: Text(_typeOfInfrastructure[index]["localization_ref"]!,style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr())
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
                            child: Text("monitor_event.sinkhole.other",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color:appTheme.primaryTextColor),).tr(),
                          ),
                          TextFormField(
                            initialValue: _reportEventController.sinkholeDamage["sinkhole_other_affected_infrastructure"],
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
                              _reportEventController.addOtherInfrastructureDamageForSinkhole(comment: value);
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
              // visible: (_reportEventController.sinkholeDamage["sinkhole_observed_damage"]!="" || _reportEventController.sinkholeDamage["sinkhole_other_observed_damage"]!="") &&
              //     (_reportEventController.sinkholeDamage["sinkhole_affected_infrastructure"].isNotEmpty || _reportEventController.sinkholeDamage["sinkhole_other_affected_infrastructure"]!=""),
              child: SubmitButton(),
            ),
          ),
        ],
      ),
    );
  }
}
