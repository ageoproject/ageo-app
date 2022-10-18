import 'package:ageoClient/api.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoder2/geocoder2.dart';

class AgeoConfig{
  late ApiClient _apiClient;
  late IndexApi _indexApi;
  late String _basePath;

  AgeoConfig._constructor(){
    if(kReleaseMode){
      _basePath="http://192.168.1.20:3000";
    }else{
      _basePath="http://192.168.1.20:3000";
    }
    _apiClient=ApiClient(basePath: _basePath);
    _indexApi=IndexApi(_apiClient);
  }

  //creating single copy of class
  static final AgeoConfig _instance = AgeoConfig._constructor();

  //factory will return class instance and if not initialized then it first initialize and then return instance
  factory AgeoConfig() {
    return _instance;
  }

  Future<String?> reportEvent({required List<double> location,required GeoData geoData})async{
    Event event=Event(
      eventType: EventEventTypeEnum.EARTHQUAKE,
      time: DateTime.now().toString(),
      image: ["location/test/image.png"],
      comment: "The is a test comment",
      location: EventLocation(coordinates: location),
      city: geoData.city,
      state: geoData.state,
      country: geoData.country,
      eventDetails: '{"name":"FLOODED"}'
    );
    EventReportResponse? eventReportResponse= await _indexApi.reportEvents(event);
    return eventReportResponse?.eventId;
  }

}