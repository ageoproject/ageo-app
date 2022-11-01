import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/view/app_drawer.dart';
import 'package:ageo/view/app_bar.dart';
import 'package:ageo/view/report_event/custom_tab_view.dart';
import 'package:ageo/view/report_event/event_type.dart';
import 'package:ageo/view/report_event/mapView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportEvent extends StatelessWidget {
  ReportEvent({Key? key}) : super(key: key);
  final ReportEventController _reportEventController=Get.put(ReportEventController());

  Widget pageSelector(){
    switch(_reportEventController.activeTab.value){
      case "event_type":{
        return SingleChildScrollView(
            child: EventTypeList(),
        );
      }
      case "map":{
        return const MapView();
      }
      default:{
        return Container();
      }
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
            child: Obx(()=> pageSelector()),
          ),
        ],
      ),
    );
  }
}
