import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageoClient/api.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventTypeList extends StatelessWidget {
  EventTypeList({Key? key}) : super(key: key);

  final ReportEventController _reportEventController=Get.find();
  final String _filePath="assets/images/report_event/event_type/";
  final List<Map<String,dynamic>> _eventDetailList=[
    {
      "event_name": "monitor_event.event_type_tab.forest_fire",
      "icon_name": "forest_fire_ic",
      "event_type": EventEventTypeEnum.FOREST_FIRE
    },
    {
      "event_name": "monitor_event.event_type_tab.tsunami",
      "icon_name": "tsunami_ic",
      "event_type": EventEventTypeEnum.TSUNAMI
    },
    {
      "event_name": "monitor_event.event_type_tab.earthquake",
      "icon_name": "earthquake_ic",
      "event_type": EventEventTypeEnum.EARTHQUAKE
    },
    {
      "event_name": "monitor_event.event_type_tab.rockfall",
      "icon_name": "rockfall_ic",
      "event_type": EventEventTypeEnum.ROCKFALL
    },
    {
      "event_name": "monitor_event.event_type_tab.land_slide",
      "icon_name": "landSlide_ic",
      "event_type": EventEventTypeEnum.LANDSLIDE
    },
    {
      "event_name": "monitor_event.event_type_tab.flood",
      "icon_name": "flood_ic",
      "event_type": EventEventTypeEnum.FLOODED
    },
    {
      "event_name": "monitor_event.event_type_tab.sinkhole",
      "icon_name": "sinkhole",
      "event_type": EventEventTypeEnum.SINKHOLE
    },
    {
      "event_name": "monitor_event.event_type_tab.eruption",
      "icon_name": "eruption_ic",
      "event_type": EventEventTypeEnum.ERUPTION
    },{
      "event_name": "monitor_event.event_type_tab.building_settlement",
      "icon_name": "buildingSettlement_ic",
      "event_type": EventEventTypeEnum.BUILDING_SETTLEMENT
    },

  ];

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        children: List<Widget>.generate(_eventDetailList.length, (index) {
          return Padding(
            padding: index % 2 ==0 ? const EdgeInsets.only(right: 12.0,bottom: 12.0):const EdgeInsets.only(bottom: 12),
            child: GestureDetector(
              onTap: (){
                _reportEventController.changeSelectedEventType(value: _eventDetailList[index]["event_type"]);
              },
              child: Container(
                padding:const EdgeInsets.symmetric(horizontal: 26,vertical: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: appTheme.inputFieldsBorderColor)
                ),
                child: Column(
                  children: [
                    Image.asset("$_filePath${_eventDetailList[index]["icon_name"]}.jpg",width: 100,),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text("${_eventDetailList[index]["event_name"]}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: appTheme.primaryTextColor),textAlign: TextAlign.center,).tr(),
                    ),
                  ],
                ),
              ),
            ),
          );
        })
      ),
    );
  }
}
