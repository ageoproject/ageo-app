import 'dart:io';
import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/common_component.dart';
import 'package:ageo/helpers/toast_message.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({Key? key}) : super(key: key);
  final ReportEventController _reportEventController=Get.find();
  final CommonComponent _commonComponent=CommonComponent();
  final CustomToastMessage _customToastMessage=CustomToastMessage();

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return Container(
      color:appTheme.primaryActionColor,
      // padding: EdgeInsets.only(bottom: 14),
      height: _reportEventController.nextAndSubmitButtonHeight,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: appTheme.primaryActionColor,
        ),
        onPressed: ()async{
          try{
            _commonComponent.initializeLoader(context: context,message: tr("common_key.submitting_response"));
            String eventId = await _reportEventController.reportEvent();
            Get.back();
            _commonComponent.showEventShareDialog(context: context, message: eventId);
          }catch(e){
            if (kReleaseMode) {
              _customToastMessage.showErrorToastMessage(message: tr("monitor_event.report_error"), duration: 1, context: context);
            }else{
              _customToastMessage.showErrorToastMessage(message: e.toString(), duration: 1, context: context);
              print(e);
            }
            Get.back();
          }
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: Platform.isIOS?8.0:0),
          child: const Text("common_key.submit_btn",style: TextStyle(color: Colors.white,fontSize: 16),).tr(),
        ),
      ),
    );
  }
}
