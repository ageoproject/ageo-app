import 'dart:io';
import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/view/report_event/submit_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventTypeList extends StatelessWidget {
  EventTypeList({Key? key}) : super(key: key);

  final ReportEventController _reportEventController=Get.find();

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return GetBuilder<ReportEventController>(
      builder:(controller)=> Scaffold(
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              children: List<Widget>.generate(_reportEventController.eventDetailList.length, (index) {
                return Padding(
                  padding: index % 2 ==0 ? const EdgeInsets.only(right: 12.0,bottom: 12.0):const EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: (){
                      _reportEventController.changeSelectedEventType(value: _reportEventController.eventDetailList[index]["event_type"]);
                    },
                    child: Container(
                      padding:const EdgeInsets.symmetric(horizontal: 26,vertical: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          // border: Border.all(color: appTheme.primaryActionColor)
                          border: Border.all(color: _reportEventController.eventDetailList[index]["event_type"]==_reportEventController.selectedEventType? appTheme.primaryActionColor : appTheme.inputFieldsBorderColor)
                      ),
                      child: Column(
                        children: [
                          Image.asset("${_reportEventController.filePath}${_reportEventController.eventDetailList[index]["icon_name"]}.png",width: 100,),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text("${_reportEventController.eventDetailList[index]["event_name"]}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: appTheme.primaryTextColor),textAlign: TextAlign.center,).tr(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
            ),
          ),
        ),
        bottomNavigationBar: _reportEventController.quickReportingIsActive.value ?Visibility(
          visible: _reportEventController.selectedEventType!=null,
          child: SubmitButton(),
        ): Visibility(
          visible: _reportEventController.selectedEventType!=null,
          child: SizedBox(
            height: Platform.isIOS? 66:40,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: appTheme.primaryActionColor,
              ),
              onPressed: (){
                _reportEventController.changeActiveTab(value: "map");
              },
              child: const Text("common_key.next_btn",style: TextStyle(color: Colors.white,fontSize: 16),).tr(),
            ),
          ),
        ),
      ),
    );
  }
}
