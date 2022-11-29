import 'package:ageo/controllers/report_event_controller.dart';
import 'package:ageo/helpers/app_theme.dart';
import 'package:ageo/view/report_event/submit_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoastalErosion extends StatefulWidget {
  const CoastalErosion({Key? key}) : super(key: key);

  @override
  State<CoastalErosion> createState() => _CoastalErosionState();
}

class _CoastalErosionState extends State<CoastalErosion> {
  final ReportEventController _reportEventController=Get.find();

  final double _inputFieldBorderRadius = 4;

  late bool isMobile;

  late CustomThemeData appTheme;

  final List<Map<String,dynamic>> _objectSubjectToErosion=[
    {
      "localization_ref":"monitor_event.coastal_erosion.cliff",
      "type_of_damage":"Cliff",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/cliff_ic.png"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.beach",
      "type_of_damage":"Beach",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/beach_ic.png"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.dune",
      "type_of_damage":"Dune or strip of pebbles",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/dune_ic.png"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.coastal_defences",
      "type_of_damage":"Coastal defences or buildings",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/coastal_defences_or_building_ic.png"
    },
  ];

  final List<Map<String,dynamic>> _erodedPartOfCliff=[
    {
      "localization_ref":"monitor_event.coastal_erosion.cliff_detail.cliff_top",
      "type_of_damage":"Cliff top",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/cliff_top_ic.png"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.cliff_detail.cliff_foot",
      "type_of_damage":"Cliff foot",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/cliff_foot_ic.png"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.cliff_detail.all_cliff",
      "type_of_damage":"All cliff face",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/all_cliff_face_ic.png"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.cliff_detail.small_blocks",
      "type_of_damage":"Small blocks",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/small_block_ic.png"
    },
  ];

  final List<Map<String,dynamic>> _typeOfSediment=[
    {
      "localization_ref":"monitor_event.coastal_erosion.beach_details.silt",
      "type_of_damage":"Silt"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.beach_details.fine_sand",
      "type_of_damage":"Fine sand"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.beach_details.coarse_sand",
      "type_of_damage":"Coarse sand"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.beach_details.gravels",
      "type_of_damage":"Gravels"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.beach_details.pebbles",
      "type_of_damage":"Pebbles"
    },
  ];

  final List<Map<String,dynamic>> _erodedPartOfDune=[
    {
      "localization_ref":"monitor_event.coastal_erosion.dune_detail.dune_top",
      "type_of_damage":"Dune top",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/dune_top_ic.png"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.dune_detail.dune_foot",
      "type_of_damage":"Dune foot",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/dune_foot_ic.png"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.dune_detail.all_dune",
      "type_of_damage":"All the dune",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/all_the_dune_ic.png"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.dune_detail.dune_migration",
      "type_of_damage":"Dune migration",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/dune_migrate_ic.png"
    },
  ];

  final List<Map<String,dynamic>> _featureOnDune=[
    {
      "localization_ref":"monitor_event.coastal_erosion.dune_detail.vegetation",
      "type_of_damage":"Vegetation",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/vegetation_ic.png"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.dune_detail.granville_slats",
      "type_of_damage":"Granville slats",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/granville_slats_ic.png"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.dune_detail.foot_path",
      "type_of_damage":"Foot path",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/dune_foot_path_ic.png"
    }
  ];

  final List<Map<String,dynamic>> _typeOfBuilding=[
    {
      "localization_ref":"monitor_event.coastal_erosion.coastal_defences_detail.housing",
      "type_of_damage":"Housing",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/housing_ic.png"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.coastal_defences_detail.harbour_facilities",
      "type_of_damage":"Harbour facilities, boat",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/harbour_ic.png"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.coastal_defences_detail.parking",
      "type_of_damage":"Roads & parking",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/parking_ic.png"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.coastal_defences_detail.agriculture",
      "type_of_damage":"Agriculture & industry",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/agriculture_ic.png"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.coastal_defences_detail.tourism",
      "type_of_damage":"Tourism & leisure facilities",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/tourism_ic.png"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.coastal_defences_detail.foot_path",
      "type_of_damage":"Foot path",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/foot_path_ic.png"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.coastal_defences_detail.coastal_defence",
      "type_of_damage":"Coastal defence",
      "icon_path":"assets/images/report_event/event_specific_images/coastal_erosion/coastal_defence_ic.png"
    },
  ];

