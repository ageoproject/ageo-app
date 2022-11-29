import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitFrequencySlider extends StatelessWidget {
  final String eventType;
  VisitFrequencySlider({Key? key,required this.eventType}) : super(key: key);
  final ReportEventController _reportEventController=Get.find();
  final List<String> _frequencyStringList=["Daily","1st time","Yearly","Monthly","Weekly"];

  String mapSliderValue({required int value}){
    switch(value){
      case 0:{
        return _frequencyStringList[value];
      }
      case 1:{
        return _frequencyStringList[value];
      }
      case 2:{
        return _frequencyStringList[value];
      }
      case 3:{
        return _frequencyStringList[value];
      }
      case 4:{
        return _frequencyStringList[value];
      }
      default:{
        return _frequencyStringList[0];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    CustomThemeData appTheme=Theme.of(context).customTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${tr("monitor_event.frequency_of_visits.text")} ${tr("monitor_event.frequency_of_visits.text_hint")} :",style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
        Text(tr("monitor_event.frequency_of_visits.text_hint"),style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
        GetBuilder<ReportEventController>(
          builder:(_)=> Slider(
            value: _reportEventController.visitFrequencySlider,
            max: 4,
            divisions: 4,
            activeColor: appTheme.primaryActionColor,
            inactiveColor: appTheme.toggleSelectionColor,
            onChanged: (value){
              _reportEventController.changeVisitFrequencySliderValue(value: value);
              // int index=value.toInt();
              if(eventType=="MARINE_FLOODING"){
                _reportEventController.changeMarineFloodingVisitFrequency(value: mapSliderValue(value:value.toInt()));
              }else{

              }
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (index) {
            return Text("monitor_event.frequency_of_visits.${_frequencyStringList[index]}",style: TextStyle(color: appTheme.primaryTextColor,fontSize: 14,)).tr();
          }),
        )
      ],
    );
  }
}
