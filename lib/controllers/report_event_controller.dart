import 'package:ageoClient/api.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ReportEventController extends GetxController{

  final RxString _activeTab="questions".obs;

  final Event _eventDetail= Event();

  RxString get activeTab=> _activeTab;

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

  void changeAddress({required String address}){
    _locationAddress=address;
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
  final RxString _eventTime= "${DateTime.now().hour}:${DateTime.now().minute}".obs;
  // final List<String> _commonQuestionLocalizationKeys=["common_question_page.was_raining","common_question_page.people_at_risk","common_question_page.animals_at_risk","common_question_page.assets_at_risk","common_question_page.i_am_safe"];
  final Map<String,dynamic> _commonQuestions={
    "0":{
      "question":"Is / Was it raining ?",
      "answer":"NO"
    },
    "1":{
      "question":"People at risk ?",
      "answer":"NO"
    },
    "2":{
      "question":"Animals at risk ?",
      "answer":"NO"
    },
    "3":{
      "question":"Assets at risk ?",
      "answer":"NO"
    },
    "4":{
      "question":"I am safe",
      "answer":"NO"
    }
  };
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

  RxString get eventDate=>_eventDate;
  RxString get eventTime=>_eventTime;
  Map<String,dynamic> get commonQuestion=>_commonQuestions;
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

  void updateAnswers({required String key,required String value}){
    _commonQuestions[key]["answer"]=value;
    update();
  }

  void updateComment({required String comment}){
    _comment=comment;
    _eventDetail.comment=_comment;
  }

  void addImage({required XFile image}){
    _uploadedImageList.add(image);
    update();
  }
  void deleteImage({required XFile image}){
    _uploadedImageList.remove(image);
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
}