  final List<Map<String,dynamic>> _causeOfDamage=[
    {
      "localization_ref":"monitor_event.coastal_erosion.coastal_defences_detail.don't_know",
      "type_of_damage":"I don't know"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.coastal_defences_detail.storm",
      "type_of_damage":"Storm"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.coastal_defences_detail.strong_wind",
      "type_of_damage":"Strong wind"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.coastal_defences_detail.heavy_rain",
      "type_of_damage":"Heavy rain"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.coastal_defences_detail.high_tide",
      "type_of_damage":"High tide"
    },
    {
      "localization_ref":"monitor_event.coastal_erosion.coastal_defences_detail.human_caused",
      "type_of_damage":"Human - caused"
    },
  ];

  final List<String> _levelOfDamageImageList=["minor_damage_ic.png","moderate_damage_ic.png","partial_collapse_ic.png","total_collapse_ic.png"];

  Widget selectDetailScreen(){
    switch(_reportEventController.coastalErosionDamage["coastal_erosion_eroded_object"]){
      case "Cliff":{
        return cliffDetailPage();
      }
      case "Beach":{
        return beachDetailPage();
      }
      case "Dune or strip of pebbles":{
        return duneDetailPage();
      }
      case "Coastal defences or buildings":{
        return coastalDefenceDetailPage();
      }
      default:{
        return Container();
      }
    }
  }

