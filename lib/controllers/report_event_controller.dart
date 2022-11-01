import 'package:ageoClient/api.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ReportEventController extends GetxController{

  final RxString _activeTab="map".obs;

  final Event _eventDetail= Event();

  RxString get activeTab=> _activeTab;
  EventEventTypeEnum? get selectedEventType=>_selectedEventType;

  void changeActiveTab({required String value}){
    _activeTab.value=value;
  }



  ///  Select event type

  EventEventTypeEnum? _selectedEventType;

  void changeSelectedEventType({required EventEventTypeEnum value }){
    _selectedEventType=value;
    _eventDetail.eventType=value;
    // print(_selectedEventType);
  }


  /// Map Page

  Set<Marker> _locationMarker={};
  late LatLng _currentLocation;

  Set<Marker> get locationMarker=>_locationMarker;
  LatLng get currentLocation=>_currentLocation;

  void markLocation({required Marker value}){
    _locationMarker.add(value);
  }

  void markCurrentLocation({required LatLng value}){
    _currentLocation=value;
  }

}