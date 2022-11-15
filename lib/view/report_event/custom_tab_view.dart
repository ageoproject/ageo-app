import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/toast_message.dart';
import 'package:ageo/view/report_event/quick_report_event.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/report_event_controller.dart';

class CustomTabView extends StatelessWidget {
  CustomTabView({Key? key}) : super(key: key);
  final ReportEventController _reportEventController=Get.find();
  final CustomToastMessage _toastMessage=CustomToastMessage();

  Color getTextColor({required String widgetId,required CustomThemeData appTheme}){
    if(_reportEventController.activeTab.value==widgetId){
      return appTheme.primaryActionColor;
    }else{
      return appTheme.placeHolderTextColor;
    }
  }

  Color getUnderLineBorderColor({required String widgetId,required CustomThemeData appTheme}){
    if(_reportEventController.activeTab.value==widgetId){
      return appTheme.primaryActionColor;
    }else{
      return Colors.transparent;
    }
  }

  bool allowToChangeTab({required BuildContext context,required String actionType}){
    if(kDebugMode){
      return true;
    }
    switch(actionType){
      case "event_type":{
        return true;
      }
      case "map":{
        if(_reportEventController.selectedEventType!=null){
          return true;
        }else{
          _toastMessage.showErrorToastMessage(message: tr("monitor_event.toast_message.select_event_type"), duration: 1, context: context);
          return false;
        }
      }
      case "questions":{
        if(_reportEventController.currentLocationMarker!=null){
          return true;
        }else{
          _toastMessage.showErrorToastMessage(message: tr("monitor_event.toast_message.select_location"), duration: 1, context: context);
          return false;
        }
      }
      case "damage":{
        if(_reportEventController.uploadedImageList.isNotEmpty){
          return true;
        }else{
          _toastMessage.showErrorToastMessage(message: tr("monitor_event.toast_message.select_event_date_time"), duration: 1, context: context);
        }
        return false;
      }
      default:
        return false;
    }
  }

  bool checkDamageTabVisibility(){
    if(_reportEventController.hasSpecificDamagePage.contains(_reportEventController.selectedEventType)){
     return true;
    }else{
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 1.0),
              child: Container(
                width: MediaQuery.of(context).size.width-32,
                padding:const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: appTheme.placeHolderTextColor))
                ),
              ),
            ),
            Obx(
                  ()=> Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Image.asset("assets/images/report_event/camera_ic.png",scale: 3.5,color: appTheme.primaryActionColor,),
                          onPressed: ()async{
                            // Navigator.popUntil(context, (route) => route.isFirst);
                            // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>QuickReportEvent()), (route) => route.isFirst);
                            await Navigator.push(context, MaterialPageRoute(builder: (context)=>const QuickReportEvent()));
                          },
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: getUnderLineBorderColor(widgetId: "event_type", appTheme: appTheme),
                                  width: 4.0,
                                ),
                              ),
                          ),
                          child: TextButton(
                            child: Text("monitor_event.tab_view.event_type",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900,color: getTextColor(widgetId: "select_event", appTheme: appTheme)),).tr(),
                            onPressed: (){
                              if(allowToChangeTab(actionType: "event_type",context: context)){
                                _reportEventController.changeActiveTab(value: "event_type");
                              }
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: getUnderLineBorderColor(widgetId: "map", appTheme: appTheme),
                                width: 4.0,
                              ),
                            ),
                          ),
                          child: TextButton(
                            child: Text("monitor_event.tab_view.map",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900,color: getTextColor(widgetId: "map", appTheme: appTheme),),).tr(),
                            onPressed: (){
                              if(allowToChangeTab(actionType: "map",context: context)){
                                _reportEventController.changeActiveTab(value: "map");
                              }
                            },
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: getUnderLineBorderColor(widgetId: "questions", appTheme: appTheme),
                                width: 4.0,
                              ),
                            ),
                          ),
                          child: TextButton(
                            child: Text("monitor_event.tab_view.questions",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900,color: getTextColor(widgetId: "questions", appTheme: appTheme)),).tr(),
                            onPressed: (){
                              if(allowToChangeTab(actionType: "questions",context: context)){
                                _reportEventController.changeActiveTab(value: "questions");
                              }
                            },
                          ),
                        ),
                        GetBuilder<ReportEventController>(
                          builder:(_)=> Visibility(
                            visible: checkDamageTabVisibility(),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: getUnderLineBorderColor(widgetId: "damage", appTheme: appTheme),
                                    width: 4.0,
                                  ),
                                ),
                              ),
                              child: TextButton(
                                child: Text("monitor_event.tab_view.damage",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900,color: getTextColor(widgetId: "damage", appTheme: appTheme)),).tr(),
                                onPressed: (){
                                  if(allowToChangeTab(actionType: "damage",context: context)){
                                    _reportEventController.changeActiveTab(value: "damage");
                                  }
                                },
                              ),
                            ),
                          ),
                        ),

                ],
              ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