  Widget cliffDetailPage(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Text("${tr("monitor_event.coastal_erosion.cliff_detail.presence_of_debris")}:",style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
              ),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: RadioListTile(
                      value: "Yes",
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                      activeColor:const Color(0xff7AD559),
                      title: Text("monitor_event.coastal_erosion.cliff_detail.yes",style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr() ,
                      contentPadding: EdgeInsets.zero,
                      groupValue: _reportEventController.coastalErosionDamage["Cliff"]["coastal_erosion_debris_presence"],
                      onChanged: (value){
                        _reportEventController.changeCoastalErosionCliffDebrisPresence(value: value.toString());
                      },
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: RadioListTile(
                      value: "No",
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                      contentPadding: EdgeInsets.zero,
                      activeColor:const Color(0xffEA3E3E),
                      // shape:const RoundedRectangleBorder(side: BorderSide(color: Color(0xffEA3E3E) )),
                      title: Text("monitor_event.coastal_erosion.cliff_detail.no",style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor)).tr() ,
                      groupValue: _reportEventController.coastalErosionDamage["Cliff"]["coastal_erosion_debris_presence"],
                      onChanged: (value){
                        _reportEventController.changeCoastalErosionCliffDebrisPresence(value: value.toString());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Text("${tr("monitor_event.coastal_erosion.cliff_detail.volume_of_debris")}:",style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
              ),
            ),
            Container(
              width:130,
              decoration:BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: appTheme.inputFieldsBorderColor),
                  borderRadius: BorderRadius.circular(4)
              ),
              padding:const EdgeInsets.only(left: 4),
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                  value: _reportEventController.coastalErosionDamage["Cliff"]["coastal_erosion_debris_volume"],
                  underline:const SizedBox(),
                  isExpanded: true,
                  items: ["Don't know","Cycle","Car","Truck"].map((String value) {
                    return DropdownMenuItem<String>(
                      key: Key(value),
                      value: value,
                      //child: new Text(value),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text("monitor_event.coastal_erosion.cliff_detail.$value",style: TextStyle(color: appTheme.primaryTextColor,fontSize: 14,)).tr(),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if(value!=null) {
                      _reportEventController.changeCoastalErosionCliffDebrisVolume(value: value);
                      // _reportEventController.changeNumberOfBuilding(index: buildingIndex, numberOfBuilding: value);
                    }
                  },
                ),
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(top:18.0,bottom: 12),
          child: Text("monitor_event.coastal_erosion.cliff_detail.eroded_part",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
        ),
        Align(
          alignment: Alignment.center,
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List<Widget>.generate(_erodedPartOfCliff.length, (index) {
              return GestureDetector(
                onTap: (){
                  _reportEventController.changeCoastalErosionCliffErodedPart(value: _erodedPartOfCliff[index]["type_of_damage"]!);
                },
                child: Container(
                  height: 86,
                  width: isMobile? (MediaQuery.of(context).size.width-40) : (MediaQuery.of(context).size.width/2)-40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // border: Border.all(color: appTheme.inputFieldsBorderColor)
                    border: _reportEventController.coastalErosionDamage["Cliff"]["coastal_erosion_eroded_part"]== _erodedPartOfCliff[index]["type_of_damage"] ? Border.all(color: appTheme.primaryActionColor,width: 2) : Border.all(color: appTheme.inputFieldsBorderColor),
                  ),
                  padding:const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Image.asset(_erodedPartOfCliff[index]["icon_path"]!,),
                      const SizedBox(width: 12,),
                      Expanded(child: Text(_erodedPartOfCliff[index]["localization_ref"]!,style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr())
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget beachDetailPage(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:18.0,bottom: 12),
          child: Text("monitor_event.coastal_erosion.beach_details.type_of_sediments",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
        ),

        Column(
          children: List.generate(_typeOfSediment.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GestureDetector(
                onTap: (){
                  _reportEventController.changeCoastalErosionBeachSedimentType(value: _typeOfSediment[index]["type_of_damage"]!);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _reportEventController.coastalErosionDamage["Beach"]["coastal_erosion_sediment_types"].contains(_typeOfSediment[index]["type_of_damage"])?appTheme.toggleSelectionColor:Colors.white,
                    borderRadius: BorderRadius.circular(_inputFieldBorderRadius),
                    border: Border.all(color: appTheme.inputFieldsBorderColor),
                  ),
                  padding:const EdgeInsets.symmetric(vertical: 12,horizontal: 14),
                  child: Row(
                    children: [
                      Container(
                        height:18,
                        padding: const EdgeInsets.only(right: 25),
                        child: Checkbox(
                          value: _reportEventController.coastalErosionDamage["Beach"]["coastal_erosion_sediment_types"].contains(_typeOfSediment[index]["type_of_damage"]),
                          checkColor: appTheme.primaryActionColor,
                          side: BorderSide(color: appTheme.inputFieldsBorderColor),
                          fillColor: MaterialStateProperty.all(Colors.white),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                          onChanged: (value){
                            _reportEventController.changeCoastalErosionBeachSedimentType(value: _typeOfSediment[index]["type_of_damage"]!);
                          },
                        ),
                      ),
                      Expanded(
                        child: Text("${_typeOfSediment[index]["localization_ref"]}",style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr(),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Image.asset("assets/images/report_event/event_specific_images/coastal_erosion/height_of_sand_ic.png"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text("${tr("monitor_event.coastal_erosion.beach_details.height_of_sand_lost")}:",style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
                  ),
                  Container(
                    width:160,
                    decoration:BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: appTheme.inputFieldsBorderColor),
                        borderRadius: BorderRadius.circular(4)
                    ),
                    padding:const EdgeInsets.only(left: 4),
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        value: _reportEventController.coastalErosionDamage["Beach"]["coastal_erosion_sand_height_lost"],
                        underline:const SizedBox(),
                        isExpanded: true,
                        items: ["Don't know","20cm","50cm","1m",">1m"].map((String value) {
                          return DropdownMenuItem<String>(
                            key: Key(value),
                            value: value,
                            //child: new Text(value),
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text("monitor_event.coastal_erosion.beach_details.$value",style: TextStyle(color: appTheme.primaryTextColor,fontSize: 14,)).tr(),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if(value!=null) {
                            _reportEventController.changeCoastalErosionBeachSandHeightLost(value: value);
                            // _reportEventController.changeNumberOfBuilding(index: buildingIndex, numberOfBuilding: value);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget duneDetailPage(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:18.0,bottom: 12),
          child: Text("monitor_event.coastal_erosion.dune_detail.eroded_part",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
        ),
        Align(
          alignment: Alignment.center,
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List<Widget>.generate(_erodedPartOfDune.length, (index) {
              return GestureDetector(
                onTap: (){
                  _reportEventController.changeCoastalErosionDuneErodedPart(value: _erodedPartOfDune[index]["type_of_damage"]!);
                },
                child: Container(
                  height: 86,
                  width: isMobile? (MediaQuery.of(context).size.width-40) : (MediaQuery.of(context).size.width/2)-40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // border: Border.all(color: appTheme.inputFieldsBorderColor)
                    border: _reportEventController.coastalErosionDamage["Dune or strip of pebbles"]["coastal_erosion_dune_part_eroded"]== _erodedPartOfDune[index]["type_of_damage"] ? Border.all(color: appTheme.primaryActionColor,width: 2) : Border.all(color: appTheme.inputFieldsBorderColor),
                  ),
                  padding:const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Image.asset(_erodedPartOfDune[index]["icon_path"]!,),
                      const SizedBox(width: 12,),
                      Expanded(child: Text(_erodedPartOfDune[index]["localization_ref"]!,style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr())
                    ],
                  ),
                ),
              );
            }),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top:18.0,bottom: 12),
          child: Text("monitor_event.coastal_erosion.dune_detail.dune_features",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
        ),
        Align(
          alignment: Alignment.center,
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List<Widget>.generate(_featureOnDune.length, (index) {
              return GestureDetector(
                onTap: (){
                  _reportEventController.changeCoastalErosionDuneFeature(value: _featureOnDune[index]["type_of_damage"]!);
                },
                child: Container(
                  height: 86,
                  width: isMobile? (MediaQuery.of(context).size.width-40) : (MediaQuery.of(context).size.width/2)-40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // border: Border.all(color: appTheme.inputFieldsBorderColor)
                    border: _reportEventController.coastalErosionDamage["Dune or strip of pebbles"]["coastal_erosion_features_on_dune"].contains(_featureOnDune[index]["type_of_damage"]) ? Border.all(color: appTheme.primaryActionColor,width: 2) : Border.all(color: appTheme.inputFieldsBorderColor),
                  ),
                  padding:const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Image.asset(_featureOnDune[index]["icon_path"]!,),
                      const SizedBox(width: 12,),
                      Expanded(child: Text(_featureOnDune[index]["localization_ref"]!,style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr())
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget coastalDefenceDetailPage(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:18.0,bottom: 12),
          child: Text("monitor_event.coastal_erosion.coastal_defences_detail.type_of_building",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
        ),
        Align(
          alignment: Alignment.center,
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List<Widget>.generate(_typeOfBuilding.length, (index) {
              return GestureDetector(
                onTap: (){
                  _reportEventController.changeCoastalErosionCoastalDefencesErodedBuildingType(value: _typeOfBuilding[index]["type_of_damage"]!);
                },
                child: Container(
                  height: 86,
                  width: isMobile? (MediaQuery.of(context).size.width-40) : (MediaQuery.of(context).size.width/2)-40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // border: Border.all(color: appTheme.inputFieldsBorderColor)
                    border: _reportEventController.coastalErosionDamage["Coastal defences or buildings"]["coastal_erosion_building_type"]== _typeOfBuilding[index]["type_of_damage"] ? Border.all(color: appTheme.primaryActionColor,width: 2) : Border.all(color: appTheme.inputFieldsBorderColor),
                  ),
                  padding:const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Image.asset(_typeOfBuilding[index]["icon_path"]!,),
                      const SizedBox(width: 12,),
                      Expanded(child: Text(_typeOfBuilding[index]["localization_ref"]!,style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr())
                    ],
                  ),
                ),
              );
            }),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top:18.0,bottom: 12),
          child: Text("monitor_event.coastal_erosion.coastal_defences_detail.level_of_damage",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(_levelOfDamageImageList.length, (index) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Image.asset("assets/images/report_event/event_specific_images/coastal_erosion/${_levelOfDamageImageList[index]}",height: 40,alignment: Alignment.bottomCenter,width: 55,),
                  ),
                );
              })
            ),
            Slider(
              value: _reportEventController.coastalErosionDamageLevelSlider,
              max: 3,
              divisions: 3,
              activeColor: appTheme.primaryActionColor,
              inactiveColor: appTheme.toggleSelectionColor,
              onChanged: (value){
                _reportEventController.changeCoastalErosionCoastalDefencesDamageLevel(value: double.parse(value.toString()));
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top:18.0,bottom: 12),
          child: Text("monitor_event.coastal_erosion.coastal_defences_detail.damage_cause",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
        ),

        Column(
          children: List.generate(_causeOfDamage.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GestureDetector(
                onTap: (){
                  _reportEventController.changeCoastalErosionCoastalDefencesDamageCauses(value: _causeOfDamage[index]["type_of_damage"]!);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _reportEventController.coastalErosionDamage["Coastal defences or buildings"]["coastal_erosion_damage_causes"].contains(_causeOfDamage[index]["type_of_damage"])?appTheme.toggleSelectionColor:Colors.white,
                    borderRadius: BorderRadius.circular(_inputFieldBorderRadius),
                    border: Border.all(color: appTheme.inputFieldsBorderColor),
                  ),
                  padding:const EdgeInsets.symmetric(vertical: 12,horizontal: 14),
                  child: Row(
                    children: [
                      Container(
                        height:18,
                        padding: const EdgeInsets.only(right: 25),
                        child: Checkbox(
                          value: _reportEventController.coastalErosionDamage["Coastal defences or buildings"]["coastal_erosion_damage_causes"].contains(_causeOfDamage[index]["type_of_damage"]),
                          checkColor: appTheme.primaryActionColor,
                          side: BorderSide(color: appTheme.inputFieldsBorderColor),
                          fillColor: MaterialStateProperty.all(Colors.white),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                          onChanged: (value){
                            _reportEventController.changeCoastalErosionCoastalDefencesDamageCauses(value: _causeOfDamage[index]["type_of_damage"]!);
                          },
                        ),
                      ),
                      Expanded(
                        child: Text("${_causeOfDamage[index]["localization_ref"]}",style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr(),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${tr("monitor_event.coastal_erosion.coastal_defences_detail.response_confident")}:",style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
                      Text(tr("monitor_event.coastal_erosion.coastal_defences_detail.response_confident_hint"),style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
                    ],
                  ),
                ),
              ),
              Container(
                width:110,
                decoration:BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: appTheme.inputFieldsBorderColor),
                    borderRadius: BorderRadius.circular(4)
                ),
                padding:const EdgeInsets.only(left: 4),
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    value: _reportEventController.coastalErosionDamage["Coastal defences or buildings"]["coastal_erosion_response_confidence"].toString(),
                    underline:const SizedBox(),
                    isExpanded: true,
                    items: ["1","2","3","4","5"].map((String value) {
                      return DropdownMenuItem<String>(
                        key: Key(value),
                        value: value,
                        //child: new Text(value),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(value,style: TextStyle(color: appTheme.primaryTextColor,fontSize: 14,)),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if(value!=null) {
                        _reportEventController.changeCoastalErosionCoastalDefencesResponseConfidence(value: value);
                        // _reportEventController.changeNumberOfBuilding(index: buildingIndex, numberOfBuilding: value);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    appTheme=Theme.of(context).customTheme;
    isMobile=MediaQuery.of(context).size.shortestSide<600;
    return Stack(
      children: [
        GetBuilder<ReportEventController>(
          builder: (_)=>Padding(
            padding: EdgeInsets.only(bottom: _reportEventController.nextAndSubmitButtonHeight),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 8),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:18.0,bottom: 12),
                      child: Text("monitor_event.coastal_erosion.object_subject_to_erosion",style: TextStyle(fontSize:14,color:appTheme.primaryActionColor,fontWeight: FontWeight.w600 ),).tr(),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: List<Widget>.generate(_objectSubjectToErosion.length, (index) {
                          return GestureDetector(
                            onTap: (){
                              _reportEventController.changeCoastalErosionErodedObject(value: _objectSubjectToErosion[index]["type_of_damage"]!);
                            },
                            child: Container(
                              height: 86,
                              width: isMobile? (MediaQuery.of(context).size.width-40) : (MediaQuery.of(context).size.width/2)-40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                // border: Border.all(color: appTheme.inputFieldsBorderColor)
                                border: _reportEventController.coastalErosionDamage["coastal_erosion_eroded_object"]== _objectSubjectToErosion[index]["type_of_damage"] ? Border.all(color: appTheme.primaryActionColor,width: 2) : Border.all(color: appTheme.inputFieldsBorderColor),
                              ),
                              padding:const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Image.asset(_objectSubjectToErosion[index]["icon_path"]!,),
                                  const SizedBox(width: 12,),
                                  Expanded(child: Text(_objectSubjectToErosion[index]["localization_ref"]!,style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),).tr())
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: selectDetailScreen(),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${tr("monitor_event.frequency_of_visits.text")}:",style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
                                  Text(tr("monitor_event.frequency_of_visits.text_hint"),style: TextStyle(fontSize: 14,color: appTheme.iconColor),),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width:110,
                            decoration:BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: appTheme.inputFieldsBorderColor),
                                borderRadius: BorderRadius.circular(4)
                            ),
                            padding:const EdgeInsets.only(left: 4),
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                value: _reportEventController.coastalErosionDamage["coastal_erosion_visit_frequency"],
                                underline:const SizedBox(),
                                isExpanded: true,
                                items: ["Daily","1st time","Yearly","Monthly","Weekly"].map((String value) {
                                  return DropdownMenuItem<String>(
                                    key: Key(value),
                                    value: value,
                                    //child: new Text(value),
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Text("monitor_event.frequency_of_visits.$value",style: TextStyle(color: appTheme.primaryTextColor,fontSize: 14,)).tr(),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  if(value!=null) {
                                    _reportEventController.changeCoastalErosionVisitFrequency(value: value);
                                    // _reportEventController.changeNumberOfBuilding(index: buildingIndex, numberOfBuilding: value);
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("common_key.other",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color:appTheme.primaryTextColor),).tr(),
                          ),
                          TextFormField(
                            initialValue: _reportEventController.coastalErosionDamage["coastal_erosion_free_comment"],
                            textInputAction: TextInputAction.next,
                            minLines: 4,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            maxLength: 1500,
                            style: TextStyle(fontSize: 14,color: appTheme.primaryTextColor),
                            decoration: InputDecoration(
                              hintText: tr("common_key.new_add_comment"),
                              hintStyle: TextStyle(fontSize: 14,color: appTheme.placeHolderTextColor),
                              filled: true,
                              fillColor: Colors.white,
                              errorMaxLines: 2,
                              contentPadding:const EdgeInsets.fromLTRB(10, 10, 0, 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:appTheme.inputFieldsBorderColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(_inputFieldBorderRadius),
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:appTheme.inputFieldsBorderColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(_inputFieldBorderRadius),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:appTheme.inputFieldsBorderColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(_inputFieldBorderRadius),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color:appTheme.inputFieldsBorderColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(_inputFieldBorderRadius),
                                ),
                              ),
                            ),
                            onChanged: (value){
                              _reportEventController.changeCoastalErosionComment(value: value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: SubmitButton(),
        ),
      ],
    );
  }
}
