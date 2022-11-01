import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/helpers/toast_message.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/report_event_controller.dart';

class CustomTabView extends StatelessWidget {
  CustomTabView({Key? key}) : super(key: key);
  final ReportEventController _reportEventController=Get.find();
  final CustomToastMessage _toastMessage=CustomToastMessage();

  Color getTextColor({required String widgetId,required CustomThemeData appTheme}){
    if(_reportEventController.activeTab.value==widgetId){
      return appTheme.primaryTextColor;
    }else{
      return appTheme.placeHolderTextColor;
    }
  }

  Color getUnderLineBorderColor({required String widgetId,required CustomThemeData appTheme}){
    if(_reportEventController.activeTab.value==widgetId){
      return appTheme.iconColor;
    }else{
      return Colors.transparent;
    }
  }
  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 1.0),
            child: Container(
              padding:const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: appTheme.placeHolderTextColor))
              ),
            ),
          ),
          Obx(
                ()=> Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset("assets/images/report_event/camera_ic.png",scale: 3.5,color: appTheme.primaryActionColor,),
                      onPressed: (){

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
                          _reportEventController.changeActiveTab(value: "event_type");
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
                          if(_reportEventController.selectedEventType!=null){
                            _reportEventController.changeActiveTab(value: "map");
                          }else{
                            _toastMessage.showErrorToastMessage(message: tr("monitor_event.toast_message.select_event_type"), duration: 1, context: context);
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
                          _reportEventController.changeActiveTab(value: "questions");
                        },
                      ),
                    ),
                    Container(
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
                          _reportEventController.changeActiveTab(value: "damage");
                        },
                      ),
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
