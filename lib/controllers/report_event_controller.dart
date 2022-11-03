import 'package:ageoClient/api.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ReportEventController extends GetxController{

  final RxString _activeTab="event_type".obs;

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
}