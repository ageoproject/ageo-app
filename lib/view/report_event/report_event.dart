import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/view/app_drawer.dart';
import 'package:ageo/view/app_bar.dart';
import 'package:ageo/view/report_event/custom_tab_view.dart';
import 'package:ageo/view/report_event/event_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportEvent extends StatelessWidget {
  ReportEvent({Key? key}) : super(key: key);
  final ReportEventController _reportEventController=Get.put(ReportEventController());

  Widget pageSelector(){
    if(_reportEventController.activeTab.value=="event_type"){
      return EventTypeList();
    }else{
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return Scaffold(
      drawer: CustomAppDrawer(),
      body: Column(
        children: [
          CustomAppBar(title: "Select Event type",),
          CustomTabView(),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(()=> pageSelector()),
            ),
          ),
        ],
      ),
    );
  }
}
