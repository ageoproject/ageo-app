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
    bool isMobile=MediaQuery.of(context).size.shortestSide<600;
    return GetBuilder<ReportEventController>(
      builder:(controller)=> Scaffold(
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            child: Wrap(
                spacing: 12,
                runSpacing: 12,
              children: List<Widget>.generate(_reportEventController.eventDetailList.length, (index) {
                String eventName=tr("${_reportEventController.eventDetailList[index]["event_name"]}");
                return GestureDetector(
                  onTap: (){
                    _reportEventController.changeSelectedEventType(value: _reportEventController.eventDetailList[index]["event_type"]);
                  },
                  child: Container(
                    width:isMobile? (MediaQuery.of(context).size.width/2)-34: (MediaQuery.of(context).size.width/4)-34,
                    padding:const EdgeInsets.symmetric(horizontal: 26,vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        // border: Border.all(color: appTheme.primaryActionColor)
                        border: _reportEventController.eventDetailList[index]["event_type"]==_reportEventController.selectedEventType? Border.all(color:  appTheme.primaryActionColor,width: 2):Border.all(color: appTheme.inputFieldsBorderColor)
                    ),
                    child: Column(
                      children: [
                        Image.asset("${_reportEventController.filePath}${_reportEventController.eventDetailList[index]["icon_name"]}.png",),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(eventName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: appTheme.primaryTextColor),textAlign: TextAlign.center,),
                        ),
                      ],
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
