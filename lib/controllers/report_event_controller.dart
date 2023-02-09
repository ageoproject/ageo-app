import 'dart:convert';
import 'package:ageo/ageoConfig.dart';
import 'package:ageoClient/api.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ReportEventController extends GetxController{

  final RxString _activeTab="event_type".obs;
  final AgeoConfig _ageoConfig=AgeoConfig();
  final Event _eventDetail= Event();
  final double _nextAndSubmitButtonHeight=50;
  double _visitFrequencySlider=1;
  final List<EventEventTypeEnum> _hasSpecificDamagePage=[EventEventTypeEnum.EARTHQUAKE,EventEventTypeEnum.LANDSLIDE,EventEventTypeEnum.ROCKFALL,EventEventTypeEnum.RIVER_FLOODING,EventEventTypeEnum.SINKHOLE,EventEventTypeEnum.BUILDING_SETTLEMENT,EventEventTypeEnum.MARINE_FLOODING,EventEventTypeEnum.COASTAL_EROSION];

  RxString get activeTab=> _activeTab;
  Event get eventDetail=>_eventDetail;
  double get visitFrequencySlider=>_visitFrequencySlider;
  double get nextAndSubmitButtonHeight=>_nextAndSubmitButtonHeight;
  List<EventEventTypeEnum> get hasSpecificDamagePage=>_hasSpecificDamagePage;

  void changeActiveTab({required String value}){
    _activeTab.value=value;
  }

  void changeVisitFrequencySliderValue({required double value}){
    _visitFrequencySlider=value;
    update();
  }
  ///  Select event type

  final String _filePath="assets/images/report_event/event_type/";
  final List<Map<String,dynamic>> _eventDetailList=[
    {
      "event_name": "monitor_event.event_type_tab.wild_fire",
      "icon_name": "forestFire_ic",
      "event_type": EventEventTypeEnum.WILDFIRE
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
      "event_name": "monitor_event.event_type_tab.sinkhole",
      "icon_name": "sinkhole_ic",
      "event_type": EventEventTypeEnum.SINKHOLE
    },
    {
      "event_name": "monitor_event.event_type_tab.eruption",
      "icon_name": "eruption_ic",
      "event_type": EventEventTypeEnum.ERUPTION
    },
    {
      "event_name": "monitor_event.event_type_tab.land_slide",
      "icon_name": "landslide_ic",
      "event_type": EventEventTypeEnum.LANDSLIDE
    },
    {
      "event_name": "monitor_event.event_type_tab.flood",
      "icon_name": "flood_ic",
      "event_type": EventEventTypeEnum.RIVER_FLOODING
    },
    {
      "event_name": "monitor_event.event_type_tab.marineFlooding",
      "icon_name": "marineFlooding_ic",
      "event_type": EventEventTypeEnum.MARINE_FLOODING
    },
    {
      "event_name": "monitor_event.event_type_tab.coastalErosion",
      "icon_name": "coastalErosion_ic",
      "event_type": EventEventTypeEnum.COASTAL_EROSION
    },
    {
      "event_name": "monitor_event.event_type_tab.building_settlement",
      "icon_name": "buildingSettlement_ic",
      "event_type": EventEventTypeEnum.BUILDING_SETTLEMENT
    },
  ];
  EventEventTypeEnum? _selectedEventType;

  String get filePath=>_filePath;
  List<Map<String,dynamic>> get eventDetailList=>_eventDetailList;
  EventEventTypeEnum? get selectedEventType=>_selectedEventType;

  void changeSelectedEventType({required EventEventTypeEnum value }){
    _selectedEventType=value;
    _eventDetail.eventType=value;
    update();
    // print(_selectedEventType);
  }


  /// Map Page

  final RxBool _hideMapModeOption=true.obs;
  final Set<Marker> _locationMarker={};
  final RxDouble _mapZoomLevel=14.4746.obs;
  MapType _mapType=MapType.normal;
  final RxBool _enableTrafficMode=false.obs;
  Marker? _currentLocationMarker;
  Marker? _markedLocationMarker;

  Set<Marker> get locationMarker=>_locationMarker;
  RxDouble get mapZoomLevel=>_mapZoomLevel;
  RxBool get hideMapModeOption=>_hideMapModeOption;
  MapType get mapType=>_mapType;
  RxBool get enableTrafficMode=>_enableTrafficMode;
  Marker? get currentLocationMarker=>_currentLocationMarker;
  Marker? get markedLocationMarker=>_markedLocationMarker;


  void markLocation({required Marker marker,required LatLng locationCoordinate}){
    try{
      if(_markedLocationMarker!=null){
        _locationMarker.remove(_markedLocationMarker);
      }
      _markedLocationMarker=marker;
      _locationMarker.add(_markedLocationMarker!);
      _eventDetail.location=EventLocation(coordinates: [locationCoordinate.longitude,locationCoordinate.latitude]);
      update();
    }catch(_){}

  }

  void markCurrentLocation({required LatLng latLng,required Marker marker}){
    if(_currentLocationMarker==null){
      _eventDetail.location=EventLocation(coordinates: [latLng.longitude,latLng.latitude]);
    }
    // else{
      // _locationMarker.remove(_currentLocationMarker);
    // }
    // _locationMarker.add(marker);
    _currentLocationMarker=marker;
    update();
  }

  void changeMapOptionState(){
    _hideMapModeOption.value=!_hideMapModeOption.value;
    update();
  }
  void changeMapType({required MapType value}){
    _mapType=value;
  }

  void toggleTrafficMode(){
    _enableTrafficMode.value=!_enableTrafficMode.value;
  }


  /// Common Question page

  final RxString _eventDate = DateTime.now().toString().split(" ")[0].obs;
  final RxString _eventTime= "${DateTime.now().hour.toString().padLeft(2,"0")}:${DateTime.now().minute.toString().padLeft(2,"0")}".obs;
  // final List<String> _commonQuestionLocalizationKeys=["common_question_page.was_raining","common_question_page.people_at_risk","common_question_page.animals_at_risk","common_question_page.assets_at_risk","common_question_page.i_am_safe"];
  final List<Map<String,String>> _commonQuestions=[
    {
      "question":"People at risk ?",
      "answer":"NO",
      "slug": "people_at_risk"
  },{
      "question":"Animals at risk ?",
      "answer":"NO",
      "slug": "animals_at_risk"
  },{
      "question":"Assets at risk ?",
      "answer":"NO",
      "slug": "assets_at_risk"
  },{
      "question":"I am safe ?",
      "answer":"NO",
      "slug": "i_am_safe"
  }
  ];

  final Map<String,dynamic> _sensorDataReferenceObject={
    "accelerometer":{
      "x":0.0,
      "y":0.0,
      "z":0.0,
    },
    "gyroscope":{
      "x":0.0,
      "y":0.0,
      "z":0.0,
    },
    "magnetometer":{
      "x":0.0,
      "y":0.0,
      "z":0.0,
    }
  };
  final List<Map<String,dynamic>> _sensorDataList=[];

  String? _comment;
  final List<XFile> _uploadedImageList=[];
  final List<String> _uploadedImagePathList=[];

  RxString get eventDate=>_eventDate;
  RxString get eventTime=>_eventTime;
  String? get comment=>_comment;
  List<Map<String,String>> get commonQuestion=>_commonQuestions;
  List<XFile> get uploadedImageList=>_uploadedImageList;
  // List<String> get commonQuestionLocalizationKeys=>_commonQuestionLocalizationKeys;


  void changeEventDate({required String date}){
    _eventDate.value=date;
    changeEventDateAndTime();
  }

  void changeEventTime({required String date}){
    _eventTime.value=date;
    changeEventDateAndTime();
  }

  void changeEventDateAndTime(){
    String dateTime="${_eventDate.value} ${_eventTime.value}";
    _eventDetail.time=DateTime.parse(dateTime).toUtc().toString();
    _eventDetail.comment="";
  }

  void updateAnswers({required int index}){
    _commonQuestions[index]["answer"]=_commonQuestions[index]["answer"]=="NO"?"YES":"NO";
    update();
  }

  void updateComment({required String comment}){
    _comment=comment;
    _eventDetail.comment=_comment;
  }

  void addImage({required XFile image}){
    _uploadedImageList.add(image);
    _uploadedImagePathList.add(image.path);
    _eventDetail.image =_uploadedImagePathList;
    // print(_sensorDataList);
    update();
  }
  void deleteImage({required XFile image}){
    int index=_uploadedImageList.indexOf(image);
    _uploadedImageList.remove(image);
    _uploadedImagePathList.remove(image.path);
    _eventDetail.image =_uploadedImagePathList;
    _sensorDataList.removeAt(index);
    update();
  }
  void updateSensorDataForCameraClick({required AccelerometerEvent accelerometerEvent,required GyroscopeEvent gyroscopeEvent,required MagnetometerEvent magnetometerEvent}){
    Map<String,dynamic> sensorData=json.decode(json.encode(_sensorDataReferenceObject));
    sensorData["accelerometer"]["x"]=accelerometerEvent.x;
    sensorData["accelerometer"]["y"]=accelerometerEvent.y;
    sensorData["accelerometer"]["x"]=accelerometerEvent.z;
    sensorData["gyroscope"]["x"]=gyroscopeEvent.x;
    sensorData["gyroscope"]["y"]=gyroscopeEvent.y;
    sensorData["gyroscope"]["x"]=gyroscopeEvent.z;
    sensorData["magnetometer"]["x"]=magnetometerEvent.x;
    sensorData["magnetometer"]["y"]=magnetometerEvent.y;
    sensorData["magnetometer"]["x"]=magnetometerEvent.z;
    _sensorDataList.add(sensorData);
  }

  void updateSensorDataForGalleryUpload({required Map<String,dynamic>? sensorValue}){
    Map<String,dynamic> sensorData;
    if(sensorValue!=null){
      sensorData=sensorValue;
    }else{
      sensorData=json.decode(json.encode(_sensorDataReferenceObject));
    }
    _sensorDataList.add(sensorData);
  }

  ///  Earthquake Page

  final List<String> _numberOfBuilding=["1","2","3","4","5","6+"];
  final Map<String,dynamic> _earthquakeDamage={
    "earthquake_observed_damage": [
      {
        "number_of_floors_in_building": "1",
        "observed_building_damage": "Falling Object"
      }
    ]
  };


  List<String> get numberOfBuilding=> _numberOfBuilding;
  Map<String,dynamic> get earthquakeDamage=>_earthquakeDamage;

  void addNewBuilding(){
    _earthquakeDamage["earthquake_observed_damage"].add({
      "number_of_floors_in_building": "1",
      "observed_building_damage": "Falling Object"
    });
    update();
  }

  void deleteBuilding({required int index}){
    _earthquakeDamage["earthquake_observed_damage"].removeAt(index);
    update();
  }

  void changeNumberOfBuilding({required int index,required String numberOfBuilding}){
    _earthquakeDamage["earthquake_observed_damage"][index]["number_of_floors_in_building"]=numberOfBuilding;
    update();
  }

  void selectObservedDamageForEarthquake({required int index,required String answer}){
    _earthquakeDamage["earthquake_observed_damage"][index]["observed_building_damage"]=answer;
    update();
  }


  /// Landslide

  double _landslideDisplacedLandSlider=0;
  final Map<String,dynamic> _landslideDamage={
    "landslide_displaced_land_volume": "Level 1",
    "landslide_observed_damage": [],
    "landslide_other_observed_damage":"",
  };

  Map<String,dynamic> get landslideDamage=>_landslideDamage;
  double get landslideDisplacedLandSlider=>_landslideDisplacedLandSlider;

  void changeVolumeOfDisplacedLand({required double value}){
    _landslideDisplacedLandSlider=value;
    String displacedLand="Level 1";
    switch(value.toInt()){
      case 0:{
        displacedLand="Level 1";
        break;
      }case 1:{
        displacedLand="Level 2";
        break;
      }case 2:{
        displacedLand="Level 3";
        break;
      }case 3:{
        displacedLand="Level 4";
        break;
      }
    }
    _landslideDamage["landslide_displaced_land_volume"]=displacedLand;
    update();
  }

  void selectObservedDamageForLandslide({required String value}){
    if(_landslideDamage["landslide_observed_damage"].contains(value)){
      _landslideDamage["landslide_observed_damage"].remove(value);
    }else{
      _landslideDamage["landslide_observed_damage"].add(value);
    }
    update();
  }
  void updateLandslideComment({required String comment}){
    _landslideDamage["landslide_other_observed_damage"]=comment;
    // update();
  }


  /// Flood

  double _riverFloodingWaterLevelSlider=0;
  final Map<String,dynamic> _riverFloodingDamage={
    "river_flooding_water_level": "Level 1",
    "river_flooding_observed_damage": [],
    "river_flooding_other_observed_damage": ""
  };

  Map<String,dynamic> get riverFloodingDamage=>_riverFloodingDamage;
  double get riverFloodingWaterLevelSlider=>_riverFloodingWaterLevelSlider;

  void changeWaterLevelOfFlood({required double value}){
    _riverFloodingWaterLevelSlider=value;
    String waterLevel="Level 1";
    switch(value.toInt()){
      case 0:{
        waterLevel="Level 1";
        break;
      }case 1:{
        waterLevel="Level 2";
        break;
      }case 2:{
        waterLevel="Level 3";
        break;
      }case 3:{
        waterLevel="Level 4";
        break;
      }case 4:{
        waterLevel="Level 5";
        break;
      }case 5:{
        waterLevel="Level 6";
        break;
      }
    }
    _riverFloodingDamage["river_flooding_water_level"]=waterLevel;
    update();
  }

  void selectObservedDamageForFlood({required String value}){
    if(_riverFloodingDamage["river_flooding_observed_damage"].contains(value)){
      _riverFloodingDamage["river_flooding_observed_damage"].remove(value);
    }else{
      _riverFloodingDamage["river_flooding_observed_damage"].add(value);
    }
    update();
  }

  void updateFloodComment({required String comment}){
    _riverFloodingDamage["river_flooding_other_observed_damage"]=comment;
    // update();
  }

  /// Sinkhole

  double _sinkholeDimensionSlider=0;
  final List<String> _sinkholeDimensionList=["1","2","3","4","5","6+"];
  final Map<String,dynamic> _sinkholeDamage={
    "sinkhole_dimension": 10,
    "sinkhole_observed_damage": "",
    "sinkhole_other_observed_damage": "",
    "sinkhole_affected_infrastructure": [],
    "sinkhole_other_affected_infrastructure": ""
  };

  Map<String,dynamic> get sinkholeDamage=>_sinkholeDamage;
  List<String> get sinkholeDimensionList=>_sinkholeDimensionList;
  double get sinkholeDimensionSlider=>_sinkholeDimensionSlider;

  void changeDimensionOfSinkhole({required double value}){
    _sinkholeDimensionSlider=value;
    _sinkholeDamage["sinkhole_dimension"]=_sinkholeDimensionList[value.toInt()];
    update();
  }

  void selectObservedDamageForSinkhole({required String value}){
    if(_sinkholeDamage["sinkhole_observed_damage"]!=value){
    _sinkholeDamage["sinkhole_observed_damage"]=value;
    }else{
      _sinkholeDamage["sinkhole_observed_damage"]="";
    }
    update();
  }

  void addOtherObserveDamageForSinkhole({required String comment}){
    _sinkholeDamage["sinkhole_other_observed_damage"]=comment;
    // update();
  }

  void selectInfrastructureDamageForSinkhole({required String value}){
    if(_sinkholeDamage["sinkhole_affected_infrastructure"].contains(value)){
      _sinkholeDamage["sinkhole_affected_infrastructure"].remove(value);
    }else{
      _sinkholeDamage["sinkhole_affected_infrastructure"].add(value);
    }
    update();
  }

  void addOtherInfrastructureDamageForSinkhole({required String comment}){
    _sinkholeDamage["sinkhole_other_affected_infrastructure"]=comment;
    // update();
  }

  //// Building Settlement

  double _buildingSettlementCrackDimensionSlider=0.3;
  final Map<String,dynamic> _buildingSettlementDamage={
    "building_settlement_type": "",
    "building_settlement_other_structures": "",
    "building_settlement_crack_direction": [],
    "building_settlement_crack_dimension": "<0.3mm",
  };

  double get buildingSettlementCrackDimensionSlider=>_buildingSettlementCrackDimensionSlider;
  Map<String,dynamic> get buildingSettlementDamage=>_buildingSettlementDamage;

  void selectTypeOfSettlementForBuildingSettlement({required String value}){
    if(_buildingSettlementDamage["building_settlement_type"]!=value){
      _buildingSettlementDamage["building_settlement_type"]=value;
    }else{
      _buildingSettlementDamage["building_settlement_type"]="";
    }
    update();
  }

  void selectOtherStructureForBuildingSettlement({required String value}){
    if(_buildingSettlementDamage["building_settlement_other_structures"]!=value){
      _buildingSettlementDamage["building_settlement_other_structures"]=value;
    }else{
      _buildingSettlementDamage["building_settlement_other_structures"]="";
    }
    update();
  }

  void selectDirectionOfCrackForBuildingSettlement({required String value}){
    if(_buildingSettlementDamage["building_settlement_crack_direction"].contains(value)){
      _buildingSettlementDamage["building_settlement_crack_direction"].remove(value);
    }else{
      _buildingSettlementDamage["building_settlement_crack_direction"].add(value);
    }
    update();
  }

  void changeDimensionOfCrackForBuildingSettlement({required double value}){
    _buildingSettlementCrackDimensionSlider=value;
    _buildingSettlementDamage["building_settlement_crack_dimension"]=value<=15.0?"<${value}mm":">${value.toInt()}mm";
    update();
  }

  /// MARINE FLOODING

  double _waterLevelSlider=0;
  final Map<String,dynamic> _marineFloodingDamage={
    "marine_flooding_submersion_type": "",
    "marine_flooding_water_level": "Level 1",
    "marine_flooding_environment_type": [],
    "marine_flooding_visit_frequency": "1st time",
    "marine_flooding_free_comments": "",
  };

  double get waterLevelSlider=>_waterLevelSlider;
  Map<String,dynamic> get marineFloodingDamage=>_marineFloodingDamage;

  void changeMarineFloodingSubmersionType({required String value}){
    if(_marineFloodingDamage["marine_flooding_submersion_type"]!=value){
      _marineFloodingDamage["marine_flooding_submersion_type"]=value;
    }else{
      _marineFloodingDamage["marine_flooding_submersion_type"]="";
    }
    update();
  }

  // void changeMarineFloodingWaterLevelSlider
  void changeMarineFloodingWaterLevel({required int value}){
    _waterLevelSlider=value.toDouble();
    String waterLevel="Level 1";
    switch(value){
      case 0:{
        waterLevel="Level 1";
        break;
      }
      case 1:{
        waterLevel="Level 2";
        break;
      }
      case 2:{
        waterLevel="Level 3";
        break;
      }
      case 3:{
        waterLevel="Level 4";
        break;
      }
      default:{
        waterLevel ="Level 1";
      }
    }
    _marineFloodingDamage["marine_flooding_water_level"]=waterLevel;
    update();
  }

  void changeMarineFloodingEnvironmentType({required String value}){
    if(_marineFloodingDamage["marine_flooding_environment_type"].contains(value)){
      _marineFloodingDamage["marine_flooding_environment_type"].remove(value);
    }else{
      _marineFloodingDamage["marine_flooding_environment_type"].add(value);
    }
    // print(_marineFloodingDamage);
    update();
  }

  void changeMarineFloodingVisitFrequency({required String value}){
    _marineFloodingDamage["marine_flooding_visit_frequency"]=value;
    update();
  }
  void changeMarineFloodingComment({required String value}){
    _marineFloodingDamage["marine_flooding_free_comments"]=value;
    update();
  }

  //// Coastal Erosion

  double _coastalErosionDamageLevelSlider=0;
  double _coastalErosionHeightOfSandLostSlider=0;
  double _coastalErosionConfidentSlider=0;
  final List<String> _coastalErosionHeightOfSandLostValueList=["Don't know","20cm","50cm","1m",">1m"];
  double _coastalErosionDebrisVolumeSlider=0;

  final Map<String,dynamic> _coastalErosionDamage={
    "coastal_erosion_eroded_object":"",
    "coastal_erosion_visit_frequency":"Daily",
    "coastal_erosion_free_comment":"",
    "Cliff":{
      "coastal_erosion_debris_presence":"No",
      "coastal_erosion_debris_volume":"Don't know",
      "coastal_erosion_eroded_part":""
    },
    "Beach":{
      "coastal_erosion_sediment_types":[],
      "coastal_erosion_sand_height_lost":"Don't know"
    },
    "Dune or strip of pebbles":{
      "coastal_erosion_dune_part_eroded":"",
      "coastal_erosion_features_on_dune":[]
    },
    "Coastal defences or buildings":{
      "coastal_erosion_building_type":"",
      "coastal_erosion_damage_level":"Minor Damage",
      "coastal_erosion_damage_causes":[],
      "coastal_erosion_response_confidence":1
    }
  };

  Map<String,dynamic> get coastalErosionDamage=>_coastalErosionDamage;
  double get coastalErosionDebrisVolumeSlider=>_coastalErosionDebrisVolumeSlider;
  double get coastalErosionDamageLevelSlider=>_coastalErosionDamageLevelSlider;
  double get coastalErosionHeightOfSandLostSlider=>_coastalErosionHeightOfSandLostSlider;
  List<String> get coastalErosionHeightOfSandLostValueList=>_coastalErosionHeightOfSandLostValueList;
  double get coastalErosionConfidentSlider=>_coastalErosionConfidentSlider;

  void changeCoastalErosionErodedObject({required String value}){
    if(_coastalErosionDamage["coastal_erosion_eroded_object"]!=value){
      _coastalErosionDamage["coastal_erosion_eroded_object"]=value;
    }else{
      _coastalErosionDamage["coastal_erosion_eroded_object"]="";
    }
    update();
  }

  void changeCoastalErosionVisitFrequency({required String value}){
    _coastalErosionDamage["coastal_erosion_visit_frequency"]=value;
    update();
  }

  void changeCoastalErosionComment({required String value}){
    _coastalErosionDamage["coastal_erosion_free_comment"]=value;
  }

  void changeCoastalErosionCliffDebrisPresence({required String value}){
    _coastalErosionDamage["Cliff"]["coastal_erosion_debris_presence"]=value;
    update();
  }
  void changeCoastalErosionCliffDebrisVolume({required int value}){
    _coastalErosionDebrisVolumeSlider=value.toDouble();
    String volumeOfDebris="Don't know";
    switch(value){
      case 0:{
        volumeOfDebris="Don't know";
        break;
      }
      case 1:{
        volumeOfDebris="Level 1";
        break;
      }
      case 2:{
        volumeOfDebris="Level 2";
        break;
      }
      case 3:{
        volumeOfDebris="Level 3";
        break;
      }
    }
    _coastalErosionDamage["Cliff"]["coastal_erosion_debris_volume"]=volumeOfDebris;
    update();
  }
  void changeCoastalErosionCliffErodedPart({required String value}){
    if(_coastalErosionDamage["Cliff"]["coastal_erosion_eroded_part"]!=value){
      _coastalErosionDamage["Cliff"]["coastal_erosion_eroded_part"]=value;
    }else{
      _coastalErosionDamage["Cliff"]["coastal_erosion_eroded_part"]="";
    }
    update();
  }
  void changeCoastalErosionBeachSedimentType({required String value}){
    if(_coastalErosionDamage["Beach"]["coastal_erosion_sediment_types"].contains(value)){
      _coastalErosionDamage["Beach"]["coastal_erosion_sediment_types"].remove(value);
    }else{
      _coastalErosionDamage["Beach"]["coastal_erosion_sediment_types"].add(value);
    }
    update();
  }
  void changeCoastalErosionBeachSandHeightLost({required int value}){
    _coastalErosionHeightOfSandLostSlider=value.toDouble();
    _coastalErosionDamage["Beach"]["coastal_erosion_sand_height_lost"]=_coastalErosionHeightOfSandLostValueList[value];
    update();
  }
  void changeCoastalErosionDuneErodedPart({required String value}){
    if(_coastalErosionDamage["Dune or strip of pebbles"]["coastal_erosion_dune_part_eroded"]!=value){
      _coastalErosionDamage["Dune or strip of pebbles"]["coastal_erosion_dune_part_eroded"]=value;
    }else{
      _coastalErosionDamage["Dune or strip of pebbles"]["coastal_erosion_dune_part_eroded"]="";
    }
    update();
  }
  void changeCoastalErosionDuneFeature({required String value}){
    if(_coastalErosionDamage["Dune or strip of pebbles"]["coastal_erosion_features_on_dune"].contains(value)){
      _coastalErosionDamage["Dune or strip of pebbles"]["coastal_erosion_features_on_dune"].remove(value);
    }else{
      _coastalErosionDamage["Dune or strip of pebbles"]["coastal_erosion_features_on_dune"].add(value);
    }
    update();
  }
  void changeCoastalErosionCoastalDefencesErodedBuildingType({required String value}){
    if(_coastalErosionDamage["Coastal defences or buildings"]["coastal_erosion_building_type"]!=value){
      _coastalErosionDamage["Coastal defences or buildings"]["coastal_erosion_building_type"]=value;
    }else{
      _coastalErosionDamage["Coastal defences or buildings"]["coastal_erosion_building_type"]="";
    }
    update();
  }
  void changeCoastalErosionCoastalDefencesDamageLevel({required double value}){
    _coastalErosionDamageLevelSlider=value;
    switch(_coastalErosionDamageLevelSlider.toString()){
      case "0.0":{
        _coastalErosionDamage["Coastal defences or buildings"]["coastal_erosion_damage_level"]="Minor Damage";
        break;
      }
      case "1.0":{
        _coastalErosionDamage["Coastal defences or buildings"]["coastal_erosion_damage_level"]="Moderate Damage";
        break;
      }
      case "2.0":{
        _coastalErosionDamage["Coastal defences or buildings"]["coastal_erosion_damage_level"]="Partial Collapse";
        break;
      }case "3.0":{
        _coastalErosionDamage["Coastal defences or buildings"]["coastal_erosion_damage_level"]="Total Collapse";
        break;
      }
      default:{
        break;
      }
    }
    update();
  }
  void changeCoastalErosionCoastalDefencesDamageCauses({required String value}){
    if(_coastalErosionDamage["Coastal defences or buildings"]["coastal_erosion_damage_causes"].contains(value)){
      _coastalErosionDamage["Coastal defences or buildings"]["coastal_erosion_damage_causes"].remove(value);
    }else{
      _coastalErosionDamage["Coastal defences or buildings"]["coastal_erosion_damage_causes"].add(value);
    }
    update();
  }
  void changeCoastalErosionCoastalDefencesResponseConfidence({required double value}){
    _coastalErosionConfidentSlider=value;
    _coastalErosionDamage["Coastal defences or buildings"]["coastal_erosion_response_confidence"]=value.toInt();
    update();
  }


  ////  Quick Report Event

  final RxString _activeScreen="image_upload".obs;
  final RxBool _quickReportingIsActive=false.obs;

  RxString get activeScreen=>_activeScreen;
  RxBool get quickReportingIsActive=>_quickReportingIsActive;

  void changeActiveScreen({required String value}){
    _activeScreen.value=value;
    update();
  }

  void toggleQuickReportingState({required bool value}){
    _quickReportingIsActive.value=value;
    update();
  }

  /// Report Event
  Object selectCustomEventDetail(){
    switch(selectedEventType){
      case EventEventTypeEnum.EARTHQUAKE:{
        return _earthquakeDamage;
      }
      case EventEventTypeEnum.LANDSLIDE:{
        return _landslideDamage;
      }
      case EventEventTypeEnum.RIVER_FLOODING:{
        return _riverFloodingDamage;
      }
      case EventEventTypeEnum.SINKHOLE:{
        return _sinkholeDamage;
      }
      case EventEventTypeEnum.BUILDING_SETTLEMENT:{
        return _buildingSettlementDamage;
      }
      case EventEventTypeEnum.MARINE_FLOODING:{
        return _marineFloodingDamage;
      }
      case EventEventTypeEnum.COASTAL_EROSION:{
        Map<String,dynamic> coastalErosion={};
        coastalErosion["coastal_erosion_eroded_object"]=_coastalErosionDamage["coastal_erosion_eroded_object"];
        coastalErosion["coastal_erosion_visit_frequency"]=_coastalErosionDamage["coastal_erosion_visit_frequency"];
        coastalErosion["coastal_erosion_free_comment"]=_coastalErosionDamage["coastal_erosion_free_comment"];
        if(_coastalErosionDamage["coastal_erosion_eroded_object"]!=""){
          coastalErosion.addAll(_coastalErosionDamage[_coastalErosionDamage["coastal_erosion_eroded_object"]]);
        }
        return coastalErosion;
      }
      default:{
        return {};
      }
    }
  }

  Object createCommonQuestionObject(){
    final Map<String,bool> eventsCommonQuestion={};
    for( Map<String, String> value in _commonQuestions){
      eventsCommonQuestion[value["slug"]!]=value["answer"]=="YES"?true:false;
    }
    return eventsCommonQuestion;
  }

  Future<String> reportEvent()async{
    _eventDetail.sensorData=_sensorDataList;
    _eventDetail.commonEventDetails=_quickReportingIsActive.value?{}:createCommonQuestionObject();
    _eventDetail.quickReport=_quickReportingIsActive.value;
    _eventDetail.customEventDetails=_quickReportingIsActive.value?{}:selectCustomEventDetail();
    // print(_eventDetail);
    String eventId= await _ageoConfig.reportEvent(eventDetail: _eventDetail,imagePathList: _uploadedImagePathList)??"";
    return eventId;
  }
}