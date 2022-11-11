import 'dart:io';
import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/common_component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({Key? key}) : super(key: key);
  final ReportEventController _reportEventController=Get.find();
  final CommonComponent _commonComponent=CommonComponent();

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return SizedBox(
      height: Platform.isIOS? 66:40,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: appTheme.primaryActionColor,
        ),
        onPressed: ()async{
          try{
            _commonComponent.initializeLoader(context: context,message: "Submitting response");
            String eventId = await _reportEventController.reportEvent();
            Get.back();
            _commonComponent.showEventShareDialog(context: context, message: eventId);
          }catch(e){
            // print(e);
            Get.back();
          }
        },
        child: const Text("common_key.submit_btn",style: TextStyle(color: Colors.white,fontSize: 16),).tr(),
      ),
    );
  }
}
