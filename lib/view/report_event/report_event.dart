import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/view/app_drawer.dart';
import 'package:ageo/view/app_bar.dart';
import 'package:ageo/view/report_event/custom_tab_view.dart';
import 'package:ageo/view/report_event/event_type.dart';
import 'package:ageo/view/report_event/map_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportEvent extends StatefulWidget {
  const ReportEvent({Key? key}) : super(key: key);

  @override
  State<ReportEvent> createState() => _ReportEventState();
}

class _ReportEventState extends State<ReportEvent> {
  final ReportEventController _reportEventController=Get.put(ReportEventController(),permanent: false);

  Widget pageSelector(){
    switch(_reportEventController.activeTab.value){
      case "event_type":{
        return EventTypeList();
      }
      case "map":{
        return MapView();
      }
      default:{
        return Container();
      }
    }
  }

  @override
  void dispose() {
    Get.delete<ReportEventController>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // CustomThemeData appTheme=Theme.of(context).customTheme;
    return Scaffold(
      drawer: CustomAppDrawer(),
      body: Column(
        children: [
          CustomAppBar(title: "Select Event type",),
          CustomTabView(),
          Expanded(
            child: Obx(()=> pageSelector()),
          ),
        ],
      ),
    );
  }
}