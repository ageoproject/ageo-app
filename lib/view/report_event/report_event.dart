import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/view/app_drawer.dart';
import 'package:ageo/view/app_bar.dart';
import 'package:ageo/view/report_event/common_questions.dart';
import 'package:ageo/view/report_event/custom_tab_view.dart';
import 'package:ageo/view/report_event/event_specific_pages/building_settlement.dart';
import 'package:ageo/view/report_event/event_specific_pages/coastal_erosion.dart';
import 'package:ageo/view/report_event/event_specific_pages/earthquake.dart';
import 'package:ageo/view/report_event/event_specific_pages/landslide.dart';
import 'package:ageo/view/report_event/event_specific_pages/sinkhole.dart';
import 'package:ageo/view/report_event/event_type.dart';
import 'package:ageo/view/report_event/map_view.dart';
import 'package:ageoClient/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'event_specific_pages/marine_flooding.dart';
import 'event_specific_pages/river_flooding.dart';

class ReportEvent extends StatefulWidget {
  const ReportEvent({Key? key}) : super(key: key);

  @override
  State<ReportEvent> createState() => _ReportEventState();
}

class _ReportEventState extends State<ReportEvent> {
  final ReportEventController _reportEventController=Get.put(ReportEventController());

  Widget pageSelector(){
    switch(_reportEventController.activeTab.value){
      case "event_type":{
        return EventTypeList();
      }
      case "map":{
        return const MapView();
      }
      case "questions":{
        return CommonQuestions();
      }
      case "damage":{
        return selectEventSpecificDamagePage();
      }
      default:{
        return Container();
      }
    }
  }

  Widget selectEventSpecificDamagePage(){
    switch(_reportEventController.selectedEventType){
      case EventEventTypeEnum.EARTHQUAKE:{
        return Earthquake();
      }
      case EventEventTypeEnum.LANDSLIDE:{
        return Landslide();
      }
      case EventEventTypeEnum.RIVER_FLOODING:{
        return RiverFlooding();
      }
      case EventEventTypeEnum.SINKHOLE:{
        return Sinkhole();
      }
      case EventEventTypeEnum.BUILDING_SETTLEMENT:{
        return BuildingSettlement();
      }
      case EventEventTypeEnum.MARINE_FLOODING:{
        return MarineFlooding();
      }
      case EventEventTypeEnum.COASTAL_EROSION:{
        return CoastalErosion();
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
      backgroundColor: Colors.white,
      drawer: CustomAppDrawer(),
      body: Column(
        children: [
          CustomAppBar(title: "Monitor Event",),
          CustomTabView(),
          Expanded(
            child: Obx(()=> pageSelector()),
          ),
        ],
      ),
    );
  }
}
