import 'package:ageo/ageoConfig.dart';
import 'package:ageoClient/api.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ReportEventController extends GetxController{

  final RxString _activeTab="event_type".obs;

  final Event _eventDetail= Event();

  final List<EventEventTypeEnum> _hasSpecificDamagePage=[EventEventTypeEnum.EARTHQUAKE,EventEventTypeEnum.LANDSLIDE,EventEventTypeEnum.FLOODED,EventEventTypeEnum.SINKHOLE,EventEventTypeEnum.BUILDING_SETTLEMENT];

  RxString get activeTab=> _activeTab;
  List<EventEventTypeEnum> get hasSpecificDamagePage=>_hasSpecificDamagePage;

  void changeActiveTab({required String value}){
    _activeTab.value=value;
  }


  ///  Select event type

  EventEventTypeEnum? _selectedEventType;

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
  String? _locationAddress;
  MapType _mapType=MapType.normal;
  final RxBool _enableTrafficMode=false.obs;
  Marker? _currentLocationMarker;
  Marker? _markedLocationMarker;

  Set<Marker> get locationMarker=>_locationMarker;
  RxDouble get mapZoomLevel=>_mapZoomLevel;
  String? get locationAddress=>_locationAddress;
  RxBool get hideMapModeOption=>_hideMapModeOption;
  MapType get mapType=>_mapType;
  RxBool get enableTrafficMode=>_enableTrafficMode;
  Marker? get currentLocationMarker=>_currentLocationMarker;

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
    }else{
      _locationMarker.remove(_currentLocationMarker);
    }
    _locationMarker.add(marker);
    _currentLocationMarker=marker;
    update();
  }

  void changeAddress({required GeoData locationDetail}){
    _locationAddress=locationDetail.address;
    _eventDetail.city=locationDetail.city;
    _eventDetail.country=locationDetail.country;
    _eventDetail.state=locationDetail.state;
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
  final List<Map<String,String>> _commonQuestions=[{
    "question":"People at risk ?",
    "answer":"NO"
  },{
    "question":"Animals at risk ?",
    "answer":"NO"
  },{
    "question":"Assets at risk ?",
    "answer":"NO"
  },{
    "question":"I am safe",
    "answer":"NO"
  }];

  final Map<String,dynamic> _sensorData={
    "accelerometer":{
      "x":"0.0",
      "y":"0.0",
      "z":"0.0",
    },
    "gyroscope":{
      "x":"0.0",
      "y":"0.0",
      "z":"0.0",
    },
    "magnetometer":{
      "x":"0.0",
      "y":"0.0",
      "z":"0.0",
    }
  };

  String? _comment;
  final List<XFile> _uploadedImageList=[];
  final List<String> _uploadedImagePathList=[];

  RxString get eventDate=>_eventDate;
  RxString get eventTime=>_eventTime;
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
    _eventDetail.time="${_eventDate.value} ${_eventTime.value}";
  }

  void updateAnswers({required int index,required String value}){
    _commonQuestions[index]["answer"]=value;
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
    update();
  }
  void deleteImage({required XFile image}){
    _uploadedImageList.remove(image);
    _uploadedImagePathList.remove(image.path);
    _eventDetail.image =_uploadedImagePathList;
    update();
  }
  void updateSensorData({required AccelerometerEvent accelerometerEvent,required GyroscopeEvent gyroscopeEvent,required MagnetometerEvent magnetometerEvent}){
    _sensorData["accelerometer"]["x"]=accelerometerEvent.x.toString();
    _sensorData["accelerometer"]["y"]=accelerometerEvent.y.toString();
    _sensorData["accelerometer"]["x"]=accelerometerEvent.z.toString();
    _sensorData["gyroscope"]["x"]=gyroscopeEvent.x.toString();
    _sensorData["gyroscope"]["y"]=gyroscopeEvent.y.toString();
    _sensorData["gyroscope"]["x"]=gyroscopeEvent.z.toString();
    _sensorData["magnetometer"]["x"]=magnetometerEvent.x.toString();
    _sensorData["magnetometer"]["y"]=magnetometerEvent.y.toString();
    _sensorData["magnetometer"]["x"]=magnetometerEvent.z.toString();
  }

  void reportEvent()async{
    AgeoConfig ageoConfig=AgeoConfig();
    // _eventDetail.sensorData=_sensorData;
    // _eventDetail.commonEventDetails=EventCommonEventDetails();
    // print("This is event in controller => $_eventDetail");
    await ageoConfig.reportEvent(eventDetail: _eventDetail);
  }

  ///  Earthquake Page

  final List<String> _numberOfBuilding=["1","2","3","4","5","6+"];
  final List<Map<String,dynamic>> _earthquakeDamage=[{
    "number_of_floors": "1",
    "observed_damage": {
      "question": "What is the observed_damage",
      "answer": null
    }
  }];


  List<String> get numberOfBuilding=> _numberOfBuilding;
  List<Map<String,dynamic>> get earthquakeDamage=>_earthquakeDamage;

  void addNewBuilding(){
    _earthquakeDamage.add({
      "number_of_floors": "1",
      "observed_damage": {
        "question": "What is the observed damage",
        "answer": "Falling Object"
      }
    });
    update();
  }

  void deleteBuilding({required int index}){
    _earthquakeDamage.removeAt(index);
    update();
  }

  void changeNumberOfBuilding({required int index,required String numberOfBuilding}){
    _earthquakeDamage[index]["number_of_floors"]=numberOfBuilding;
    update();
  }

  void selectObservedDamageForEarthquake({required int index,required String answer}){
    _earthquakeDamage[index]["observed_damage"]["answer"]=answer;
    update();
  }


  /// Landslide

  final Map<String,dynamic> _landslideDamage={
    "volume_of_displacement": "10%",
    "observed_damage": {
      "question": "what infrastructure was affected ?",
      "answer": [],
      "other":""
    }
  };

  Map<String,dynamic> get landslideDamage=>_landslideDamage;

  void changeVolumeOfDisplacedLand({required String value}){
    _landslideDamage["volume_of_displacement"]=value;
    update();
  }

  void selectObservedDamageForLandslide({required String value}){
    if(_landslideDamage["observed_damage"]["answer"].contains(value)){
      _landslideDamage["observed_damage"]["answer"].remove(value);
    }else{
      _landslideDamage["observed_damage"]["answer"].add(value);
    }
    update();
  }
  void updateLandslideComment({required String comment}){
    _landslideDamage["observed_damage"]["other"]=comment;
    // update();
  }


  /// Flood

  final Map<String,dynamic> _floodDamage={
    "water_level": "10",
    "observed_damage": {
      "question": "what infrastructure was affected ?",
      "answer": [],
      "other":""
    }
  };

  Map<String,dynamic> get floodDamage=>_floodDamage;

  void changeWaterLevelOfFlood({required String value}){
    _floodDamage["water_level"]=value;
  }

  void selectObservedDamageForFlood({required String value}){
    if(_floodDamage["observed_damage"]["answer"].contains(value)){
      _floodDamage["observed_damage"]["answer"].remove(value);
    }else{
      _floodDamage["observed_damage"]["answer"].add(value);
    }
    update();
  }

  void updateFloodComment({required String comment}){
    _floodDamage["observed_damage"]["other"]=comment;
    // update();
  }

  /// Sinkhole

  final Map<String,dynamic> _sinkholeDamage={
    "dimension_of_sinkhole": "10",
    "observed_damage": {
      "question": "what infrastructure was affected ?",
      "answer": "",
      "other":""
    },
    "affected_infrastructure": {
      "question": "what infrastructure was affected ?",
      "answer": [],
      "other":""
    }
  };

  Map<String,dynamic> get sinkholeDamage=>_sinkholeDamage;

  void changeDimensionOfSinkhole({required String value}){
    _sinkholeDamage["dimension_of_sinkhole"]=value;
  }

  void selectObservedDamageForSinkhole({required String value}){
    if(_sinkholeDamage["observed_damage"]["answer"]!=value){
    _sinkholeDamage["observed_damage"]["answer"]=value;
    }else{
      _sinkholeDamage["observed_damage"]["answer"]="";
    }
    update();
  }

  void addOtherObserveDamageForSinkhole({required String comment}){
    _sinkholeDamage["observed_damage"]["other"]=comment;
    // update();
  }

  void selectInfrastructureDamageForSinkhole({required String value}){
    if(_sinkholeDamage["affected_infrastructure"]["answer"].contains(value)){
      _sinkholeDamage["affected_infrastructure"]["answer"].remove(value);
    }else{
      _sinkholeDamage["affected_infrastructure"]["answer"].add(value);
    }
    update();
  }

  void addOtherInfrastructureDamageForSinkhole({required String comment}){
    _sinkholeDamage["affected_infrastructure"]["other"]=comment;
    // update();
  }


  final Map<String,dynamic> _buildingSettlementDamage={
    "type_of_settlement": {
      "question": "how infrastructure was affected ?",
      "answer": ""
    },
    "other_structure": {
      "question": "what other infrastructure was affected ?",
      "answer": ""
    },
    "direction_of_cracks": {
      "dimension_of_crack": "10",
      "question": "what was the direction of cracks?",
      "answer": []
    }
  };

  Map<String,dynamic> get buildingSettlementDamage=>_buildingSettlementDamage;

  void selectTypeOfSettlementForBuildingSettlement({required String value}){
    if(_buildingSettlementDamage["type_of_settlement"]["answer"]!=value){
      _buildingSettlementDamage["type_of_settlement"]["answer"]=value;
    }else{
      _buildingSettlementDamage["type_of_settlement"]["answer"]="";
    }
    update();
  }

  void selectOtherStructureForBuildingSettlement({required String value}){
    if(_buildingSettlementDamage["other_structure"]["answer"]!=value){
      _buildingSettlementDamage["other_structure"]["answer"]=value;
    }else{
      _buildingSettlementDamage["other_structure"]["answer"]="";
    }
    update();
  }

  void selectDirectionOfCrackForBuildingSettlement({required String value}){
    if(_buildingSettlementDamage["direction_of_cracks"]["answer"].contains(value)){
      _buildingSettlementDamage["direction_of_cracks"]["answer"].remove(value);
    }else{
      _buildingSettlementDamage["direction_of_cracks"]["answer"].add(value);
    }
    update();
  }

  void changeDimensionOfCrackForBuildingSettlement({required String value}){
    _buildingSettlementDamage["direction_of_cracks"]["dimension_of_crack"]=value;
    // update();
  }

}